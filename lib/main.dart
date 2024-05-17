import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voice_bank/src/constants/environment_keys.dart';
import 'package:voice_bank/src/models/vb_user.dart';
import 'package:voice_bank/src/ui/views/auth_view/auth_view.dart';

var currentUser = VbUser(
  accountID: 0,
  userID: '',
  firstName: '',
  lastName: '',
  email: '',
  accountType: '',
  balance: 0.0,
);

void main() async {
  await Supabase.initialize(url: 'https://hvmjjvjcszyhgubfbnnn.supabase.co', anonKey: SUPABASE_API_KEY);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VoiceBank',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0070A8)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthView(),
    );
  }
}
