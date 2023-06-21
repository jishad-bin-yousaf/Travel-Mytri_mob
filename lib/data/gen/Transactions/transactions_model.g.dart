// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../model/Transactions/transactions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountStatementResponse _$$_AccountStatementResponseFromJson(
        Map<String, dynamic> json) =>
    _$_AccountStatementResponse(
      status: json['status'] as bool?,
      responseMessage: json['responseMessage'] as String?,
      objDaywiseStatement: (json['objDaywiseStatement'] as List<dynamic>?)
          ?.map((e) => DaywiseStatement.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_AccountStatementResponseToJson(
        _$_AccountStatementResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'responseMessage': instance.responseMessage,
      'objDaywiseStatement': instance.objDaywiseStatement,
      'totalAmount': instance.totalAmount,
    };

_$_DaywiseStatement _$$_DaywiseStatementFromJson(Map<String, dynamic> json) =>
    _$_DaywiseStatement(
      date: json['date'] as String?,
      objAccountStatement: (json['objAccountStatement'] as List<dynamic>?)
          ?.map((e) => AccountStatement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DaywiseStatementToJson(_$_DaywiseStatement instance) =>
    <String, dynamic>{
      'date': instance.date,
      'objAccountStatement': instance.objAccountStatement,
    };

_$_AccountStatement _$$_AccountStatementFromJson(Map<String, dynamic> json) =>
    _$_AccountStatement(
      transactionType: json['transactionType'] as String?,
      transactionDetails: json['transactionDetails'] as String?,
      time: json['time'] as String?,
      source: json['source'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      comments: json['comments'] as String?,
    );

Map<String, dynamic> _$$_AccountStatementToJson(_$_AccountStatement instance) =>
    <String, dynamic>{
      'transactionType': instance.transactionType,
      'transactionDetails': instance.transactionDetails,
      'time': instance.time,
      'source': instance.source,
      'amount': instance.amount,
      'comments': instance.comments,
    };
