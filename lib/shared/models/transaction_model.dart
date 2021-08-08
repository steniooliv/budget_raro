class TransactionModel {
  
  final double value;
  final String tag;
  final String type;
  final String? description;
  final DateTime date;
  
  TransactionModel({
    required this.value,
    required this.tag,
    required this.type,
    this.description = "",
    required this.date,
  });

}
