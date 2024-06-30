import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../constants/app_function.dart';

double sizefix( double size , double screen){
   return Sizefix.sizefix(size, screen);
}
class ComicSaved extends GetView {
  const ComicSaved({super.key});
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
      ],
    );
  }
}