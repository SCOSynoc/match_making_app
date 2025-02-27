import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_making/utils/customTextTheme.dart';

class CommonMainTextField extends StatelessWidget {
  const CommonMainTextField({
    super.key,
    required TextEditingController controller, required hintText,
    bool? obscure
  }) : _textController = controller, _hintText = hintText, _obscure= obscure ;

  final TextEditingController _textController;
  final String _hintText;
  final bool? _obscure;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
        controller: _textController,
        placeholder: _hintText,
        obscureText: _obscure ?? false,
        placeholderStyle: AppTextTheme.placeHolderStyle(context),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Theme.of(context).primaryColorLight)
        )
    );
  }
}