import 'package:flutter/material.dart';
import 'package:groceryapp/Component/grocery_item_tile.dart';
import 'package:groceryapp/model/cart_model.dart';

import 'package:groceryapp/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Icon(
            Icons.location_on,
            color: Colors.grey[700],
          ),
        ),
        title: Text(
          'Bikfaya, Lebanon',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
        centerTitle: false,
      ),


      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const CartPage();
            },
          ),
        ),
        child: const Icon(Icons.shopping_bag),
      ),
      body:
      // ListView(
      //   shrinkWrap: false,
      //   children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),

              // good morning bro
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text('Good morning,'),
              ),

              const SizedBox(height: 4),

              // Let's order fresh items for you
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Let's order fresh items for you",
                ),
              ),

              const SizedBox(height: 24),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Divider(),
              ),

              const SizedBox(height: 24),

              // categories -> horizontal listview
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Fresh Items",
                ),
              ),

              // recent orders -> show last 3
              Expanded(
                child: Consumer<CartModel>(
                  builder: (context, value, child) {
                    return GridView.builder(
                      padding: const EdgeInsets.all(12),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: value.shopItems.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.2,
                      ),
                      itemBuilder: (context, index) {
                        return GroceryItemTile(
                          itemName: value.shopItems[index][0],
                          itemPrice: value.shopItems[index][1],
                          imagePath: value.shopItems[index][2],
                          color: value.shopItems[index][3],
                          onPressed: () =>
                              Provider.of<CartModel>(context, listen: false)
                                  .addItemToCart(index),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),


    );
  }
}