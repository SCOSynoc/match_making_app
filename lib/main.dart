import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:match_making/bloc/ProfileBloc/profile_states.dart';
import 'package:match_making/screens/all_matches_screen.dart';
import 'package:match_making/screens/filter_screen.dart';
import 'package:match_making/screens/match_screen.dart';
import 'package:match_making/screens/onboard_screen.dart';
import 'package:match_making/screens/signup_screen.dart';
import 'package:match_making/utils/themes.dart';
import 'package:match_making/widgets/image_carousal_widget.dart';
import 'bloc/AuthBloc/auth_bloc.dart';
import 'bloc/ProfileBloc/profile_bloc.dart';
import 'bloc_observer.dart';
import 'custom_card_swiper.dart';
import 'local_storage/hive_service.dart';

void main() async{
  Bloc.observer = AppBlocObserver();
  await Hive.initFlutter();
  await Hive.openBox(localBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => ProfileBloc())
      ],
      child: MaterialApp(
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          body: OnboardingScreen(),
        ),
      ),
    );
  }
}

class CardSwiperExample extends StatelessWidget {
  CardSwiperExample({super.key});

  Future<List<Widget>> _fetchCards() async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(5, (index) =>
        ProfileCard(index: index,),
        );
  }

  final initialCards = List.generate(5,
        (index) => ProfileCard(index: index),
  );

  @override
  Widget build(BuildContext context) {


    return Center(
      child: CardSwiper(
        initialCards: initialCards,
        loadMoreCards: _fetchCards,
        onSwipe: (index, isLiked) {
          print('Card $index swiped ${isLiked ? "right" : "left"}');
        },
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.index
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        margin: EdgeInsets.all(16),
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pinkAccent, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Text(
              'New Card ${ index + 1}',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      );


  }
}
