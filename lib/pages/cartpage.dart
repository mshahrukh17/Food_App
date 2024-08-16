// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, use_full_hex_values_for_flutter_colors, unused_local_variable

import 'package:flutter/material.dart';

class cartpage extends StatefulWidget {
  final List itemcart;
  const cartpage({super.key, 
  required this.itemcart});

  @override
  State<cartpage> createState() => _cartpageState();
}

class _cartpageState extends State<cartpage> {

  // Update quantity //
  void updatequantity(int index , int change){
    setState(() {
      int quantity = widget.itemcart[index]["quantity"] ?? 0;
      quantity += change;
      if (quantity < 0) {
        quantity = 0;
      }
      widget.itemcart[index]["quantity"] = quantity;
    });
  }

   double calculateTotalAmount(){
     double total = 0.0;
     for (var item in widget.itemcart) {
       double price = item["price"]?? 0.0;
       int quantity = item["quantity"]?? 0;
       total += price * quantity;
     }
     return total;
   }

  @override
  Widget build(BuildContext context) {
    double totalamount = calculateTotalAmount();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
         child: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Cart Items"),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
          foregroundColor: Colors.black,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [ Color(0xfffF6170B),Color(0xfffEE8F43),])
            ),
          ),
         )),
      body: widget.itemcart.isEmpty ? const Center(
        child: Text("Empty Cart")) : 
        ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
        itemCount: widget.itemcart.length,
        itemBuilder: (context,index){
          var item = widget.itemcart[index];
          double price = item["price"] ?? 0.0;
          int quantity = item["quantity"]?? 0;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width *1,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(14)
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       Image.asset("${item["image"]}",height: 50,),
                  SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${item["name"]}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          Text("${item["subtitle"]}",
                      style: TextStyle(
                        fontWeight: FontWeight.w400
                      ),
                      ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 5,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Price",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),
                        ),
                        Text("\$${item["price"]}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                elevation: 5
                              ),
                              onPressed: 
                              () => updatequantity(index, -1),
                               child: const Icon(Icons.remove)),
                            SizedBox(width: 5,),
                            Text(quantity.toString()),
                            SizedBox(width: 5),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                elevation: 5
                              ),
                              onPressed: 
                              () => updatequantity(index, 1),
                               child: const Icon(Icons.add))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
        bottomSheet: Container(
          height: 100,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total Amount",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
                ),
                Text("\$${totalamount.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                      ),
              ],
            ),
          ),
        )
    );
  }
}