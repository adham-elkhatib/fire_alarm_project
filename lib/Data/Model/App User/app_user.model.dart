import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../gender.enum.dart';

class AppUser {
  String id;
  String email;
  String name;
  Gender gender;
  String address;
  GeoPoint homeLocation;

  AppUser({
    required this.id,
    required this.email,
    required this.name,
    required this.gender,
    required this.address,
    required this.homeLocation,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'fullName': name,
      'gender': gender.index,
      'address': address,
      'homeLocation': {
        'latitude': homeLocation.latitude,
        'longitude': homeLocation.longitude,
      },
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] as String,
      email: map['email'] as String,
      name: map['fullName'] as String,
      gender: Gender.values[map['gender'] as int],
      address: map['address'] as String,
      homeLocation: GeoPoint(
        (map['homeLocation']['latitude'] as num).toDouble(),
        (map['homeLocation']['longitude'] as num).toDouble(),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
