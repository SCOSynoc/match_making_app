import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_making/screens/user_selection_screen.dart';
import 'package:match_making/utils/decorations.dart';

import '../utils/navigation.dart';


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
      firstDate: DateTime(1900),
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Details', style: theme.textTheme.displaySmall),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              navigateToScreen(context,const UserSelectionScreen());
            },
            child: Text(
              'Skip',
              style: theme.textTheme.displaySmall,
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
                TextField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'First Name',
                    fillColor: Colors.white,
                    border: Decorations.commonInputBorders,
                    enabledBorder:Decorations.commonInputBorders,
                    disabledBorder: Decorations.commonInputBorders,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white,
                    border: Decorations.commonInputBorders,
                    enabledBorder:Decorations.commonInputBorders ,
                    disabledBorder: Decorations.commonInputBorders,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () => _selectDate(context),
                  icon: const Icon(CupertinoIcons.calendar_today,color: Colors.pink,),
                  label: Text('Choose Birthday Date',style: Theme.of(context).textTheme.displaySmall,),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColorDark, backgroundColor: Colors.pink.shade100,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
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
  }
}
