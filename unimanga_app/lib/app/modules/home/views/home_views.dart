import 'package:flutter/material.dart';
import 'package:unimanga_app/app/constants/index.dart';
import 'package:unimanga_app/app/modules/dashboard/views/dashboard_views.dart';
import 'package:unimanga_app/app/modules/infor_user/views/Info.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  static  final List<Widget> _widgetOptions = <Widget>[
    DashboardView(),
    Text('Item 2'),
    const InfoScreen(),
  ];
   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: 'Truyện',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Tủ sách',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'Tài khoản',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.RedPrimary,
        onTap: _onItemTapped
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}