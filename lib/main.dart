import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
//packages
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:flutter_chat_app01/screens/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  const app = App();

  if (kIsWeb) {
    runApp(DevicePreview(builder: (_) => app));
  } else {
    runApp(app);
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 63, 17, 177)),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: const AuthScreen(),
      ),
    );
  }
}
