import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:furnitureui/Data/data.dart';
import 'package:furnitureui/Widgets/popular_products.dart';
import 'package:furnitureui/Widgets/recently_added.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: (){

                        },
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.search),
                            onPressed: (){

                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.shopping_bag_outlined),
                            onPressed: (){

                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 5.0, left: 20.0),
                      child: Text(
                        "Hey, Ramesh",
                        style: TextStyle(
                          color: Colors.black54
                        ),
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0, left: 20.0),
                      child: Text(
                        "Explore your \nfurnitures",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.0
                        ),
                      )
                    )
                  ],
                ),
                Container(
                  height: 100.0,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index){
                      return _buildCategories(index);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryIcon.length,
                  ),
                ),
                _buildHeading("Popular products"),
                PopularProducts(),
                _buildHeading("Recently Added"),
                RecentlyAdded()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeading(String heading){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: Text(
        heading,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0
        ),
      ),
    );
  }


  Widget _buildCategories(int index){
    return InkWell(
      onTap: (){
        setState(() {
          selectedIndex = index;
          log(selectedIndex.toString());
        });
      },
      child: ClipRRect(
        child: Container(
          decoration: BoxDecoration(
              color: selectedIndex == index ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(35.0),
              border: Border.all(color: Colors.black),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 2.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ]
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Center(
            child: Icon(
              categoryIcon[index],
              color: selectedIndex == index ? Colors.white: Colors.black,
              size: 40.0,
            ),
          ),
        ),
      ),
    );
  }
}
