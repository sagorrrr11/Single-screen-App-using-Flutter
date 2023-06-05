import 'package:flutter/material.dart';

void main() {
  runApp(TabbedApp());
}

class TabbedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tabbed App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabbedHomePage(),
    );
  }
}

class TabbedHomePage extends StatefulWidget {
  @override
  _TabbedHomePageState createState() => _TabbedHomePageState();
}

class _TabbedHomePageState extends State<TabbedHomePage> {
  int _currentIndex = 0;

  List<Widget> _pages = [
    TabbedPage(number: 1, color: Colors.red),
    TabbedPage(number: 2, color: Colors.green),
    TabbedPage(number: 3, color: Colors.blue),
  ];

  void _onTabChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabbed App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Page 1'),
              onTap: () {
                _onTabChanged(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Page 2'),
              onTap: () {
                _onTabChanged(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Page 3'),
              onTap: () {
                _onTabChanged(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabChanged,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Page 3',
          ),
        ],
      ),
    );
  }
}

class TabbedPage extends StatelessWidget {
  final int number;
  final Color color;

  const TabbedPage({Key? key, required this.number, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: color,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          'Page $number',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
