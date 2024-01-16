import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_kullanimi/models/message.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final User user;

  MessageBubble({super.key, required this.message, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: message.userID == user.uid
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: message.userID == user.uid ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                bottomLeft: message.userID == user.uid
                    ? const Radius.circular(12)
                    : Radius.zero,
                bottomRight: message.userID == user.uid
                    ? Radius.zero
                    : const Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.all(8),
            child: Text(
              message.message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
