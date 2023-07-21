import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'word_card.dart';
import 'main.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    // Q: 에엥 MyAppState 형식의 객체를 watch 한다고? 만약 MyAppState 형식의 객체가 여러개라면?

    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.star;
    } else {
      icon = Icons.star_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('a random Uniquegood idea:'),
          WordCard(pair: pair),
          SizedBox(height: 24),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon, color: Color(0xFFFFD000)),
                label: Text('Like'),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
