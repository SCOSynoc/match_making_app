import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:match_making/custom_card_swiper.dart';
import 'package:match_making/screens/all_matches_screen.dart';
import 'package:match_making/screens/filter_screen.dart';
import 'package:match_making/screens/match_screen.dart';
import 'package:match_making/screens/matcher_profile_detail.dart';
import 'package:match_making/utils/navigation.dart';





class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  int _currentIndex = 0;



  Future<List<Widget>> _fetchCards() async {
    await Future.delayed(const Duration(seconds: 2));
    return List.generate(5, (index) => ProfileCard(
      name: "Jessica Parker",
      age: "23",
      job: "Professional model",
      distance: "$index km",
      imageUrl:
      "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e", // Replace with your image URL
    ),

    );
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Discover',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Chicago, IL',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              showBottomSheet(
                  sheetAnimationStyle: AnimationStyle.noAnimation,
                  context: context,
                  builder: (BuildContext context) {
                return FilterScreen();
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Card Section
          Expanded(
            child: Center(
              child: SizedBox(
                width: screenWidth * 0.9,
                child: CardSwiper(
                  loadMoreCards: _fetchCards,
                  initialCards:  [
                        InkWell(
                          onTap: () {
                            navigateToScreen(context, ProfileMatchDetailScreen());
                          },
                          child: const ProfileCard(
                            name: "Jessica Parker",
                            age: "23",
                            job: "Professional model",
                            distance: "1 km",
                            imageUrl:
                            "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e", // Replace with your image URL
                          ),
                        ),

                  ],)

              ),
            ),
          ),
          // Buttons Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircularButton(
                  icon: Icons.close,
                  color: Colors.red,
                  onTap: () {},
                ),
                CircularButton(
                  icon: Icons.favorite,
                  color: Colors.pink,
                  onTap: () {
                    navigateToScreen(context, const MatchScreen());
                  },
                  isLarge: true,
                ),
                CircularButton(
                  icon: Icons.star,
                  color: Colors.purple,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String age;
  final String job;
  final String distance;
  final String imageUrl;

  const ProfileCard({
    required this.name,
    required this.age,
    required this.job,
    required this.distance,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Gradient Overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // Profile Details
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$name, $age",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  job,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.white, size: 16),
                    SizedBox(width: 4),
                    Text(
                      distance,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final bool isLarge;

  const CircularButton({
    required this.icon,
    required this.color,
    required this.onTap,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    double size = isLarge ? 70 : 50;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(0.1),
        ),
        child: Center(
          child: Icon(
            icon,
            color: color,
            size: isLarge ? 32 : 24,
          ),
        ),
      ),
    );
  }
}
