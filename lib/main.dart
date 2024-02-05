import 'package:flutter/material.dart';
import 'package:pharnacy/chat_interface/chat_params.dart';
import 'package:pharnacy/chat_interface/chatscreen.dart';
import 'package:pharnacy/pages/welcomeScreen.dart';
import 'package:pharnacy/pages/selectScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
              // primarySwatch: Colors.green,
              )
          .copyWith(
              colorScheme: ThemeData().colorScheme.copyWith(
                  primary: Color(0xFF21C51D),
                  secondary: Color(0xFFD9D9D9),
                  onSurface: Color(0xFF212121))),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, userSnapshot) {
            if (userSnapshot.hasData) {
              return WelcomeScreen();
            }
            return WelcomeScreen();
          }),
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => WelcomeScreen());
      case '/chat':
        var arguments = settings.arguments;
        if (arguments != null) {
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  ChatScreen(chatParams: arguments as ChatParams),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                animation =
                    CurvedAnimation(curve: Curves.ease, parent: animation);
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              });
        } else {
          return pageNotFound();
        }
      default:
        return pageNotFound();
    }
  }

  static MaterialPageRoute pageNotFound() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
            appBar: AppBar(title: Text("Error"), centerTitle: true),
            body: Center(
              child: Text("Page not found"),
            )));
  }
}
