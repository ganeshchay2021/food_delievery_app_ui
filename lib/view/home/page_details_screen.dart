import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/const.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:readmore/readmore.dart';

class PageDetailsScreen extends StatefulWidget {
  final FoodModel product;
  const PageDetailsScreen({super.key, required this.product});

  @override
  State<PageDetailsScreen> createState() => _PageDetailsScreenState();
}

class _PageDetailsScreenState extends State<PageDetailsScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: Image.asset(
                "assets/images/food pattern.png",
                repeat: ImageRepeat.repeatY,
                color: imageBackground2,
              ),
            ),

            Positioned(
              bottom: 0,
              child: Container(
                height: size.height * 0.65,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(right: 20, left: 20, bottom: 75),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    headerPart(context),

                    Hero(
                      tag: widget.product.imageCard,
                      child: Image.asset(
                        widget.product.imageDetail,
                        height: size.height * 0.45,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                        color: red,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) {
                                  quantity--;
                                }
                              });
                            },
                            icon: Icon(Icons.remove, color: Colors.white),
                          ),
                          Text(
                            quantity.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (quantity < 10) {
                                  quantity++;
                                }
                              });
                            },
                            icon: Icon(Icons.add, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.name,
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                widget.product.specialItems,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black26,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),

                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "\$",
                                style: TextStyle(
                                  color: orange,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: widget.product.price.toString(),
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: orange),
                            SizedBox(width: 8),
                            Text(
                              widget.product.rate.toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset("assets/images/fire.png", height: 20),
                            SizedBox(width: 8),
                            Text(
                              "${(widget.product.rate * 88).toInt()}K",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset("assets/images/time.png", height: 20),
                            SizedBox(width: 8),
                            Text(
                              "10 - 15 mins",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    ReadMoreText(
                      widget.product.description,
                      trimMode: TrimMode.Line,
                      style: TextStyle(fontSize: 18),
                      trimLines: 2,
                      colorClickableText: red,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: red,
                      ),
                      lessStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 55),
        ),
        onPressed: () {},
        child: Text(
          "Add to cart",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Row headerPart(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            padding: EdgeInsets.all(10),
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: grey1,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: grey,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(1, 2),
                ),
              ],
            ),
            child: Icon(Icons.arrow_back_ios_new),
          ),
        ),

        Spacer(),

        Container(
          padding: EdgeInsets.all(10),
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: grey1,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: grey,
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 2),
              ),
            ],
          ),
          child: Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}
