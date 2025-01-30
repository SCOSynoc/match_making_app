import 'package:flutter/material.dart';



class ImageCarouselScreen extends StatefulWidget {
  const ImageCarouselScreen({super.key});

  @override
  _ImageCarouselScreenState createState() => _ImageCarouselScreenState();
}

class _ImageCarouselScreenState extends State<ImageCarouselScreen> {
  final List<String> images = [
    'https://images.unsplash.com/photo-1735437643865-18e22575a630', // Replace with your main image
    'https://plus.unsplash.com/premium_photo-1690522330990-250e9a828c08', // Replace with your gallery images
    'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
    'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
    'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
    'https://images.unsplash.com/photo-1735437643865-18e22575a630'
  ];

  int _currentIndex = 0;
  int _selectedIndex = 0;
  bool isTapped = false;
  late PageController _pageController;
  
  
  
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.3);
  }

  void _animateToPage(int index) {
    if (index != _currentIndex) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
      setState(() {
        _currentIndex = index;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Fullscreen main image
          Expanded(
            child: Container(
              width: screenWidth > 1000 ? screenWidth * 0.20 : screenWidth,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: NetworkImage(images[_currentIndex]),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high
                ),
              ),
            ),
          ),

          // Custom Carousel of smaller images
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: SizedBox(
                    height: 150,
                    child: PageView.builder(
                      itemCount: images.length,
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        bool isActive = _currentIndex == index;
                        return InkWell(
                          onTap: () {
                            _animateToPage(index);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            width: isActive ? 120 : 80,
                            height: isActive ? 120 : 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: NetworkImage(images[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Indicator below the carousel
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    images.length,
                        (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index ? Colors.pink: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}