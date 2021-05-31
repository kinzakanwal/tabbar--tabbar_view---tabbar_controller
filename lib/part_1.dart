
import 'package:flutter/material.dart';

class PartOne extends StatelessWidget {
  const PartOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Widget'),
          bottom:  TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.text_fields),
              ),
              Tab(
                icon: Icon(Icons.thumb_up),
              ),
              Tab(
                icon: Icon(Icons.elevator),
              ),
              Tab(
                icon: Icon(Icons.water_damage),
              ),
              Tab(
                icon: Icon(Icons.border_all),
              ),
            ],
          ),
        ),
        body:  TabBarView(
          children: <Widget>[
            Center(
              child: TextButton(
                
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 40),
                ),
                onPressed: null,
                child: const Text(
                  'Disabled',
                ),
              ),
            ),
            Center(
              
              child: Ink(
                decoration: const ShapeDecoration(
                  color: Colors.red,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  iconSize: 40,
                  icon: const Icon(
                    Icons.favorite_border_rounded,
                  ),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Enabled'),
              ),
            ),
            Center(
              child: FloatingActionButton.extended(
                onPressed: () {
                  
                },
                label: const Text('Approve'),
                icon: const Icon(Icons.thumb_up),
                backgroundColor: Colors.pink,
              ),
            ),
            Center(
              child: OutlinedButton(
                  onPressed: () {
                    
                  },
                  child: const Text('Click Me'),
                ),
            ),
          ],
        ),
      ),
    );
  }
}