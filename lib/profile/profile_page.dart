import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eigo/profile/password_reset.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:eigo/profile/answers.dart';
import 'package:eigo/profile/edit_profile.dart';
import 'package:eigo/profile/quesions.dart';
import 'package:eigo/services/auth.dart';
import 'package:eigo/services/database.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  Stream<QuerySnapshot<Object?>>? profileListsStream;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool switchColor0 = true;
  bool switchColor1 = false;

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  getHomeLists() async {
    profileListsStream = await DatabaseService(uid).fetchImage();
    setState(() {});
  }

  onScreenLoaded() async {
    getHomeLists();
  }

  @override
  void initState() {
    onScreenLoaded();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: profileListsStream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Scaffold(
                  key: _scaffoldKey,
                  endDrawer: Drawer(
                      child: ListView(
                    children: [
                      InkWell(
                        onTap: () {
                          AuthMethods().signOut(context);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 0.5,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          child: const ListTile(
                            leading: Icon(
                              Icons.logout,
                              color: Colors.black,
                            ),
                            title: Text('ログアウト',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            tileColor: Colors.transparent,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            PasswordReset(),
                                        transitionDuration:
                                            const Duration(seconds: 0),
                                      ));
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 0.5,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          child: const ListTile(
                            leading: Icon(
                              Icons.lock_outline_rounded,
                              color: Colors.black,
                            ),
                            title: Text('パスワード',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            tileColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  )),
                  appBar: AppBar(
                    iconTheme: const IconThemeData(
                      color: Colors.black,
                      size: 40,
                    ),
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  resizeToAvoidBottomInset: false,
                  body: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(150.0),
                              child: SizedBox(
                                width: 110,
                                height: 110,
                                child: Image.network(
                                  snapshot.data!.docs[0]['ProfilePicture'] == ''
                                      ? 'https://firebasestorage.googleapis.com/v0/b/eigo-224ae.appspot.com/o/44884218_345707102882519_2446069589734326272_n.jpeg?alt=media&token=9cdb200e-9d19-4657-a861-711f87ad10f4'
                                      : snapshot.data!.docs[0]
                                          ['ProfilePicture'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.05),
                            Expanded(
                              child: Text(
                                snapshot.data!.docs[0]['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Text(
                              snapshot.data!.docs[0]['selfIntroduction'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 40,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffdbdbdb)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            EditProfile(
                                                name: snapshot.data!.docs[0]
                                                    ['name'],
                                                ex: snapshot.data!.docs[0]
                                                    ['selfIntroduction']),
                                        transitionDuration:
                                            const Duration(seconds: 0),
                                      ));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'プロフィールを編集する',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ],
                                )),
                          ),
                          const SizedBox(height: 10),
                          Row(children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  switchColor0 = !switchColor0;
                                  switchColor1 = !switchColor1;
                                });
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: switchColor0
                                          ? Colors.black
                                          : Colors.grey,
                                      width: switchColor0 ? 2.0 : 1.0,
                                    ),
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: const Center(
                                  child: Text('質問',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      )),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  switchColor0 = !switchColor0;
                                  switchColor1 = !switchColor1;
                                });
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: switchColor1
                                          ? Colors.black
                                          : Colors.grey,
                                      width: switchColor1 ? 2.0 : 1.0,
                                    ),
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: const Center(
                                  child: Text('回答',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      )),
                                ),
                              ),
                            ),
                          ])
                        ],
                      ),
                      // ここに質問のリストを載せる
                      Flexible(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.width,
                          child: switchColor0 ? Questions(uid) : Answers(uid),
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator());
        });
  }
}
