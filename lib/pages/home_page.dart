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
      label: "Donuts",
      ),
    const MyTab(
      iconPath:"lib/icons/burger.png" ,
      label: "Burgers",
      ),
    const MyTab(
      iconPath:"lib/icons/smoothie.png" ,
      label: "Smothies",
      ),
    const MyTab(
      iconPath:"lib/icons/pancakes.png" ,
      label: "Pancakes",
      ),
    const MyTab(
      iconPath:"lib/icons/pizza.png" ,
      label: "Pizzas",
      ),
  ];

  // Estado del carrito
  Map<String, int> cartItems = {};
  double totalAmount = 0;

  // Añadir artículo al carrito
  void addToCart(String itemName, double itemPrice) {
    setState(() {
      if (cartItems.containsKey(itemName)) {
        cartItems[itemName] = cartItems[itemName]! + 1;
      } else {
        cartItems[itemName] = 1;
      }
      totalAmount += itemPrice;
    });
  }

  // Eliminar artículo del carrito
  void removeFromCart(String itemName, double itemPrice) {
    setState(() {
      if (cartItems.containsKey(itemName)) {
        if (cartItems[itemName] == 1) {
          cartItems.remove(itemName);
        } else {
          cartItems[itemName] = cartItems[itemName]! - 1;
        }
        totalAmount -= itemPrice;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const Padding(
            padding:  EdgeInsets.only(left: 24.0),
            child: Icon(
              Icons.menu,
              color: Colors.grey,
            ),
          ),
          actions: const [Padding(
            padding:  EdgeInsets.only(right: 24.0),
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

          Expanded(
            child: TabBarView(children:[
          DonutTab(addToCart: addToCart, removeFromCart: removeFromCart),
          BurgerTab(addToCart: addToCart, removeFromCart: removeFromCart),
          SmoothieTab(addToCart: addToCart, removeFromCart: removeFromCart),
          PanCakeTab(addToCart: addToCart, removeFromCart: removeFromCart),
          PizzaTab(addToCart: addToCart, removeFromCart: removeFromCart)
        ],
        ),
          ),

        CartBar(
              itemCount: cartItems.values.fold(0, (a, b) => a + b),
              totalAmount: totalAmount,
              onViewCartPressed: () {
              },
        ),
        ],
        ),
      ),
    );
  }
}
