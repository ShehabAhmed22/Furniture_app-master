import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnitureui/models/chair.dart';
import 'package:furnitureui/screens/cart_screen.dart';

class DetailScreen extends StatelessWidget {

  late Chair chair;

  DetailScreen({required this.chair});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 300.0,
                width: MediaQuery.of(context).size.width,
                color: chair.backgorundColor,
                child: Hero(
                  tag: chair.name,
                  child: Image(
                    image: AssetImage(
                        chair.imageUrl
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.black,
                      iconSize: 25.0,
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 30.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: GestureDetector(
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        onTap: (){
                          Navigator
                              .of(context)
                              .push(MaterialPageRoute(builder: (_)=> CartScreen()));
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    chair.name,
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.5
                    ),
                  ),
                ),
                Text(
                  chair.type,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    color: Colors.black54
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                    ),
                    Text(
                      chair.rating.toString(),
                      style: TextStyle(
                        fontSize: 15.0,
                          color: Colors.black54
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Details: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  chair.description,
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.black54
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      detailsWidget('H: ${chair.height}"'),
                      detailsWidget('W: ${chair.weight}"'),
                      detailsWidget(chair.color),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(15.0)
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                            child: const Center(
                              child: Text(
                                "Buy now",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                          onTap: (){
                            Navigator
                                .of(context)
                                .push(MaterialPageRoute(builder: (_)=> CartScreen()));
                          },
                        )
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(15.0)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                        child: const Center(
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget detailsWidget(String description){
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.00,
                  offset: Offset(0,2)
              )
            ]
        ),
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: Text(
            description,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0
            ),
          ),
        )
    );
  }
}
