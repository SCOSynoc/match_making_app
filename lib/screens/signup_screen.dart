import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:match_making/bloc/AuthBloc/auth_bloc.dart';
import 'package:match_making/bloc/AuthBloc/auth_states.dart';
import 'package:match_making/screens/email_signup.dart';
import 'package:match_making/screens/mobile_verification_screen.dart';
import 'package:match_making/screens/profile_detail_screen2.dart';
import 'package:match_making/utils/navigation.dart';
import 'package:match_making/utils/themes.dart';
import 'package:match_making/widgets/common_button.dart';



class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc,AuthStates>(

      builder: (BuildContext context, state) {

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
                  CommonButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const EmailSignup()));
                  }, text:'Continue with email', backgroundColor: Theme.of(context).primaryColorLight,),
                  const SizedBox(height: 10),
                  // Use phone number button
                  CommonButton(
                      onPressed: (){

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PhoneVerificationScreen()));

                      }, text: "Use phone number",
                      backgroundColor: getMaterialColor(Colors.red)

                  ),
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
      }, listener: (BuildContext context, AuthStates state) {

    },

    );
  }
}
