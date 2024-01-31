import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyImageProvider extends ChangeNotifier {
  File? _selectedImage;
  String? _imageUrl;

  File? get selectedImage => _selectedImage;
  String? get imageUrl => _imageUrl;

  void setSelectedImage(File? image) {
    _selectedImage = image;
    notifyListeners();
  }

  void setImageUrl(String url) {
    _imageUrl = url;
    notifyListeners();
  }
}


FirebaseStorage _storage = FirebaseStorage.instance;

void _uploadImage(BuildContext context, File image) async {
  try {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = _storage.ref().child('images/$fileName');
    UploadTask uploadTask = reference.putFile(image);
    await uploadTask.whenComplete(() async {
      String imageUrl = await reference.getDownloadURL();
      Provider.of<MyImageProvider>(context, listen: false).setImageUrl(imageUrl);
      print('Image uploaded successfully');
    });
  } catch (e) {
    print('Error uploading image: $e');
  }
}
