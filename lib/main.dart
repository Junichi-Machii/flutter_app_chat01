import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//packages
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//screens
import 'package:flutter_chat_app01/screens/auth.dart';
import 'package:flutter_chat_app01/screens/chat.dart';
import 'package:flutter_chat_app01/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  const app = App();
  runApp(app);
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData(
        useMaterial3: true,
      ).copyWith(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 56, 192, 54)),
      ),
      home: Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snapshot) {
            //splashScreen
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashScreen();
            }

            if (snapshot.hasData) {
              return const ChatScreen();
            }

            return const AuthScreen();
          },
        ),
      ),
    );
  }
}
