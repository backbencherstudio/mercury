import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'package:mercury/core/constansts/icon_manager.dart';
import 'package:mercury/core/resource/utils.dart';
import 'package:mercury/presentation/widgets/primary_button.dart';

import '../../../core/constansts/color_manger.dart';
import '../../../core/resource/style_manager.dart';
import '../../bottom_nav/viewmodel/bottom_nav_provider.dart';
import '../../widgets/custom_back_header.dart';
import '../../../core/route/route_name.dart';
import '../viewmodel/add_lead_viewmodel.dart';

final _files = StateProvider<List<File>>((ref) => []);

class LeadScreen extends ConsumerStatefulWidget {
  const LeadScreen({super.key});

  @override
  ConsumerState<LeadScreen> createState() => _LeadScreenState();
}

class _LeadScreenState extends ConsumerState<LeadScreen> {
  final _formKey = GlobalKey<FormState>();

  final _addressController = TextEditingController();

  final _nameController = TextEditingController();

  final _phoneController = TextEditingController();

  final _notesController = TextEditingController();

  String? _selectedTradeId;

  /// 🔥 PICK IMAGES
  Future<void> _pickImages() async {
    final picker = ImagePicker();
    final List<XFile> pickedFiles = await picker.pickMultiImage(
      imageQuality: 85,
    );

    if (pickedFiles.isNotEmpty) {
      final currentPhotos = ref.read(_files);
      final int availableSlots = 10 - currentPhotos.length;

      if (availableSlots > 0) {
        final List<File> newPhotos = pickedFiles
            .take(availableSlots)
            .map((e) => File(e.path))
            .toList();

        ref.read(_files.notifier).state = [...currentPhotos, ...newPhotos];

        if (pickedFiles.length > availableSlots && mounted) {
          Utils.showToast(
            message: 'Maximum 10 photos can be uploaded',
            backgroundColor: ColorManager.errorColor,
            textColor: Colors.white,
          );
        }
      } else {
        if (mounted) {
          Utils.showToast(
            message: 'Maximum 10 photos can be uploaded',
            backgroundColor: ColorManager.errorColor,
            textColor: Colors.white,
          );
        }
      }
    }
  }

  /// 🔥 REMOVE IMAGE
  void _removeImage(int index) {
    final currentPhotos = ref.read(_files);
    ref.read(_files.notifier).state = [...currentPhotos]..removeAt(index);
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      if (ref.read(_files).isEmpty) {
        Utils.showToast(
          message: 'Please add at least one photo',
          backgroundColor: ColorManager.errorColor,
          textColor: Colors.white,
        );
        return;
      }

      final res = await ref
          .read(addLeadProvider.notifier)
          .addLead(
            address: _addressController.text,
            name: _nameController.text,
            phoneNumber: _phoneController.text,
            trade_id: _selectedTradeId ?? "",
            notes: _notesController.text,
            files: ref.read(_files),
          );

      if (res.isSuccess) {
        _addressController.clear();
        _nameController.clear();
        _phoneController.clear();
        _notesController.clear();
        setState(() {
          _selectedTradeId = null;
        });
        ref.read(_files.notifier).state = [];
        Navigator.pushNamed(context, RouteName.addNewLeadSuccessScreen);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final filesList = ref.watch(_files);
    final tradesAsync = ref.watch(tradesProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        /// ADDRESS
                        _buildLabel("Address"),

                        _buildTextField(
                          controller: _addressController,
                          hint: "123 Main St, Los Angeles",
                          validator: (value) =>
                              value == null || value.trim().isEmpty
                              ? 'Address is required'
                              : null,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12.r),
                            child: SvgPicture.asset(
                              IconManager.map,
                              height: 20.h,
                              width: 20.w,
                            ),
                          ),
                        ),

                        20.verticalSpace,

                        /// NAME
                        _buildLabel("Homeowner's Name"),

                        _buildTextField(
                          controller: _nameController,
                          hint: "John Smith",
                          validator: (value) =>
                              value == null || value.trim().isEmpty
                              ? 'Name is required'
                              : null,
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

                        /// PHONE
                        _buildLabel("Homeowner's Phone Number"),

                        _buildTextField(
                          controller: _phoneController,
                          hint: "+33 01238324",
                          keyboardType: TextInputType.phone,
                          validator: (value) =>
                              value == null || value.trim().isEmpty
                              ? 'Phone number is required'
                              : null,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12.r),
                            child: SvgPicture.asset(
                              IconManager.calling,
                              height: 20.h,
                              width: 20.w,
                            ),
                          ),
                        ),

