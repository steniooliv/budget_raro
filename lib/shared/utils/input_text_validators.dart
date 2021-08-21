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
  ]);
  
  final cpf = Validatorless.multiple([
    isEmpty,
    Validatorless.cpf("CPF inválido")
  ]);

  final password = MultiValidator([
    isEmpty,
    MinLengthValidator( 
      6,
      errorText: "deve ter entre 6 e 8 caracteres"
    )
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