//메인화면의 이미지, 내용, 하트, 댓글 관리하는 클래스
import 'package:flutter/cupertino.dart';

// class userStoryBoard {
//   String img;
//   String content;
//   int likeCount;
//   String comment;

//   userStoryBoard(this.img, this.content, this.likeCount, this.comment) {}
// }

class UserInfo {
  String name;
  String img;
  int likeCount;
  String comment;

  UserInfo(
      {required this.name,
      required this.img,
      required this.likeCount,
      required this.comment});

  // UserInfo.fromJson(Map<String, dynamic> json):
  //   cid = json.['asd'];

  //     Map<String, dynamic> toJson() => {
  //       '': cid
  // };
}
