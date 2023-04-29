// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructor, prefer_const_constructors, unused_label, dead_code

import 'package:electromate/models/product.dart';
import 'package:electromate/models/cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../Widgets/appBar.dart';
import '../../Widgets/drawer.dart';
import '../Menu/notificationpage.dart';
import '../chat/message_screen.dart';
import '../profile/profile.dart';
import 'productslistPage.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final user = FirebaseAuth.instance.currentUser!;
  int currentPage = 0;
  final screens = [
    MessageScreen(
      email: '',
      image: '',
      name: '',
      receiverId: '',
    ),
    Shop(),
    NotificationPage(),
    ProfileScreen(),
  ];
  //add product to cart methode
  void addProductToCart(Product product) {
    Provider.of<Cart>(context, listen: false).addItemToCart(product);

    //alert the user product succesfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('succesfully added'),
        content: Text('check your cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          context, Text('shop', style: TextStyle(color: Colors.black))),
      drawer: buildDrawer(context),
      body: Stack(
        children: [
          IndexedStack(
            index: currentPage,
            children: screens,
          ),
          Center(
            child: Consumer<Cart>(
                builder: (context, value, child) => Column(children: [
                      //search bar
                      Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              //search bar
                              Text(
                                'search',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                            ],
                          )),

                      //message under search bar
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Text(
                          'descover with us',
                        ),
                      ),

                      //text for ideas
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text(
                              'our products',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              'see all',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      //list of product for sale
                      Expanded(
                        child: ListView.builder(
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              //get product from products list
                              Product product = value.getProductList()[index];

                              return ProductsList(
                                  product: product,
                                  onTap: () => addProductToCart(product));
                            }),
                      ),

                      const Padding(
                        padding: EdgeInsets.only(top: 25, left: 25, right: 25),
                        child: Divider(
                          color: Colors.white,
                        ),
                      )
                    ])),
          )
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: currentPage == 2
                ? Icon(
                    Icons.chat,
                    color: Colors.black,
                  )
                : Icon(
                    Icons.chat,
                    color: Colors.grey.shade700,
                  ),
            label: 'chat',
          ),
          BottomNavigationBarItem(
            icon: currentPage == 3
                ? Icon(
                    Icons.shop,
                    color: Colors.black,
                  )
                : Icon(
                    Icons.shop_2_outlined,
                    color: Colors.grey.shade700,
                  ),
            label: 'shop',
          ),
          BottomNavigationBarItem(
            icon: currentPage == 4
                ? Icon(
                    Icons.notifications,
                    color: Colors.black,
                  )
                : Icon(
                    Icons.notifications_outlined,
                    color: Colors.grey.shade700,
                  ),
            label: 'notification',
          ),
          BottomNavigationBarItem(
            icon: currentPage == 5
                ? Icon(
                    Icons.person,
                    color: Colors.black,
                  )
                : Icon(
                    Icons.person_outline,
                    color: Colors.grey.shade700,
                  ),
            label: 'account',
          ),
        ],
      ),
    );
  }
}
