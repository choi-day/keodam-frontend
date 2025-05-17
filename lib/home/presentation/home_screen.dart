import 'package:flutter/material.dart';
import 'package:keodam_frontend/const/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title:
          const Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
            children: [
              Text("DISCORVERY",
                style: TextStyle(
                  color: MAIN_COLOR,
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),
              ),
              Text("담소로 내딛는 한 걸음",
                style: TextStyle(
                  color: SUB_TEXT_COLOR,
                  fontSize: 10
                ),
              ),
            ],
          ),
          actions: [
            IconButton(onPressed:(){} , icon: Icon(Icons.favorite_border_outlined)),
            IconButton(onPressed:(){} , icon: Icon(Icons.notifications_none_outlined))
          ],
      ),
      body: Column(
        children: [
          Column(
            children: [
              //광고 배너
              //이벤트 배너
              //검색
            ],
          ),
          Column(
            children: [
              //사용자
            ],
          )
        ],
      ),
    );
  }
}
