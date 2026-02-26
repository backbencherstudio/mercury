import 'package:flutter/material.dart';

import '../../../../core/routes/route_name.dart';

class ConnectionList extends StatelessWidget {
  const ConnectionList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        "title": "Plumber",
        "status": "Open",
        "location": "Miami FI",
        "time": "2 hours ago",
      },
      {
        "title": "Electronics",
        "status": "Open",
        "location": "Fort Lauder dale, FI",
        "time": "5 hours ago",
      },
      {
        "title": "HVAC Technician",
        "status": "Fulfilled",
        "location": "Tampa. FI",
        "time": "6 hours ago",
      },
      {
        "title": "Handyman",
        "status": "Open",
        "location": "Orlando FI",
        "time": "2 hours ago",
      },
      {
        "title": "Roofer",
        "status": "Fulfilled",
        "location": "Jacksonville FI",
        "time": "9 hours ago",
      },
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          "Connection Request",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final connectData = data[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 16),
                child: GestureDetector(
                  onTap: ()async{
                    await Navigator.pushNamed(context, RouteNames.connectionRequest);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 19, horizontal: 15),

                    decoration: BoxDecoration(
                      color: Color(0xffF8FAFB),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              connectData['title'],
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: connectData['status'] == "Fulfilled"
                                    ? Color(0xffDFE1E7)
                                    : Color(0xffDCF6F9),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                connectData['status'],
                                style: TextStyle(
                                  color: connectData['status'] == "Fulfilled"
                                      ? Color(0xff4A4C56)
                                      : Color(0xff0F9DAB),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            SizedBox(width: 5),
                            Text(connectData['location']),
                            SizedBox(width: 5),

                            Icon(Icons.access_time),
                            SizedBox(width: 5),

                            Text(connectData['time']),
                          ],
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
