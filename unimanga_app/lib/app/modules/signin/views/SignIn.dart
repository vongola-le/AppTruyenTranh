import 'dart:math';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unimanga_app/app/constants/index.dart';
import 'package:unimanga_app/app/modules/home/views/home_views.dart';

//import 'SignUp.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final _frmkey = GlobalKey<FormState>();
  // final _user = Get.put(UserController());
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController addressController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        height: 200,
                        image: AssetImage(AppImages.Logoapp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(height: 30.0),
                  Form(
                    key: _frmkey,
                    child: Column(
                      children: [
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
                              borderSide: BorderSide(
                                color: Color(0xFFADDDFF),
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                          ),
                          // validator: (email) {
                          //   if (email!.isEmpty) {
                          //     return 'Vui lòng nhập email';
                          //   }
                          //   if (!isValidEmail(email)) {
                          //     return 'Vui lòng nhập đúng định dang !';
                          //   }
                          //   return null;
                          // },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          style: TextStyle(
                            color: Color(0xFF0597F2),
                            fontSize: 18,
                          ),
                          controller: passwordController,
                          decoration: InputDecoration(
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
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                          ),
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
                  const SizedBox(height: 5.0),
                  GestureDetector(
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ForgotPassword()),
                    //   );
                    // },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Quên mật khẩu?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: Center(
                        child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      elevation: 5.0,
                      height: 45,
                      minWidth: double.infinity,
                      onPressed: () {
                        setState(() {
                         const HomeView();
                        });
                        const HomeView();
                      },
                      child: Text(
                        "Đăng nhập",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      color: Color(0xFFADDDFF),
                    )),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Bạn đã chưa có tài khoản ?',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.pushReplacement(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => const SignUp()));
                      //   },
                      //   child: Text(
                      //     'Đăng ký',
                      //     style: TextStyle(color: Colors.blue),
                      //   ),
                      // )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
