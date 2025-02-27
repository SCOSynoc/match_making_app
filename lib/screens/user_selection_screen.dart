import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_making/bloc/ProfileBloc/profile_bloc.dart';
import 'package:match_making/bloc/ProfileBloc/profile_events.dart';
import 'package:match_making/screens/interest_selection_screen.dart';
import 'package:match_making/utils/navigation.dart';

import '../bloc/ProfileBloc/profile_states.dart';
import '../local_storage/hive_service.dart';
import '../models/profile/profile.dart';
import '../widgets/custom_dropdown_button.dart';


class UserSelectionScreen extends StatefulWidget {
  const UserSelectionScreen({super.key});

  @override
  State<UserSelectionScreen> createState() => _UserSelectionScreenState();
}

class _UserSelectionScreenState extends State<UserSelectionScreen> {


  bool isManSelected = false;
  bool isWomenSelected = false;
  bool isSelected = false;
  String selectedGender = "";

  Profile profile = Profile();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    context.read<ProfileBloc>().add(GetLocallyStoreProfileData());
    return BlocConsumer<ProfileBloc,ProfileStates>(
      builder: (context,state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Navigation Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.red,size: 20,),
                        onPressed: () {
                          // Handle back button
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle skip
                        },
                        child:Text(
                          "Skip",
                          style:Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 16)
                        )
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),

                  // Main Heading
                  const Text(
                    "I am a",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),

                  // Dropdown Buttons
                  CustomDropdownButton(
                    label: "Woman",
                    isSelected: isWomenSelected,
                    onTap: () {
                      setState(() {
                        // Handle Woman Selection
                        isWomenSelected= !isWomenSelected;
                        isManSelected = false;
                        isSelected = false;
                        selectedGender = "Women";
                      });

                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomDropdownButton(
                    label: "Man",
                    isSelected: isManSelected,
                    onTap: () {
                      setState(() {
                        // Handle Man Selection
                        isManSelected = !isManSelected;
                        isWomenSelected = false;
                        isSelected = false;
                        selectedGender = "Man";
                      });

                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomDropdownButton(
                    label: "Others",
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        // Handle Choose Another Selection
                        isManSelected = false;
                        isWomenSelected = false;
                        isSelected = !isSelected;
                        selectedGender = "others";
                      });
                    },
                  ),
                  const Spacer(),

                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {

                        if(state is GotLocallyStoredProfileData) {
                          profile = state.profile;
                          print("In on click gender Screen ${profile.toJson()}");
                        }

                        /*HiveService hive = HiveService()..initLocalService();
                        final data = hive.getData(key: "UserId");
                        int user_id = jsonDecode(data);

                        Profile updProfile = Profile(
                            user_id: user_id,
                            first_name: profile.first_name,
                            last_name: profile.last_name,
                            age: profile.age,
                            gender: selectedGender
                        );*/
                        Profile updProfile = profile.copyWith(gender: selectedGender);
                        context.read<ProfileBloc>().add(StoreProfileDataLocallyReq(
                            profile: updProfile)
                        );

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                ],
              ),
            ),
          ),
        );
      }, listener: (BuildContext context, ProfileStates state) {
         if(state is GotLocallyStoredProfileData) {
             profile = state.profile;
             print("In listener gender Screen ${profile.toJson()}");
             navigateToScreen(context, InterestSelectionScreen());
         }
    },
    );
  }
}




