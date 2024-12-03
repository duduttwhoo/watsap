import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WhatsAppHome(),
    );
  }
}

class WhatsAppHome extends StatelessWidget {
  final List<Map<String, dynamic>> chats = [
    {
      "name": "Cintakuu",
      "message": "Sayanggg?",
      "time": "09:34",
      "unread": 1,
    },
    {
      "name": "Andre",
      "message": "Ayo siti",
      "time": "09:10",
      "unread": 1,
    },
    {
      "name": "Alip",
      "message": "Tc ulang?",
      "time": "08:08",
      "unread": 1,
    },
    {
      "name": "Samid",
      "message": "Ayo bolooo",
      "time": "Yesterday",
      "unread": 2,
    },
    {
      "name": "Mafia Pentol",
      "message": "Sinio kerumah",
      "time": "Yesterday",
      "unread": 4,
    },
    {
      "name": "TIM NGGACLE",
      "message": "Ale: Hantu laut",
      "time": "Yesterday",
      "unread": 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF25D366),
          title: Text("WhatsApp"),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.camera_alt)),
              Tab(text: "CHATS"),
              Tab(text: "STATUS"),
              Tab(text: "CALLS"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Camera feature is not implemented yet.")),
            _buildChatList(),
            Center(child: Text("Status feature is not implemented yet.")),
            Center(child: Text("Calls feature is not implemented yet.")),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xFF25D366),
          child: Icon(Icons.message),
        ),
      ),
    );
  }

  Widget _buildChatList() {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          chats.length,
          (index) {
            final chat = chats[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: Text(
                  chat['name']![0],
                  style: TextStyle(color: Colors.black),
                ),
              ),
              title: Text(
                chat['name']!,
                style: TextStyle(
                  fontWeight:
                      chat['unread'] > 0 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              subtitle: Text(
                chat['message']!,
                style: TextStyle(
                  fontWeight:
                      chat['unread'] > 0 ? FontWeight.bold : FontWeight.normal,
                  color: chat['unread'] > 0 ? Colors.black : Colors.grey,
                ),
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    chat['time']!,
                    style: TextStyle(
                      color: chat['unread'] > 0 ? Colors.green : Colors.grey,
                      fontWeight: chat['unread'] > 0
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  if (chat['unread'] > 0)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xFF25D366),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        chat['unread'].toString(),
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
