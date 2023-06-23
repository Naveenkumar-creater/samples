import 'package:flutter/material.dart';
import '../../constants/global_variable.dart';
import '../../widget/bottom_bar/workorder.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = '/home';
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    WorkOrdersScreen(),
    // DummyDashboard(),
    AssetsScreen(),
    MessagesScreen(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openSettingsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          leadingWidth: GlobalVariables.defaultPadding,
          backgroundColor: GlobalVariables.primaryColor,
          title: Row(
            children: [
              const Text(
                'Hello, Sivabala!',
                style: TextStyle(
                  fontSize: GlobalVariables.defaultPadding,
                ),
              ),
              Spacer(),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: _openSettingsPage,
                  ),
                  const Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          flexibleSpace: const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: GlobalVariables.defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Prominous',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: GlobalVariables.defaultPadding * 2),
              ],
            ),
          ),
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Work Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.extension),
            label: 'Assets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: GlobalVariables.primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Messages Screen',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'More Screen',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: const Center(
        child: Text(
          'Settings Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
