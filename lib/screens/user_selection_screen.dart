import 'package:flutter/material.dart';
import 'package:match_making/screens/interest_selection_screen.dart';
import 'package:match_making/utils/navigation.dart';


class UserSelectionScreen extends StatelessWidget {
  const UserSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSelected = false;
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
                isSelected: isSelected,
                onTap: () {
                  // Handle Woman Selection
                  isSelected = !isSelected;
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomDropdownButton(
                label: "Man",
                isSelected: true,
                onTap: () {
                  // Handle Man Selection
                  isSelected = !isSelected;
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomDropdownButton(
                label: "Choose another",
                isSelected: isSelected,
                onTap: () {
                  // Handle Choose Another Selection
                  isSelected = !isSelected;
                },
              ),
              const Spacer(),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Continue
                    navigateToScreen(context, const InterestSelectionScreen());
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
  }
}

// Custom Dropdown Button Widget
class CustomDropdownButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomDropdownButton({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.red : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.red : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            Icon(
              isSelected ? Icons.check : Icons.arrow_forward_ios,
              color: isSelected ? Colors.red : Colors.grey,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
