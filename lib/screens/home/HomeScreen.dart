import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:lebihdekatdengantouna/contants.dart';
import 'package:lebihdekatdengantouna/screens/event/EventScreen.dart';
import 'package:lebihdekatdengantouna/screens/notifikasi/NotifikasiScreen.dart';
import 'package:lebihdekatdengantouna/screens/pengaturan/PengaturanScreen.dart';
import 'package:lebihdekatdengantouna/screens/utama/UtamaScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(kBackgroundColor);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    return Scaffold(
      body: SizedBox.expand(

        child: PageView(

          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            UtamaScreen(),
            EventScreen(),
            NotifikasiScreen(),
            PengaturanScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        showElevation: false,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Utama'),
            icon: Icon(Icons.home),
            activeColor: kColorPrimary,
          ),
          BottomNavyBarItem(
            title: Text('Event'),
            icon: Icon(Icons.calendar_today),
            activeColor: kColorSecondary,
          ),
          BottomNavyBarItem(
            title: Text('Notifikasi'),
            icon: Icon(Icons.notifications),
            activeColor: kColorThird,
          ),
          BottomNavyBarItem(
            title: Text('Pengaturan'),
            icon: Icon(Icons.settings),
            activeColor: kColorFourth,
          ),
        ],
      ),
    );
  }
}
