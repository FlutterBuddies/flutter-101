import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Q: Flutter에서 super.key는 뭐하는 녀석이지?
  // I: 대충 보니 각 Widget마다 고유 key가 있는듯. 이걸로 State에 대한 참조가 이뤄지나?
  //    근데 또 MyHomePage에서는 super.key를 주입 받는 생성자가 없네?

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff6495ed)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  // Q: 그냥 선언하면 public이 되는건가? 아래서 바로 접근하네

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];
  // Q: 왜 흔한 문법 대로 WordPair[] 대신 <WordPair>[]를 썼을까?

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}
