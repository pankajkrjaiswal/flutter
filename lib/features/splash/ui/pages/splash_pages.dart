import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/features/splash/cubit/cubit/startup_cubit.dart';
import 'package:youtube_clone/features/splash/ui/widgets/spalsh_widgets.dart';

class SplashPages extends StatelessWidget {
  const SplashPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StartupCubit(),
      child: const SplashWidgets(),
    );
  }
}
