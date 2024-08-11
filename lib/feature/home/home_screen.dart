// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:practice/data/view_models/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';
import 'package:practice/widgets/nav_bar.dart';
import 'package:practice/feature/home/cart_screen.dart';
import 'package:practice/feature/home/widgets/cook_widget.dart';
import 'package:practice/feature/home/widgets/product_tile.dart';
import 'package:practice/feature/products/product_screen.dart';
import 'package:practice/widgets/custom_raised_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        toolbarHeight: 60,
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            ),
            child: const Icon(Icons.shopping_cart_outlined),
          ),
          const Gap(4),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Consumer<HomeViewModel>(
            builder: (context, homeViewModel, child) {
              if (homeViewModel.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (homeViewModel.products.isEmpty) {
                return const Center(child: Text('No products available'));
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    color: Colors.black,
                    height: 10,
                    thickness: 0.5,
                    indent: 0.2,
                    endIndent: 0.2,
                  ),
                  const Gap(10),
                  const CookWidget(),
                  const Gap(16),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomRaisedButton(isButton: false, label: 'Overview'),
                        Gap(10),
                        CustomRaisedButton(
                            isButton: false, label: 'Best selling'),
                        Gap(10),
                        CustomRaisedButton(
                            isButton: false, label: 'Offer of the day'),
                        Gap(10),
                        CustomRaisedButton(isButton: false, label: 'Cart'),
                        Gap(10),
                        CustomRaisedButton(isButton: false, label: 'Overview'),
                        Gap(10),
                        CustomRaisedButton(
                            isButton: false, label: 'Best selling'),
                        Gap(10),
                        CustomRaisedButton(
                            isButton: false, label: 'Offer of the day'),
                        Gap(10),
                      ],
                    ),
                  ),
                  const Gap(34),
                  const Text('Today\'s Special'),
                  const Gap(18),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const Gap(10),
                    shrinkWrap: true,
                    itemCount: homeViewModel.products.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          final List<dynamic> ingredients =
                              homeViewModel.products[index]['ingredients'];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductScreen(
                                name:
                                    '${homeViewModel.products[index]['name']}',
                                rating: homeViewModel.products[index]['rating'],
                                image: homeViewModel.products[index]['image'],
                                price:
                                    '${homeViewModel.products[index]['price']}',
                                description:
                                    '${homeViewModel.products[index]['description']}',
                                ingredients: ingredients,
                              ),
                            ),
                          );
                        },
                        child: ProductTile(
                          title: '${homeViewModel.products[index]['name']}',
                          subtitle:
                              '${homeViewModel.products[index]['description']}',
                          price: '${homeViewModel.products[index]['price']}',
                          image: homeViewModel.products[index]['image'],
                        ),
                      );
                    },
                  ),
                  const Gap(20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
