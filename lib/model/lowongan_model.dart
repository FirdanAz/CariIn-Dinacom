import 'package:cloud_firestore/cloud_firestore.dart';

class LowonganModel {
  String? id;
  String? name;
  String? ptName;
  String? ptLocation;
  String? profession;
  String? division;
  String? experience;
  Timestamp? timestamp;

  LowonganModel({
    required this.id,
    required this.name,
    required this.ptName,
    required this.ptLocation,
    required this.profession,
    required this.division,
    required this.experience,
    required this.timestamp
});
}