import 'package:lumas/general/configs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final TextEditingController txtController;
  final String label;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? errorText;
  final ValueChanged<String>? onSubmitted;

  Input({
    this.obscureText = false,
    required this.txtController,
    required this.label,
    this.keyboardType,
    this.errorText,
    this.onSubmitted,
  });

  @override
  State<StatefulWidget> createState() {
    return _InputState();
  }
}

class _InputState extends State<Input> {
  late FocusNode _focusNode;
  bool _isFocussing = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus != _isFocussing) {
        setState(() {
          _isFocussing = _focusNode.hasFocus;
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.txtController,
      obscureText: widget.obscureText,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      style: TextStyle(
        color: AppColor.blackMain,
        fontWeight: AppFont.wMedium,
        fontSize: 25,
      ),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          fontWeight: AppFont.wLight,
          fontSize: 20,
          color: _isFocussing ? AppColor.pinkPrimary : AppColor.blackMain,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.pinkPrimary,

          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.pinkPrimary,
          ),
        ),
        errorText: widget.errorText ?? null,
      ),
      onSubmitted: widget.onSubmitted,
    );
  }
}
