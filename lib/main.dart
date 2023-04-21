import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';

var duration = Duration(seconds: 3); //Duration, die einen Zeitraum von 3 Sekunden definiert
var timer = Timer(duration, function);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  static const String _title = 'Flutter Test';
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyStatefulWidget(), MyHomePage(title: 'Flutter Timer Demo Home Page'),
    );
  }
}

class MyHomePage  extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    },
    );
  }
}

@override
void initState() {
  super.initState();
  Timer(Duration(seconds: 3), _incrementCounter);
}

@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Der Zaehler wird nach 3 Sekunden hochzaehlen',
          ),
          Text('$_counter',
            style: Theme.of(context).textTheme.headline4,),
        ],
      ),)
  )
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Settings',
      style: optionStyle,
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: const Text('BottomNavigationBar Sample'),
    ),
    body: Center(child: _widgetOptions.elementAt(_selectedIndex),
    ),
    bottomNavigationBar: BottomNavigationBar(items: const<BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home'
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings'
      )
    ],
    currentIndex: _selectedIndex,
    selectedItemColor: Colors.lightBlue,
    onTap: _onItemTapped,
    ),
    );
  }
}

