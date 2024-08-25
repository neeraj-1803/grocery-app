import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app_flutter/models/product.dart';
import 'package:grocery_app_flutter/models/shop.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int hr = DateTime.now().hour;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenWidth = (size.width);
    final shop = context.read<Shop>();
    final product = shop.product;

    void onClickProduct(int index) {
      final shop = context.read<Shop>();
      final product = shop.product[index];
      shop.addToCart(product);
    }

    return Consumer<Shop>(
      builder: (context, value, index) {
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 70),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
                    child: Text(
                      hr < 12
                          ? "Good Morning,"
                          : hr < 5
                              ? "Good afternoon,"
                              : "Good evening,",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      'We deliver groceries at your doorstep',
                      style: GoogleFonts.monomaniacOne(
                        fontSize: 40,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                  )
                ],
              ),
              //line
              Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(color: Colors.grey.shade400),
                child: const SizedBox(
                  height: 2,
                  width: 370,
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Fresh items',
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              //product list
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: product.length,
                  itemBuilder: (context, index) {
                    return MyProduct(
                      item: product[index],
                      onTap: () => onClickProduct(index),
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndFloat,
          floatingActionButton: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(35),
              ),
              child: const Icon(
                Icons.shopping_bag_rounded,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
