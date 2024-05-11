import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_rolls/components/button.dart';
import 'package:sushi_rolls/models/food.dart';
import 'package:sushi_rolls/models/shop.dart';
import 'package:sushi_rolls/theme/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  void removeFromcart(Food food, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text(
            "My Cart",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.grey[300],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  final Food food = value.cart[index];
                  final String foodName = food.name;
                  final String foodPrice = food.price;
                  return Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(223, 169, 53, 57),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: ListTile(
                      title: Text(
                        foodName,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        foodPrice,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        onPressed: () => removeFromcart(food, context),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(text: "Pay Now", onTap: () {}),
            )
          ],
        ),
      ),
    );
  }
}
