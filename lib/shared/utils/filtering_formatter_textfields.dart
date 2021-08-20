import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final RegExp emoji = RegExp(
  '\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff]'
);

class FilteringFormatter {
  List<TextInputFormatter> name = [
    FilteringTextInputFormatter.allow(
      RegExp(r'^[a-zA-Zà-úÀ-Ú]+\s?[a-zA-Zà-úÀ-Ú]{0,}$')
    ),
    LengthLimitingTextInputFormatter(20),
  ];
  List<TextInputFormatter> email = [
    FilteringTextInputFormatter.deny(RegExp(r"[\sA-ZÀ-Ú]")),
    FilteringTextInputFormatter.deny(emoji),
    LengthLimitingTextInputFormatter(40),
  ];
  List<TextInputFormatter> phone = [
    MaskTextInputFormatter(
      mask: '## #####-####',
      filter: {"#": RegExp(r'\d+')}
    ),
  ];
  List<TextInputFormatter> cpf = [
    MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {"#": RegExp(r'[0-9]')}
    ),
  ];
  List<TextInputFormatter> password = [
  FilteringTextInputFormatter.deny(RegExp(r"\s")),
  LengthLimitingTextInputFormatter(12),
  ];
  List<TextInputFormatter> value = [
    FilteringTextInputFormatter.allow(
      RegExp(r"^(0{1}|[1-9]\d*)(\.|,)?\d{0,2}")
    ),
    FilteringTextInputFormatter.deny(
      RegExp(r"\,"),
      replacementString: "."
    ),
    FilteringTextInputFormatter.deny(
      RegExp(r"\.{2}"),
      replacementString: "."
    ),
    FilteringTextInputFormatter.deny(
      RegExp(r"^(0{2}|0[^\.])"),
      replacementString: "0"
    ),
  ];
  List<TextInputFormatter> description = [
    FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Zà-úÀ-Ú]+')),
    LengthLimitingTextInputFormatter(20),
  ];
}