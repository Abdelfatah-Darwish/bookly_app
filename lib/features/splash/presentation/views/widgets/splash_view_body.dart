import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../home/presentation/views/home_view.dart';
import 'sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> offsetAnimation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    // Introducing a 3-second delay before navigating to the main screen
    navigateToHomeview();
  }

//closs you reasorce
//avoide to made memory like
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(
          height: 4,
        ),
        SlidingText(offsetAnimation: offsetAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, 3),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.elasticIn,
      ),
    );
  }

  void navigateToHomeview() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.to(
        () => const HomeView(),
        transition: Transition.fade,
        duration: kTransitionDuration,
      );
    });
  }
}
