import 'package:flutter/material.dart';
import 'package:youtube_clone/common/constants/theme.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final void Function()? onChanged;
  final TextEditingController? controller;
  final String hintText;
  final double bottomMargin;
  const CustomTextField({
    Key? key,
    this.controller,
    this.onChanged,
    required this.title,
    required this.hintText,
    this.bottomMargin = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _textTheme = _theme.textTheme;
    print(_textTheme.headline6!.fontSize);
    return Container(
      padding: EdgeInsets.only(
        bottom: bottomMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: _textTheme.bodyText2!.copyWith(
              fontSize: 16,
              letterSpacing: 0.28,
              color: CustomTheme.textcolor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            style: _textTheme.headline6!.copyWith(
              fontSize: 16,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: _textTheme.headline6!.copyWith(
                fontSize: 16,
                color: CustomTheme.greycolor,
              ),
              contentPadding: 
              const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 20,
              ),
              border: _border,
              errorBorder: _border,
              enabledBorder: _border,
              focusedBorder: _border,
              disabledBorder: _border,
              focusedErrorBorder: _border,
            ),
          ),
        ],
      ),
    );
  }

  InputBorder get _border {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: CustomTheme.greycolor,
        width: 1,
      ),
    );
  }
}
