import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mercury/presentation/widgets/primary_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constansts/color_manger.dart';
import '../../../../core/resource/style_manager.dart';
import '../../../../core/resource/utils.dart';
import '../../../../core/route/route_name.dart';
import '../viewmodel/auth_viewmodel.dart';
import '../viewmodel/is_password_show_provider.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late TapGestureRecognizer _termsTapRecognizer;
  DateTime? _lastPressedAt;

  @override
  void initState() {
    super.initState();
    _termsTapRecognizer = TapGestureRecognizer()..onTap = _launchTermsUrl;
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _termsTapRecognizer.dispose();
    super.dispose();
  }

  void _launchTermsUrl() async {
    final Uri url = Uri.parse('https://aqualeads.netlify.app/terms-of-use');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      Utils.showErrorToast(message: "Could not launch Terms & Conditions");
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPassword = ref.watch(passwordVisibilityProvider);
    final isCheck = ref.watch(toggleCheckBoxProvider);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final now = DateTime.now();
        if (_lastPressedAt == null ||
            now.difference(_lastPressedAt!) > const Duration(seconds: 2)) {
          _lastPressedAt = now;
          Fluttertoast.showToast(msg: "Tap again to exit");
          return;
        }

        SystemNavigator.pop();
      },
      child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 13.h,
                          horizontal: 24.w,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.backgroundColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'A',
                          style: getMedium500Style12(
                            color: ColorManager.whiteColor,
                            fontSize: 40.sp,
                          ),
                        ),
                      ),

                      20.verticalSpace,

                      Text(
                        "Aqua Leads",
                        style: getSemiBold600Style32(
                          color: ColorManager.blackColor,
                        ),
                      ),

                      8.verticalSpace,

                      Text(
                        "Lead Generation",
                        style: getMedium500Style16(
                          color: ColorManager.black400,
                        ),
                      ),
                    ],
                  ),

                  30.verticalSpace,

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email or Username",
                      style: getMedium500Style16(color: ColorManager.black500),
                    ),
                  ),

                  8.verticalSpace,

                  TextFormField(
                    controller: _userNameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your email or username";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Enter your email or username",
                    ),
                  ),

                  20.verticalSpace,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Password",
                      style: getMedium500Style16(color: ColorManager.black500),
                    ),
                  ),

                  8.verticalSpace,

                  TextFormField(
                    controller: _passwordController,
                    obscureText: isPassword,
                    textInputAction: TextInputAction.done,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          ref.read(passwordVisibilityProvider.notifier).state =
                              !isPassword;
                        },
                        icon: Icon(
                          isPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null;
                    },
                  ),

                  8.verticalSpace,

                  Row(
                    children: [
                      Checkbox(
                        activeColor: ColorManager.backgroundDark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        side: BorderSide(
                          color: ColorManager.black400,
                          width: 1.w,
                        ),
                        value: isCheck,
                        onChanged: (value) {
                          ref.read(toggleCheckBoxProvider.notifier).state =
                              value!;
                        },
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "I agree to the ",
                                style: getMedium500Style14(
                                  color: ColorManager.black500,
                                ),
                              ),
                              TextSpan(
                                text: "Terms & Conditions",
                                recognizer: _termsTapRecognizer,
                                style: getMedium500Style14(
                                  color: ColorManager.backgroundColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  32.verticalSpace,

                  PrimaryButton(
                    title: 'Login',
                    isLoading: ref.watch(authProvider),
                    onTap: () async {
                      if (!isCheck) {
                        Utils.showErrorToast(
                          message: "Please agree to the Terms & Conditions",
                        );
                        return;
                      }
                      if (_formKey.currentState!.validate()) {
                        final res = await ref
                            .read(authProvider.notifier)
                            .login(
                              email: _userNameController.text.trim(),
                              password: _passwordController.text.trim(),
                            );
                        if (res.isSuccess) {
                          if (!context.mounted) return;
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RouteName.bottomNavScreen,
                            (route) => false,
                          );
                        }
                      }
                    },
                  ),

                  30.verticalSpace,
                  Text(
                    "Account are created by Admin Only",
                    style: getRegular400Style12(color: ColorManager.black300),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
