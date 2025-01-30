import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                      Icon(Icons.arrow_back_ios, color: Colors.grey),
                      Text(
                        'Discover',
                        style: TextStyle(
                          fontSize: screenHeight * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Icon(Icons.filter_alt, color: Colors.pink),
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
                            style: TextStyle(
                              fontSize: screenHeight * 0.03,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Clear',
                            style: TextStyle(
                              fontSize: screenHeight * 0.02,
                              color: Colors.pink,
                            ),
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
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: screenHeight * 0.015,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
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
                        activeColor: Colors.pink,
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
                        activeColor: Colors.pink,
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
                          backgroundColor: Colors.pink,
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
                            style: TextStyle(
                              fontSize: screenHeight * 0.02,
                              color: Colors.white,
                            ),
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

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  FilterButton({required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.pink : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
