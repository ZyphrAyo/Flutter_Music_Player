import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_rolls/components/button.dart';
import 'package:sushi_rolls/models/food.dart';
import 'package:sushi_rolls/models/shop.dart';
import 'package:sushi_rolls/theme/colors.dart';

class FoodDetailes extends StatefulWidget {
  final Food food;

  const FoodDetailes({Key? key, required this.food}) : super(key: key);

  @override
  State<FoodDetailes> createState() => _FoodDetailesState();
}

class _FoodDetailesState extends State<FoodDetailes> {
  int quantityCount = 0;

  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {
    // add domething to cart if there is something in cart
    if (quantityCount > 0) {
      // get access to shop
      final shop = context.read<Shop>();
      // add to cart
      shop.addToCart(widget.food, quantityCount);

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Material(
          type: MaterialType.transparency,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(2),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Successfully Added to Cart...",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  // Okay Button
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.done),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),
                  SizedBox(width: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.food.name,
                    style: GoogleFonts.libreBaskerville(fontSize: 28),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Description",
                    style: GoogleFonts.montserrat(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Indulge in the exquisite flavors of our signature Salmon Sushi. This delightful Japanese dish features premium slices of fresh salmon delicately placed on a bed of seasoned rice, creating a perfect harmony of taste and texture. The velvety richness of the salmon, coupled with the slightly tangy and seasoned rice, makes each bite a culinary delight.",
                    style: TextStyle(
                        color: Colors.grey[600], fontSize: 14, height: 1.9),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: primaryColor,
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\₹" + widget.food.price,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: decrementQuantity,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: incrementQuantity,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                MyButton(text: "Add To Cart", onTap: addToCart)
              ],
            ),
          )
        ],
      ),
    );
  }
}
