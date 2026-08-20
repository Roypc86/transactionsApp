import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_service.dart';
import '../models/transaction_model.dart';

part 'transaction_repository.g.dart';

/// Mediates access to the transactions endpoint of the Google Apps Script
/// API, translating raw JSON into [TransactionModel] instances.
class TransactionRepository {
  const TransactionRepository(this._apiService);

  final ApiService _apiService;

  static const String _basePath = '/transactions';

  Future<List<TransactionModel>> getTransactions() async {
    final response = await _apiService.get(_basePath);
    final items = (response as List).cast<Map<String, dynamic>>();
    return items.map(TransactionModel.fromJson).toList();
  }

  Future<void> addTransaction(TransactionModel transaction) {
    return _apiService.post(_basePath, body: transaction.toJson());
  }
}

@riverpod
TransactionRepository transactionRepository(Ref ref) {
  return TransactionRepository(ref.watch(apiServiceProvider));
}
