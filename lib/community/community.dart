import 'package:flutter/material.dart';
import 'package:sustain/community/community_chat.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Community();
  }
}

class _Community extends State<Community> {
  final List<Widget> _chats = <Widget>[];

  _addChat(String title, String description, num id) {
    _chats.add(
      ListTile(
        title: Text(title),
        subtitle: Text(description),
        isThreeLine: true,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CommunityChat(
                title: title,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _addChat("Aufräumen", "Räumet den Müll weg....", 1);
    _addChat("Bla", "Räumet den Müll weg....", 2);
    _addChat("Blubb", "Räumet den Müll weg....", 3);
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Community",
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(
          10,
        ),
        child: Column(
          children: _chats,
        ),
      ),
    );
  }
}
