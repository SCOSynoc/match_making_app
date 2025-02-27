

import 'dart:js_interop';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_making/bloc/AuthBloc/auth_bloc.dart';
import 'package:match_making/bloc/AuthBloc/auth_events.dart';
import 'package:match_making/bloc/AuthBloc/auth_states.dart';
import 'package:match_making/screens/profile_detail_screen2.dart';
import 'package:match_making/utils/themes.dart';
import 'package:match_making/widgets/common_button.dart';
import 'package:match_making/widgets/common_textfield.dart';

import '../models/users/users.dart';
import '../utils/navigation.dart';

class EmailSignup extends StatefulWidget {
  const EmailSignup({super.key});

  @override
  State<EmailSignup> createState() => _EmailSignupState();
}

class _EmailSignupState extends State<EmailSignup> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool signUp = true;
  String signUpText = "Sign up with Email";


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc,AuthStates>(
      builder: (BuildContext context, AuthStates state) {
        return Scaffold(
          body: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.65,
              height: MediaQuery.of(context).size.height * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(signUp? CupertinoIcons.envelope_open : Icons.account_circle,
                    color:Theme.of(context).primaryColorLight,
                    size:MediaQuery.of(context).size.height*0.15,
                  ),
                  SizedBox(height:MediaQuery.of(context).size.height*0.05 ,),
                  Text(signUpText, style: Theme.of(context).textTheme.displayMedium,),
                  SizedBox(height:MediaQuery.of(context).size.height*0.05 ,),
                  CommonMainTextField(controller:_emailController , hintText: "email"),
                  SizedBox(height:MediaQuery.of(context).size.height*0.05 ,),
                  CommonMainTextField(controller:_passwordController , hintText: "enter password", obscure: true,),
                  SizedBox(height:MediaQuery.of(context).size.height*0.05 ,),
                  Visibility(
                    visible: signUp,
                    replacement:CommonButton(onPressed: (){
                      context.read<AuthBloc>().add(LoginUserRequested( context: context,
                          password: _passwordController.text, email: _emailController.text)
                      );

                    },
                      text: "Sign In",
                      backgroundColor: Theme.of(context).primaryColorLight,
                    ),
                    child: CommonButton(onPressed: (){
                      Users user = Users( email: _emailController.text,
                        password: _passwordController.text,
                        latitude: 0.0, longitude: 0.0, phoneNumber: null,
                      );

                      context.read<AuthBloc>()
                          .add(EmailSignUpRequested(users: user, context: context));
                    },
                      text: "Sign up",
                      backgroundColor: Theme.of(context).primaryColorLight,
                    ),
                  ),
                  SizedBox(height:MediaQuery.of(context).size.height*0.05 ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already Signed Up ?', style: Theme.of(context).textTheme.displaySmall,),
                      TextButton(onPressed: (){
                        setState(() {
                          signUp = true;
                          signUpText = "Sign In";
                        });
                       },
                          child: Text("Sign In", style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: getMaterialColor(Colors.red), fontWeight: FontWeight.bold, fontSize: 14
                        ),
                      )
                      )
                    ],
                  )

                ],
              ),
            ),
          ),
        );
      }, listener: (BuildContext context, AuthStates state) {
      if(state is EmailSignupSuccess) {
        navigateAndRemovePush(context, const ProfileDetailsScreens());
      }
    },

    );
  }
}


