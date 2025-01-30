import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:match_making/utils/navigation.dart';

import '../widgets/image_carousal_widget.dart';

class ProfileMatchDetailScreen extends StatelessWidget {
  const ProfileMatchDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background Profile Image
          Container(
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e'), // Replace with your background image asset
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content Section
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 200),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Profile Image
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e'), // Replace with your profile image asset
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.favorite, color: Colors.red),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(Icons.star, color: Colors.yellow),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 16),

                      // Name and Occupation
                      Text(
                        "Jessica Parker, 23",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Professional model",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 16),

                      // Location
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on, color: Colors.red),
                          SizedBox(width: 4),
                          Text(
                            "Chicago, IL, United States",
                            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),

                      // About Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "My name is Jessica Parker and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading...",
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Read more",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),

                      // Interests Section
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Interests",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            children: [
                              InterestChip(label: "Travelling"),
                              InterestChip(label: "Books"),
                              InterestChip(label: "Music"),
                              InterestChip(label: "Dancing"),
                              InterestChip(label: "Modeling"),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),

                      // Gallery Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Gallery",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  navigateToScreen(context, const ImageCarouselScreen());
                                },
                                child: const Text(
                                  "See all",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          StaggeredGrid.count(
                            crossAxisCount: 6,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            children: [
                              StaggeredGridTile.count(
                                crossAxisCellCount: 3,
                                mainAxisCellCount: 2,
                                child: _buildGalleryItem('https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e'),
                              ),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 3,
                                mainAxisCellCount: 2,
                                child: _buildGalleryItem('https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e'),
                              ),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 2,
                                child: _buildGalleryItem('https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e'),
                              ),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 2,
                                child: _buildGalleryItem('https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e'),
                              ),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 2,
                                child: _buildGalleryItem('https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Top Buttons
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildGalleryItem(String imagePath) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 6,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        imagePath,
        fit: BoxFit.cover,
      ),
    ),
  );
}


class InterestChip extends StatelessWidget {
  final String label;

  const InterestChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.pink[50],
      labelStyle: TextStyle(color: Colors.pink),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

