import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, this.onPressed, this.backgroundColor, this.text});
  final Function()? onPressed;
  final Color? backgroundColor;
  final String? text;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth*0.70,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            foregroundColor: Theme.of(context).primaryColorDark,
            backgroundColor: backgroundColor,
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
            textStyle: const TextStyle(fontSize: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
        ),
        child:Text('$text',style: Theme.of(context).textTheme.labelSmall,),
      ),
    );
  }
}


