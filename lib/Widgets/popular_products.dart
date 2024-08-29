
import 'package:flutter/material.dart';
import 'package:furnitureui/Data/data.dart';
import 'package:furnitureui/models/chair.dart';
import 'package:furnitureui/screens/cart_screen.dart';
import 'package:furnitureui/screens/details_screens.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.0,
      child: ListView.builder(
        itemBuilder: (content, index){
          return _buildPopularProducts(context,index);
        },
        itemCount: popular.length,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _buildPopularProducts(BuildContext context, int index){

    Chair chair = popular[index];

    return GestureDetector(
      onTap: (){
        Navigator.
          of(context)
            .push(MaterialPageRoute(
            builder: (_)=> DetailScreen(chair: chair)));
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 25.0),
        child: Stack(
          children: [
            Container(
              width: 200.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20.0,
                        offset: Offset(0,2)
                    )
                  ]
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  height: 130,
                  width: 190.0,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                      color: chair.backgorundColor
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Hero(
                      tag: chair.name,
                      child: Image(
                        image: AssetImage(
                            chair.imageUrl
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 200.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding :const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              chair.name,
                              style:const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  overflow: TextOverflow.ellipsis
                              ),
                            ),
                          ),
                          Container(
                            padding : const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              chair.color,
                              style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                  overflow: TextOverflow.ellipsis
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              chair.type,
                              style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                  overflow: TextOverflow.ellipsis
                              ),
                            ),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding : const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                "\$" + chair.price.toString(),
                                style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orangeAccent,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              chair.rating.toString(),
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.only(right: 5.0),
                              height: 30.0,
                              width: 30.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.black
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            onTap: (){
                              Navigator
                                  .of(context)
                                  .push(MaterialPageRoute(builder: (_)=> CartScreen()));
                            },
                          )
                        ],
                      ),
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
