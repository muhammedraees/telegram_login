import 'package:flutter/material.dart';

class chat extends StatefulWidget {
  final String name;
  final String image;

  const chat({Key? key, required this.name, required this.image}) : super(key: key);

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0088CC),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(widget.image),
            ),
            const SizedBox(width: 10.0),
            Text(
              widget.name,
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 560),
          Align( alignment: Alignment.centerLeft,
            child: Text('hi')),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Message',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}