import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_making/bloc/ProfileBloc/profile_bloc.dart';
import 'package:match_making/bloc/ProfileBloc/profile_events.dart';
import 'package:match_making/bloc/ProfileBloc/profile_states.dart';
import 'package:match_making/local_storage/hive_service.dart';
import 'package:match_making/screens/user_selection_screen.dart';
import 'package:match_making/utils/customTextTheme.dart';
import 'package:match_making/utils/decorations.dart';

import '../models/profile/profile.dart';
import '../utils/navigation.dart';
import '../widgets/common_textfield.dart';


class ProfileDetailsScreens extends StatefulWidget {
  const ProfileDetailsScreens({super.key});

  @override
  _ProfileDetailsScreenState createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreens> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1910),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }


  final Widget datPicker = CupertinoDatePicker(onDateTimeChanged: (DateTime date){});


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<ProfileBloc,ProfileStates>(
      builder: (context,state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
                'Profile Details',
                style: theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.bold
               )
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              TextButton(
                onPressed: () {
                  navigateToScreen(context,const UserSelectionScreen());
                },
                child: Text(
                  'Skip',
                  style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[200],
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt, color: Colors.red),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 20),
                    CommonMainTextField(controller: _firstNameController, hintText: "First Name"),
                    const SizedBox(height: 20),
                    CommonMainTextField(controller: _lastNameController, hintText: "Last Name"),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () => _selectDate(context),
                      icon: const Icon(CupertinoIcons.calendar_today,color: Colors.pink,),
                      label: Text('Choose Birthday Date-${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',style: Theme.of(context).textTheme.displaySmall,),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Theme.of(context).primaryColorDark, backgroundColor: Colors.pink.shade100,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        HiveService hive = HiveService()..initLocalService();
                        final data = hive.getData(key: "UserId");
                        int user_id = jsonDecode(data);
                        Profile profile = Profile(first_name: _firstNameController.text,user_id: user_id,
                            last_name:_lastNameController.text);
                        context.read<ProfileBloc>().add(StoreProfileDataLocallyReq(profile: profile));

                        // Handle confirm action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: Text('Confirm', style: Theme.of(context).textTheme.displaySmall,)
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }, listener: (BuildContext context, state) {
        if(state is DataStoredLocallySuccess) {
          navigateToScreen(context,const UserSelectionScreen());
        }
    },
    );
  }
}


