import 'package:newdesignpatternapp/widgets/list_design.dart';
import 'package:newdesignpatternapp/widgets/main_appbar.dart';
import 'package:newdesignpatternapp/widgets/sidebar.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();
  int _currentIndex=1;
  final List _widgets=[const Favorites(), const DesignPatternsList(),const Quiz()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      drawer: Sidebar(),
      body: _widgets[_currentIndex],
      bottomNavigationBar:  SizedBox(
        height: 100,
        child: BottomNavigationBar(items: [
           BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorites'),
           BottomNavigationBarItem(icon: Icon(Icons.home_rounded),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.quiz_rounded),label: 'Quiz')
        ],
        type: BottomNavigationBarType.fixed,
        
        currentIndex: _currentIndex,
        onTap:(int value) {
          setState(() {
            _currentIndex=value;
          });
        },
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.yellowAccent,
        unselectedIconTheme: IconThemeData(size: 25),
        selectedIconTheme: IconThemeData(size: 35),
        iconSize: 20,
        ),
      ) ,
    );
  }
}


class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
