part of './create_wallet_name_page.dart';

class CreateWalletPageAnimations {
  final Animation<double> title1Opacity;
  final Animation<double> field1Opacity;
  final Animation<double> buttonOpacity;

  CreateWalletPageAnimations(AnimationController controller)
      : title1Opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.2,
              0.467,
              curve: Curves.ease,
            ),
          ),
        ),
        field1Opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.467,
              0.734,
              curve: Curves.ease,
            ),
          ),
        ),
        buttonOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.734,
              1,
              curve: Curves.ease,
            ),
          ),
        );
}
