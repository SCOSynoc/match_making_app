import 'package:flutter/material.dart';
import 'dart:math';

class CardSwiper extends StatefulWidget {
  final List<Widget> initialCards;
  final Future<List<Widget>> Function()? loadMoreCards;
  final void Function(int index, bool isLiked)? onSwipe;

  const CardSwiper({
    super.key,
    required this.initialCards,
    this.loadMoreCards,
    this.onSwipe,
  });

  @override
  _CardSwiperState createState() => _CardSwiperState();
}

class _CardSwiperState extends State<CardSwiper> with SingleTickerProviderStateMixin {
  late List<Widget> _cards;
  int _currentIndex = 0;
  Offset _dragOffset = Offset.zero;
  late AnimationController _animationController;
  bool _isLiked = false;
  bool _loadingMore = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _cards = List.from(widget.initialCards);
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _loadMoreCards() async {
    setState(() {
      _loadingMore = true;
    });
    if (widget.loadMoreCards != null) {
      final newCards = await widget.loadMoreCards!();
      setState(() {
        _cards.addAll(newCards);
        _loadingMore = false;
      });
    }
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    setState(() {
      _dragOffset += details.delta;
      _isLiked = _dragOffset.dx > 0;
      print("The _dragOffset is in _handlePanUpdate() :: $_dragOffset ");
    });
  }

  void _handlePanEnd(DragEndDetails details) {
    if (_dragOffset.dx.abs() > 150) {
      _swipeCard(_isLiked);
    } else {
      _resetCard();
    }
  }

  void _swipeCard(bool isLiked) {
    widget.onSwipe?.call(_currentIndex, isLiked);

    _animationController.forward().then((_) {
      setState(() {
        _currentIndex++;
        _dragOffset = Offset.zero;
        if (_currentIndex >= _cards.length - 1) {
          _loadMoreCards();
        }
      });
      _animationController.reset();
    });
  }

  void _resetCard() {
    _animationController.reverse().then((_) {
      setState(() {
        _dragOffset = Offset.zero;
      });
    });
  }

  void _undoLastSwipe() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        for (int i = _currentIndex; i < _cards.length; i++)
          if (i == _currentIndex)
            GestureDetector(
              onPanUpdate: _handlePanUpdate,
              onPanEnd: _handlePanEnd,
              child: CardSwipeMainWidget(animationController: _animationController,
                  dragOffset: _dragOffset, isLiked: _isLiked, cards: _cards, i: i),
            ),
        if(_loadingMore)
           const Center(
             child: SizedBox(
                 height: 50,
                 width: 50,
                 child: CircularProgressIndicator(color: Colors.yellowAccent,)),
           ),

        if (_currentIndex > 0)
          Positioned(
            bottom: 50,
            child: ElevatedButton(
              onPressed: _undoLastSwipe,
              child: Text("Undo"),
            ),
          ),
      ],
    );
  }
}

class CardSwipeMainWidget extends StatelessWidget {
  const CardSwipeMainWidget({
    super.key,
    required AnimationController animationController,
    required Offset dragOffset,
    required bool isLiked,
    required List<Widget> cards,
    required this.i,
  }) : _animationController = animationController, _dragOffset = dragOffset, _isLiked = isLiked, _cards = cards;

  final AnimationController _animationController;
  final Offset _dragOffset;
  final bool _isLiked;
  final List<Widget> _cards;
  final int i;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _animationController,
      builder: (context, _, child) {
        final slidePercent = _animationController.value;
        final angle = (_dragOffset.dx * 0.001) * (1 - slidePercent);
        final offset = Offset(
          _dragOffset.dx * (1 - slidePercent),
          _dragOffset.dy * (1 - slidePercent),
        );

        print("Here data is $slidePercent , $angle , $offset ");

        return Transform.translate(
          offset: offset,
          child: Transform.rotate(
            angle: angle,
            child: Stack(
              children: [
                child!,
                if (_dragOffset.dx.abs() > 20)
                  Align(
                    alignment: _isLiked
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(120),
                      child: Text(
                        _isLiked ? "Liked" : "Nope",
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: Theme.of(context).textTheme.displayMedium?.fontFamily,
                          fontWeight: FontWeight.bold,
                          color: _isLiked ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
      child: _cards[i],
    );
  }
}
