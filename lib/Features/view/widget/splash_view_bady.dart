import 'package:bookly/Features/home/presntation/view/home_view.dart';
import 'package:bookly/Features/view/widget/sliding_txet.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

class SplashViewBady extends StatefulWidget {
  const SplashViewBady({super.key});

  @override
  State<SplashViewBady> createState() => _SplashViewBadyState();
}

class _SplashViewBadyState extends State<SplashViewBady> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {

    super.initState();
    initslidingAnimation();
    navigateToHome();
  }

  void initslidingAnimation() {
    animationController = AnimationController( vsync:this ,duration:  const Duration(seconds: 1));
    slidingAnimation = Tween<Offset>(begin:Offset(0, 5) ,end:Offset.zero ). animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(Duration(seconds: 2),(){
//Get.to(()=>  HomeView(), transition: Transition.fade,duration: kTranstionDuration);
    GoRouter.of(context).push(AppRouter.khomeview);
    },
    );
  }
  @override
  void dispose() {

    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
Image.asset(AssetData.logo),
        const SizedBox(
          height: 4,
        ),
         SlidingText(slidingAnimation: slidingAnimation),

      ],
    );
  }
}


