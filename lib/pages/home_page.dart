// ignore_for_file: prefer_const_constructors, camel_case_types, unused_local_variable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, use_full_hex_values_for_flutter_colors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/components/drawer.dart';
import 'package:foodapp/pages/cartpage.dart';
import 'package:foodapp/pages/items_detail.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  bool buger = false, icecream = false, drink = false;
  List cartitems = [];

  List burgerItems = [
    {
      "name": "Non Veg Burger",
      "price": 10.00,
      "subtitle": "Spicy burger with nonveg meat",
      "image": "assets/burger.png"
    },
    {
      "name": "Black Bean Beef Burgers",
      "price": 20.00,
      "subtitle": "Black bean + Beef + cheese",
      "image": "assets/burger2.png"
    },
    {
      "name": "Burger Tacos",
      "price": 15.00,
      "subtitle": "veg burger + non veg tacos",
      "image": "assets/burger3.png"
    },
    {
      "name": "French Fries",
      "price": 10.00,
      "subtitle": "French Fries",
      "image": "assets/fries.png"
    },
    {
      "name": "Spicy Chips XL",
      "price": 40.00,
      "subtitle": "spicy chips with crispy texture\nextra large",
      "image": "assets/samosa.png"
    },
    {
      "name": "Bread Omlet",
      "price": 7.00,
      "subtitle": "Bread+omlet+peas+spicy chips",
      "image": "assets/roll.png"
    },
  ];

  List iceCreamItems = [
    {
      "name": "Yogurt Sorbet ",
      "image": "assets/icecream1.png",
      "price": 10.00,
      "subtitle": "Delicious Frozen yogurt sorbet "
    },
    {
      "name": "4 Flavoured Ice Cream",
      "image": "assets/icecream2.png",
      "price": 25.00,
      "subtitle": "Strawberry + Litchi + Mango"
    },
    {
      "name": "Pista Choco",
      "image": "assets/icecream3.png",
      "price": 15.00,
      "subtitle": "Pista + choco chip"
    },
    {
      "name": "Mango Vanilla",
      "image": "assets/icecream4.png",
      "price": 7.00,
      "subtitle": "Mango + Vanilla "
    },
    {
      "name": "Vanilla chip",
      "image": "assets/icecream5.png",
      "price": 10.00,
      "subtitle": "Vanilla + choco chip"
    },
  ];

  List drinkItems = [
    {
      "name": "Watermelon",
      "price": 4.00,
      "subtitle": "Watermelon + soda",
      "image": "assets/juice.png"
    },
    {
      "name": "Duff Beer ",
      "price": 20.00,
      "subtitle": "Watermelon + soda",
      "image": "assets/drink4.png"
    },
    {
      "name": "Fernet Branca(Liquor)",
      "price": 200.00,
      "subtitle": "Fernet branca liquor",
      "image": "assets/drink3.png"
    },
    {
      "name": "Jack Daniels (Whiskey)",
      "price": 120.00,
      "subtitle": "Jennessee Whiskey no.1",
      "image": "assets/drink2.png"
    },
    {
      "name": "Virgin Mojito",
      "price": 2.00,
      "subtitle": "Pudina + soda + Lemon ",
      "image": "assets/drink5.png"
    },
    {
      "name": "Gournate",
      "price": 2.00,
      "subtitle": "Gournate Large",
      "image": "assets/drink.png"
    },
  ];

  List mixitems = [
    {
      "name": "Yogurt Sorbet",
      "image": "assets/icecream1.png",
      "price": 20.00,
      "subtitle": "Delicious Frozen yogurt sorbet"
    },
    {
      "name": "Watermelon",
      "price": 20.00,
      "subtitle": "Watermelon + soda",
      "image": "assets/juice.png"
    },
    {
      "name": "Non Veg Burger",
      "price": 20.00,
      "subtitle": "Spicy burger with nonveg meat",
      "image": "assets/burger.png"
    },
    {
      "name": "Mango Vanilla",
      "image": "assets/icecream4.png",
      "price": 7.00,
      "subtitle": "Mango + Vanilla "
    },
    {
      "name": "Vanilla chip",
      "image": "assets/icecream5.png",
      "price": 10.00,
      "subtitle": "Vanilla + choco chip"
    },
    {
      "name": "Virgin Mojito",
      "price": 2.00,
      "subtitle": "Pudina + soda + Lemon ",
      "image": "assets/drink5.png"
    },
    {
      "name": "Gournate",
      "price": 2.00,
      "subtitle": "Gournate Large",
      "image": "assets/drink.png"
    },
    {
      "name": "Fernet Branca(Liquor)",
      "price": 200.00,
      "subtitle": "Fernet branca liquor",
      "image": "assets/drink3.png"
    },
    {
      "name": "Jack Daniels (Whiskey)",
      "price": 120.00,
      "subtitle": "Jennessee Whiskey no.1",
      "image": "assets/drink2.png"
    },
  ];

  void selectCategory(category) {
    setState(() {
      buger = category == 'burger';
      icecream = category == 'icecream';
      drink = category == 'drink';
    });
  }

  List getItemsForCategory() {
    if (buger) {
      return burgerItems;
    } else if (icecream) {
      return iceCreamItems;
    } else if (drink) {
      return drinkItems;
    } else {
      return mixitems;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    List items = getItemsForCategory();

    return Scaffold(
      drawer: opendrawer(),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 230,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                color: Colors.red,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xfffF6170B), Color(0xfffEE8F43)]
                ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          child: Icon(Icons.menu)),
                        GestureDetector(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      cartpage(itemcart: cartitems),
                                ),
                              );
                              setState(() {});
                            },
                            child: cartitems.isEmpty
                                ? CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.shopping_cart,
                                      color: Colors.black,
                                    ))
                                : Badge(
                                    alignment: Alignment.topLeft,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.black,
                                    label: Text(cartitems.length.toString()),
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.shopping_cart,
                                          color: Colors.black,
                                        ))))
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delicious and Fresh Food",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "We made Hygenic and Healthy Food",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => selectCategory('burger'),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: buger ? Colors.black : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              "assets/group2.png",
                              color: buger ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => selectCategory('icecream'),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: icecream ? Colors.black : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              "assets/group3.png",
                              color: icecream ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => selectCategory('drink'),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: drink ? Colors.black : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              "assets/group1.png",
                              color: drink ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 13),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 180,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => detail(
                                    index: index,
                                    cartitems: cartitems,
                                    items: items,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 60,
                                    child: Image.asset(
                                      items[index]["image"],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    items[index]["name"],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    items[index]["subtitle"],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "\$${items[index]["price"].toString()}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => detail(
                              index: index,
                              cartitems: cartitems,
                              items: items,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            Container(
                              height: 60,
                              child: Image.asset(
                                items[index]["image"],
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              items[index]["name"],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              items[index]["subtitle"],
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "\$${items[index]["price"].toString()}",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white
                ),
                  onPressed: () async {
                    FirebaseAuth.instance.signOut();
                    Navigator.pop(context);
                  },
                  child: const Text("Sign out")),
            )
          ],
        ),
      ),
    );
  }
}
