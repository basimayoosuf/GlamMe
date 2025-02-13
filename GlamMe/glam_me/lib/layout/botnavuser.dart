import 'package:flutter/material.dart';
class botnav_user extends StatefulWidget {
  const botnav_user({Key? key}) : super(key: key);

  @override
  State<botnav_user> createState() => _botnav_userState();
}

class _botnav_userState extends State<botnav_user> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
          print(_currentIndex);
          if(_currentIndex==0)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/main');
          }
          else if(_currentIndex==1)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/viewserviceuser');
          }
          else if(_currentIndex==2)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/viewoffer');
          }
          else if(_currentIndex==3)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/viewreplyuser');
          }
          else if(_currentIndex==4)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/mybooking');
          }
        });

      },
      items: [
        BottomNavigationBarItem(
          label: 'Home',

          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Services',

          icon: Icon(Icons.details),
        ),
        BottomNavigationBarItem(
          label: 'Offers',
          icon: Icon(Icons.local_offer),
        ),
        BottomNavigationBarItem(
          label: 'view Reply',
          icon: Icon(Icons.note),
        ),
        BottomNavigationBarItem(
          label: 'My Booking',
          icon: Icon(Icons.library_books),
        ),
      ],
    );;
  }
}
