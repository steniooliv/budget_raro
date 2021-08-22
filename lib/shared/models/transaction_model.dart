import 'dart:convert';

class TransactionModel {
  final num value;
  final String category;
  final String type;
  final String description;
  final DateTime createdAt;

  TransactionModel({
    required this.value,
    required this.category,
    required this.type,
    required this.description,
    required this.createdAt,
  });

  TransactionModel copyWith({
    num? value,
    String? category,
    String? type,
    String? description,
    DateTime? createdAt,
  }) {
    return TransactionModel(
      value: value ?? this.value,
      category: category ?? this.category,
      type: type ?? this.type,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'category': category,
      'type': type,
      'description': description,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      value: map['value'],
      category: map['category'],
      type: map['type'],
      description: map['description'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  factory TransactionModel.fromMapFirebase(Map<String, dynamic> map) {
    return TransactionModel(
        value: map['value'],
        category: map['category'],
        type: map['type'],
        description: map['description'],
        createdAt: DateTime.fromMillisecondsSinceEpoch(
          (map['createdAt'].millisecondsSinceEpoch),
        ));
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransactionModel(value: $value, category: $category, type: $type, description: $description, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionModel &&
        other.value == value &&
        other.category == category &&
        other.type == type &&
        other.description == description &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return value.hashCode ^
        category.hashCode ^
        type.hashCode ^
        description.hashCode ^
        createdAt.hashCode;
  }
}
