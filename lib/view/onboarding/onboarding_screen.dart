import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/const.dart';
import 'package:food_delivery_app/view/botton_navbar.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                color: imageBackground,
                child: Image.asset(
                  "assets/images/food pattern.png",
                  color: imageBackground2,
                  repeat: ImageRepeat.repeatY,
                ),
              ),
              Positioned(
                top: -30,
                left: 20,
                right: 20,
                child: Image.asset("assets/images/chef.png"),
              ),
              Positioned(
                top: 140,
                right: 20,
                child: Image.asset("assets/images/leaf.png", width: 80),
              ),
              Positioned(
                top: -30,
                left: 20,
                right: 20,
                child: Image.asset("assets/images/chef.png"),
              ),
              Positioned(
                top: 260,
                left: 5,
                child: Image.asset("assets/images/ginger.png", width: 65),
              ),
              Positioned(
                top: 370,
                right: 15,
                child: Image.asset("assets/images/chili.png", width: 80),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: ClipPath(
                  clipper: CustomClip(),
                  child: Container(
                    height: size.height * 0.45,
                    width: size.width,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.w700,
                              ),
                              children: [
                                TextSpan(text: "The Fastest in\nDelivery "),
                                TextSpan(
                                  text: "Food",
                                  style: TextStyle(color: red),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Our job is to filling your tummy with\ndelicious food and fast delivery",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(3, (index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 6),
                                child: Container(
                                  height: 10,
                                  width: index == 0 ? 25 : 10,
                                  decoration: BoxDecoration(
                                    color: index == 0 ? orange : Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              );
                            }),
                          ),
                          SizedBox(height: 20),
                          MaterialButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BottomNavbar(),
                                ),
                                (route) => false,
                              );
                            },
                            color: red,
                            minWidth: 250,
                            height: 60,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 30);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 30);
    path.quadraticBezierTo(size.width / 2, -30, 0, 30);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
