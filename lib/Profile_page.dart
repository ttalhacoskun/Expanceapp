import 'dart:io';git
import 'package:expance_app/view_Model/MyImageProvider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => MyImageProvider()),
          ],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () async {
                  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

                  if (pickedFile != null) {
                    Provider.of<MyImageProvider>(context, listen: false).setSelectedImage(File(pickedFile.path));
                    _uploadImage(context, File(pickedFile.path));
                  }
                },
                child: Consumer<MyImageProvider>(
                  builder: (context, imageProvider, _) => CircleAvatar(
                    radius: 48,
                    backgroundImage: imageProvider.selectedImage != null ? FileImage(imageProvider.selectedImage!) : null,
                    child: imageProvider.selectedImage == null ? Icon(Icons.add) : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _uploadImage(BuildContext context, File image) async {
    try {
      FirebaseStorage _storage = FirebaseStorage.instance;
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
}


/*class _ProfilePageState extends State<ProfilePage> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => MyImageProvider()),
          ],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () async {
                  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

                  if (pickedFile != null) {
                    Provider.of<MyImageProvider>(context, listen: false).setSelectedImage(File(pickedFile.path));
                    _uploadImage(context, File(pickedFile.path));
                  }
                },
                child: Consumer<MyImageProvider>(
                  builder: (context, imageProvider, _) => CircleAvatar(
                    radius: 48,
                    backgroundImage: imageProvider.selectedImage != null ? FileImage(imageProvider.selectedImage!) : null,
                    child: imageProvider.selectedImage == null ? Icon(Icons.add) : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _uploadImage(BuildContext context, File image) async {
    try {
      FirebaseStorage _storage = FirebaseStorage.instance;
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
}

void main() {
  runApp(
    MaterialApp(
      home: ProfilePage(),
    ),
  );
}
*/