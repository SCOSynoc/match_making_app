import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:match_making/screens/mobile_verification_screen.dart';
import 'package:match_making/widgets/common_button.dart';



class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: SvgPicture.asset(
                  'assets/images/trademark.svg', // Replace with your logo URL
                  height: 100,
                ),
              ),
              // Sign up text

              const SizedBox(height: 20),
              // Continue with email button
              CommonButton(onPressed: (){}, text:'Continue with email', backgroundColor: Colors.pink,),
              const SizedBox(height: 10),
              // Use phone number button
             CommonButton(onPressed: (){
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PhoneVerificationScreen()));
             },text: "Use phone number",),
              // Sign up with social media
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: SvgPicture.asset(
                  'assets/images/or_login_with.svg', // Replace with your logo URL
                  height: 100,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/images/fb.svg',
                      semanticsLabel: 'facebook login logo',
                    ),
                    iconSize: 40,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/images/fb.svg',
                      semanticsLabel: 'facebook login logo',
                    ),
                    iconSize: 40,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/images/google.svg',
                      semanticsLabel: 'Google login logo',
                    ),
                    iconSize: 40,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Terms of use and Privacy Policy
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: Text('Terms of use',style: Theme.of(context).textTheme.displaySmall),
                  ),
                  const Text(' | '),
                  TextButton(
                    onPressed: () {},
                    child: Text('Privacy Policy',style: Theme.of(context).textTheme.displaySmall,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
