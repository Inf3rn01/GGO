import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ggo/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String name;
  String phoneNumber;
  final String email;
  String profilePicture;


  ///Constructor for UserModel
  UserModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.profilePicture,
  });

  /// Helper function to get the phone number
  String get formattedPhoneNo => GFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to create empty user model
  static UserModel empty() => UserModel(id: '', name: '', phoneNumber: '', email: '',  profilePicture: '');

  /// Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Name' : name,
      'PhoneNumber' : phoneNumber,
      'Email' : email,
      'ProfilePicture' : profilePicture,
    };
  }

  /// Factory method to create a UserModel from a Firebase document snapshot
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null){
      final data = document.data()!;
      return UserModel(
        id: document.id,
        name: data['Name'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        email: data['Email'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }

}