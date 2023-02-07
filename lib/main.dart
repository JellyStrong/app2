// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//
import 'content/home.dart';
import 'content/profile.dart';
import 'content/reels.dart';
import 'content/search.dart';
import 'content/shop.dart';
//
import 'firebase_options.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InstaApp(),
    );
  }
}

String page = 'home'; //home , search, reels, shop, profile

class InstaApp extends StatefulWidget {
  const InstaApp({super.key});
  @override
  State<InstaApp> createState() => _InstaAppState();
}

Widget _content(String page) {
  Widget content = SizedBox();

  switch (page) {
    case 'home':
      print("화면 home");
      return content = HomeContent();
    case 'search':
      print("화면 search");
      return content = SearchContent();
    case 'reels':
      print("화면 reels");
      return content = ReelsContent();
    case 'shop':
      print("화면 shop");
      return content = ShopContent();
    case 'profile':
      print("화면 profile");
      return content = ProfileContent();
  }

  return content;
}

class _InstaAppState extends State<InstaApp> {
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  CollectionReference product2 =
      FirebaseFirestore.instance.collection('homeItem');

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double whidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.2))),
              width: whidth,
              height: height * 0.07,
              child: Stack(children: [
                Image.asset('assets/logo/instagram_logo.png'),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    width: 100,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.add),
                          Icon(Icons.favorite_outline),
                          Icon(Icons.rocket_launch_outlined)
                        ]),
                  ),
                ),
              ]),
            ),
            //컨텐츠
            Expanded(child: _content(page)),
            //푸터
            Container(
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 0.2))),
              padding:
                  EdgeInsets.fromLTRB(whidth * 0.05, 0.0, whidth * 0.05, 0.0),
              height: height * 0.07,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // _footerIcon(Icon(Icons.home), 'home'),
                    // _footerIcon(Icon(Icons.search_rounded), 'search'),
                    // _footerIcon(Icon(Icons.video_call), 'reels'),
                    // _footerIcon(Icon(Icons.shopping_bag), 'shop'),
                    // _footerIcon(Icon(Icons.people), 'profile'),
                    GestureDetector(
                        onTap: () {
                          page = 'home';
                          print(">>" + page);
                          setState(() {});
                        },
                        child: Icon(Icons.home)),
                    GestureDetector(
                        onTap: () {
                          page = 'search';
                          print(">>" + page);
                          setState(() {});
                        },
                        child: Icon(Icons.search_rounded)),
                    GestureDetector(
                        onTap: () {
                          page = 'reels';
                          print(">>" + page);
                          setState(() {});
                        },
                        child: Icon(Icons.video_call)),
                    GestureDetector(
                        onTap: () {
                          page = 'shop';
                          print(">>" + page);
                          setState(() {});
                        },
                        child: Icon(Icons.shopping_bag)),
                    GestureDetector(
                        onTap: () {
                          page = 'profile';
                          print(">>" + page);
                          setState(() {});
                        },
                        child: Icon(Icons.people)),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
