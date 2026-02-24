import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/route_name.dart';
import '../../../../core/widget/customButton.dart';

class AddNewLead extends StatefulWidget {
  const AddNewLead({super.key});

  @override
  State<AddNewLead> createState() => _AddNewLeadState();
}

class _AddNewLeadState extends State<AddNewLead> {
  final _formKey = GlobalKey<FormState>();

  // Controllers (you'll need these later for real data collection)
  final _addressController = TextEditingController(
    text: "123 Main St, Los Angeles",
  );
  final _nameController = TextEditingController(text: "John Smith");
  final _phoneController = TextEditingController(text: "+33 01238324");
  final _notesController = TextEditingController(text: "Roof leaking issue");

  String? _selectedTrade = "Plumbing";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 70,
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
          "Add New Lead",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Address
              _buildLabel("Address"),
              _buildTextField(
                controller: _addressController,
                hint: "123 Main St, Los Angeles",
                prefixIcon: const Icon(CupertinoIcons.location_solid, size: 22),
              ),
              const SizedBox(height: 20),

              // Homeowner Name
              _buildLabel("Homeowner's Name"),
              _buildTextField(
                controller: _nameController,
                hint: "John Smith",
                prefixIcon: const Icon(CupertinoIcons.person_fill, size: 22),
              ),
              const SizedBox(height: 20),

              // Phone
              _buildLabel("Homeowner's Phone Number"),
              _buildTextField(
                controller: _phoneController,
                hint: "+33 01238324",
                prefixIcon: const Icon(CupertinoIcons.phone_fill, size: 22),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),

              // Trade
              _buildLabel("Trade"),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: DropdownButton<String>(
                  value: _selectedTrade,
                  isExpanded: true,
                  underline: const SizedBox(),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items:
                      ["Plumbing", "Electrical", "Roofing", "HVAC", "General"]
                          .map(
                            (trade) => DropdownMenuItem(
                              value: trade,
                              child: Text(trade),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() => _selectedTrade = value);
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Notes
              _buildLabel("Write Notes"),
              TextFormField(
                controller: _notesController,
                maxLines: 4,
                minLines: 3,
                decoration: InputDecoration(
                  hintText: "Roof leaking issue",
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  filled: true,
                  fillColor: const Color(0xFFF9F9F9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
              const SizedBox(height: 24),

              // Photo Upload
              _buildLabel("Upload Photos Here"),
              Row(
                children: [
                  _buildPhotoPlaceholder(),
                  const SizedBox(width: 12),
                  _buildPhotoPlaceholder(),
                  const SizedBox(width: 12),
                  _buildPhotoPlaceholder(isAdd: true),
                ],
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: "Preview",
                submit: () {
                  Navigator.pushNamed(context, RouteNames.previewScreen);
                },
                backgroundColor: Color(0xffE7F9FB),
              ),

              SizedBox(height: 20),
              CustomButton(
                text: "Submit",
                submit: () {},
                backgroundColor: Color(0xff0E93A1),
                textColor: Colors.white,
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    Icon? prefixIcon,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade500),
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: const Color(0xFFffffff),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xffE9E9EA), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xffE9E9EA), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xffE9E9EA), width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
      ),
    );
  }

  Widget _buildPhotoPlaceholder({bool isAdd = false}) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: isAdd
          ? const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_circle_outline, size: 32, color: Colors.grey),
                SizedBox(height: 4),
                Text(
                  "Add More",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            )
          : const Icon(
              CupertinoIcons.camera_fill,
              size: 36,
              color: Colors.grey,
            ),
    );
  }
}
