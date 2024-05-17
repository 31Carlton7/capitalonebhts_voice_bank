import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voice_bank/src/constants/environment_keys.dart';

class ChatbotView extends ConsumerStatefulWidget {
  const ChatbotView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatbotViewState();
}

class _ChatbotViewState extends ConsumerState<ChatbotView> {
  final _openAI = OpenAI.instance.build(
    token: OPEN_AI_API_KEY,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 5),
    ),
    enableLog: true,
  );

  final ChatUser _currentUser = ChatUser(
    id: '1',
    firstName: 'John',
    lastName: 'Doe',
  );

  final ChatUser _voiceBankGPT = ChatUser(
    id: '2',
    firstName: 'Voice',
    lastName: 'Bank',
  );

  List<ChatMessage> _messages = [];
  // ignore: prefer_final_fields
  List<ChatUser> _typingUsers = <ChatUser>[];

  @override
  void initState() {
    super.initState();
    _messages = [
      ChatMessage(
        text: 'Hi there!\nI\'m VoiceBank, your personal Capital One voice assistant. How can I help you today?',
        user: _voiceBankGPT,
        createdAt: DateTime.now(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Image.asset('assets/eno_logo.jpg', height: 40),
        actions: [
          IconButton(
            onPressed: () {
              // ignore: avoid_print
              print('Settings');
            },
            icon: const Icon(
              Icons.voice_chat,
              color: Colors.white,
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},

      //   tooltip: 'Increment',
      //   child: const Icon(Icons.voice_chat),
      // ),
      body: DashChat(
        currentUser: _currentUser,
        onSend: (ChatMessage m) {
          getChatResponse(m);
        },
        messages: _messages,
        typingUsers: _typingUsers,
      ),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
      _typingUsers.add(_voiceBankGPT);
    });

    final List<Map<String, dynamic>> messagesHistory = _messages.reversed.map((m) {
      if (m.user == _currentUser) {
        return Messages(role: Role.user, content: m.text).toJson();
      } else {
        return Messages(role: Role.assistant, content: m.text).toJson();
      }
    }).toList();

    final req = ChatCompleteText(
      model: GptTurbo0301ChatModel(),
      messages: messagesHistory,
      maxToken: 200,
    );

    final res = await _openAI.onChatCompletion(request: req);

    for (final e in res!.choices) {
      if (e.message != null) {
        setState(() {
          _messages.insert(
            0,
            ChatMessage(
              text: e.message!.content,
              user: _voiceBankGPT,
              createdAt: DateTime.now(),
            ),
          );
        });
      }
    }

    setState(() {
      _typingUsers.remove(_voiceBankGPT);
    });
  }
}
