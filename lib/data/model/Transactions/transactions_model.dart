import 'package:freezed_annotation/freezed_annotation.dart';

part '../../gen/Transactions/transactions_model.freezed.dart';
part '../../gen/Transactions/transactions_model.g.dart';

@freezed
class AccountStatementResponse with _$AccountStatementResponse {
  const factory AccountStatementResponse({
    bool? status,
    String? responseMessage,
    List<DaywiseStatement>? objDaywiseStatement,
    double? totalAmount,
  }) = _AccountStatementResponse;

  factory AccountStatementResponse.fromJson(Map<String, dynamic> json) => _$AccountStatementResponseFromJson(json);
}

@freezed
class DaywiseStatement with _$DaywiseStatement {
  const factory DaywiseStatement({
    String? date,
    List<AccountStatement>? objAccountStatement,
  }) = _DaywiseStatement;

  factory DaywiseStatement.fromJson(Map<String, dynamic> json) => _$DaywiseStatementFromJson(json);
}

@freezed
class AccountStatement with _$AccountStatement {
  const factory AccountStatement({
    String? transactionType,
    String? transactionDetails,
    String? time,
    String? source,
    double? amount,
    String? comments,
  }) = _AccountStatement;

  factory AccountStatement.fromJson(Map<String, dynamic> json) => _$AccountStatementFromJson(json);
}
