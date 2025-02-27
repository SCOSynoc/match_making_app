import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigateToScreen(BuildContext context, Widget screen, {bool replace = false}) {
  if (replace) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => screen));
  } else {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }
}



void navigateAndRemovePush(BuildContext context, Widget screen,){
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => screen),
          (Route<dynamic> route) => false
  );
}
void showSnackBar({required BuildContext context, required String content , required Function() onPressed}) {
    ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
              content: Text(content,style: Theme.of(context).textTheme.labelMedium,),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
                snackBarAnimationStyle: AnimationStyle(curve: Curves.bounceIn)
            );

}


