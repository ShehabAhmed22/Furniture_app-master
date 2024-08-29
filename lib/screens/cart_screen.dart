import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnitureui/Data/custom_icons.dart';
import 'package:furnitureui/Data/data.dart';
import 'package:furnitureui/models/chair.dart';

class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    int product_price = 0;

    currentUser.cart.forEach((product) {
      product_price += product.quantity * product.chair.price;
    });

    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0)
          )
        ),
        elevation: 3.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Your Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        centerTitle: true,
        actions: const  [
          Icon(
            CustomIcons.short_text,
            size: 30.0,
            color: Colors.black,
          )
        ],
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index){
          return index < currentUser.cart.length
            ? _buildCartItems(index)
            : SizedBox(height: 300.0,);
        },
        itemCount: currentUser.cart.length + 1,
      ),
      bottomSheet: Container(
        height: 250.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, -1),
              blurRadius: 5.0
            )
          ],
          color: Colors.white
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              _bottomSheetElement("Product price", "\$ " + product_price.toString(), false),
              _bottomSheetElement("Delivery price : ",  "\$ 50" , false),
              _bottomSheetElement("Total price : ", "\$ " + (product_price + 50).toString(), true),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: const Text(
                  "Check out",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 3.0
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20.0)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomSheetElement(String elementName, String elementValue, bool isBold){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            elementName,
            style: TextStyle(
                fontSize: 22.0,
                letterSpacing: 2.5
            ),
          ),
          Text(
            elementValue,
            style: TextStyle(
                fontSize: 22.0,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCartItems(int index){

    Chair chair = currentUser.cart[index].chair;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 10.0
      ),
      child: Container(
        height: 94.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  offset: Offset(0,2)
              )
            ]
        ),
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: chair.backgorundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0)
                ),
              ),
              width: 120.0,
              child: Image(
                image: AssetImage(
                  chair.imageUrl
                ),
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chair.name,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  chair.color,
                  style: const TextStyle(
                      fontSize: 13.0,
                      color: Colors.black54
                  ),
                ),
                Text(
                  chair.type,
                  style: const TextStyle(
                    fontSize: 13.0,
                    color: Colors.black54
                  ),
                ),
                Text(
                  "\$ ${chair.price}",
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  )
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                            currentUser.cart[index].quantity.toString()
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.black
                        ),
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
