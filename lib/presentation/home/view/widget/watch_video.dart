import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Transform.translate(
            offset: Offset(10, 0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffE9E9EA),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text("Watch Video"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 2,
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPress: () {
              setState(() {
                selectedIndex = index;
              });
            },
            onTap: () {
              setState(() {
                selectedIndex = null;
              });
            },
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //  Video Box
                      Container(
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            //  Bottom Controls Bar
                            Positioned(
                              left: 8,
                              right: 8,
                              bottom: 8,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.pause,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 8),

                                  //  Progress bar
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      value: 0.3,
                                      backgroundColor: Colors.white30,
                                      color: Colors.green,
                                    ),
                                  ),

                                  const SizedBox(width: 8),

                                  //  Time
                                  const Text(
                                    "1:12:22",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),

                                  const SizedBox(width: 8),

                                  //  Volume
                                  const Icon(
                                    Icons.volume_down_outlined,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  SizedBox(width: 6),
                                  Icon(
                                    Icons.closed_caption_off_rounded,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  SizedBox(width: 6),

                                  Icon(
                                    Icons.fullscreen,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      // 📝 Title + Time
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "How to get started",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: const [
                              Icon(Icons.access_time, size: 16),
                              SizedBox(width: 4),
                              Text("45 min"),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // 📘 Info Box
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xffECF5F7),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              index == 0
                                  ? "Introduction to Aqua Lead"
                                  : "How to do a meeting",
                              style: const TextStyle(
                                color: Color(0xff13C0D2),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              index == 0
                                  ? "This video contains on how to use this app. You will find detail direction on this video."
                                  : "Here's how to do a meeting. Please watch the video completely to understand how to do it.",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // 🗑 Delete icon (only on long press)
                if (selectedIndex == index)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        // delete logic here
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
