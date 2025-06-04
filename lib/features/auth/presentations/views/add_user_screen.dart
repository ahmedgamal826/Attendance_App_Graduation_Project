// import 'package:attendance_app/features/auth/presentations/views/widget/auth_functions.dart';
// import 'package:attendance_app/features/auth/presentations/views/widget/custom_button.dart';
// import 'package:attendance_app/features/auth/presentations/views/widget/custom_text_filed.dart';
// import 'package:flutter/material.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   // Controllers
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   String _role = 'student';

//   void handleAddUser() {
//     if (_formKey.currentState!.validate()) {
//       signUp(
//         context: context,
//         nameController: nameController,
//         emailController: emailController,
//         passwordController: passwordController,
//         confirmPasswordController: confirmPasswordController,
//         role: _role,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color(0xff70ACF4),
//         body: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               const SizedBox(height: 15),
//               const Center(
//                 child: Text(
//                   'Add User',
//                   style: TextStyle(fontSize: 50, color: Colors.white),
//                 ),
//               ),
//               const SizedBox(height: 50),
//               const Padding(
//                 padding: EdgeInsets.only(left: 20),
//                 child: Text(
//                   'Username',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               CustomTextFiled(
//                 hintText: 'Enter your Name',
//                 controller: nameController,
//                 validatorMessage: 'Username is required',
//               ),
//               const SizedBox(height: 20),
//               const Padding(
//                 padding: EdgeInsets.only(left: 20),
//                 child: Text(
//                   'Email',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               CustomTextFiled(
//                 hintText: 'Enter your Email',
//                 controller: emailController,
//                 validatorMessage: 'Email is required',
//               ),
//               const SizedBox(height: 20),
//               const Padding(
//                 padding: EdgeInsets.only(left: 20),
//                 child: Text(
//                   'Password',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               CustomTextFiled(
//                 hintText: 'Enter your Password',
//                 controller: passwordController,
//                 validatorMessage: 'Password is required',
//               ),
//               const SizedBox(height: 20),
//               // const Padding(
//               //   padding: EdgeInsets.only(left: 20),
//               //   child: Text(
//               //     'Confirm Password',
//               //     style: TextStyle(
//               //       fontSize: 22,
//               //       fontWeight: FontWeight.bold,
//               //       color: Colors.white,
//               //     ),
//               //   ),
//               // ),
//               // const SizedBox(height: 10),
//               // CustomTextFiled(
//               //   hintText: 'Enter Confirm Password',
//               //   controller: confirmPasswordController,
//               //   validatorMessage: 'Confirm Password is required',
//               // ),
//               const SizedBox(height: 20),
//               // قسم اختيار الدور
//               const Padding(
//                 padding: EdgeInsets.only(left: 20),
//                 child: Text(
//                   'Select Role',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: RadioListTile<String>(
//                       title: const Text(
//                         'Student',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         ),
//                       ),
//                       value: 'student',
//                       groupValue: _role,
//                       onChanged: (value) {
//                         setState(() {
//                           _role = value!;
//                         });
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: RadioListTile<String>(
//                       title: const Text(
//                         'Admin',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         ),
//                       ),
//                       value: 'admin',
//                       groupValue: _role,
//                       onChanged: (value) {
//                         setState(() {
//                           _role = value!;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               CustomButton(buttonText: 'Add', onPressed: handleAddUser),
//               const SizedBox(height: 10),
//               // CustomTextAndTextbutton(
//               //   text1: 'Already have an account? ',
//               //   text2: 'Login',
//               //   onTap: () {
//               //     Navigator.of(context).pushReplacementNamed("loginScreen");
//               //   },
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/auth/presentations/views/widget/auth_functions.dart';
import 'package:attendance_app/features/auth/presentations/views/widget/custom_button.dart';
import 'package:attendance_app/features/auth/presentations/views/widget/custom_text_filed.dart';
import 'package:attendance_app/features/home/presentation/manager/provider/dark_mode_provider.dart';
import 'package:attendance_app/features/assistant/presentation/views/assistant_home_view.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // final TextEditingController confirmPasswordController =
  //     TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // متغير لتحديد الدور، القيمة الافتراضية "student"
  String _role = 'student';

  // متغير لتخزين الصورة المُختارة
  File? _image;
  final ImagePicker _picker = ImagePicker();

  bool isLoading = false;

  // دالة اختيار الصورة من المعرض
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // دالة رفع الصورة إلى Firebase Storage والحصول على رابط التحميل
  // تأكد من إضافة الحزمة firebase_storage في pubspec.yaml
  Future<String> _uploadImage(File image) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final Reference storageRef =
        FirebaseStorage.instance.ref().child('user_images').child(fileName);
    final UploadTask uploadTask = storageRef.putFile(image);
    final TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  // void handleAddUser() async {
  //   if (_formKey.currentState!.validate()) {
  //     setState(() {
  //       isLoading = true; // بدء تحميل
  //     });
  //     String imageUrl = "";
  //     if (_image != null) {
  //       imageUrl = await _uploadImage(_image!);
  //     }
  //     signUp(
  //       context: context,
  //       nameController: nameController,
  //       emailController: emailController,
  //       passwordController: passwordController,
  //       role: _role,
  //       imageUrl: imageUrl,
  //     );
  //   }
  // }

  void handleAddUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      String imageUrl = "";
      try {
        if (_image != null) {
          imageUrl = await _uploadImage(_image!);
        }

        signUp(
          context: context,
          nameController: nameController,
          emailController: emailController,
          passwordController: passwordController,
          role: _role,
          imageUrl: imageUrl,
        );

        setState(() {
          isLoading = false;
        });
      } catch (error) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<DarkModeProvider>(context).isDarkMode;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? Colors.black : AppColors.primaryColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: isDarkMode ? Colors.black : AppColors.primaryColor,
        ),
        body: Stack(
          children: [
            Form(
              key: _formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 15),
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              _image != null ? FileImage(_image!) : null,
                          child: _image == null
                              ? Icon(
                                  Icons.person,
                                  size: 50,
                                  color: isDarkMode
                                      ? Colors.black
                                      : AppColors.primaryColor,
                                )
                              : null,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Center(
                    child: Text(
                      'Add User',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Username',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextFiled(
                    hintText: 'Enter your Name',
                    controller: nameController,
                    validatorMessage: 'Username is required',
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextFiled(
                    hintText: 'Enter your Email',
                    controller: emailController,
                    validatorMessage: 'Email is required',
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextFiled(
                    hintText: 'Enter your Password',
                    controller: passwordController,
                    validatorMessage: 'Password is required',
                  ),
                  const SizedBox(height: 20),

                  // const Padding(
                  //   padding: EdgeInsets.only(left: 20),
                  //   child: Text(
                  //     'Confirm Password',
                  //     style: TextStyle(
                  //       fontSize: 22,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 10),
                  // CustomTextFiled(
                  //   hintText: 'Enter confirm Password',
                  //   controller: confirmPasswordController,
                  //   validatorMessage: 'Confirm Password is required',
                  // ),
                  const SizedBox(height: 7),

                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Select Role',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text(
                            'Student',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          value: 'student',
                          groupValue: _role,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              _role = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text(
                            'Admin',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          value: 'admin',
                          groupValue: _role,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              _role = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  CustomButton(
                    buttonText: 'Add',
                    onPressed: handleAddUser,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            if (isLoading)
              const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
