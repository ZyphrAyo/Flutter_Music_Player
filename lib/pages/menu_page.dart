import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_rolls/components/button.dart';
import 'package:sushi_rolls/components/food_title.dart';
import 'package:sushi_rolls/models/shop.dart';
import 'package:sushi_rolls/pages/food_detailes.dart';
import 'package:sushi_rolls/theme/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // food menu
  // List foodMenu = [
  //   Food(
  //       name: "Salmon Sushi",
  //       price: "210.00/-",
  //       imagePath: "lib/images/salmon.png",
  //       rating: "4.9"),
  //   Food(
  //       name: "Tuna Sushi",
  //       price: "410.00/-",
  //       imagePath: "lib/images/su.png",
  //       rating: "4.9"),
  //   Food(
  //       name: "Roe Sushi",
  //       price: "310.00/-",
  //       imagePath: "lib/images/roe.png",
  //       rating: "5"),
  // ];

  void navigateToFoodDetails(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailes(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          "Sushi Rolls",
          style: GoogleFonts.montserrat(
            textStyle:
                TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        actions: [
          // cart button
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // promo banner
          Container(
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(25)),
            margin: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    // promot text
                    Text(
                      "Get 32% Promo",
                      style: GoogleFonts.libreBaskerville(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // redeem button
                    MyButton(text: "Redeem", onTap: () {}),
                  ],
                ),

                // image
                Padding(
                  padding: EdgeInsets.only(
                      right: 5), // Adjust the right padding as needed
                  child: Image.asset('lib/images/plate.png', height: 125),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                hintText: "Search Here !!",
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),

          // menu list
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Food Menu",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // popular food
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTitle(
                food: foodMenu[index],
                onTap: () => navigateToFoodDetails(index),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
            padding: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "lib/images/suegg.png",
                      height: 55,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Salmon Egg Sushi",
                          style: GoogleFonts.libreBaskerville(fontSize: 18),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "\₹ 310.00/-",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
