import 'package:flutter/material.dart';

class GetModulList extends StatelessWidget {
  const GetModulList({
    super.key,
    required this.imagePath,
    required this.ontab,
    required this.projectDesc,
    required this.projectTitle,
  });

  final String imagePath;
  final String projectTitle;
  final String projectDesc;
  final Function ontab;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 0.999,
      width: size.width - 100,
      //color: Colors.tealAccent,
      child: Row(children: <Widget>[
        IntrinsicHeight(
          child: Column(children: []),
        ),
        IntrinsicHeight(
          child: Column(children: []),
        ),
        IntrinsicHeight(
          child: Column(children: []),
        )
      ]),
    );
  }
}