                        20.verticalSpace,

                        /// TRADE
                        _buildLabel("Trade"),

                        tradesAsync.when(
                          data: (trades) {
                            return DropdownButtonFormField<String>(
                              initialValue:
                                  trades.any((t) => t.id == _selectedTradeId)
                                  ? _selectedTradeId
                                  : null,
                              validator: (value) =>
                                  value == null || value.isEmpty
                                  ? 'Trade is required'
                                  : null,
                              decoration: const InputDecoration(
                                hintText: "Select Trade",
                              ),
                              items: trades.map((trade) {
                                return DropdownMenuItem<String>(
                                  value: trade.id,
                                  child: Text(trade.name ?? ""),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedTradeId = value;
                                });
                              },
                            );
                          },
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          error: (err, stack) => Text('Error: $err'),
                        ),

                        20.verticalSpace,

                        /// NOTES
                        _buildLabel("Write Notes"),

                        TextFormField(
                          controller: _notesController,
                          maxLines: 4,
                          minLines: 3,
                          validator: (value) =>
                              value == null || value.trim().isEmpty
                              ? 'Notes are required'
                              : null,
                          decoration: const InputDecoration(
                            hintText: "Roof leaking issue",
                          ),
                        ),

                        24.verticalSpace,

                        /// 🔥 PHOTO PICKER
                        _buildLabel("Upload Photos Here"),

                        GestureDetector(
                          onTap: _pickImages,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: ColorManager.borderColor,
                              ),
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.add_a_photo_outlined,
                                  size: 32.sp,
                                  color: ColorManager.black400,
                                ),

                                8.verticalSpace,

                                Text(
                                  "Add Photos",
                                  style: getRegular400Style14(
                                    color: ColorManager.black400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        /// 🔥 IMAGE PREVIEW
                        if (filesList.isNotEmpty) ...[
                          16.verticalSpace,

                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: filesList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10.w,
                                  mainAxisSpacing: 10.h,
                                  childAspectRatio: 1,
                                ),
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      image: DecorationImage(
                                        image: FileImage(filesList[index]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                                  Positioned(
                                    top: 4,
                                    right: 4,
                                    child: GestureDetector(
                                      onTap: () {
                                        _removeImage(index);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(4.r),
                                        decoration: const BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 16.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],

                        32.verticalSpace,

                        /// PREVIEW
                        PrimaryButton(
                          title: 'Preview',
                          containerColor: ColorManager.backgroundLight,
                          textStyle: getSemiBold600Style16(
                            color: ColorManager.backgroundDark,
                          ),
                          border: Border.all(
                            color: ColorManager.backgroundDark,
                          ),
                          onTap: () async {
                            String? tradeName = _selectedTradeId;
                            if (tradesAsync.hasValue) {
                              final selected = tradesAsync.value!
                                  .where((t) => t.id == _selectedTradeId)
                                  .toList();
                              if (selected.isNotEmpty) {
                                tradeName = selected.first.name;
                              }
                            }

                            final shouldSubmit = await Navigator.pushNamed(
                              context,
                              RouteName.previewScreen,
                              arguments: {
                                'address': _addressController.text,
                                'name': _nameController.text,
                                'phone': _phoneController.text,
                                'trade': tradeName,
                                'notes': _notesController.text,
                                'files': filesList,
                              },
                            );

                            if (shouldSubmit == true) {
                              _submitForm();
                            }
                          },
                        ),

                        20.verticalSpace,

                        /// SUBMIT
                        PrimaryButton(
                          title: 'Submit',
                          isLoading: ref.watch(addLeadProvider),
                          onTap: _submitForm,
                        ),

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
      padding: EdgeInsets.only(bottom: 8.h),
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
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(hintText: hint, prefixIcon: prefixIcon),
    );
  }
}
