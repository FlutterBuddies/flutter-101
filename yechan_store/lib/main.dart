import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:yechan_store/model/app_state_model.dart';
import 'app.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AppStateModel>(
      create: (_) => AppStateModel()..loadProducts(),
      // A: ..연산자는 객체의 메소드를 호출하는데 연달아 호출하게 해주는 연산자. 그런데 이제 반환 값은 객체 그 자체인
      child: const CupertinoStoreApp(),
      // Q: 여기에 const는 왜 붙지?
    ),
  );
}
