import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/widgets/chat_buble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  static String id = 'ChatView';
  final listController = ScrollController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection(keyMessageCollection);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreateAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messageList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(MessageModel.formJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: kPrimaryColor,
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    kLogo,
                    height: 50,
                  ),
                  const Text(
                    'chat',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            body: Column(children: [
              Expanded(
                child: ListView.builder(
                    reverse: true,
                    controller: listController,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return messageList[index].id == email
                          ? ChatBuble(
                              messageModel: messageList[index],
                            )
                          : ChatBubleForFriend(
                              messageModel: messageList[index]);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: controller,
                  onSubmitted: (value) {
                    _sendMessage(value, email);
                  },
                  decoration: InputDecoration(
                    hintText: 'Send Message',
                    suffixIcon: IconButton(
                      onPressed: () => _sendMessage(controller.text, email),
                      icon:const Icon(Icons.send),
                      color: kPrimaryColor,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: kPrimaryColor)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: kPrimaryColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ]),
          );
        } else {
          return const Text("Loadding......................");
        }
      },
    );
  }

  void _sendMessage(String value, String email) {
    messages.add(
      {
        kMessage: value,
        kCreateAt: DateTime.now(),
        'id': email,
      },
    );
    controller.clear();
    listController.animateTo(0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn);
  }
}
