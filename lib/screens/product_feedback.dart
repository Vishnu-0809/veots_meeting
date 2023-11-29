import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:Veots/screens/home_page.dart';
import 'package:Veots/screens/login.dart';
import 'package:Veots/widgets/send_accept.dart';
import '../widgets/Requests.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'final_forgot_password.dart';

class Product_Feedback extends StatefulWidget {
  Product_Feedback(
      {super.key,
      
      // required this.password,
   
      // required this.location_on
      });
  //  final bool location_on;
  // final String password;
 

  @override
  State<Product_Feedback> createState() => _Product_FeedbackState();
}

class _Product_FeedbackState extends State<Product_Feedback> {
  // var uuid = Uuid();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    bool someBooleanValue = true;


    List<String> Heading=["Scan to Verify Authenticity","Expiry check, alerts & Notification","Register the Products","Enjoy rewards on claiming the products","Activate Digital Warranty","Access to Purchase history"];
    List<String> Content=["Scan QR code of our partnered Brands to Verify  product authenticity even before  buying","Provides easy expiry check or alert during purchase and sends you notifications when the product expires, post purchase.","Claim and register purchased products to your name, to access your purchase history anytime , anywhere !!","You may get rewards upon successful registration of products","Say no to storing your warranty cards and paper bills. Activates warranty for the products registered. Save your bills on cloud to access it anytime.","Post purchase, you can access information about product details, expiration dates, and the specifics of your registered products."];
    return Scaffold(
      body:Column(

        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10,10, 10, 10),
              height: 20,
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 IconButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                            Icons.close,
                                            size: MediaQuery.of(context).size.width*0.08,
                                            color: Colors.black,
                                            ),
                                            ),
            ]),

          ),


          SizedBox(
              height:MediaQuery.of(context).size.height*0.05,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                      "Product Feedback",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium",
                                                              color: const Color(0xff002060),
                        // fontStyle: FontStyle.italic,
                        fontSize: MediaQuery.of(context).size.width * 0.058,
                      ),
                    ),
              ],
            ),
          ),
           SizedBox(
              height:MediaQuery.of(context).size.height*0.05,
          ),
          Container(
            // padding: EdgeInsets.only(top: 500),
            width: MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height*0.12,
            color:  Color.fromARGB(255, 201, 196, 196),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Container(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.09,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              margin: EdgeInsets.all(8),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                                child: CachedNetworkImage(
        imageUrl: "https://hips.hearstapps.com/hmg-prod/images/mango-fruit-sugar-1530136260.jpg",
      progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
        
        errorWidget: (context, url, error) => Icon(Icons.error),
     ),
                                              ),
                                            ),
                                            
                                          ],
                                        )),
                                         Container(
                                          // width: 200,
                                          // height: MediaQuery.of(context)
                                          //         .size
                                          //         .height /
                                          //     4,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            // crossAxisAlignment:
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: MediaQuery.of(context).size.width*0.03,),
                                              SizedBox(
                                                // fit: BoxFit.fitWidth,
                                                width: MediaQuery.of(context).size.width*0.5,
                                                child: Text(
                                   "asd",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins Medium",
                                      color:const Color(0xff002060),
                                      // fontStyle: FontStyle.italic,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.018,
                                    ),
                                  ),
                                              ),
                                              // SizedBox(height: 8),
                                              FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Text(
                                  "ss",
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins Medium",
                                      color: Color.fromARGB(255, 123, 119, 119),
                                      //  backgroundColor:Color(0x888888),
                                      // fontStyle: FontStyle.italic,
                                     fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.018,
                                    ),
                                  ),
                                              ),]))
              ],

            ),
          ),
          SizedBox(
              height:MediaQuery.of(context).size.height*0.02,
          ),
           Container(
            // padding: EdgeInsets.only(top: 500),
            width: MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height*0.0005,
            color:  Color.fromARGB(255, 201, 196, 196),
          ),
          SizedBox(
              height:MediaQuery.of(context).size.height*0.02,
          ),
           Container(
            // color: Colors.grey,
            width: MediaQuery.of(context).size.width*0.8,
              child: TextField(
                maxLines: 25, //or null 
                decoration: InputDecoration.collapsed(hintText: "Please provide comprehensive feedback, including as many details as possible.. "),
              ),
            
          )

        ],
      )




    );
  }

  Widget buildFittedWidthText(String text) => Container(
        // color: Colors.blue,
        // width: MediaQuery.of(context).size.width / 2.5,
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle( color: Colors.white,
            fontFamily: "Poppins Medium"),
          ),
        ),
      );
  Widget buildFittedWidthText2(String text) => Container(
        // color: Colors.blue,
        width: MediaQuery.of(context).size.width / 8,
        child: FittedBox(
          child: Text(text),
        ),
      );
  Widget buildFittedWidthText3(String text) => Container(
        // color: Colors.blue,
        width: MediaQuery.of(context).size.width / 8,
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 0.1}) {
    final width = MediaQuery.of(context).size.width / 2;
    double val = (width / 2000) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
