import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchesScreen extends StatelessWidget {

  final List<Map<String, dynamic>> matchesToday = [
    {'name': 'Leilani', 'age': 19, 'image': 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e'},
    {'name': 'Annabelle', 'age': 20, 'image': 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e'},
    {'name': 'Reagan', 'age': 24, 'image': 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e'},
    {'name': 'Hadley', 'age': 25, 'image': 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e'},
  ];

  final List<Map<String, dynamic>> matchesYesterday = [
    {'name': 'Sophia', 'age': 21, 'image': 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e'},
    {'name': 'Emma', 'age': 23, 'image': 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e'},
  ];

  MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsiveWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Matches',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt, color: Colors.pinkAccent),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'This is a list of people who have liked you and your matches.',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 16),
              buildSectionTitle('Today'),
              buildMatchesGrid(matchesToday,responsiveWidth),
              const SizedBox(height: 16),
              buildSectionTitle('Yesterday'),
              buildMatchesGrid(matchesYesterday,responsiveWidth),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildMatchesGrid(List<Map<String, dynamic>> matches, double width) {

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: width > 1000 ? 4 : 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 3 / 4,
      ),
      itemCount: matches.length,
      itemBuilder: (context, index) {
        final match = matches[index];
        return buildMatchCard(match);
      },
    );
  }

  Widget buildMatchCard(Map<String, dynamic> match) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(match['image']),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${match['name']}, ${match['age']}',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const Row(
                    children: [
                      Icon(Icons.clear, color: Colors.white),
                      SizedBox(width: 8),
                      Icon(Icons.favorite, color: Colors.pinkAccent),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite, color: Colors.pinkAccent),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '',
        ),
      ],
    );
  }
}
