import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReelsContent extends StatefulWidget {
  const ReelsContent({super.key});

  @override
  State<ReelsContent> createState() => _ReelsContentState();
}

class _ReelsContentState extends State<ReelsContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Reels"),
    );
  }
}
