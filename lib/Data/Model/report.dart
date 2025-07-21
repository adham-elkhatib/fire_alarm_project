import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

enum Status {
  responded,
  underReview,
  falseReport,
}

extension StatusDescription on Status {
  String get description {
    switch (this) {
      case Status.responded:
        return 'Responded';
      case Status.underReview:
        return 'UnderReview';
      case Status.falseReport:
        return 'False Report';
    }
  }
}

class Report {
  String id;
  String name;
  String address;
  GeoPoint homeLocation;
  final DateTime dateTime;
  final Status status;

  Report({
    required this.id,
    required this.name,
    required this.address,
    required this.homeLocation,
    required this.status,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address,
      'homeLocation': homeLocation,
      'status': status.index,
      'dateTime': dateTime,
    };
  }

  factory Report.fromMap(Map<String, dynamic> map) {
    final GeoPoint homeLocation = map['homeLocation'] as GeoPoint;

    return Report(
      id: map['id'] as String,
      name: map['name'] as String,
      address: map['address'] as String,
      homeLocation: homeLocation,
      dateTime: (map['dateTime'] as Timestamp).toDate(),
      status: Status.values[map['status'] as int],
    );
  }

  String toJson() => json.encode(toMap());

  factory Report.fromJson(String source) =>
      Report.fromMap(json.decode(source) as Map<String, dynamic>);
}
