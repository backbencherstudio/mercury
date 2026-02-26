import 'package:flutter/material.dart';

class MoreInfoScreen extends StatelessWidget {
  const MoreInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6F8),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          "Lead Activity",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle("Total Lead submitted (6)"),
            const SizedBox(height: 10),
            _leadCard(),

            const SizedBox(height: 20),

            _sectionTitle("Qualified Leads (4)"),
            const SizedBox(height: 10),
            _leadCard(),

            const SizedBox(height: 20),

            _sectionTitle("Conversions (2)"),
            const SizedBox(height: 10),
            _leadCard(),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
    );
  }

  Widget _leadCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: List.generate(
          4,
          (index) => Column(
            children: [
              _leadRow(),
              if (index != 3)
                const Divider(height: 20, thickness: 0.5, indent: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _leadRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffB6EDF2),
            ),
            child: const Icon(Icons.star, size: 16, color: Color(0xff0E93A1)),
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("1245 la st", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 2),
              Text(
                "3 January, 2026",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
