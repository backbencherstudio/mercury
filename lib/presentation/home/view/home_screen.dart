import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mercury/presentation/home/view/widget/custom_header.dart';
import '../../../core_copy/route/route_name.dart';
import '../../bottom_nav/viewmodel/bottom_nav_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        "image": "assets/images/add new lead icon.png",
        "title": "Add New Lead",
        "subtitle": "Submit leads here",
      },
      {
        "image": "assets/images/activity.png",
        "title": "Lead Activity",
        "subtitle": "See all activities",
      },
      {
        "image": "assets/images/connection request icon.png",
        "title": "Connection Request",
        "subtitle": "Send Connection Request",
      },
      {
        "image": "assets/images/connection request icon.png",
        "title": "Watch Videos",
        "subtitle": "Watch Instructional Videos",
      },
    ];
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 90),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteName.supportCenterScreen);
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Image.asset(
            "assets/images/supporrt.png",
            height: 70,
            width: 70,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: Column(
        children: [
          CustomHeader(),
          ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 7,
                  horizontal: 20,
                ),
                child: GestureDetector(
                  onTap: () {
                    if (data[index]['title'] == "Add New Lead") {
                      ref.read(bottomNavIndexProvider.notifier).setIndex(1);
                      //Navigator.pushNamed(context, RouteNames.addNewLead);
                    } else if (data[index]['title'] == "Lead Activity") {
                      ref.read(bottomNavIndexProvider.notifier).setIndex(2);
                      // Navigator.pushNamed(context, RouteNames.leadActivity);
                    } else if (data[index]['title'] == "Connection Request") {
                      ref.read(bottomNavIndexProvider.notifier).setIndex(3);
                      //   Navigator.pushNamed(context, RouteNames.connectionRequest);
                    } else if (data[index]['title'] == "Watch Videos") {
                      Navigator.pushNamed(context, RouteName.watchVideoScreen);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xffF6F8FA),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xffDCF6F9),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Image.asset(
                            data[index]["image"],
                            height: 50,
                            width: 50,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index]['title'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Text(data[index]['subtitle']),
                          ],
                        ),

                        Spacer(),
                        Image.asset(
                          "assets/images/arrow white icon.png",
                          color: Colors.black,
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
