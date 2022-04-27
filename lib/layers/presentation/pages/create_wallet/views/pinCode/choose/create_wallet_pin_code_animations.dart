part of 'create_wallet_pin_code_page.dart';

class CreateWalletPinCodePageAnimations {
  final Animation<double> title1Opacity;
  final Animation<double> field1Opacity;
  final Animation<double> rememberOpacity;
  final Animation<double> keyboardAnimationOpacity;
  final Animation<double> confirmButtonAnimationOpacity;

  CreateWalletPinCodePageAnimations(AnimationController controller)
      : title1Opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.2,
              0.36,
              curve: Curves.ease,
            ),
          ),
        ),
        field1Opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.36,
              0.52,
              curve: Curves.ease,
            ),
          ),
        ),
        rememberOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.52,
              0.68,
              curve: Curves.ease,
            ),
          ),
        ),
        keyboardAnimationOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.68,
              0.84,
              curve: Curves.ease,
            ),
          ),
        ),
        confirmButtonAnimationOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.84,
              1,
              curve: Curves.ease,
            ),
          ),
        );
}
