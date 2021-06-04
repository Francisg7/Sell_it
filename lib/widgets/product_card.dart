import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sell_it/Screens/constants.dart';
import 'package:sell_it/Screens/product_page.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  final String productId;
  final Function onPressed;
  final String  imageUrl;
  final String imagethumb;
  final String title;
  final String price;
  final String username;
  String postTimeStamp = DateTime.now().toString();
  final int productLikeCount;
  final int productCommentCount;

  ProductCard({this.imagethumb,this.title, this.onPressed, this.imageUrl, this.price, this.productId, this.username, this.postTimeStamp, this.productCommentCount, this.productLikeCount});
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
        height: 400,
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
                      leading: CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage (
                            "$imagethumb",
                        ),
                      ),
                      title: Text("$username"),
                      subtitle: Text("$postTimeStamp"),
                    ),
                    Container(
                      height: 230,
                      width: 400,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          "$imageUrl",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.thumb_up, color: Colors.grey,),
                              SizedBox(width: 8.0,),
                              Text("$productLikeCount", style: Constants.regularIcon,),
                            ],
                          ),
                          SizedBox(width: 10.0,),
                          Row(
                            children: [
                              Icon(Icons.comment, color: Colors.grey,),
                              SizedBox(width: 8.0,),
                              Text("$productCommentCount",  style: Constants.regularIcon)
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

