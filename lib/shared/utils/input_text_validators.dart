import 'package:form_field_validator/form_field_validator.dart';
import 'package:validatorless/validatorless.dart';

class Validator {
  static final isEmpty = RequiredValidator(errorText: "campo necessário!"); 
  
  final name = MultiValidator([
    isEmpty,
    MinLengthValidator(
      3,
      errorText: "deve ter no mínimo 3 caracteres"
    )
  ]);

  final email = MultiValidator([
    isEmpty,
    EmailValidator(errorText: "e-mail inválido")
  ]);

  final phone = MultiValidator([
    isEmpty,
    MinLengthValidator(13, errorText: "número inválido"),
    PatternValidator(r"^[1-9]{2}\s[9][\d]{4}\-[\d]{4}$",
      errorText: "digite um número de celular válido"
    ),
  ]);
  
  final cpf = Validatorless.multiple([
    isEmpty,
    Validatorless.cpf("CPF inválido")
  ]);

  final password = MultiValidator([
    isEmpty,
    MinLengthValidator( 
      8, errorText: "pelo menos 8 caracteres"
    ),
    PatternValidator(r"[A-Z]",
      errorText: "pelo menos uma letra maiúscula"),
    PatternValidator(r"[a-z]",
      errorText: "pelo menos uma letra minúscula"),
    PatternValidator(r"\d",
      errorText: "deve ter um número"),
    PatternValidator(r"[}{,.^?~=+\-_\/*\-+.\|@#&<>%\$!]",
      errorText: "deve ter um símbolo"),
  ]);
  
  final value = MultiValidator([
    isEmpty,
    PatternValidator(
      r'[1-9]',
      errorText: 'o valor não pode ser zero'
    )
  ]);

  String? confirmPassword (String? value, String password) {
    return MatchValidator(
      errorText: 'as senhas não conferem').validateMatch(
        value!, password
      );
  }
}