import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/const.dart';
import 'package:food_delivery_app/models/category_model.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:food_delivery_app/view/home/page_details_screen.dart';
import 'package:food_delivery_app/view/home/widgets/homescreen_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final List<String> locations = [
    "Kathmandu, Nepal",
    "Lahan, Siraha",
    "Jhapa Birtamode",
  ];

  final List<String> category = [
    "Burger",
    "Pizza",
    "Cup Cake",
  ];

   late List<FoodModel> food;

  @override
  void initState() {
    super.initState();
    food = foodProduct
        .where((element) => element.category == "Burger")
        .toList();
  }

  String? selectedLocation;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: headerPart(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          //home screen banner
          HomeScreenBanner(size: size),

          SizedBox(height: 20),

          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: Text(
              "Category",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),

          SizedBox(height: 20),

          //category button Scroller
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(myCategories.length, (index) {
                final catgry = myCategories[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });

                    food = foodProduct.where((element)=> element.category==category[currentIndex]).toList();
                  },
                  child: Padding(
                    padding: index == 0
                        ? EdgeInsets.only(left: 20, right: 20)
                        : EdgeInsets.only(right: 20),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      height: 45,
                      decoration: BoxDecoration(
                        color: currentIndex == index ? Colors.red : grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(catgry.image),
                          ),

                          SizedBox(width: 10),

                          Text(
                            catgry.name,
                            style: TextStyle(
                              fontSize: 15,
                              color: currentIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          SizedBox(height: 20),

          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Popular Now",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Spacer(),

                GestureDetector(
                  onTap: () {
                    // 1. Clear any existing SnackBar immediately
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();

                    // 2. Show the new SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("No data available"),
                        backgroundColor: Colors.black,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "View All",
                      style: TextStyle(
                        color: orange,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        WidgetSpan(child: SizedBox(width: 2)),
                        WidgetSpan(
                          child: Container(
                            alignment: Alignment.center,
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(food.length, (index) {
                final product = food[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PageDetailsScreen(product: product),
                      ),
                    );
                  },
                  child: Padding(
                    padding: index == 0
                        ? EdgeInsets.only(right: 20, left: 20)
                        : EdgeInsets.only(right: 20),
                    child: Stack(
                      children: [
                        Container(
                          height: size.height * 0.20,
                          width: size.width * 0.45,
                          color: Colors.white,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 60, bottom: 10),
                          height: size.height * 0.20,
                          width: size.width * 0.45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: grey,
                                blurRadius: 2,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 20,
                          left: 20,
                          child: Hero(
                            tag: product.imageCard,
                            child: Image.asset(
                              product.imageCard,
                              height: 100,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 110,
                          right: 20,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                product.name,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                product.specialItems,
                                style: TextStyle(color: Colors.black38),
                              ),

                              SizedBox(height: 20),

                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "\$",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: red,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "${product.price}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  AppBar headerPart() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      actions: [
        SizedBox(width: 20),
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
          child: Image.asset("assets/images/dash.png"),
        ),

        Spacer(),

        Icon(Icons.location_on, color: red),
        SizedBox(width: 5),
        DropdownButton<String>(
          underline: Container(height: 1, width: 1, color: Colors.transparent),
          dropdownColor: grey1,
          borderRadius: BorderRadius.circular(10),
          barrierDismissible: false,
          elevation: 0,
          value: selectedLocation,
          hint: Text("Select a location"),
          items: locations.map((String location) {
            return DropdownMenuItem<String>(
              value: location,
              child: Text(location),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              selectedLocation = newValue;
            });
          },
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
          child: Image.asset("assets/images/profile.png"),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
