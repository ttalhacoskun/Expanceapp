import 'package:expance_app/Home_page.dart';
import 'package:expance_app/view_Model/MyImageProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyImageProvider(), // MyImageProvider olarak değiştirildi
      child: MaterialApp(
        home: Home_page(),
      ),
    );
  }
}
