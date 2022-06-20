import 'package:flutter/material.dart';
import 'package:youtube_clone/common/constants/theme.dart';

class CustomRoundedButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final double? width;
  const CustomRoundedButton({
    Key? key,
    this.onPressed,
    required this.title,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _textTheme = _theme.textTheme;
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: CustomTheme.primarycolor,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: _textTheme.headline6!.copyWith(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
