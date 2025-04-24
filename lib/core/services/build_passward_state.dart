import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/widgets/custom_text_feild.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

class BiludPasswordState extends StatefulWidget {
  const BiludPasswordState({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<BiludPasswordState> createState() => _BiludPasswordStateState();
}

class _BiludPasswordStateState extends State<BiludPasswordState> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormFeild(
      obscureText: _isObscure,
      onSaved: widget.onSaved,
      hintText: S.of(context).on_signup_password,
      textInputType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            _isObscure = !_isObscure;
          });
        },
        child:
            _isObscure
                ? const Icon(Icons.remove_red_eye, color: Color(0xFFC9CECF))
                : const Icon(Icons.visibility_off, color: Color(0xFFC9CECF)),
      ),
    );
  }
}
