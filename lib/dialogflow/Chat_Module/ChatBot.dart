import 'package:dialog_flowtter_plus/dialog_flowtter_plus.dart';
import 'package:flutter/material.dart';
import 'MyMessages.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appBar:AppBar(elevation:3,shadowColor:Colors.blue,
      //     leading:Padding(
      //       padding: const EdgeInsets.only(left:10),
      //       child: CircleAvatar(backgroundImage:AssetImage("assets/images/images/img_4.png")),
      //     ),
      //   title:Column(
      //     children: [
      //       Text("SafetyBOT",style:Theme.of(context).textTheme.headlineSmall),
      //       Text("What can I Help You..",style:Theme.of(context).textTheme.bodySmall),
      //     ],
      //   )
      // ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: MessagesScreen(messages: messages)),
            Container(
              padding: EdgeInsets.symmetric(horizontal:10, vertical:5),
              color: Colors.white24,
              child: Row(
                children: [
                  Expanded(
                      child:TextFormField(
                        controller: _controller,
                      )),
                  IconButton(
                    iconSize:30,
                      onPressed: () {
                        sendMessage(_controller.text);
                        _controller.clear();
                      },
                      icon: Icon(Icons.send,color:Colors.blue))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty',);
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}