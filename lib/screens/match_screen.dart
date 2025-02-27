import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _femaleImageAnimation;
  late Animation<Offset> _maleImageAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _femaleImageAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.decelerate),
    );

    _maleImageAnimation = Tween<Offset>(
      begin: Offset(1.0,0.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.decelerate),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Match',
                style: Theme.of(context).textTheme.displayMedium
              ),
              SizedBox(height: screenHeight * 0.03),
              SizedBox(
                height: screenHeight * 0.4,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      left: screenWidth * 0.05,
                      child: Transform.rotate(
                        angle: -0.15,
                        child: SlideTransition(
                          position: _femaleImageAnimation,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
                              height: screenHeight * 0.35,
                              width: screenWidth * 0.4,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: screenWidth * 0.05,
                      child: Transform.rotate(
                        angle: 0.15,
                        child: SlideTransition(
                          position: _maleImageAnimation,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
                              height: screenHeight * 0.35,
                              width: screenWidth * 0.4,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenHeight * 0.12,
                      child: Container(
                        height: screenHeight * 0.12,
                        width: screenHeight * 0.12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Theme.of(context).primaryColorLight, width: 3),
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColorLight,
                          size: screenHeight * 0.05,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Text(
                "It's a match,",
                style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize:screenHeight * 0.04, fontWeight: FontWeight.bold ),
              ),
              Text(
                'Jake!',
                style:Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontSize:screenHeight * 0.035, fontWeight: FontWeight.bold
                )
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Start a conversation now with each other',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize:screenHeight * 0.02 ),
              ),
              SizedBox(height: screenHeight * 0.05),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColorLight,
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.3, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Say hello',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize:screenHeight * 0.02 ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Keep swiping',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize:screenHeight * 0.02 ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
