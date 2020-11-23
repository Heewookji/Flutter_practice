import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, index) => Container(
          padding: EdgeInsets.all(8),
          child: Text('This works!'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/s1i0dftkSgC4ukKAUbbZ/messages')
              .snapshots()
              .listen((data) {
            data.docs.forEach((doc) {
              print(doc['text']);
            });
            print(data.docs[0]['text']);
          });
        },
      ),
    );
  }
}
