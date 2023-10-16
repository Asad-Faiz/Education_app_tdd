import 'dart:developer';

import 'package:education_app_using_tdd/core/common/views/loading_view.dart';
import 'package:education_app_using_tdd/core/common/widgets/gradient_background.dart';
import 'package:education_app_using_tdd/core/res/colors.dart';
import 'package:education_app_using_tdd/core/res/media_res.dart';
import 'package:education_app_using_tdd/src/on_boarding/domain/entities/page_content.dart';
import 'package:education_app_using_tdd/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:education_app_using_tdd/src/on_boarding/presentation/widgets/on_boarfding_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const routeName = '/';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();
  @override
  void initState() {
    super.initState();

    context.read<OnBoardingCubit>().checkIfUserIsFirstTimer();
    log(OnBoardingScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GradientBackGround(
        image: MediaRes.onBoardingBackground,
        child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
          listener: (context, state) {
            if (state is OnBoardingStatus && state.isFirstTimer == false) {
              log(state.isFirstTimer.toString());
              Navigator.pushReplacementNamed(context, '/home');
            } else if (state is UserCached) {
              //TODO(User-Cached-Handler): Push to Appropariate screen
              log('user cached');
            }
          },
          builder: (context, state) {
            if (state is CheckingIfUserIsFirstTimer ||
                state is CachingFirstTimer) {
              return const LoadingView();
            }
            return Stack(
              children: [
                PageView(
                  controller: pageController,
                  children: const [
                    OnBoardingBody(pageContent: PageContent.first()),
                    OnBoardingBody(pageContent: PageContent.second()),
                    OnBoardingBody(pageContent: PageContent.third()),
                  ],
                ),
                Align(
                  alignment: const Alignment(0, 0.80),
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    onDotClicked: (index) {
                      pageController.animateToPage(index,
                          duration: const Duration(microseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    effect: const WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 40,
                      activeDotColor: Colours.primaryColour,
                      dotColor: Colors.white,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
