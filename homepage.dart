import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  runApp(const MyApp());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text("Chats"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            buildChatTile(
              avatarColor: Colors.pinkAccent,
              icon: Icons.person,
              title: "Crazy Us!",
              subtitle: "Hello! Welcome back",
            ),
            buildChatTile(
              avatarColor: Colors.blueAccent,
              icon: Icons.person,
              title: "Flutter Lover",
              subtitle: "How's your day going?",
            ),
            buildChatTile(
              avatarColor: Colors.greenAccent,
              icon: Icons.person,
              title: "Tech Enthusiast",
              subtitle: "Exciting tech news!",
            ),
            buildChatTile(
              avatarColor: Colors.orangeAccent,
              icon: Icons.person,
              title: "Creative Mind",
              subtitle: "Let's create something amazing!",
            ),
          ],
        ),
      ),
    );
  }

  Widget buildChatTile({
    required Color avatarColor,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: avatarColor,
        child: Icon(icon),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.black),
      ),
      onTap: () {},
    );
  }
}
