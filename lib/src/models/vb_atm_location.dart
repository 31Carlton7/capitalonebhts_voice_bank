// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VbATMLocation {
  int atmID;
  double latitude;
  double longitude;
  double address;

  VbATMLocation({
    required this.atmID,
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  VbATMLocation copyWith({
    int? atmID,
    double? latitude,
    double? longitude,
    double? address,
  }) {
    return VbATMLocation(
      atmID: atmID ?? this.atmID,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'atmID': atmID,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
    };
  }

  factory VbATMLocation.fromMap(Map<String, dynamic> map) {
    return VbATMLocation(
      atmID: map['atmID'] as int,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      address: map['address'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory VbATMLocation.fromJson(String source) => VbATMLocation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VbATMLocation(atmID: $atmID, latitude: $latitude, longitude: $longitude, address: $address)';
  }

  @override
  bool operator ==(covariant VbATMLocation other) {
    if (identical(this, other)) return true;

    return other.atmID == atmID &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.address == address;
  }

  @override
  int get hashCode {
    return atmID.hashCode ^ latitude.hashCode ^ longitude.hashCode ^ address.hashCode;
  }
}
