import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_making/screens/signup_screen.dart';
import 'package:match_making/utils/themes.dart';
import 'package:match_making/widgets/common_button.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: const [
                OnboardingPage(
                  image: 'assets/images/photo_1.png',
                  title: 'Welcome',
                  description: 'Discover amazing features to boost your productivity.',
                ),
                OnboardingPage(
                  image: 'assets/images/photo_2.png',
                  title: 'Organize',
                  description: 'Organize your tasks and stay on top of your schedule.',
                ),
                OnboardingPage(
                  image: 'assets/images/photo_3.png',
                  title: 'Achieve',
                  description: 'Set goals and achieve them with ease.',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 12 : 8,
                      height: _currentPage == index ? 12 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index ? Colors.blue : Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 24),
                CommonButton(
                  backgroundColor: AppThemes.lightTheme.primaryColorDark,
                  onPressed: () {
                    if (_currentPage == 2) {
                      // Navigate to the next screen or finish
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SignUpScreen()),
                              (Route<dynamic> route) => false);
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  text: _currentPage == 2 ? "Create an account" : "Next",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 250),
          SizedBox(height: 32),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}