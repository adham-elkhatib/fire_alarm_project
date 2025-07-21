import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SensorData {
  final String id;
  final double temperature;
  final double smokeLevel;
  final double temperatureThreshold;
  final double smokeLevelThreshold;
  final Color temperatureColor;
  final Color smokeLevelColor;
  String? token;
  String? address;
  String? name;
  GeoPoint? homeLocation;
  bool? isTriggered;

  SensorData({
    required this.id,
    required this.temperature,
    required this.smokeLevel,
    required this.temperatureThreshold,
    required this.smokeLevelThreshold,
    required this.token,
    this.isTriggered = false,
    this.address,
    this.homeLocation,
    this.name,
  })  : temperatureColor = _getColor(temperature),
        smokeLevelColor = _getColor(smokeLevel);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "smoke_level": smokeLevel,
      "smoke_level_threshold": smokeLevelThreshold,
      "temperature": temperature,
      "temperature_threshold": temperatureThreshold,
      "token": token,
      "address": address,
      "isTriggered": isTriggered,
      'homeLocation': {
        'latitude': homeLocation?.latitude,
        'longitude': homeLocation?.longitude,
      },
      "name": name,
    };
  }

  factory SensorData.fromMap(Map<String, dynamic> map) {
    return SensorData(
      id: map["id"],
      token: map["token"],
      smokeLevel: (map["smoke_level"] as num).toDouble(),
      smokeLevelThreshold: (map["smoke_level_threshold"] as num).toDouble(),
      temperature: (map["temperature"] as num).toDouble(),
      temperatureThreshold: (map["temperature_threshold"] as num).toDouble(),
      address: map["address"] != null ? map["address"] : null,
      isTriggered: map["isTriggered"] != null ? map["isTriggered"] : false,
      homeLocation: map['homeLocation'] != null
          ? GeoPoint(
              (map['homeLocation']['latitude'] as num).toDouble(),
              (map['homeLocation']['longitude'] as num).toDouble(),
            )
          : null,
      name: map["name"] != null ? map["name"] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SensorData.fromJson(String source) =>
      SensorData.fromMap(json.decode(source) as Map<String, dynamic>);

  static Color _getColor(double level) {
    if (level < 200) return Colors.green;
    if (level < 500) return Colors.orange;
    return Colors.red;
  }
}
