// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:rocket_help/shared/regex_validator.dart';

class Constants {
  // green colors
  static const green700 = Color(0xFF00875F);
  static const green500 = Color(0xFF00B37E);
  static const green300 = Color(0xFF04D361);

  // primary and secondary colors
  static const primary = Color(0xFF996DFF);
  static const secondary = Color(0xFFFBA94C);

  // gray colors
  static const gray700 = Color(0xFF121214);
  static const gray600 = Color(0xFF202024);
  static const gray500 = Color(0xFF29292E);
  static const gray400 = Color(0xFF323238);
  static const gray300 = Color(0xFF7C7C8A);
  static const gray100 = Color(0xFFE1E1E6);

  // error color
  static const error = Color(0xFFF75A68);

  // validators
  static final passwordValidator = MultiValidator([
    RequiredValidator(
      errorText: 'Campo obrigatório.',
    ),
    MinLengthValidator(
      6,
      errorText: 'Senha deve conter no minímo 6 digitos.',
    ),
    RegexValidator(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*)(?=.*[#$@!%&*?])[A-Za-z\d#$@!%&*?]{6,}$',
      errorText: '',
    ),
  ]);
  static final emailValidator = MultiValidator([
    RequiredValidator(
      errorText: 'Campo obrigatório.',
    ),
    EmailValidator(
      errorText: 'Informe um email Válido.',
    ),
  ]);
}
