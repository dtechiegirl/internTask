import 'package:flutter/material.dart';
import 'package:interntask/widgets/smaller_text_widget.dart';
import 'package:interntask/discover/discover_screen_profiles.dart';


import 'package:interntask/src/constants/colors.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20),
          child: CircleAvatar(
            child: Image.asset("assets/images/profileimg.png"),
          ),
        ),
        title: Text(
          "Title",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Discover",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              "Find everything you need to make your dreams come true",
              style: TextStyle(fontSize: 14, color: AppColors.lightGrey),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: Color.fromARGB(87, 221, 226, 228),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black12,
                    style: BorderStyle.solid
                  )
                  ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/search.png",
                      height: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    smallerTextWidget(text: "I'm looking for..."),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorWeight: 1,
                        indicatorColor: Colors.black,
                        tabs: [
                          Tab(
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/Icon.png",
                                  height: 30,
                                ),
                                const Text(
                                  "Enterprenuers",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 9),
                                )
                              ],
                            ),
                          ),
                          Tab(
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/Icon.png",
                                  height: 30,
                                ),
                                const Text(
                                  "Influencers",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 9),
                                )
                              ],
                            ),
                          ),
                          Tab(
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/Icon.png", 
                                  height: 30,
                                ),
                                const Text(
                                  "Investors",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 9),
                                )
                              ],
                            ),
                          ),
                          Tab(
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/Icon.png",
                                  height: 30,
                                ),
                                const Text(
                                  "Businesses",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 9),
                                )
                              ],
                            ),
                          ),
                        ]),
                    SizedBox(
                      height: 500,
                      child: TabBarView(
                        children: [
                          Text(""),
                          Text(""),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                DiscoverScreenProfilePlain(
                                  image: Image.asset(
                                    "assets/images/photo2.png",
                                    height: 40,
                                  ),
                                  fullname: 'Esher Marvin',
                                  title: 'Venture Capitalist (Venture Africa)',
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                DiscoverScreenProfile(
                                  image: Image.asset(
                                    "assets/images/Photo.png",
                                    height: 40,
                                  ),
                                  fullname: 'Brooklyn Simmons',
                                  title: 'Venture Capitalist (Venture Africa)',
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                DiscoverScreenProfile(
                                  image: Image.asset(
                                    "assets/images/Photo.png",
                                    height: 40,
                                  ),
                                  fullname: 'Emma Leeson',
                                  title: 'Venture Capitalist (Venture Africa)',
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                DiscoverScreenProfile(
                                  image: Image.asset(
                                    "assets/images/Photo.png",
                                    height: 40,
                                  ),
                                  fullname: 'Esher Marvin',
                                  title: 'Venture Capitalist (Venture Africa)',
                                ),
                              ],
                            ),
                          ),
                          Text(""),
                        ],
                      ),
                    )
                  ],
                ))
            // DiscoverTabSection()
          ],
        ),
      ),
    );
  }
}
