import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mercury/core/constansts/icon_manager.dart';
import 'package:mercury/presentation/widgets/primary_button.dart';
import '../../../core/constansts/color_manger.dart';
import '../../../core/resource/style_manager.dart';
import '../../bottom_nav/viewmodel/bottom_nav_provider.dart';
import '../../widgets/custom_back_header.dart';
import '../../../core/route/route_name.dart';

class LeadScreen extends ConsumerStatefulWidget {
  const LeadScreen({super.key});

  @override
  ConsumerState<LeadScreen> createState() => _LeadScreenState();
}

class _LeadScreenState extends ConsumerState<LeadScreen> {
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CustomBackHeader(
                title: "Add New Lead",
                onBackTap: () {
                  ref.read(bottomNavIndexProvider.notifier).setIndex(0);
                },
              ),
              30.verticalSpace,
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Address
                        _buildLabel("Address"),
                        _buildTextField(
                          controller: _addressController,
                          hint: "123 Main St, Los Angeles",
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12.r),
                            child: SvgPicture.asset(
                              IconManager.map,
                              height: 20.h,
                              width: 20.w,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Homeowner Name
                        _buildLabel("Homeowner's Name"),
                        _buildTextField(
                          controller: _nameController,
                          hint: "John Smith",
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12.r),
                            child: SvgPicture.asset(
                              IconManager.user,
                              height: 20.h,
                              width: 20.w,
                            ),
                          ),
                        ),
                        20.verticalSpace,

                        // Phone
                        _buildLabel("Homeowner's Phone Number"),
                        _buildTextField(
                          controller: _phoneController,
                          hint: "+33 01238324",
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12.r),
                            child: SvgPicture.asset(
                              IconManager.calling,
                              height: 20.h,
                              width: 20.w,
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                        20.verticalSpace,

                        // Trade
                        _buildLabel("Trade"),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: DropdownButton<String>(
                            value: _selectedTrade,
                            isExpanded: true,
                            underline: const SizedBox(),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items:
                                [
                                      "Plumbing",
                                      "Electrical",
                                      "Roofing",
                                      "HVAC",
                                      "General",
                                    ]
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

                        PrimaryButton(
                          title: 'Preview',
                          containerColor: ColorManager.backgroundLight,
                          textStyle: getSemiBold600Style16(
                            color: ColorManager.backgroundDark,
                          ),
                          border: Border.all(
                            color: ColorManager.backgroundDark,
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteName.previewScreen,
                            );
                          },
                        ),
                        20.verticalSpace,
                        PrimaryButton(title: 'Submit', onTap: () {}),
                        32.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
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
        style: getMedium500Style16(color: ColorManager.black500),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    Widget? prefixIcon,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade500),
        prefixIcon: prefixIcon,
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
