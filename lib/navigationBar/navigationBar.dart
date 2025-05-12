import 'package:flutter/material.dart';
import 'package:keodam_frontend/const/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavItem {
  final int index;
  final String activeIcon;
  final String inactiveIcon;
  final String label;

  const NavItem({
    required this.index,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.label,
  });
}

const _navItems = [
  NavItem(
    index: 0,
    activeIcon: "assets/icons/chat.svg",
    inactiveIcon: "assets/icons/chat.svg",
    label: '매칭',
  ),
  NavItem(
    index: 1,
    activeIcon: "assets/icons/search.svg",
    inactiveIcon: "assets/icons/search.svg",
    label: '탐색',
  ),
  NavItem(
    index: 2,
    activeIcon: "assets/icons/heart.svg",
    inactiveIcon: "assets/icons/heart.svg",
    label: '찜',
  ),
  NavItem(
    index: 3,
    activeIcon: "assets/icons/person.svg",
    inactiveIcon: "assets/icons/person.svg",
    label: '마이페이지',
  ),
];

class navigationBar extends StatefulWidget {
  const navigationBar({super.key});

  @override
  State<navigationBar> createState() => _navigationBarState();
}

class _navigationBarState extends State<navigationBar> with TickerProviderStateMixin{
  late TabController _tabController;
  int _index = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _navItems.length, vsync: this, initialIndex: _index);
    _tabController.addListener(tabListener);
  }

  @override
  void dispose() {
    _tabController.removeListener(tabListener);
    _tabController.dispose();
    super.dispose();
  }

  void tabListener() {
    setState(() {
      _index = _tabController.index;
    });
  }

  void changeTab(int index) {
    _tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double fontSize = size.width * 0.03;

    return
      Scaffold(
        backgroundColor: MAIN_BACKGROUND_COLOR,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar:
      Stack(
        children: [
          BottomNavigationBar(
            backgroundColor: MAIN_BACKGROUND_COLOR,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: MAIN_COLOR,
            unselectedItemColor: SUB_TEXT_COLOR,
            selectedLabelStyle: TextStyle(fontSize: fontSize),
            unselectedLabelStyle: TextStyle(fontSize: fontSize),
            onTap: (int index) {
              changeTab(index);
            },
            currentIndex: _index,
            items: _navItems.map((item) {
              return BottomNavigationBarItem(
                icon:_index == item.index ?
                SvgPicture.asset(
                  item.activeIcon,
                  width: size.width*0.065,
                  height: size.width*0.065,
                  color: MAIN_COLOR,
                ):
                SvgPicture.asset(
                    item.inactiveIcon,
                    width: size.width*0.065,
                    height: size.width*0.065,
                    color: SUB_TEXT_COLOR,
                ),
                label: item.label,
              );
            }).toList(),
            showUnselectedLabels: true,
          ),
        ],
          ),
        //),
        body: TabBarView(
          controller: _tabController,
          children: const [
            Center(child: Text('매칭'),),
            Center(child: Text('탐색'),),
            Center(child: Text('찜'),),
            Center(child: Text('마이페이지'),),
          ],
        ),
      );
  }
}