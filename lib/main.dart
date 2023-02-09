// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'global.dart';
//
// void main() {
//   runApp(
//     const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     ),
//   );
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage>with TickerProviderStateMixin{
//
//   bool platform = false;
//   int index = 0;
//
//   void initState(){
//     super.initState();
//     TabController tab=TabController(length: 3, vsync: this);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: (platform == false) ? 3 : 0,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             "Chat App",
//             style: TextStyle(
//                 color: Colors.black,
//                 letterSpacing: 1,
//                 fontWeight: FontWeight.w600),
//           ),
//           backgroundColor: const Color(0xffF4F4F4),
//           centerTitle: true,
//           leading: const Padding(
//             padding: EdgeInsets.all(5),
//             child: CircleAvatar(
//               backgroundImage: AssetImage("build/asset/image/profile.jpg"),
//             ),
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.search_rounded,
//                 color: Colors.black,
//               ),
//             ),
//             Switch(
//               inactiveThumbColor: Colors.grey,
//               activeTrackColor: Colors.grey,
//               activeColor: Colors.black,
//               inactiveTrackColor: Colors.black,
//               value: platform,
//               onChanged: (bool value) {
//                 setState(() {
//                   platform = value;
//                 });
//               },
//             )
//           ],
//
//           // bottom: (platform == false)
//           //     ? const TabBar(
//           //         labelColor: Colors.black,
//           //         unselectedLabelColor: Colors.grey,
//           //         indicatorSize: TabBarIndicatorSize.label,
//           //         indicatorColor: Colors.black,
//           //         labelStyle: TextStyle(fontSize: 18),
//           //         tabs: <Tab>[
//           //           Tab(text: "Chats"),
//           //           Tab(text: "Status"),
//           //           Tab(text: "Calls"),
//           //         ],
//           //       )
//           //     : const PreferredSize(
//           //         preferredSize: Size(40, 40),
//           //         child: SizedBox(
//           //           height: 10,
//           //           child: TabBar(
//           //             tabs: [],
//           //           ),
//           //         ),
//           //       ),
//         ),
//         body: Column(
//           children: [
//             (platform == false)
//                 ? Container(
//                     child: const TabBar(
//                       labelColor: Colors.black,
//                       unselectedLabelColor: Colors.grey,
//                       indicatorSize: TabBarIndicatorSize.label,
//                       indicatorColor: Colors.black,
//                       labelStyle: TextStyle(fontSize: 18),
//                       tabs: <Tab>[
//                         Tab(text: "Chats"),
//                         Tab(text: "Status"),
//                         Tab(text: "Calls"),
//                       ],
//                     ),
//                   )
//                 : Container(),
//             Expanded(
//               child: TabBarView(
//                 controller: tab,
//                 children: [
//                   ListView(
//                     children: Global.contact.map((e) {
//                       return ListTile(
//                         leading: Padding(
//                           padding: const EdgeInsets.all(5),
//                           child: CircleAvatar(
//                             backgroundImage: AssetImage(e['proImage']),
//                           ),
//                         ),
//                         title: Text(e['conName']),
//                         subtitle: Text(e['message']),
//                         trailing: Text(e['readTime']),
//                       );
//                     }).toList(),
//                   ),
//                   ListView(children: [
//                     const ListTile(
//                       leading: Padding(
//                         padding: EdgeInsets.all(5),
//                         child: CircleAvatar(
//                           backgroundImage:
//                               AssetImage("build/asset/image/profile.jpg"),
//                         ),
//                       ),
//                       title: Text("My status"),
//                       subtitle: Text("Tap to add status"),
//                     ),
//                     const Divider(),
//                     ...Global.contact.map((e) {
//                       return ListTile(
//                         leading: Padding(
//                           padding: const EdgeInsets.all(5),
//                           child: CircleAvatar(
//                             backgroundImage: AssetImage(e['proImage']),
//                           ),
//                         ),
//                         title: Text(e['conName']),
//                         subtitle: Text(e['time']),
//                       );
//                     }).toList(),
//                   ]),
//                   ListView(
//                     children: Global.contact.map((e) {
//                       return ListTile(
//                           leading: Padding(
//                             padding: const EdgeInsets.all(5),
//                             child: CircleAvatar(
//                               backgroundImage: AssetImage(e['proImage']),
//                             ),
//                           ),
//                           title: Text(e['conName']),
//                           subtitle: Text(e['conNumber']),
//                           trailing: const Icon(
//                             CupertinoIcons.phone_solid,
//                             color: Colors.green,
//                           ));
//                     }).toList(),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.add),
//               label: "add",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.add),
//               label: "add",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.add),
//               label: "add",
//             )
//           ],
//           currentIndex: index,
//           onTap: (val) {
//             setState(() {
//               index = val;
//               tab.animateTo(index);
//             });
//           },
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:share_plus/share_plus.dart';
import 'archive.dart';
import 'chat.dart';
import 'global.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'archive': (context) => const Archive(),
        'chat': (context) => const Chat(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool platform = false;
  int index = 0;

  getImage() async {
    XFile? pic = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pic != null) {
      setState(() {
        Global.image = File(pic.path);
      });
    }
  }

  camera() async {
    XFile? pic = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pic != null) {
      setState(() {
        Global.cameraImage = File(pic.path);
      });
    }
  }

  late TabController tabController;
  PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: WillPopScope(
        onWillPop: () async {
          final iWillPop = await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Are You Sure to Exit ?"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  actions: [
                    ElevatedButton(
                      child: const Text("Yes"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                    TextButton(
                      child: const Text(
                        "No",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                    ),
                  ],
                );
              });
          return iWillPop;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Chat App",
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600),
            ),
            backgroundColor: const Color(0xffF4F4F4),
            centerTitle: true,
            elevation: 0,
            leadingWidth: 70,
            leading: Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  setState(() {
                    Scaffold.of(context).openDrawer();
                  });
                },
                padding: const EdgeInsets.all(5),
                icon: const CircleAvatar(
                  backgroundImage: AssetImage("asset/image/profile.jpg"),
                ),
              );
            }),
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: const Icon(
                  Icons.search_rounded,
                  color: Colors.black,
                ),
              ),
              Switch(
                inactiveThumbColor: Colors.grey,
                activeTrackColor: Colors.grey,
                activeColor: Colors.black,
                inactiveTrackColor: Colors.black,
                value: platform,
                onChanged: (bool value) {
                  setState(() {
                    platform = value;
                  });
                },
              )
            ],
          ),
          drawer: SafeArea(
            child: Drawer(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        (Global.image != null)
                            ? CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(Global.image!),
                              )
                            : const CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(
                                  "asset/image/profile.jpg",
                                ),
                              ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Roshni Lungiwala",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Always available :)",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.qr_code_scanner_sharp,
                          color: Colors.grey,
                          size: 34,
                        ),
                      ],
                    ),
                    const Divider(color: Colors.grey, thickness: 1),
                    ListTile(
                      leading: const Icon(
                        CupertinoIcons.person,
                        size: 26,
                        color: Colors.black,
                      ),
                      title: const Text(
                        "Account",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          CupertinoIcons.right_chevron,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      selected: true,
                      onTap: () {
                        setState(() {});
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        CupertinoIcons.chat_bubble_text,
                        size: 26,
                        color: Colors.black,
                      ),
                      title: const Text(
                        "Chats",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          CupertinoIcons.right_chevron,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      selected: true,
                      onTap: () {
                        setState(() {});
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        CupertinoIcons.bell,
                        size: 26,
                        color: Colors.black,
                      ),
                      title: const Text(
                        "Notification",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          CupertinoIcons.right_chevron,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      selected: true,
                      onTap: () {
                        setState(() {});
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.sd_storage_outlined,
                        size: 26,
                        color: Colors.black,
                      ),
                      title: const Text(
                        "Storage & data",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          CupertinoIcons.right_chevron,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      selected: true,
                      onTap: () {
                        setState(() {});
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        CupertinoIcons.lock_shield,
                        size: 26,
                        color: Colors.black,
                      ),
                      title: const Text(
                        "Security",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          CupertinoIcons.right_chevron,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      selected: true,
                      onTap: () {
                        setState(() {});
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        CupertinoIcons.textformat_abc_dottedunderline,
                        size: 26,
                        color: Colors.black,
                      ),
                      title: const Text(
                        "Language",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          CupertinoIcons.right_chevron,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      selected: true,
                      onTap: () {
                        setState(() {});
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.live_help_outlined,
                        size: 28,
                        color: Colors.black,
                      ),
                      title: const Text(
                        "Help center ",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          CupertinoIcons.right_chevron,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      selected: true,
                      onTap: () {
                        setState(() {});
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.remove_red_eye_outlined,
                        size: 26,
                        color: Colors.black,
                      ),
                      title: const Text(
                        "Dark mode",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          CupertinoIcons.right_chevron,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      selected: true,
                      onTap: () {
                        setState(() {});
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        CupertinoIcons.person_3,
                        size: 28,
                        color: Colors.black,
                      ),
                      title: const Text(
                        "Invite friends",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          CupertinoIcons.right_chevron,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      selected: true,
                      onTap: () {
                        setState(() {});
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        CupertinoIcons.square_arrow_left,
                        size: 28,
                        color: Colors.redAccent,
                      ),
                      title: const Text(
                        "Log out",
                        style: TextStyle(color: Colors.redAccent, fontSize: 16),
                      ),
                      selected: true,
                      onTap: () {
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              (platform == false)
                  ? TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.black,
                      labelStyle: const TextStyle(fontSize: 18),
                      controller: tabController,
                      onTap: (val) {
                        setState(() {
                          pageController.animateToPage(val,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease);
                          index = val;
                        });
                      },
                      physics: const BouncingScrollPhysics(),
                      tabs: const <Tab>[
                        Tab(text: "Chats"),
                        Tab(text: "Status"),
                        Tab(text: "Calls"),
                      ],
                    )
                  : Container(),
              Expanded(
                child: PageView(
                  controller: pageController,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (val) {
                    setState(() {
                      tabController.animateTo(val);
                      index = val;
                    });
                  },
                  children: [
                    //chat
                    ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ListTile(
                            leading: const Icon(Icons.archive_outlined),
                            title: const Text("Archived"),
                            onTap: () {
                              Navigator.of(context).pushNamed('archive');
                            },
                          ),
                        ),
                        ...Global.contact.map((e) {
                          if (e['pin']) {
                            return Slidable(
                              key: UniqueKey(),
                              startActionPane: ActionPane(
                                dragDismissible: true,
                                extentRatio: 0.4,
                                motion: const StretchMotion(),
                                dismissible: DismissiblePane(
                                  onDismissed: () {
                                    setState(() {
                                      e['archive'] = !e['archive'];
                                      print(e['archive']);
                                    });
                                  },
                                ),
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
                                    icon: CupertinoIcons.archivebox,
                                    label: "Archive",
                                  ),
                                  SlidableAction(
                                    onPressed: (val) {
                                      setState(() {
                                        e['pin'] = !e['pin'];
                                        print(e['pin']);
                                      });
                                    },
                                    backgroundColor: Colors.grey,
                                    foregroundColor: Colors.white,
                                    icon: CupertinoIcons.pin_slash,
                                    label: "UnPin",
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
                                onTap: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(10)),
                                    ),
                                    backgroundColor: Colors.white,
                                    context: context,
                                    builder: (context) {
                                      return DraggableScrollableSheet(
                                        initialChildSize: 0.5,
                                        expand: false,
                                        builder: (context, _) {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                radius: 60,
                                                backgroundImage:
                                                    AssetImage(e['proImage']),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                e['conName'],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 0.5,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                e['conNumber'],
                                                style: const TextStyle(
                                                  color: Color(0xff9D9DA4),
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 40,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, 'chat',
                                                      arguments: Global.contact
                                                          .indexOf(e));
                                                },
                                                child:
                                                    const Text("Send message"),
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.black),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              CupertinoButton.filled(
                                                child: const Text("Share"),
                                                onPressed: () => Share.share(
                                                    '${e['conName']} || ${e['conNumber']}',
                                                    subject: 'mm'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          }
                          return Container();
                        }).toList(),
                        ...Global.contact.map((e) {
                          if (!e['archive'] && !e['pin']) {
                            return Slidable(
                              key: UniqueKey(),
                              startActionPane: ActionPane(
                                dragDismissible: true,
                                extentRatio: 0.4,
                                motion: const StretchMotion(),
                                dismissible: DismissiblePane(
                                  onDismissed: () {
                                    setState(() {
                                      e['archive'] = !e['archive'];
                                      print(e['archive']);
                                    });
                                  },
                                ),
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
                                    icon: CupertinoIcons.archivebox,
                                    label: "Archive",
                                  ),
                                  SlidableAction(
                                    onPressed: (val) {
                                      setState(() {
                                        e['pin'] = !e['pin'];
                                        print(e['pin']);
                                      });
                                    },
                                    backgroundColor: Colors.grey,
                                    foregroundColor: Colors.white,
                                    icon: CupertinoIcons.pin,
                                    label: "Pin",
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
                                onTap: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(50)),
                                    ),
                                    backgroundColor: Colors.white,
                                    context: context,
                                    builder: (context) {
                                      return DraggableScrollableSheet(
                                        initialChildSize: 0.5,
                                        expand: false,
                                        builder: (context, _) {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                radius: 60,
                                                backgroundImage:
                                                    AssetImage(e['proImage']),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                e['conName'],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 0.5,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                e['conNumber'],
                                                style: const TextStyle(
                                                  color: Color(0xff9D9DA4),
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 40,
                                              ),
                                              CupertinoButton.filled(
                                                child:
                                                    const Text("Send Message"),
                                                onPressed: () =>
                                                    Navigator.pushNamed(
                                                        context, 'chat',
                                                        arguments: Global
                                                            .contact
                                                            .indexOf(e)),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              CupertinoButton.filled(
                                                child: const Text("Share"),
                                                onPressed: () => Share.share(
                                                    '${e['conName']} || ${e['conNumber']}',
                                                    subject: 'mm'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          }
                          return Container();
                        }).toList(),
                      ],
                    ),
                    //status
                    ListView(
                      children: [
                        ListTile(
                          leading: Stack(
                            alignment: const Alignment(-0.7, 1.3),
                            children: [
                              (Global.image != null)
                                  ? CircleAvatar(
                                      radius: 30,
                                      backgroundImage: FileImage(Global.image!),
                                    )
                                  : const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          "build/asset/image/profile.jpg"),
                                    ),
                              SizedBox(
                                height: 20,
                                child: FloatingActionButton(
                                  onPressed: () async {
                                    XFile? pic = await ImagePicker()
                                        .pickImage(source: ImageSource.camera);
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          title: Text("My status"),
                          subtitle: Text("Tap to add status"),
                        ),
                        Divider(),
                        ...Global.contact.map((e) {
                          return ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.all(5),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(e['proImage']),
                              ),
                            ),
                            title: Text(e['conName']),
                            subtitle: Text(e['time']),
                            onTap: () => Navigator.pushNamed(context, 'story',
                                arguments: Global.contact.indexOf(e)),
                          );
                        }).toList(),
                      ],
                    ),
                    //calls
                    ListView(
                      children: Global.contact.map((e) {
                        return Slidable(
                          key: UniqueKey(),
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            extentRatio: 0.2,
                            dragDismissible: true,
                            closeThreshold: 0.5,
                            dismissible: DismissiblePane(onDismissed: () async {
                              await FlutterPhoneDirectCaller.callNumber(
                                  '+91 ${e['number']}');
                              setState(() {});
                            }),
                            children: [
                              SlidableAction(
                                onPressed: (val) async {
                                  await FlutterPhoneDirectCaller.callNumber(
                                      '+91 ${e['number']}');
                                },
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                icon: CupertinoIcons.phone,
                                label: "Call",
                                spacing: 5,
                              ),
                            ],
                          ),
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            extentRatio: 0.2,
                            dragDismissible: true,
                            closeThreshold: 0.5,
                            dismissible: DismissiblePane(onDismissed: () {
                              setState(() {
                                Global.contact.remove(e);
                              });
                            }),
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
                                spacing: 5,
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
                            onTap: () async {
                              await FlutterPhoneDirectCaller.callNumber(
                                  '+91 ${e['number']}');
                            },
                            title: Text(e['conName']),
                            subtitle: Text(e['conNumber']),
                            trailing: const Icon(
                              CupertinoIcons.phone_solid,
                              color: Colors.green,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              )
            ],
          ),
          bottomNavigationBar: (platform == true)
              ? BottomNavigationBar(
                  backgroundColor: const Color(0xffF4F4F4),
                  selectedItemColor: Colors.black,
                  unselectedItemColor: const Color(0xffA2A2A9),
                  type: BottomNavigationBarType.fixed,
                  currentIndex: index,
                  onTap: (val) {
                    setState(() {
                      tabController.animateTo(val);
                      pageController.animateToPage(val,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                      index = val;
                    });
                  },
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.chat_bubble_2_fill),
                      label: "Chats",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.data_saver_off_rounded),
                      label: "Status",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.phone),
                      label: "Calls",
                    ),
                  ],
                )
              : Container(
                  height: 0.0,
                ),
        ),
      ),
    );
  }
}
