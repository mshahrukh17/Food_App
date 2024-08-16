// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors, avoid_unnecessary_containers, sized_box_for_whitespace, unused_local_variable, body_might_complete_normally_nullable, unnecessary_null_comparison, non_constant_identifier_names, avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/auth/signup.dart';
import 'package:foodapp/pages/home_page.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  bool showpassword = true;
  final formkey = GlobalKey<FormState>();

  loginuser() async {
    try {
      final Credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text
        ); 
        emailcontroller.clear();
        passwordcontroller.clear();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homepage(),));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xfffF6170B), Color(0xfffEE8F43)]),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50))),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 460),
            child: Center(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> homepage()));
                  },
                  child: Image.asset(
                                "assets/logo.png",
                                height: 90,
                              ),
                )),
          ),
          Center(
              child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 340,
              width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 20, left: 20),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Text(
                        "Login Account",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                           RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',);
                           if (value!.isEmpty || value==null) {
                             return "Please enter your email";
                           } else if(!emailRegex.hasMatch(value)){
                             return "Please Enter valid email";
                           }
                           else{
                            return null;
                           }
                        },
                        controller: emailcontroller,
                        decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(
                              Icons.mail,
                            ),
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 3),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 3),
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value==null) {
                            return "Required password";
                          } else if(value.length < 6){
                            return "Atleast 6 characters";
                          }
                          else{
                            return null;
                          }
                        },
                        controller: passwordcontroller,
                        obscureText: showpassword,
                        decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showpassword = !showpassword;
                                });
                              },
                              icon: Icon(showpassword
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.remove_red_eye_rounded),
                            ),
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 3),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 3),
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Container(
                          height: 50,
                          width: 250,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white),
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  loginuser();
                                  return print("Wellcome");
                                } else {
                                  return print("Error");
                                }
                              },
                              child: const Text("Login"))),
                    ],
                  ),
                ),
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 430),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => signup(),
                    ));
              },
              child: Center(
                  child: Text(
                "Dont Have An Account? SignUp",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
