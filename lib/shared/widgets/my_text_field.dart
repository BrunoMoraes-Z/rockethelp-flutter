import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:rocket_help/shared/constants.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    Key? key,
    required this.icon,
    required this.placeholder,
    required this.onChange,
    required this.validator,
    this.initial = '',
    this.obscure = false,
    this.keyboardType = TextInputType.name,
    this.inputAction = TextInputAction.done,
  }) : super(key: key);

  final String placeholder;
  final IconData icon;
  final String initial;
  final bool obscure;
  final Function(String) onChange;
  final FieldValidator<String?> validator;
  final TextInputType keyboardType;
  final TextInputAction inputAction;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late TextEditingController controller;
  late Color iconColor = Constants.gray300;
  late bool error = false;
  late bool view = false;

  @override
  void initState() {
    controller = TextEditingController();
    controller.text = widget.initial;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        maxLines: 1,
        controller: controller,
        cursorColor: Constants.green700,
        style: const TextStyle(color: Constants.gray100),
        onChanged: (value) {
          widget.onChange(value);
          setState(() {
            if (error) error = false;
            if (value.trim().isEmpty) {
              iconColor = Constants.gray300;
            } else {
              iconColor = Constants.green700;
            }
          });
        },
        validator: (value) {
          var result = widget.validator(value);
          setState(() {
            error = result != null;
          });
          return result;
        },
        keyboardType: widget.keyboardType,
        textInputAction: widget.inputAction,
        obscureText: widget.obscure && !view,
        decoration: InputDecoration(
          filled: true,
          hintText: widget.placeholder,
          hintStyle: const TextStyle(color: Constants.gray300),
          prefixIcon: Icon(
            widget.icon,
            color: error ? Constants.error : iconColor,
          ),
          suffixIcon: widget.obscure
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      view = !view;
                    });
                  },
                  icon: Icon(
                    view ? PhosphorIcons.eye_closed : PhosphorIcons.eye,
                    color: Constants.gray300,
                  ),
                  splashColor: Colors.transparent,
                )
              : null,
          errorMaxLines: 1,
          errorStyle: const TextStyle(
            fontSize: 0,
          ),
          fillColor: Constants.gray700,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Constants.green700),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Constants.error),
          ),
        ),
      ),
    );
  }
}
