import 'package:flutter/material.dart';
import 'package:furnitureui/Data/data.dart';
import 'package:furnitureui/models/chair.dart';
import 'package:furnitureui/screens/cart_screen.dart';
import 'package:furnitureui/screens/details_screens.dart';

class RecentlyAdded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        itemBuilder: (context, index){
          return _buildRecentlyAdded(index, context);
        },
        itemCount: recentlyAdded.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
      ),
    );
  }

  Widget _buildRecentlyAdded(int index, BuildContext context){

    Chair chair = recentlyAdded[index];

    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 15.0, 25.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 6.0,
                        offset: Offset(0, 1)
                    )
                  ]
              ),
              child: Row(
                children: [
                  Container(
                    width: 100.0,
                    height: 94,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0)
                        ),
                        color: chair.backgorundColor
                    ),
                    child: Image(
                      image: AssetImage(
                        chair.imageUrl,
                      ),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chair.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0
                            ),
                          ),
                          Text(
                            chair.color,
                            style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.grey
                            ),
                          ),
                          Text(
                            chair.type,
                            style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.grey
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              "\$ " + chair.price.toString(),
                              style: TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      onTap: (){
        Navigator
            .of(context)
            .push(MaterialPageRoute(builder: (_)=> DetailScreen(chair: chair)));
      }
    );
  }
}
