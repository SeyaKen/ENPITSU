import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eigo/SelectLogin/privacy_policy.dart';
import 'package:eigo/SelectLogin/riyoukiyaku.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:eigo/mailSignin/mailAuth.dart';
import 'package:eigo/mailSignin/mailAuthenticate.dart';
import 'package:eigo/main_page.dart';
import 'package:eigo/services/google_sign_in.dart';
import 'package:eigo/services/sharedpref_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SelectLoginScreen extends StatefulWidget {
  const SelectLoginScreen({Key? key}) : super(key: key);

  @override
  State<SelectLoginScreen> createState() => _SelectLoginScreenState();
}

String? loginCheck;

class _SelectLoginScreenState extends State<SelectLoginScreen> {
  void Check() async {
    loginCheck = await SharedPreferenceHelper().getUserName();
  }

  @override
  void initState() {
    Check();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : loginCheck == 'LogIned'
                  ? MainPage(currenttab: 0)
                  : snapshot.hasError
                      ? const Center(
                          child: Text('エラーが発生しました、もう一度やり直してください。'),
                        )
                      : Scaffold(
                          // backgroundColor: const Color(0XFFF2D095),
                          body: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.24,
                                child: const Text('ENPITSU',
                                    style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              InkWell(
                                onTap: () {
                                  final provider =
                                      Provider.of<GoogleSignInProvider>(context,
                                          listen: false);
                                  try {
                                    provider.googleLogin().then((user) => {
                                          if (FirebaseAuth.instance.currentUser!
                                              .emailVerified)
                                            {
                                              FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(FirebaseAuth.instance
                                                      .currentUser!.uid)
                                                  .get()
                                                  .then((value) {
                                                if (value.data() == null) {
                                                  FirebaseFirestore.instance
                                                      .collection('users')
                                                      .doc(FirebaseAuth.instance
                                                          .currentUser!.uid)
                                                      .set({
                                                    'ProfilePicture': '',
                                                    'email': FirebaseAuth
                                                        .instance
                                                        .currentUser!
                                                        .email,
                                                    'name': '',
                                                    'selfIntroduction': '',
                                                    'uid': FirebaseAuth.instance
                                                        .currentUser!.uid,
                                                  });
                                                }
                                                SharedPreferenceHelper()
                                                    .saveUserName('LogIned');
                                                Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                      pageBuilder: (_, __,
                                                              ___) =>
                                                          MainPage(
                                                              currenttab: 0),
                                                      transitionDuration:
                                                          const Duration(
                                                              seconds: 0),
                                                    ));
                                              }),
                                            }
                                          else
                                            {
                                              AuthService().errorBox(
                                                  context, 'メール認証が終わっていません。')
                                            }
                                        });
                                  } catch (e) {
                                    print(e.toString());
                                    if (e.toString() ==
                                        '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.') {
                                      AuthService()
                                          .errorBox(context, 'パスワードが間違っています。');
                                    } else if (e.toString() ==
                                        '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.') {
                                      AuthService().errorBox(context,
                                          '一致するユーザーが見つかりません。新規登録画面から登録してください。');
                                    }
                                  }
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            width: 24,
                                            height: 24,
                                            child: Image.asset(
                                                'assets/googleLogo.png')),
                                        const Text('Googleで始める',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        const FaIcon(
                                          FontAwesomeIcons.google,
                                          color: Colors.transparent,
                                        ),
                                      ],
                                    )),
                              ),
                              const SizedBox(height: 30),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            const mailAuthenticate(),
                                        transitionDuration:
                                            const Duration(seconds: 0),
                                      ));
                                },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      border: Border.all(
                                          color: Colors.grey, width: 0.5),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.mail,
                                          color: Colors.black,
                                        ),
                                        Text('メールアドレスで始める',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        FaIcon(
                                          FontAwesomeIcons.google,
                                          color: Colors.transparent,
                                        ),
                                      ],
                                    )),
                              ),
                              const SizedBox(height: 50),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: RichText(
                                    text: TextSpan(
                                  style: const TextStyle(color: Colors.black),
                                  children: [
                                    const TextSpan(
                                      text: '登録またはログインすることで、',
                                    ),
                                    TextSpan(
                                      style:
                                          const TextStyle(color: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                pageBuilder: (_, __, ___) =>
                                                    const Riyoukiyaku(),
                                                transitionDuration:
                                                    const Duration(seconds: 0),
                                              ));
                                        },
                                      text: '利用規約',
                                    ),
                                    const TextSpan(
                                      text: 'と',
                                    ),
                                    TextSpan(
                                      style:
                                          const TextStyle(color: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                pageBuilder: (_, __, ___) =>
                                                    const PrivacyPolicy(),
                                                transitionDuration:
                                                    const Duration(seconds: 0),
                                              ));
                                        },
                                      text: 'プライバシーポリシー',
                                    ),
                                    const TextSpan(
                                      text: 'に同意したものと見なされます。',
                                    ),
                                  ],
                                )),
                              ),
                            ],
                          ),
                        ));
        });
  }
}
