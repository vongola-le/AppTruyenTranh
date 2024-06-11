import 'package:flutter/material.dart';
import 'package:unimanga_app/app/global_widgets/index.dart';

class ChappterPage extends StatefulWidget {
  const ChappterPage({super.key});

  @override
  State<ChappterPage> createState() => _ChappterPageState();
}

class _ChappterPageState extends State<ChappterPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextCustom(text: "Chappter"),
    );
  }
}