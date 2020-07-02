import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'file:///C:/Users/sebastian/Documents/Universidad/Repos/mg_first_demo/lib/constants.dart';
import 'package:mgfirstdemo/screens/details_screen.dart';
import 'package:mgfirstdemo/tabs/allexcercises_tab.dart';
import 'package:mgfirstdemo/widgets/bottom_nav_bar.dart';
import 'package:mgfirstdemo/widgets/category_card.dart';
import 'package:mgfirstdemo/widgets/search_bar.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MG First Demo',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex=1;
  final PageController _pageController = PageController();

  final _pageOptions = [
    Center(child: Text('Primera')),
    allexcercises_tab(),
    Center(child: Text('Tercera'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageView(
        controller: _pageController,
        children: <Widget>[
          Center(child: Text('Primera')),
          allexcercises_tab(),
          Center(child: Text('Tercera'))
        ],
        onPageChanged: (page) {
          setState(() {
            _currentIndex = page;
          });
        },
      ),
      /*_pageOptions[_currentIndex]*/
      bottomNavigationBar: SizedBox(
        height: 90.0,
        child: BottomNavigationBar(
          elevation: 50.0,
          currentIndex: _currentIndex ,
          iconSize: 80,
          selectedItemColor: kActiveIconColor,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(6.0),
                child: SvgPicture.asset(
                  ("assets/icons/calendar.svg"),
                  color: _currentIndex==0 ? kActiveIconColor : kTextColor,
                ),
              ),
              title: Text('Today'),
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: SvgPicture.asset(
                    ("assets/icons/gym.svg"),
                    color: _currentIndex==1 ? kActiveIconColor : kTextColor
                    ,
                  ),
                ),
                title: Text('All Excercises'),
                backgroundColor: Colors.white
            ),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: SvgPicture.asset(
                    ("assets/icons/calendar.svg"),
                    color: _currentIndex==2 ? kActiveIconColor : kTextColor
                    ,
                  ),
                ),
                title: Text('Settings'),
                backgroundColor: Colors.white
            ),
          ],
          onTap: (index){
            setState(() {
              _currentIndex=index;
            });
            _pageController.jumpToPage(index);
          },
        ),
      )/*BottomNavBar()*/,

    );
  }
}
