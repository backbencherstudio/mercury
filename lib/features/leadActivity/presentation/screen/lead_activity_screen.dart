import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercury/core/routes/route_name.dart';
import 'package:mercury/core/widget/customButton.dart';

class LeadActivityScreen extends StatefulWidget {
  const LeadActivityScreen({super.key});

  @override
  State<LeadActivityScreen> createState() => _LeadActivityScreenState();
}

class _LeadActivityScreenState extends State<LeadActivityScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        "image": "assets/images/lead submitted.png",
        "number": "6",
        "title": "Lead Submitted",
      },
      {
        "image": "assets/images/qualified lead.png",
        "number": "4",
        "title": "Qualified Leads",
      },
      {
        "image": "assets/images/conversation lead.png",
        "number": "6",
        "title": "Conversation",
      },
    ];
    String? selectedMonth;

    final List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text("Lead Activity"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButtonFormField<String>(
              value: selectedMonth,
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Color(0xffE9E9EA),
                size: 28,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffE9E9EA)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffE9E9EA)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffE9E9EA)),
                ),
              ),
              items: months.map((month) {
                return DropdownMenuItem<String>(
                  value: month,
                  child: Text(month),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedMonth = value;
                });
              },
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 180,
            child: ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final leadData = data[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffE9E9EA)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),

                            color: Color(0xffE7F9FB),
                          ),
                          child: Image.asset(leadData['image'], height: 50),
                        ),
                        SizedBox(height: 10),
                        Text(leadData['number']),
                        SizedBox(height: 10),

                        Text(leadData['title']),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30.h),
          CustomButton(
            backgroundColor: Color(0xff0E93A1),
            textColor: Colors.white,
            text: "More Info",
            submit: () async {
              await Navigator.pushNamed(context, RouteNames.moreInfoScreen);
            },
          ),
        ],
      ),
    );
  }
}
