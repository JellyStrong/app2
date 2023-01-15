import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  CollectionReference product =
      FirebaseFirestore.instance.collection('homeItem');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: product.snapshots(),
      builder: ((context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.lightBlueAccent,
          ));
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            final DocumentSnapshot documentSnapshot =
                snapshot.data!.docs[index];

            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(documentSnapshot['name'])),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.amber,
                    child: Image.asset(
                      'assets/imageSave/' + documentSnapshot['img'],
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(children: [
                      Container(
                        width: 100,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.favorite_outline),
                              Icon(Icons.chat_bubble_outline),
                              Icon(Icons.rocket_launch_outlined),
                            ]),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(". . ."), //사진 갯수
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.bookmark_outline))
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: ([
                            Text(
                              documentSnapshot['content'],
                              style: TextStyle(),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              documentSnapshot['comment'],
                              style: TextStyle(),
                              textAlign: TextAlign.left,
                            ),
                          ])),
                    ),
                  )
                ]);
          },
          itemCount: snapshot.data!.docs.length,
        );
      }),
    );
  }
}
