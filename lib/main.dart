import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_info_app/provider/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:weather_info_app/screens/guest_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDE-tDrT1avCJoiyQWFzKxsuAU4DfwarhI",
      appId: "1:830318338117:android:7a1ab0e6b8fd0bda22832c",
      messagingSenderId: "830318338117",
      projectId: "weatherinfo-4a6f1",
    ),
  );

  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AuthSevice().handleAuthState(),
  );
}
