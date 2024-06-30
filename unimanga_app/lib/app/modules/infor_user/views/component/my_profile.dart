import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unimanga_app/app/global_widgets/text_field_custom2.dart';
import 'package:unimanga_app/app/modules/infor_user/repository/user_repository.dart';
import '../../../../global_widgets/appbar_custom2.dart';
import '../../../../global_widgets/button_custom2.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  UserRepository authController = Get.put(UserRepository());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Map<String, dynamic> _userData = {};
  final ImagePicker _picker = ImagePicker();
  var isProfileUploading = false.obs;
  File? selectedImage;

  // hàm lấy ảnh
  getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      selectedImage = File(image.path);
      setState(() {});
    }
  }

  // Hàm lấy dữ liệu
  Future<void> _loadUserData() async {
    _userData = await authController.getUserData();
    setState(() {
      nameController = TextEditingController(text: _userData['name'] ?? '');
      addressController =
          TextEditingController(text: _userData['address'] ?? '');
    });
  }

  //
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.4,
              child: Stack(
                children: [
                  IntroWidgetWithoutLogo(),
                  Positioned(
                    top: 20,
                    left: 0,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        // Xử lý sự kiện khi người dùng bấm nút trở về
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {
                        getImage(ImageSource.camera);
                      },
                      child: selectedImage == null
                          ? _userData['imageUrl'] != null
                              ? Container(
                                  width: 120,
                                  height: 120,
                                  margin: EdgeInsets.only(bottom: 20),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              _userData['imageUrl']!),
                                          fit: BoxFit.fill),
                                      shape: BoxShape.circle,
                                      color: Color(0xffD6D6D6)),
                                )
                              : Container(
                                  width: 120,
                                  height: 120,
                                  margin: EdgeInsets.only(bottom: 20),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffD6D6D6)),
                                  child: Center(
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                          : Container(
                              width: 120,
                              height: 120,
                              margin: EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(selectedImage!),
                                      fit: BoxFit.fill),
                                  shape: BoxShape.circle,
                                  color: Color(0xffD6D6D6)),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFieldWidget(
                      "Name",
                      Icons.person_outlined,
                      nameController,
                      (String? input) {
                        if (input!.isEmpty) {
                          return 'Name is required!';
                        }

                        if (input.length < 5) {
                          return 'Please enter a valid name!';
                        }

                        return null;
                      },
                    ),
                    TextFieldWidget(
                      "Address",
                      Icons.location_city,
                      addressController,
                      (String? input) {
                        if (input!.isEmpty) {
                          return 'Adrress is required!';
                        }

                        if (input.length < 5) {
                          return 'Please enter a valid name!';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(() => isProfileUploading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : greenButton('Cập nhật', () {
                            if (!formKey.currentState!.validate()) {
                              return;
                            }

                            isProfileUploading(true);
                            authController.updateUserInfo(selectedImage,
                                nameController.text, addressController.text);
                          })),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
