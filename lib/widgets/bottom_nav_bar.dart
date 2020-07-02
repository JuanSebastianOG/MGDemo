import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'file:///C:/Users/sebastian/Documents/Universidad/Repos/mg_first_demo/lib/constants.dart';
class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex=1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
        },
      ),
    );
  }
}


