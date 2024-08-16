// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_typing_uninitialized_variables, must_be_immutable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unused_local_variable, prefer_const_constructors_in_immutables, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:foodapp/pages/cartpage.dart';

class detail extends StatefulWidget {
  final List items;
  final int index;
  final List cartitems;

  detail({super.key, 
  required this.items, 
  required this.index, 
  required this.cartitems
  });

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  bool isInCart = false;

  @override
  void initState() {
    super.initState();
    isInCart = widget.cartitems.contains(widget.items[widget.index]);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width *1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50) 
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xfffF6170B), Color(0xfffEE8F43)]
                    )
                ),
                child: Column(
                  children: [
                    Padding(
                padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          child: Center(child: Icon(Icons.arrow_back_ios)))),
                    GestureDetector(
                        onTap: () async{
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => cartpage(
                                  itemcart: widget.cartitems,
                                ),
                              ));
                              setState(() {
                                
                              });
                        },
                        child: widget.cartitems.isEmpty
                            ? CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.shopping_cart, color: Colors.black,))
                            : Badge(
                                alignment: Alignment.topLeft,
                                textColor: Colors.white,
                                backgroundColor: Colors.black,
                                label: Text(widget.cartitems.length.toString()),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.shopping_cart, color: Colors.black,))))
                  ],
                ),
              ),
              Center(
                child: Image.asset(
                  widget.items[widget.index]["image"],
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
              ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.items[widget.index]["name"],
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.items[widget.index]["subtitle"],
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "These all combinations make Chill  \nhearted and this is best in Summer \nseason and this is our special",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Total Price",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "\$${widget.items[widget.index]["price"].toString()}",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Center(
                      child: Container(
                        height: 50,
                        width: 300,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  isInCart ? Colors.red : Colors.black,
                              foregroundColor: Colors.white,
                              elevation: 5,
                            ),
                            onPressed: () {
                              setState(() {
                                if (isInCart) {
                                  widget.cartitems.remove(widget.items[widget.index]);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: const Text("Item Remove from Cart"),
                                  ));
                                } else {
                                  widget.cartitems.add(widget.items[widget.index]);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              const Text("Item Added in Cart")));
                                }
                                isInCart = !isInCart;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(isInCart
                                    ? "Remove from Cart"
                                    : "Add to Cart"),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  isInCart ? Icons.delete : Icons.shopping_cart,
                                  color: Colors.white,
                                )
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
