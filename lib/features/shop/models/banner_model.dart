import 'package:cloud_firestore/cloud_firestore.dart'; 
 
class BannerModel { 
  final String id;
  final String imageUrl; 
  final bool active; 
 
  BannerModel({required this.id, required this.imageUrl, required this.active}); 
 
  Map<String, dynamic> toJson() { 
    return { 
      'Id': id,
      'Image': imageUrl, 
      'Active': active, 
    }; 
  } 
 
  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) { 
    final data = snapshot.data() as Map<String, dynamic>; 
    return BannerModel( 
      id: snapshot.id,
      imageUrl: data['Image'] ?? '', 
      active: data['Active'] ?? false, 
    ); 
  } 
}
