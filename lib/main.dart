import 'package:demo_firbase_app/firebase_options.dart';
import 'package:demo_firbase_app/models/member.dart';
import 'package:demo_firbase_app/screen/home_screen.dart';
import 'package:demo_firbase_app/screen/login_screen.dart';
import 'package:demo_firbase_app/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Member?>.value(
      value: AuthService().onAuthStateChanged,
      initialData: null,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final member = Provider.of<Member?>(context);
    Widget view;
    print(member);
    if (member == null) {
      view = const LoginScreen();
    } else {
      view = const HomeScreen();
    }
    return Scaffold(body: view);
  }
}
