import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/save_user_local_auth_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_recover_login/user_recover_login_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_pincode/user_set_pincode_usecase.dart';
import 'package:freeflow/layers/domain/usecases/username_exist/get_username_exists_usecase.dart';
import 'package:freeflow/layers/infra/drivers/biometric/biometric_auth_driver.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:mobx/mobx.dart';

part 'recover_account_controller.g.dart';

class RecoverAccountController = RecoverAccountControllerBase
    with _$RecoverAccountController;

abstract class RecoverAccountControllerBase with Store {
  final UserRecoverLoginUseCase userRecoverLoginUseCase;
  final BiometricAuthDriver biometricDriver;
  final UserSetPincodeUsecase userSetPincodeUsecase;
  final GetUsernameExistsUsecase getUsernameExistsUsecase;
  final SaveUserLocalAuthUsecase saveUserLocalAuthUsecase;

  RecoverAccountControllerBase({
    required this.userRecoverLoginUseCase,
    required this.biometricDriver,
    required this.userSetPincodeUsecase,
    required this.getUsernameExistsUsecase,
    required this.saveUserLocalAuthUsecase,
  });

  @observable
  bool isAnimatingExitFirstView = false;

  @observable
  bool isAnimatingExitSecondView = false;

  @observable
  bool isAnimatingExitThirdView = false;

  @observable
  bool isAnimatingExitFourthView = false;

  @observable
  bool isAnimatingExistFirstViewEnd = false;

  @observable
  bool isAnimatingExitSecondViewEnd = false;

  @observable
  bool isAnimatingExitThirdViewEnd = false;

  @observable
  bool isAnimatingExitFourthViewEnd = false;

  @observable
  String? privateKeyError;

  @observable
  String? usernameError;

  @observable
  String? pinCodeError;

  @observable
  String? confirmPinCodeError;

  @observable
  bool isNameValid = false;

  @observable
  bool isKeyValid = false;

  @observable
  bool isPinValid = false;

  @observable
  bool isConfirmPinCodeValid = false;

  @observable
  bool isInFirstView = true;

  @observable
  bool isInSecondView = false;

  @observable
  bool isInThirdView = false;

  @observable
  bool isInFourthView = false;

  @observable
  int currentIndex = 0;

  @observable
  String? pinCode;

  @observable
  bool isValidating = false;

  @observable
  bool isBiometricAvailable = true;

  @observable
  String username = '';

  @observable
  bool isContinueButtonVisible = true;

  @observable
  int currentPage = 0;

  int animationDuration = 10;

  @action
  setCurrentPage(int value) => currentPage = value;

  @action
  Future<void> backPage() async {
    if (currentPage == 0) {
      return;
    } else {
      currentPage -= currentPage;
    }
  }

  @action
  tapContinueButton(BuildContext context,
      {String? privateKey,
      String? username,
      String? pincode,
      String? confirmPincode}) async {
    if (isInFirstView) {
      FocusScope.of(context).requestFocus(FocusNode());
      updateIndex(1);
    } else if (isInSecondView) {
      FocusScope.of(context).requestFocus(FocusNode());
      updateIndex(2);
    } else if (isInThirdView) {
      updateIndex(3);
    } else if (isInFourthView) {
      Routes.instance.goToWelcomePageRoute();
    }
  }

  @action
  void onChangedField(BuildContext context, String? value) {
    if (isInFirstView) {
      validateName(context, value);
    } else if (isInSecondView) {
      validatePrivateKey(context, value);
    } else if (isInThirdView) {
      validatePinCode(context, value);
    } else if (isInFourthView) {
      validateConfirmPinCode(context, value);
      if (isConfirmPinCodeValid) {
        savePinCode();
      }
    }
  }

  void savePinCode() {
    if (pinCode != null) userSetPincodeUsecase(pinCode!);
  }

  bool isContinueButtonActive() {
    if (isInFirstView) {
      return isNameValid;
    } else if (isInSecondView) {
      return isKeyValid;
    } else if (isInThirdView) {
      return isPinValid;
    } else if (isInFourthView) {
      return isConfirmPinCodeValid;
    } else {
      return true;
    }
  }

  validatePrivateKey(BuildContext context, String? key) async {
    if ((key ?? '').isEmpty) {
      isKeyValid = false;
      privateKeyError = FlutterI18n.translate(
        context,
        'recoverAccount.pleaseEnterPrivateKey',
      );
    } else {
      isValidating = true;
      final result = await userRecoverLoginUseCase(
          username: username, privateKey: key ?? '');
      result.fold(
        (l) {
          isKeyValid = false;
          privateKeyError = FlutterI18n.translate(
            context,
            'recoverAccount.privateKeyIsNotValid',
          );
          if (l == DomainError.noInternet) {}
        },
        (r) {
          isKeyValid = true;
          privateKeyError = null;
          saveUserLocalAuthUsecase(r);
        },
      );
    }
    isValidating = false;
  }

  void validatePinCode(BuildContext context, String? code) {
    if ((code ?? '').isEmpty) {
      isPinValid = false;
      pinCodeError = FlutterI18n.translate(
        context,
        'recoverAccount.pleaseEnterPinCode',
      );
    } else if ((code ?? '').length < 4) {
      isPinValid = false;
      pinCodeError = null;
    } else {
      isPinValid = true;
      pinCodeError = null;
      pinCode = code;
    }
  }

