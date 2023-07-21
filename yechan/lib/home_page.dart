import 'package:flutter/material.dart';
import 'package:flutter_application_1/favorites_page.dart';

import 'generator_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Q: 아 언더바가 앞에 붙으면 private인가보네

  int selectedIndex = 0;
  // dart의 문법은 c#이랑 비슷한가..? var이면 자동으로 타입 추론이 되는듯

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        // Q: Scaffold는 뭘까..?
        // I: 대충 보니 Material Design 레이아웃 잡는거네. 나중에 앱바나 드로워메뉴 등이 확장 가능한듯?
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 800,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.star),
                    label: Text('Favorites'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}
