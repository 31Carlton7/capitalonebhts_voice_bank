// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VbTransaction {
  int transactionID;
  int senderAccountID;
  int receiverAccountID;
  double amount;
  String timestamp;

  VbTransaction({
    required this.transactionID,
    required this.senderAccountID,
    required this.receiverAccountID,
    required this.amount,
    required this.timestamp,
  });

  VbTransaction copyWith({
    int? transactionID,
    int? senderAccountID,
    int? receiverAccountID,
    double? amount,
    String? timestamp,
  }) {
    return VbTransaction(
      transactionID: transactionID ?? this.transactionID,
      senderAccountID: senderAccountID ?? this.senderAccountID,
      receiverAccountID: receiverAccountID ?? this.receiverAccountID,
      amount: amount ?? this.amount,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'transactionID': transactionID,
      'senderAccountID': senderAccountID,
      'receiverAccountID': receiverAccountID,
      'amount': amount,
      'timestamp': timestamp,
    };
  }

  factory VbTransaction.fromMap(Map<String, dynamic> map) {
    return VbTransaction(
      transactionID: map['transactionID'] as int,
      senderAccountID: map['senderAccountID'] as int,
      receiverAccountID: map['receiverAccountID'] as int,
      amount: map['amount'] as double,
      timestamp: map['timestamp'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VbTransaction.fromJson(String source) => VbTransaction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VbTransaction(transactionID: $transactionID, senderAccountID: $senderAccountID, receiverAccountID: $receiverAccountID, amount: $amount, timestamp: $timestamp)';
  }

  @override
  bool operator ==(covariant VbTransaction other) {
    if (identical(this, other)) return true;

    return other.transactionID == transactionID &&
        other.senderAccountID == senderAccountID &&
        other.receiverAccountID == receiverAccountID &&
        other.amount == amount &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return transactionID.hashCode ^
        senderAccountID.hashCode ^
        receiverAccountID.hashCode ^
        amount.hashCode ^
        timestamp.hashCode;
  }
}
