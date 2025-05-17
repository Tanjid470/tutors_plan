import 'dart:async'; // <-- Import this

import 'package:flutter/material.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/const/app_images.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/text_style.dart';
import 'package:tutors_plan/route/app_pages.dart';

import 'onboarding_item.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer; // <-- Timer for auto slide

  final List<OnboardingItem> _onboardingData = [
    OnboardingItem(
      image: AppImages.learningARTPoster,
      title: 'LearningART AI Platform',
      subtitle: 'Personalized learning with advanced AI technology',
    ),
    OnboardingItem(
      image: AppImages.scholarPassPoster,
      title: 'ScholarPASS',
      subtitle: 'Access to exclusive scholarship opportunities',
    ),
    OnboardingItem(
      image: AppImages.tutorLearningPoster,
      title: 'Live Tutoring & Learning',
      subtitle: 'Connect with expert tutors in real-time',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentIndex < _onboardingData.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void _nextPage() {
    if (_currentIndex < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void _skip() {
    Navigator.pushReplacementNamed(context, RouteNames.loginView);
  }

  @override
  void dispose() {
    _timer?.cancel(); // <-- Always cancel timer in dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = _onboardingData[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        item.image,
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: MediaQuery.of(context).size.height * 0.7,
                        fit: BoxFit.contain,
                      ),

                      const SizedBox(height: 30),
                      Column(
                        children: [
                          Text(
                            item.title,
                            style: customTextStyle(
                              context,
                              fontSize: TextSize.font24(context),
                              color: ColorUtils.black87,
                              fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            item.subtitle,
                            style: customTextStyle(
                              context,
                              fontSize: TextSize.font20(context),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: _skip,
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                    child: Text('Skip',
                      style: customTextStyle(
                          context,
                          color: ColorUtils.baseColor,
                          fontSize: TextSize.font16(context)
                      ),
                    ),
                  ),
                ),
                Row(
                  children: List.generate(
                    _onboardingData.length,
                        (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentIndex == index ? 15 : 10,
                      height: _currentIndex == index ? 15 : 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? ColorUtils.baseColor
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: _nextPage,
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                    child: Text('Next',
                      style: customTextStyle(
                          context,
                          color: ColorUtils.baseColor,
                          fontSize: TextSize.font16(context)
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
