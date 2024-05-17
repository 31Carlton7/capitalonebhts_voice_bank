// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sign_in_button/sign_in_button.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voice_bank/main.dart';
import 'package:voice_bank/src/models/vb_user.dart';
import 'package:voice_bank/src/ui/views/chatbot_view/chatbot_view.dart';

class AuthView extends ConsumerStatefulWidget {
  const AuthView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthViewState();
}

class _AuthViewState extends ConsumerState<AuthView> {
  // final _supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to VoiceBank!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0070A8),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  var db = await openDatabase('assets/bank.db');
                  List<Map<String, dynamic>> listOfUsers =
                      await db.rawQuery('SELECT * FROM user_accounts ORDER BY RANDOM() LIMIT 1');
                  currentUser = listOfUsers.map((e) => VbUser.fromMap(e)).first;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ChatbotView();
                      },
                    ),
                  );
                },
                child: const Text('Sign In'),
              ),
              // SignInButton(
              //   Buttons.google,
              //   onPressed: () async {
              //     await _supabase.auth.signInWithOAuth(
              //       OAuthProvider.google,
              //       redirectTo: kIsWeb ? null : 'io.supabase.flutter://reset-callback/',
              //     );
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
