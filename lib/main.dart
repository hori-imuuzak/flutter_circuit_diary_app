import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:circuit_diary/app/domain/repository/car_repository.dart';

import 'package:circuit_diary/app/state/car_state.dart';
import 'package:circuit_diary/app/state_notifier/car_state_notifier.dart';

import 'package:circuit_diary/app/ui/screen/car_management.dart';
import 'package:circuit_diary/app/ui/screen/track_management.dart';

import 'package:circuit_diary/app/infrastructure/firebase/firebase_car_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container();
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return circuitDiary();
          }

          return Container();
        });
  }
}

Widget circuitDiary() {
  var app = MaterialApp(
    title: 'Circuit Support',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    initialRoute: '/',
    routes: <String, WidgetBuilder>{
      '/': (BuildContext context) => HomePage(),
    },
  );

  return MultiProvider(
    providers: [
      Provider<CarRepository>(create: (_) => FirebaseCarRepository()),
      StateNotifierProvider<CarStateNotifier, CarState>(
          create: (context) => CarStateNotifier(context.read))
    ],
    child: app,
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTabIndex = 0;

  static List<Widget> _pageList = [
    Text(
      'Page1',
    ),
    Text(
      'Page2',
    ),
    CarManagement(),
    TrackManagement(),
    Text(
      'Page5',
    ),
  ];

  static List<String> _titleList = [
    'ホーム',
    'スケジュール',
    '車両管理',
    'コース管理',
    'レコード管理',
  ];

  @override
  void initState() {
    FirebaseAuth.instance.signInAnonymously();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleList[_selectedTabIndex]),
      ),
      body: SafeArea(child: _pageList[_selectedTabIndex]),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.home),
            label: _titleList[0],
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.calendar_today),
            label: _titleList[1],
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.car_repair),
            label: _titleList[2],
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.track_changes),
            label: _titleList[3],
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.timer),
            label: _titleList[4],
          ),
        ],
        currentIndex: _selectedTabIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }
}
