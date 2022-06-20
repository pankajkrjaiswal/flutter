import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:youtube_clone/common/constants/assets.dart';
import 'package:youtube_clone/common/constants/theme.dart';
import 'package:youtube_clone/common/widgets/button/custom_rounded_button.dart';
import 'package:youtube_clone/common/widgets/textfield/custom_textfield.dart';
import 'package:youtube_clone/features/authentication/cubit/social_cubit.dart';

class LoginWidgets extends StatefulWidget {
  const LoginWidgets({Key? key}) : super(key: key);

  @override
  State<LoginWidgets> createState() => _LoginWidgetsState();
}

class _LoginWidgetsState extends State<LoginWidgets> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SocialCubit,SocialState>(
      listener: (context, state) {
        
        setState(() {
          _isLoading = true;
        
        });
      },
      child: LoadingOverlay(
        isLoading: _isLoading,
        child: Scaffold(
          appBar: AppBar(backgroundColor: CustomTheme.primarycolor),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: CustomTheme.horizontalpadding,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CustomTextField(
                    title: "EMAIL Address",
                    hintText: "Enter email address",
                    controller: _emailcontroller,
                  ),
                  CustomTextField(
                    title: "Password",
                    hintText: "Enter Password",
                    controller: _passwordcontroller,
                  ),
                  CustomRoundedButton(
                    title: "LOGIN",
                    onPressed: () {},
                    //width: double.infinity,
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    height: 1,
                  ),
                  const SizedBox(height: 20),
                  const Text("or sign with"),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<SocialCubit>().loginWithGoogle();
                        },
                        icon: Image.asset(
                          Assets.google,
                          height: 50,
                          width: 50,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          Assets.facebook,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
