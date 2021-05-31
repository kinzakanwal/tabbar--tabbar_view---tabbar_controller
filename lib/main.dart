import 'package:flutter/material.dart';
import 'package:task_8/part_1.dart';
import 'package:task_8/part_2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task 8',
      
      
      
      
      
      
      
      
      
      
      
      home: MyHomePage(title: 'TabBar, TabBarView & TabBarController'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('TabBar, TabBarView & TabBarController'),
            ),
            ListTile(
              title: Text('part 1'),
              onTap: () {
                
                
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PartOne()),
                );
                
              },
            ),
            ListTile(
              title: Text('part 2'),
              onTap: () {
                
                
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PartTwo()),
                );
                
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
