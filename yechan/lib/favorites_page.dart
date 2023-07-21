import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();

    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          Text("You have ${appState.favorites.length} favorites:"),
          SizedBox(height: 8),
          ...appState.favorites
              .map(
                (item) => Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Color(0xFFFFD000)),
                        SizedBox(width: 8),
                        Text(item.asLowerCase),
                      ],
                    ),
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
