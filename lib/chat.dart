import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:image_picker/image_picker.dart';

import 'global.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    int index = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leadingWidth: 30,
        leading: IconButton(
          splashRadius: 10,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        title: Row(
          children: [
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'profile', arguments: index),
              child: CircleAvatar(
                backgroundImage: AssetImage(Global.contact[index]['proImage']),
              ),
            ),
            const SizedBox(width: 15),
            Text(
              Global.contact[index]['conName'],
              style: const TextStyle(
                fontFamily: 'Iphone',
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 65,
          color: Colors.black,
          child: Row(
            children: [
              IconButton(
                splashRadius: 20,
                icon: const Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                splashRadius: 20,
                icon: const Icon(
                  Icons.camera,
                  size: 28,
                  color: Colors.white,
                ),
                onPressed: () async {
                  XFile? pic =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                },
              ),
              const SizedBox(width: 5),
              Expanded(
                child: CupertinoTextField(
                  //controller: textEditingController,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Iphone',
                    fontSize: 20,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2C2E),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: const Color(0xFF48484A)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  onChanged: (val) {
                    setState(() {
                      //text = val;
                    });
                  },
                ),
              ),
              IconButton(
                splashRadius: 20,
                icon: const Icon(
                  CupertinoIcons.arrow_right_circle_fill,
                  size: 35,
                  color: Colors.white,
                ),
                onPressed: () {
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
