import 'package:flutter/material.dart';
import 'package:interntask/discover/discover_screen.dart';
import 'package:interntask/home/home_screen.dart';
import 'package:interntask/login/login.dart';
import 'package:interntask/network/network_screen.dart';
import 'package:interntask/post/post_screen.dart';
import 'package:interntask/raise/raise_screen.dart';
import 'package:interntask/signup/signup.dart';
import 'package:interntask/src/constants/navitems.dart';

class CustomButtomAppbar extends StatefulWidget {
  const CustomButtomAppbar({super.key});

  @override
  State<CustomButtomAppbar> createState() => _CustomButtomAppbarState();
}

class _CustomButtomAppbarState extends State<CustomButtomAppbar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
   
    HomeScreen(),
    NetworkScreen(),
     
    PostScreen(),
    DiscoverScreen(),
    SignupScreen(),
  ];
  void onTapTabbed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 80,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(navitemsList.length,
                    (index) => GestureDetector(child: Column( children: [
                        GestureDetector(
                      child: Column(
                        children: [
                          Image.asset(
                          
                           navitemsList[index].assetUrl,
                           
                            height: 20,
                          ),
                          Text(navitemsList[index].name)
                        ],
                      ),
                      onTap:(){
                        onTapTabbed(index);
                      },
                    ),
                    ]

                    ))

                    

                    // GestureDetector(
                    //   child: Column(
                    //     children: [
                    //       Image.asset(
                    //         "assets/images/network.png",
                    //         height: 20,
                    //       ),
                    //       Text("Network")
                    //     ],
                    //   ),
                    //   // onTap: onTapTabbed,
                    //    onTap:(){
                    //     onTapTabbed(_currentIndex);
                    //   },
                    // ),

                    // // CustomBottomAppBar(),
                    // Column(
                    //   children: [
                    //     Image.asset(
                    //       "assets/images/discover.png",
                    //       height: 20,
                    //     ),
                    //     Text("Discover")
                    //   ],
                    // ),
                    // GestureDetector(
                    //   child: Column(
                    //     children: [
                    //       Image.asset(
                    //         "assets/images/raise.png",
                    //         height: 20,
                    //       ),
                    //       Text("Raise")
                    //     ],
                    //   ),
                    //    onTap:(){
                    //     onTapTabbed(_currentIndex);
                    //   },
                    // ),
                    // ],
                    ),
              ),
            ),
          ),
        ));
  }
}
