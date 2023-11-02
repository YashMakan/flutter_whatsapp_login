import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'constants.dart';
import 'home_screen.dart';
import 'whatsapp_login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? generatedOtp;
  late WebSocketChannel channel;

  @override
  void initState() {
    channel = IOWebSocketChannel.connect(
        'ws://565e-2406-7400-63-7676-d9ef-3ea-8743-a851.ngrok-free.app/ws');
    channel.stream.listen((event) {
      final response = jsonDecode(event);
      print(response);
      if (response['Body'][0].split(':').last.toString().trim() == generatedOtp) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(response: response)));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: WhatsAppLoginButton(
          onTap: () {
            generatedOtp =
                List.generate(6, (index) => Random().nextInt(9).toString())
                    .toList()
                    .join();
            String message = "The phone verification code is: $generatedOtp";
            launchUrl(Uri.parse('https://wa.me/$twilioNumber/?text=$message'));
          },
        ),
      ),
    );
  }
}
