import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ggo/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String name;
  String phoneNumber;
  final String email;
  String profilePicture;

  /// Конструктор для UserModel
  UserModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.profilePicture,
  });

  /// Вспомогательная функция для получения номера телефона
  String get formattedPhoneNo => GFormatter.formatPhoneNumber(phoneNumber);

  /// Статический метод для создания пустой модели пользователя
  static UserModel empty() => UserModel(id: '', name: '', phoneNumber: '', email: '', profilePicture: '');

  /// Преобразование модели в структуру JSON для хранения данных в Firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'PhoneNumber': phoneNumber,
      'Email': email,
      'ProfilePicture': profilePicture,
    };
  }

  /// Отображение снимка документа, ориентированного на Json, из Firebase в UserModel
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
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