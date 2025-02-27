import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_making/bloc/ProfileBloc/profile_bloc.dart';
import 'package:match_making/bloc/ProfileBloc/profile_events.dart';
import 'package:match_making/bloc/ProfileBloc/profile_states.dart';
import 'package:match_making/screens/dashboard_screen.dart';
import 'package:match_making/screens/discover_screen.dart';
import 'package:match_making/utils/navigation.dart';
import 'package:match_making/utils/themes.dart';

import '../models/profile/profile.dart';


class InterestSelectionScreen extends StatefulWidget {
  const InterestSelectionScreen({super.key});

  @override
  _InterestSelectionScreenState createState() =>
      _InterestSelectionScreenState();
}

class _InterestSelectionScreenState extends State<InterestSelectionScreen> {
  // List of interests with selection state
  final List<Map<String, dynamic>> interests = [
    {"label": "Photography", "isSelected": false, "icon": Icons.camera_alt},
    {"label": "Shopping", "isSelected": true, "icon": Icons.shopping_bag},
    {"label": "Karaoke", "isSelected": false, "icon": Icons.mic},
    {"label": "Yoga", "isSelected": false, "icon": Icons.self_improvement},
    {"label": "Cooking", "isSelected": false, "icon": Icons.kitchen},
    {"label": "Tennis", "isSelected": false, "icon": Icons.sports_tennis},
    {"label": "Run", "isSelected": true, "icon": Icons.directions_run},
    {"label": "Swimming", "isSelected": false, "icon": Icons.pool},
    {"label": "Art", "isSelected": false, "icon": Icons.brush},
    {"label": "Traveling", "isSelected": true, "icon": Icons.flight_takeoff},
    {"label": "Extreme", "isSelected": false, "icon": Icons.sports_motorsports},
    {"label": "Music", "isSelected": false, "icon": Icons.music_note},
    {"label": "Drink", "isSelected": false, "icon": Icons.local_bar},
    {"label": "Video games", "isSelected": false, "icon": Icons.videogame_asset},
  ];

  List<String> selectedInterestList = [];
  Profile profile = const Profile();

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
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          // Handle back button
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle skip
                        },
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Main Heading
                  const Text(
                    "Your interests",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "Select a few of your interests and let everyone know what you're passionate about.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),

                  // Grid of Interests
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.50,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: screenWidth * 0.03,
                          mainAxisSpacing: screenHeight * 0.02,
                          childAspectRatio: screenWidth > 600 ? 10 : 3.5,
                        ),
                        itemCount: interests.length,
                        itemBuilder: (context, index) {
                          final interest = interests[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                interest['isSelected'] = !interest['isSelected'];
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: interest['isSelected']
                                    ? Colors.red.withOpacity(0.1)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: interest['isSelected']
                                      ? Colors.red
                                      : Colors.grey.shade300,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    interest['icon'],
                                    color: interest['isSelected']
                                        ? Colors.red
                                        : Colors.grey,
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    interest['label'],
                                    style: context.conditionalTextStyle(fontSize: 14,
                                      selectedColor:  Colors.red,
                                      selectedWeight: FontWeight.normal,
                                      defaultWeight: FontWeight.bold,
                                      defaultColor: Colors.black,
                                      isSelected: interest['isSelected'],

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle Continue
                        for (var i in interests) {
                          if(i['isSelected'] == true) {
                              selectedInterestList.add(i['label']);
                          }
                        }

                        if(state is GotLocallyStoredProfileData) {
                            profile = state.profile;

                        }
                        Profile updatedInterestProf = profile.copyWith(interests: selectedInterestList);

                        context.read<ProfileBloc>().add(
                            StoreProfileDataLocallyReq(profile: updatedInterestProf)
                        );

                        context.read<ProfileBloc>().add(
                            StoreProfileDataToDatabase(profile: profile, context: context)
                        );


                        if(state is ProfileDataStoredInDatabaseSuccess) {
                          navigateAndRemovePush(context, const DashboardScreen());
                        }


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

      },
    );
  }
}
