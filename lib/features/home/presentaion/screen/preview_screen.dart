import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercury/core/widget/customButton.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 70,
        surfaceTintColor: Colors.white,

        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Color(0xFFE9E9EA),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ),
        title: const Text(
          "Preview",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade200),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),

                      // Address
                      _buildPreviewRow(
                        label: "Address",
                        value: "123 Main St, Los Angeles",
                        onEdit: () {},
                      ),
                      const Divider(height: 32, color: Color(0xFFE9E9EA)),

                      // Homeowner Name
                      _buildPreviewRow(
                        label: "Homeowner's Name",
                        value: "John Smith",
                        onEdit: () {},
                      ),
                      const Divider(height: 32, color: Color(0xFFE9E9EA)),

                      // Phone
                      _buildPreviewRow(
                        label: "Homeowner's Phone",
                        value: "+33 01238324",
                        onEdit: () {},
                      ),
                      const Divider(height: 32, color: Color(0xFFE9E9EA)),

                      // Trade
                      _buildPreviewRow(
                        label: "Trade",
                        value: "Plumbing",
                        onEdit: () {},
                      ),
                      const Divider(height: 32, color: Color(0xFFE9E9EA)),

                      // Notes
                      _buildLabel("Notes"),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9F9F9),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: const Text(
                          "The lead is located at 123 Main St. The owner's name is John Smith. He has some roof leaking issue. I've shared some images based on specific objective.\n\nPlease see the images below for this specific lead.",
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.4,
                            color: Color(0xff777980),
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),

                      // Images Section
                      _buildLabel("Images (3)"),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildImageTile("Image1.jpg", "images1.jpg"),
                          _buildImageTile("image.jpg", "image12.jpg"),
                          _buildImageTile("image2.jpg", "image2.jpg"),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          onPressed: () {
                            // Re-upload or add more logic
                          },
                          icon: const Icon(
                            Icons.upload,
                            size: 18,
                            color: Colors.blue,
                          ),
                          label: const Text(
                            "File Upload",
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            CustomButton(
              backgroundColor: Color(0xff0E93A1),
              textColor: Colors.white,
              text: "Submit",
              submit: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildPreviewRow({
    required String label,
    required String value,
    required VoidCallback onEdit,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onEdit,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons
                  .edit_off_outlined, // ← you changed to this; keep or revert to pencil?
              size: 20,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageTile(String displayName, String fileName) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const Icon(
              CupertinoIcons.photo,
              size: 50,
              color: Colors.grey,
            ), // Replace with real Image.file() later
          ),
        ),
        const SizedBox(height: 6),
        Text(
          displayName,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
