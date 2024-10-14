import 'package:flutter/material.dart';
import 'package:p1_donut_app_jose_chale/utils/my_tab.dart';

import '../tab/burger_tab.dart';
import '../tab/donut_tab.dart';
import '../tab/pancake_tab.dart';
import '../tab/pizza_tab.dart';
import '../tab/smoothie_tab.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 
  List<Widget> myTabs = [
    const MyTab(
      iconPath:"lib/icons/donut.png" ,
      ),
    const MyTab(
      iconPath:"lib/icons/burger.png" ,
      ),
    const MyTab(
      iconPath:"lib/icons/smoothie.png" ,
      ),
    const MyTab(
      iconPath:"lib/icons/pancakes.png" ,
      ),
    const MyTab(
      iconPath:"lib/icons/pizza.png" ,
      ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Icon(
              Icons.menu,
              color: Colors.grey,
            ),
          ),
          actions: const [Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Icon(Icons.person),
          )],
        ),
      body: Column(
        children: [
       const Padding(
          padding: EdgeInsets.all(24.0),
          child: Row(
            children: [
              Text("I want to ", style: TextStyle(fontSize: 24)),
              Text("Eat", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, decoration: TextDecoration.underline ))
            ],
      
          ),
        ),
          TabBar(tabs: myTabs),

          const Expanded(
            child: TabBarView(children:[
          DonutTab(),
          BurgerTab(),
          SmoothieTap(),
          PancakeTab(),
          PizzaTap()
        ])
          )
        ],
        ),
      ),
    );
  }
}