  void validateConfirmPinCode(BuildContext context, String? value) {
    if (value?.length == 4) {
      if (value != pinCode) {
        confirmPinCodeError = FlutterI18n.translate(
          context,
          'recoverAccount.pleaseEnterConfirmPinCode',
        );
        isConfirmPinCodeValid = false;
      } else {
        confirmPinCodeError = null;
        isConfirmPinCodeValid = true;
      }
    } else {
      isConfirmPinCodeValid = false;
    }
  }

  void validateName(BuildContext context, String? name) async {
    if ((name ?? '').trim().isEmpty) {
      usernameError = FlutterI18n.translate(
        context,
        'recoverAccount.pleaseEnterUsername',
      );
      isNameValid = false;
    } else {
      isValidating = true;
      final result = await getUsernameExistsUsecase(name ?? '');
      result.fold((l) {
        usernameError = FlutterI18n.translate(
          context,
          'recoverAccount.pleaseEnterUsername',
        );
        isNameValid = false;
        if (l == DomainError.noInternet) {}
      }, (r) {
        if (r) {
          usernameError = null;
          isNameValid = true;
          username = name ?? '';
        } else {
          usernameError = FlutterI18n.translate(
            context,
            'recoverAccount.usernameIsNotValid',
          );
          isNameValid = false;
        }
      });
    }
    isValidating = false;
  }

  @action
  void updateIndex(int index) {
    if (index == 0) {
      if (isInFirstView) {
        return;
      } else {
        isAnimatingExitFirstView = false;
        isAnimatingExitSecondView = true;
        isContinueButtonVisible = false;
        Timer.periodic(const Duration(seconds: 3), (timer) {
          isInFirstView = true;
          isInSecondView = false;
          currentIndex = 0;
          animationDuration = 5;
          isAnimatingExistFirstViewEnd = false;
          isAnimatingExitSecondViewEnd = true;
          timer.cancel();
        });
        isContinueButtonVisible = true;
      }
    } else if (index == 1) {
      if (isInSecondView) {
        return;
      } else {
        isContinueButtonVisible = false;
        isAnimatingExitSecondView = false;
        isAnimatingExitFirstView = true;
        isAnimatingExitThirdView = true;
        Timer.periodic(const Duration(seconds: 3), (timer) {
          isInFirstView = false;
          isInThirdView = false;
          isInSecondView = true;
          currentIndex = 1;
          isAnimatingExitSecondViewEnd = false;
          isAnimatingExistFirstViewEnd = true;
          isAnimatingExitThirdViewEnd = true;
          timer.cancel();
        });
        Timer.periodic(const Duration(seconds: 4), (timer) {
          isContinueButtonVisible = true;
          timer.cancel();
        });
      }
    } else if (index == 2) {
      if (isInThirdView) {
        return;
      } else {
        isContinueButtonVisible = false;
        isAnimatingExitThirdView = false;
        isAnimatingExitSecondView = true;
        isAnimatingExitFourthView = true;
        Timer.periodic(const Duration(seconds: 3), (timer) {
          isInFirstView = false;
          isInSecondView = false;
          isInThirdView = true;
          isInFourthView = false;
          currentIndex = 2;
          isAnimatingExitThirdViewEnd = false;
          isAnimatingExitSecondViewEnd = true;
          isAnimatingExitFourthViewEnd = true;
          timer.cancel();
        });
        Timer.periodic(const Duration(seconds: 4), (timer) {
          isContinueButtonVisible = true;
          timer.cancel();
        });
      }
    } else if (index == 3) {
      if (isInFourthView) {
        return;
      } else {
        isAnimatingExitFourthView = false;
        isAnimatingExitThirdView = true;
        isContinueButtonVisible = false;
        Timer.periodic(const Duration(seconds: 3), (timer) {
          isInFirstView = false;
          isInSecondView = false;
          isInThirdView = false;
          isInFourthView = true;
          currentIndex = 3;
          isAnimatingExitFourthViewEnd = false;
          isAnimatingExitThirdViewEnd = true;
          timer.cancel();
        });
        Timer.periodic(const Duration(seconds: 4), (timer) {
          isContinueButtonVisible = true;
          timer.cancel();
        });
      }
    }
  }

  void openKeyboard(context, {required FocusNode inputNode, int? duration}) {
    Timer.periodic(Duration(seconds: duration ?? animationDuration), (timer) {
      FocusManager.instance.primaryFocus?.unfocus();
      FocusScope.of(context).requestFocus(inputNode);
      timer.cancel();
    });
  }

  Future<bool> onWillPop() async {
    if (isInFirstView) {
      //TODO: Go to initial page
      return false;
    } else if (isInSecondView) {
      updateIndex(0);
      return false;
    } else if (isInThirdView) {
      updateIndex(1);
      return false;
    } else if (isInFourthView) {
      updateIndex(2);
      return false;
    } else {
      updateIndex(0);
      return false;
    }
  }

  @action
  Future<void> hasBiometricAvailable() async {
    final result = await biometricDriver.getAvailableBiometrics();
    result.fold(
      (l) => isBiometricAvailable = false,
      (r) => isBiometricAvailable = r.isNotEmpty,
    );
  }
}
