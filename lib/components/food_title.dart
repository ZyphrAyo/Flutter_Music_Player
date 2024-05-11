import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_rolls/models/food.dart';

class FoodTitle extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTitle({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(left: 15),
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset(
                food.imagePath,
                height: 140,
              ),
            ),
            Text(
              food.name,
              style: GoogleFonts.libreBaskerville(fontSize: 20),
            ),
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\₹' + food.price,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey[700]),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      Text(
                        food.rating,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
