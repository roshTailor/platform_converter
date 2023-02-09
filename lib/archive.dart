import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'global.dart';

class Archive extends StatefulWidget {
  const Archive({Key? key}) : super(key: key);

  @override
  State<Archive> createState() => _ArchiveState();
}

class _ArchiveState extends State<Archive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Archive",
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xffF4F4F4),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: Global.contact.map((e) {
          return (e['archive'] == true)
              ? Slidable(
                  key: UniqueKey(),
                  startActionPane: ActionPane(
                    dragDismissible: true,
                    dismissible: DismissiblePane(
                      onDismissed: () {
                        setState(() {
                          e['archive'] = !e['archive'];
                        });
                      },
                    ),
                    extentRatio: 0.2,
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (val) {
                          setState(() {
                            e['archive'] = !e['archive'];
                            print(e['archive']);
                          });
                        },
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        icon: Icons.unarchive_outlined,
                        label: "UnArchive",
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    extentRatio: 0.2,
                    motion: const BehindMotion(),
                    dismissible: DismissiblePane(
                      onDismissed: () {
                        setState(() {
                          Global.contact.remove(e);
                        });
                      },
                    ),
                    children: [
                      SlidableAction(
                        onPressed: (val) {
                          setState(() {
                            Global.contact.remove(e);
                          });
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: CupertinoIcons.delete,
                        label: "Delete",
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(5),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(e['proImage']),
                      ),
                    ),
                    title: Text(e['conName']),
                    subtitle: Text(e['message']),
                    trailing: Text(e['readTime']),
                  ),
                )
              : Container();
        }).toList(),
      ),
    );
  }
}
