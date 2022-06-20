import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:youtube_clone/common/constants/assets.dart';
import 'package:youtube_clone/common/utils/shared_pref.dart';
import 'package:youtube_clone/features/authentication/ui/pages/login_page.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({Key? key}) : super(key: key);

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  final List<PageViewModel> _items = [
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Center(
        child: SvgPicture.asset(Assets.intro, height: 175.0),
      ),
    ),
    PageViewModel(
      title: "Title of second page",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Center(
        child: SvgPicture.asset(Assets.videoInfluence, height: 175.0),
      ),
    ),
    PageViewModel(
      title: "Title of third page",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Center(
        child: SvgPicture.asset(Assets.videotutorial, height: 175.0),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _textTheme = _theme.textTheme;
    return Scaffold(
      body: IntroductionScreen(
        pages: _items,
        onDone: () {
          SharedPref.setFirstTime(false);
          Navigator.of(context).pushReplacement(
            PageTransition(
              child: LoginPage(),
              type: PageTransitionType.fade,
            ),
          );
        },
        // When done button is press

        showBackButton: true,
        showSkipButton: false,

        back: const Icon(Icons.keyboard_arrow_left_rounded),
        next: const Icon(Icons.keyboard_arrow_right_rounded),
        done: const Icon(Icons.done_rounded),
      ),
    );
  }
}
