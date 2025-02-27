import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_making/utils/decorations.dart';
import 'package:match_making/utils/themes.dart';

import '../widgets/filter_button.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectedInterest = 'Girls';
  double distance = 40;
  RangeValues ageRange = RangeValues(20, 28);
  String selectedLocation = 'Chicago, USA';
  final List<String> locations = [
    'Chicago, USA',
    'New York, USA',
    'Los Angeles, USA',
    'Miami, USA',
    'Dallas, USA'
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return  SizedBox(
      child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: screenHeight * 0.15,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios, color: Colors.grey)
                      ),
                      Text(
                        'Discover',
                        style: TextStyle(
                          fontSize: screenHeight * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Icon(Icons.filter_alt, color: Theme.of(context).primaryColorLight),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: screenHeight * 0.65,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Filters',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            'Clear',
                            style:Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Text(
                        'Interested in',
                        style: TextStyle(
                          fontSize: screenHeight * 0.02,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FilterButton(
                            label: 'Girls',
                            isSelected: selectedInterest == 'Girls',
                            onTap: () {
                              setState(() {
                                selectedInterest = 'Girls';
                              });
                            },
                          ),
                          FilterButton(
                            label: 'Boys',
                            isSelected: selectedInterest == 'Boys',
                            onTap: () {
                              setState(() {
                                selectedInterest = 'Boys';
                              });
                            },
                          ),
                          FilterButton(
                            label: 'Both',
                            isSelected: selectedInterest == 'Both',
                            onTap: () {
                              setState(() {
                                selectedInterest = 'Both';
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Text(
                        'Location',
                        style: TextStyle(
                          fontSize: screenHeight * 0.02,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                    DropdownButtonFormField<String>(
                      value: selectedLocation,
                      decoration: Decorations.commonDropDownDeco(context),
                      items: locations.map((location) {
                        return DropdownMenuItem(
                          value: location,
                          child: Text(location),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedLocation = value!;
                        });
                      },
                    ),
                      SizedBox(height: screenHeight * 0.03),
                      Text(
                        'Distance',
                        style: TextStyle(
                          fontSize: screenHeight * 0.02,
                          color: Colors.grey,
                        ),
                      ),
                      Slider(
                        value: distance,
                        min: 0,
                        max: 100,
                        divisions: 100,
                        activeColor: Theme.of(context).primaryColorLight,
                        onChanged: (value) {
                          setState(() {
                            distance = value;
                          });
                        },
                        label: '${distance.toInt()}km',
                      ),
                      Text(
                        'Age',
                        style: TextStyle(
                          fontSize: screenHeight * 0.02,
                          color: Colors.grey,
                        ),
                      ),
                      RangeSlider(
                        values: ageRange,
                        min: 18,
                        max: 100,
                        divisions: 82,
                        activeColor: Theme.of(context).primaryColorLight,
                        onChanged: (values) {
                          setState(() {
                            ageRange = values;
                          });
                        },
                        labels: RangeLabels(
                          '${ageRange.start.toInt()}',
                          '${ageRange.end.toInt()}',
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColorLight,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                          ),
                        ),
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            'Continue',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );

  }
}

