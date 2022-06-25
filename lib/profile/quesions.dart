import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eigo/HomeDetail/home_detail.dart';
import 'package:eigo/services/database.dart';

class Questions extends StatefulWidget {
  Questions(this.uid, {Key? key, String}) : super(key: key);
  String uid;

  @override
  State<Questions> createState() => _QuestionsState(uid);
}

class _QuestionsState extends State<Questions> {
  _QuestionsState(this.uid);
  String uid;
  Stream<QuerySnapshot<Object?>>? questionsListsStream;
  final ScrollController _scrollController = ScrollController();
  int _currentMax = 10;

  getQuestinosLists() async {
    questionsListsStream = DatabaseService(uid).personalQuestinosCollect();
    setState(() {});
  }

  _getMoreData() async {
    _currentMax = _currentMax + 10;
    questionsListsStream = await DatabaseService(uid).additionalPersonalQuestions(_currentMax);
    // UIを読み込み直す
    setState(() {});
  }

  @override
  void initState() {
    getQuestinosLists();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: questionsListsStream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  controller: _scrollController,
                  itemCount: snapshot.data!.docs.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return index == snapshot.data!.docs.length
                      ? const CupertinoActivityIndicator()
                      : InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => HomeDetail(
                              articleId: snapshot.data!.docs[index].id,
                              askerId: snapshot.data!.docs[index]['asker'],
                              fromWhere: 'profile',
                            ),
                            transitionDuration: const Duration(seconds: 0),
                          ),
                        );
                      },
                      child: Container(
                        height: 140,
                        decoration: const BoxDecoration(
                            border: Border(
                          top: BorderSide(width: 0.5, color: Colors.grey),
                        )),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 15),
                        // color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Text(
                                snapshot.data!.docs[index]['caption'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Text(
                                snapshot.data!.docs[index]['questionList'][0],
                                style: const TextStyle(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(150.0),
                                child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection('users')
                                          .where('uid',
                                              isEqualTo: snapshot
                                                  .data!.docs[index]['asker'])
                                          .snapshots(),
                                      builder: (context, snapshot0) {
                                        return snapshot0.hasData
                                            ? Image.network(
                                                snapshot0.data!.docs[0][
                                                            'ProfilePicture'] ==
                                                        ''
                                                    ? 'https://firebasestorage.googleapis.com/v0/b/eigo-224ae.appspot.com/o/44884218_345707102882519_2446069589734326272_n.jpeg?alt=media&token=9cdb200e-9d19-4657-a861-711f87ad10f4'
                                                    : snapshot0.data!.docs[0]
                                                        ['ProfilePicture'],
                                                fit: BoxFit.cover,
                                              )
                                            : Image.network(
                                                'https://firebasestorage.googleapis.com/v0/b/eigo-224ae.appspot.com/o/44884218_345707102882519_2446069589734326272_n.jpeg?alt=media&token=9cdb200e-9d19-4657-a861-711f87ad10f4',
                                                fit: BoxFit.cover,
                                              );
                                      }),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        StreamBuilder<QuerySnapshot>(
                                            stream: FirebaseFirestore.instance
                                                .collection('users')
                                                .where('uid',
                                                    isEqualTo: snapshot.data!
                                                        .docs[index]['asker'])
                                                .snapshots(),
                                            builder: (context, snapshot1) {
                                              return snapshot1.hasData
                                                  ? Text(
                                                      snapshot1.data!.docs[0]
                                                          ['name'],
                                                      style: const TextStyle(
                                                        fontSize: 10,
                                                      ),
                                                    )
                                                  : const Text('');
                                            }),
                                        const SizedBox(height: 5),
                                        Text(
                                          snapshot.data!.docs[index]['date']
                                              .toDate()
                                              .toString()
                                              .substring(0, 16),
                                          style: const TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ]),
                          ],
                        ),
                      ),
                    );
                  })
              : Container();
        });
  }
}
