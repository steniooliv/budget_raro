import 'package:intl/intl.dart';

class Formatter {

String real(value) {
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatter.format(value);
  }

}