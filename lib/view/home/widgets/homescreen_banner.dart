import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/const.dart';

class HomeScreenBanner extends StatelessWidget {
  const HomeScreenBanner({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: size.height * 0.22,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: red.withOpacity(0.4),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "The Fastest In\nDelivery",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ),
                      children: [
                        TextSpan(
                          text: " Food",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 9,
                      ),
                    ),
                    onPressed: () {},
                    child: Text("Order Now"),
                  ),
                ],
              ),
            ),
              
            Image.asset(
              "assets/images/courier.png",
              width: size.width * 0.4,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
