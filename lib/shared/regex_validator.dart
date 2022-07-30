import 'package:form_field_validator/form_field_validator.dart';

class RegexValidator extends TextFieldValidator {
  final String format;

  RegexValidator(this.format, {required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) {
    return RegExp(format).hasMatch(value ?? '');
  }
}
