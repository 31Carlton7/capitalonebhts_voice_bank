// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VbUser {
  int accountID;
  String userID;
  String firstName;
  String lastName;
  String email;
  String accountType;
  double balance;

  VbUser({
    required this.accountID,
    required this.userID,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.accountType,
    required this.balance,
  });

  VbUser copyWith({
    int? accountID,
    String? userID,
    String? firstName,
    String? lastName,
    String? email,
    String? accountType,
    double? balance,
  }) {
    return VbUser(
      accountID: accountID ?? this.accountID,
      userID: userID ?? this.userID,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      accountType: accountType ?? this.accountType,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accountID': accountID,
      'userID': userID,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'accountType': accountType,
      'balance': balance,
    };
  }

  factory VbUser.fromMap(Map<String, dynamic> map) {
    return VbUser(
      accountID: map['accountID'] as int,
      userID: map['userID'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      accountType: map['accountType'] as String,
      balance: map['balance'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory VbUser.fromJson(String source) => VbUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VbUser(accountID: $accountID, userID: $userID, firstName: $firstName, lastName: $lastName, email: $email, accountType: $accountType, balance: $balance)';
  }

  @override
  bool operator ==(covariant VbUser other) {
    if (identical(this, other)) return true;

    return other.accountID == accountID &&
        other.userID == userID &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.accountType == accountType &&
        other.balance == balance;
  }

  @override
  int get hashCode {
    return accountID.hashCode ^
        userID.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        accountType.hashCode ^
        balance.hashCode;
  }
}
