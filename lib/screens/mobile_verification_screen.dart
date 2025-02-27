import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_making/screens/otp_verification_screen.dart';
import 'package:match_making/screens/profile_detail_screen2.dart';
import 'package:match_making/utils/decorations.dart';
import 'package:match_making/utils/themes.dart';
import 'package:match_making/widgets/common_button.dart';

import '../widgets/common_textfield.dart';


class PhoneVerificationScreen extends StatelessWidget {
  const PhoneVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.darkTheme.primaryColorDark,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'My mobile',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Please enter your valid phone number. We will send you a 4-digit code to verify your account.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: DropdownButtonFormField<String>(
                      value: '+1',
                      items:   [
                        DropdownMenuItem(
                          value: '+1',
                          child: Text('🇺🇸 +1',style: Theme.of(context).textTheme.displaySmall,),
                        ),
                        // Add more country codes here
                      ],
                      onChanged: (value) {},
                      decoration:  Decorations.commonInputDecorations,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 5,
                    child: CommonMainTextField(
                      controller: TextEditingController(),
                      hintText: "331 623 8413",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              CommonButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const VerificationScreen()));
              }, backgroundColor: AppThemes.lightTheme.primaryColorDark, text: "Continue",)
            ],
          ),
        ),
      ),
    );
  }
}
