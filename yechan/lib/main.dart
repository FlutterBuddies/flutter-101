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
  var history = <WordPair>[];

  GlobalKey? historyListKey;

  void getNext() {
    history.insert(0, current);

    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);
    // Q: 0번째에 넣는 건 뭐지?

    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite([WordPair? pair]) {
    // Q: 대괄호로 묶인 건 왜지? 무슨 문법이지
    // S: 찾아보니 옵셔널, 그리고 순서가 있는 파라미터에 대한 문법인듯
    pair = pair ?? current;

    if (favorites.contains(pair)) {
      favorites.remove(pair);
    } else {
      favorites.add(pair);
    }
    notifyListeners();
  }

  void removeFavorite(WordPair pair) {
    favorites.remove(pair);
    notifyListeners();
  }
}
