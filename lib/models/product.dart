import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/models/item.dart';

class MyProduct extends StatelessWidget {
  final Item item;
  final void Function()? onTap;
  const MyProduct({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: item.color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.asset(
              item.imagePath,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(item.name),
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: item.btnColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "\$${item.price}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
