import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  const WordCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Q: final 키워드는 뭐지?
    // I: const는 const끼리 체이닝 되어야 하는듯? const에 값을 넣으려면 var가 아닌 const가 들어와야 함. final은 변수를 더이상 변하지 않게 참조하는듯

    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
