// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:gap/gap.dart';


import 'package:practice/feature/home/cart_screen.dart';
import 'package:practice/feature/home/home_screen.dart';
import 'package:practice/feature/products/widgets/ingredients_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.ingredients,
    required this.rating,
  });

  final String name;
  final String image;
  final String price;
  final String description;
  final List<dynamic> ingredients;
  final String rating;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool imageExists = widget.image.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              icon: Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: imageExists
                      ? Image.network(widget.image)
                      : Image.asset('assets/images/cook.png'),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  width: size.width - 40,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 7, right: 7, top: 12, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              fontFamily: 'Petrona'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Gap(10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color.fromRGBO(255, 223, 161, 1),
                                    ),
                                    Text(
                                      '${widget.rating}',
                                    ),
                                  ],
                                ),
                                Gap(5),
                                Text(
                                  widget.price,
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (itemCount > 1) itemCount--;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Icon(Icons.remove),
                                  ),
                                ),
                                Gap(5),
                                Text(
                                  '$itemCount',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                Gap(5),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      itemCount++;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gap(30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(206, 206, 206, 1),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                width: size.width * 0.8,
                                height: 32,
                                child: Center(
                                  child: Text(
                                    'Add To Cart',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(20),
                Text(
                  'Ingredients',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Gap(10),
                Container(
                  height: 150,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.ingredients.length,
                      itemBuilder: (context, index) {
                        final ingri = widget.ingredients[index];

                        final percent = ingri['percentage'];
                        final gram = ingri['grams'];

                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: IngredientsWidget(
                              percentage: percent.toString(),
                              grams: gram.toString(),
                              ingredient: ingri['name'],
                              color: Color.fromRGBO(255, 194, 194, 1)),
                        );
                      },
                    ),
                  ),
                ),
                Gap(20),
                Text(
                  'DESCRIPTION',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Gap(8),
                Text(
                  widget.description,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                Gap(10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
