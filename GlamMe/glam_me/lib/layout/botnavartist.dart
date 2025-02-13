import 'package:flutter/material.dart';
class botnav_artist extends StatefulWidget {
  const botnav_artist({Key? key}) : super(key: key);

  @override
  State<botnav_artist> createState() => _botnav_artistState();
}

class _botnav_artistState extends State<botnav_artist> {
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
            Navigator.pushNamed(context, '/main___');
          }
          else if(_currentIndex==1)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/updateworkstatus');
          }
          else if(_currentIndex==2)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/viewassignedwork');
          }
          else if(_currentIndex==3)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/view_rating');
          }
          else if(_currentIndex==4)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/artistprofile');
          }
        });

      },
      items: [
        BottomNavigationBarItem(
          label: 'Home',

          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'work Status',

          icon: Icon(Icons.update),
        ),
        BottomNavigationBarItem(
          label: 'My works',
          icon: Icon(Icons.history),
        ),
        BottomNavigationBarItem(
          label: 'view rating',
          icon: Icon(Icons.star_border_purple500_outlined),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(Icons.person),
        ),
      ],
    );;
  }
}
