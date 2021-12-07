import 'dart:html';
import 'package:flutter/material.dart';

final String tableParking = "parkingdata";


class GuestFields{
  static final List<String> values = [
    id, licensePlate, timeCheckin, timeCheckout, imgPath
  ];
  static final String id = 'id';
  static final String licensePlate = 'licensePlate';
  static final String timeCheckin = 'timeCheckin';
  static final String timeCheckout = 'timeCheckout';
  static final String imgPath = 'imgPath';
}

class Guest{
  final int? id;
  final String licensePlate;
  final DateTime timeCheckin;
  final DateTime? timeCheckout;
  final String imgPath;

  Guest({
  required this.id,
  required this.licensePlate,
  required this.timeCheckin,
  required this.timeCheckout,
  required this.imgPath,
});

  Guest copy({
    int? id,
    String? licensePlate,
    DateTime? timeCheckin,
    DateTime? timeCheckout,
    String? imgPath,
}) =>
  Guest(
    id: id ?? this.id,
    licensePlate: licensePlate ?? this.licensePlate,
    timeCheckin: timeCheckin ?? this.timeCheckin,
    timeCheckout: timeCheckout ?? this.timeCheckout,
    imgPath: imgPath ?? this.imgPath,
  );

  static Guest fromJson(Map<String, Object?> json) => Guest (
    id: json[GuestFields.id] as int?,
    licensePlate: json[GuestFields.licensePlate] as String,
    timeCheckin: DateTime.parse(json[GuestFields.timeCheckin] as String),
    timeCheckout: DateTime.parse(json[GuestFields.timeCheckout] as String),
    imgPath: json[GuestFields.imgPath] as String,
  );

  Map<String, Object?> toJson()=> {
      GuestFields.id: id,
      GuestFields.licensePlate: licensePlate,
      GuestFields.timeCheckin: timeCheckin.toIso8601String(),
      GuestFields.timeCheckout: timeCheckout!.toIso8601String(),
      GuestFields.imgPath: imgPath,

  }
}
