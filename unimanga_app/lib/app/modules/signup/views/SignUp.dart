import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimanga_app/app/constants/index.dart';

import '../../list_ranking/views/SignIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  final _frmkey = GlobalKey<FormState>();
  // final _user = Get.put(UserController());
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController addressController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  bool showProgress = false;
  bool _obscureText = true;
  bool? isChecked = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        controller.reset();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // void signUp() async {
  //   final user = Users(
  //       fullName: nameController.text.trim(),
  //       address: {
  //         "Home": addressController.text.trim(),
  //         "Company": null,
  //         "Etc": null,
  //       },
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim(),
  //       agree: isChecked);
  //   if (!_frmkey.currentState!.validate()) {
  //     showFailureDialog();
  //   } else {
  //     if (isChecked == true) {
  //       try {
  //         await _user.createUser(user);
  //       } on SignUp_AccountFailure catch (e) {
  //         showFailureDialog(message: e.message);
  //       } catch (_) {
  //         showFailureDialog();
  //       }
  //     } else {
  //       showCheckBoxDialog();
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    height: 200,
                    image: AssetImage(AppImages.Logoapp),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              Form(
                key: _frmkey,
                child: Column(
                  children: [
                    TextFormField(
                      style: const TextStyle(
                        color: Color(0xFF0597F2),
                        fontSize: 18,
                      ),
                      controller: nameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Họ và Tên",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color(0xFFADDDFF),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      validator: (nameController) {
                        if (nameController!.isEmpty) {
                          return 'Vui lòng nhập Họ Tên';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      style: const TextStyle(
                        color: Color(0xFF0597F2),
                        fontSize: 18,
                      ),
                      controller: addressController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Địa chỉ",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color(0xFFADDDFF),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      validator: (address) {
                        if (address!.isEmpty) {
                          return 'Vui lòng nhập địa chỉ';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      style: const TextStyle(
                        color: Color(0xFF0597F2),
                        fontSize: 18,
                      ),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color(0xFFADDDFF),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      validator: (email) {
                        if (email!.isEmpty) {
                          return 'Vui lòng nhập email';
                        }
                        // if (!isValidEmail(email)) {
                        //   return 'Vui lòng nhập đúng định dang !';
                        // }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      style: const TextStyle(
                        color: Color(0xFF0597F2),
                        fontSize: 18,
                      ),
                      controller: passwordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color.fromARGB(255, 42, 43, 44),
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        labelText: "Password",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color(0xFFADDDFF),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      obscureText: _obscureText,
                      validator: (pass) {
                        if (pass!.isEmpty) {
                          return 'Vui lòng nhập mật khẩu';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Checkbox(
              //       value: isChecked,
              //       onChanged: (bool? newValue) {
              //         setState(() {
              //           isChecked = newValue!;
              //         });
              //       },
              //     ),
              //     const Text(
              //       'Đồng ý với ',
              //       style: TextStyle(color: Colors.black),
              //     ),
              //     const Text(
              //       'Chính sách & Quyền riêng tư',
              //       style: TextStyle(color: Colors.grey),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: Center(
                    child: MaterialButton(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  elevation: 5.0,
                  height: 45,
                  minWidth: double.infinity,
                  onPressed: () {},
                  child: const Text(
                    "Đăng ký",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  color: const Color(0xFFADDDFF),
                )),
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Bạn đã có tài khoản ?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login_Screen()));
                    },
                    child: const Text(
                      'Đăng nhập',
                      style: TextStyle(color: Color(0xFFADDDFF)),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

//   Future<void> showDoneDialog() async {
//     await showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (context) => Dialog(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Lottie.asset(
//               'assets/animations/login_successly.json',
//               repeat: false,
//               controller: controller,
//               onLoaded: (composition) {
//                 controller.duration = composition.duration;
//                 controller.forward();
//               },
//             ),
//             const Text(
//               "Đăng ký thành công",
//               style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
//             ),
//             const SizedBox(height: 16.0),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> showFailureDialog({String? message}) async {
//     await showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (context) => Dialog(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Lottie.asset(
//               'assets/animations/login_failure.json',
//               repeat: false,
//               controller: controller,
//               onLoaded: (composition) {
//                 controller.duration = composition.duration;
//                 controller.forward();
//               },
//             ),
//             Text(
//               message ?? "Đăng ký thất bại",
//               style:
//                   const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
//             ),
//             const SizedBox(height: 16.0),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> showCheckBoxDialog() async {
//     await showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (context) => Dialog(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Lottie.asset(
//               'assets/animations/checkbox.json',
//               repeat: false,
//               controller: controller,
//               onLoaded: (composition) {
//                 controller.duration = composition.duration;
//                 controller.forward();
//               },
//             ),
//             const Text(
//               "Vui lòng chọn Đồng ý",
//               style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
//             ),
//             const SizedBox(height: 16.0),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> showCheckExistDialog() async {
//     await showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (context) => Dialog(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Lottie.asset(
//               'assets/animations/failure.json',
//               repeat: false,
//               controller: controller,
//               onLoaded: (composition) {
//                 controller.duration = composition.duration;
//                 controller.forward();
//               },
//             ),
//             const Text(
//               "Tài khoản đã tồn tại",
//               style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
//             ),
//             const SizedBox(height: 16.0),
//           ],
//         ),
//       ),
//     );
//   }
}