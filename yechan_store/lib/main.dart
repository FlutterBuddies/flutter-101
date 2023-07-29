import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:yechan_store/model/app_state_model.dart';
import 'app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider<AppStateModel>(
      create: (_) => AppStateModel()..loadProducts(),
      // A: ..연산자는 객체의 메소드를 호출하는데 연달아 호출하게 해주는 연산자. 그런데 이제 반환 값은 객체 그 자체인
      child: const CupertinoStoreApp(),
      // Q: 여기에 const는 왜 붙지?
    ),
  );
}
