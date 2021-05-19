import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sell_it/Screens/constants.dart';
import 'package:sell_it/Screens/product_page.dart';

class ProductCard extends StatelessWidget {
  final String productId;
  final Function onPressed;
  final String  imageUrl;
  final String title;
  final String price;

  ProductCard({this.title, this.onPressed, this.imageUrl, this.price, this.productId});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ProductPage(productId: productId,),
        ));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0)
        ),
        height: 350,
        margin: EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 24.0
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(),
                      title: Text("Francis Williams"),
                      subtitle: Text("Wed 19 May 2021"),
                    ),
                    Container(
                      height:200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          "$imageUrl",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.thumb_up, color: Colors.grey,),
                              SizedBox(width: 8.0,),
                              Text("Like", style: Constants.regularIcon,),
                            ],
                          ),
                          SizedBox(width: 10.0,),
                          Row(
                            children: [
                              Icon(Icons.comment, color: Colors.grey,),
                              SizedBox(width: 8.0,),
                              Text("Comment",  style: Constants.regularIcon)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: Constants.regularHeading,
                        ),
                        Text(
                         price,
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

