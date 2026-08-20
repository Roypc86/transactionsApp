/// Represents a single financial transaction row stored in the Google Sheet.
class TransactionModel {
  const TransactionModel({
    required this.id,
    required this.description,
    required this.amount,
    required this.date,
    required this.category,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] as String,
      description: json['description'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      category: json['category'] as String,
    );
  }

  final String id;
  final String description;
  final double amount;
  final DateTime date;
  final String category;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'amount': amount,
      'date': date.toIso8601String(),
      'category': category,
    };
  }
}
