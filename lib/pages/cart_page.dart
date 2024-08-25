import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/models/item.dart';
import 'package:grocery_app_flutter/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  final isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(builder: (context, value, index) {
      final cart = context.read<Shop>().cart;
      void removeFromCart(Item item) {
        final shop = context.read<Shop>();
        shop.removeFromCart(item);
      }

      String calcAmt = context.read<Shop>().getCartValue();

      return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          title: const Text("My Cart"),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.all(25),
          child: (cart.isEmpty)
              ? const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("My Cart is empty..."),
                  ],
                )
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade200,
                      ),
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(top: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            cart[index].imagePath,
                            height: 50,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cart[index].name,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                                Text(
                                  "\$${cart[index].price}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: Icon(
                              Icons.close_rounded,
                              color: Colors.grey.shade700,
                            ),
                            onPressed: () => removeFromCart(cart[index]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: (cart.isNotEmpty)
            ? SizedBox(
                height: 100,
                width: 350,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green.shade600,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Total Price",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade200,
                              ),
                            ),
                            Text(
                              calcAmt,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(right: 25),
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                            )),
                        child: const Row(children: [
                          Text(
                            "Pay Now",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                          )
                        ]),
                      )
                    ],
                  ),
                ),
              )
            : null,
      );
    });
  }
}
