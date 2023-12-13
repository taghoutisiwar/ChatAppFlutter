import 'package:chat_app/controller/authController.dart';
import 'package:chat_app/view/chat/chat.dart';
import 'package:chat_app/view/chat/mainScreenChat.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_app/model/user.model.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: usersCollection.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<UserModel> userList = [];
          snapshot.data!.docs.forEach((doc) {
            userList.add(UserModel.fromJson(doc));
          });

          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/chatflutter2-34aef.appspot.com/o/3177440.png?alt=media&token=2f1cc372-0524-45e9-9ed8-4b9e5e1bae75"),
                ),
                title: Text(
                    "${userList[index].firstName} ${userList[index].lastName}"),
                onTap: () {
                  // Sort UIDs in ascending order
                  List<String> uids = [
                    userList[index].uid,
                    AuthController.instance.getUser().uid
                    // Add the other user's UID here
                  ];
                  uids.sort();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        chat: Chat(
                          lobbyName:
                              "${userList[index].firstName} ${userList[index].lastName}",
                          collectionName: 'privateChat_${uids[0]}_${uids[1]}',
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
