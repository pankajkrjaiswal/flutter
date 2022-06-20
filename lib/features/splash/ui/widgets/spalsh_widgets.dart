import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:youtube_clone/common/constants/assets.dart';
import 'package:youtube_clone/features/onboarding/ui/screens/onboarding_page.dart';
//import 'package:youtube_clone/features/onboarding/ui/screens/onboarding_page.dart';
import 'package:youtube_clone/features/splash/cubit/cubit/startup_cubit.dart';

import '../../../authentication/ui/pages/login_page.dart';

class SplashWidgets extends StatefulWidget {
  const SplashWidgets({Key? key}) : super(key: key);

  @override
  State<SplashWidgets> createState() => _SplashWidgetsState();
}

class _SplashWidgetsState extends State<SplashWidgets> {
  @override
  void initState() {
    super.initState();
    context.read<StartupCubit>().fetchStartupData();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _textTheme = _theme.textTheme;
    return BlocListener<StartupCubit, StartupState>(
      listener: (context, state) {
        if (state is StartupSucess) {
          if (state.isFirstTime) {
            Navigator.of(context).pushReplacement(
              PageTransition(
                  child:  OnboardingPage(),
                   type: PageTransitionType.fade
                   ),
            );
          } else {
            if (state.isLoggedIn) {
              //send to dashboard

            } else {
              Navigator.of(context).pushReplacement(
              PageTransition(
                  child:  LoginPage(), 
                  type: PageTransitionType.fade
                  ),
            );// send to logInscreen
            }
          }
        }
      },
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Assets.youtube,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              const SizedBox(height: 20),
              Text(
                "youtube Clone",
                style: _textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names

}
