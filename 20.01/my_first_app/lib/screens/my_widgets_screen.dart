import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyWidgetsScreen extends StatelessWidget {
  const MyWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text("Home screen appBar"),
          toolbarHeight: 30,
        ),
        body: ElevatedButton(
          onPressed: () {
            log("On tap");
          },
          child: Icon(Icons.edit),
        )
        //  InkWell(
        //   onTap: () {
        //     log("On tap");
        //   },
        //   child: Container(
        //     margin: EdgeInsets.all(50),
        //     padding: EdgeInsets.all(20),
        //     decoration: BoxDecoration(
        //       color: Colors.yellow,
        //       border: Border.all(color: Colors.red, width: 5),
        //       borderRadius: BorderRadius.all(
        //         Radius.circular(12),
        //       ),
        //     ),
        //     child: Text("HOME SCREEN"),
        //   ),
        // ),

        //  Row(
        //   children: [
        // Container(
        //   // margin: EdgeInsets.symmetric(horizontal: 50),
        //   padding: EdgeInsets.all(20),
        //   decoration: BoxDecoration(
        //     color: Colors.yellow,
        //     border: Border.all(color: Colors.red, width: 5),
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(12),
        //     ),
        //   ),
        //   child: Text("HOME SCREEN"),
        // ),
        //     Gap(20),
        //     Container(
        //       // margin: EdgeInsets.symmetric(horizontal: 50),
        //       padding: EdgeInsets.all(20),
        //       decoration: BoxDecoration(
        //         color: Colors.yellow,
        //         border: Border.all(color: Colors.red, width: 5),
        //         borderRadius: BorderRadius.all(
        //           Radius.circular(12),
        //         ),
        //       ),
        //       child: Text("HOME SCREEN"),
        //     ),
        //   ],
        // ),
        //  Column(
        //   spacing: 20,
        //   children: [
        // Container(
        //   margin: EdgeInsets.symmetric(horizontal: 50),
        //   padding: EdgeInsets.all(20),
        //   decoration: BoxDecoration(
        //     color: Colors.yellow,
        //     border: Border.all(color: Colors.red, width: 5),
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(12),
        //     ),
        //   ),
        //   child: Text("HOME SCREEN"),
        // ),
        //     // SizedBox(
        //     //   height: 20,
        //     // ),
        //     // Gap(20),
        //     Container(
        //       margin: EdgeInsets.symmetric(horizontal: 50),
        //       padding: EdgeInsets.all(20),
        //       decoration: BoxDecoration(
        //         color: Colors.yellow,
        //         border: Border.all(color: Colors.red, width: 5),
        //         borderRadius: BorderRadius.all(
        //           Radius.circular(12),
        //         ),
        //       ),
        //       child: Text("HOME SCREEN"),
        //     ),
        //     // Gap(20),
        //     Container(
        //       margin: EdgeInsets.symmetric(horizontal: 50),
        //       padding: EdgeInsets.all(20),
        //       decoration: BoxDecoration(
        //         color: Colors.yellow,
        //         border: Border.all(color: Colors.red, width: 5),
        //         borderRadius: BorderRadius.all(
        //           Radius.circular(12),
        //         ),
        //       ),
        //       child: Text("HOME SCREEN"),
        //     ),
        //   ],
        // ),
        );
  }
}
