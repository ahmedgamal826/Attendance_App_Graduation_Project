// // // // // // import 'dart:io';
// // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/create_chat_button.dart';
// // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/custom_camera_button.dart';
// // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/custom_circle_avatar.dart';
// // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/new_chat_text_field.dart';
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:image_picker/image_picker.dart';
// // // // // // import 'package:provider/provider.dart';

// // // // // // class NewChatView extends StatefulWidget {
// // // // // //   const NewChatView({super.key});

// // // // // //   @override
// // // // // //   _NewChatViewState createState() => _NewChatViewState();
// // // // // // }

// // // // // // class _NewChatViewState extends State<NewChatView> {
// // // // // //   File? _selectedImage; // To store the selected image
// // // // // //   final _formKey = GlobalKey<FormState>(); // For form validation
// // // // // //   final TextEditingController nameController = TextEditingController();
// // // // // //   final TextEditingController emailController = TextEditingController();

// // // // // //   // Function to pick an image from the gallery
// // // // // //   Future<void> _pickImage() async {
// // // // // //     final picker = ImagePicker();
// // // // // //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

// // // // // //     if (pickedFile != null) {
// // // // // //       setState(() {
// // // // // //         _selectedImage = File(pickedFile.path);
// // // // // //       });
// // // // // //     }
// // // // // //   }

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return ChangeNotifierProvider(
// // // // // //       create: (context) => ChatViewModel(ChatRepository()),
// // // // // //       child: Consumer<ChatViewModel>(
// // // // // //         builder: (context, viewModel, child) {
// // // // // //           return Scaffold(
// // // // // //             resizeToAvoidBottomInset: true, // يضبط الشاشة لما الكيبورد يظهر
// // // // // //             backgroundColor: Colors.white, // خلفية بيضاء
// // // // // //             appBar: AppBar(
// // // // // //               iconTheme: const IconThemeData(
// // // // // //                 color: Colors.white,
// // // // // //               ),
// // // // // //               backgroundColor: AppColors.primaryColor,
// // // // // //               elevation: 0,
// // // // // //               title: const Text(
// // // // // //                 'New Chat',
// // // // // //                 style: TextStyle(
// // // // // //                   fontSize: 25,
// // // // // //                   fontWeight: FontWeight.bold,
// // // // // //                   color: Colors.white,
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ),
// // // // // //             body: Padding(
// // // // // //               padding: const EdgeInsets.all(16.0),
// // // // // //               child: Form(
// // // // // //                 key: _formKey,
// // // // // //                 child: SingleChildScrollView(
// // // // // //                   physics: const BouncingScrollPhysics(), // سكرول مرن
// // // // // //                   child: Column(
// // // // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                     children: [
// // // // // //                       // CircleAvatar with camera icon
// // // // // //                       Center(
// // // // // //                         child: Stack(
// // // // // //                           children: [
// // // // // //                             CustomCircleAvatar(selectedImage: _selectedImage),
// // // // // //                             CustomCameraButton(
// // // // // //                               onTap: _pickImage,
// // // // // //                             )
// // // // // //                           ],
// // // // // //                         ),
// // // // // //                       ),
// // // // // //                       const SizedBox(height: 50),
// // // // // //                       // Name field
// // // // // //                       NewChatTextField(
// // // // // //                         controller: nameController,
// // // // // //                         hintText: 'Name',
// // // // // //                         validator: (value) {
// // // // // //                           if (value == null || value.trim().isEmpty) {
// // // // // //                             return 'Name is required';
// // // // // //                           }
// // // // // //                           return null;
// // // // // //                         },
// // // // // //                         suffixIcon: Icons.person,
// // // // // //                         onSuffixIconPressed: () {
// // // // // //                           // Logic to open contacts (not implemented for now)
// // // // // //                         },
// // // // // //                       ),
// // // // // //                       const SizedBox(height: 30),
// // // // // //                       // Email field
// // // // // //                       NewChatTextField(
// // // // // //                         controller: emailController,
// // // // // //                         hintText: 'Email',
// // // // // //                         keyboardType: TextInputType.emailAddress,
// // // // // //                         validator: (value) {
// // // // // //                           if (value == null || value.trim().isEmpty) {
// // // // // //                             return 'Email is required';
// // // // // //                           }
// // // // // //                           return null;
// // // // // //                         },
// // // // // //                         suffixIcon: Icons.email,
// // // // // //                         onSuffixIconPressed: () {
// // // // // //                           // Logic for email action (not implemented for now)
// // // // // //                         },
// // // // // //                       ),
// // // // // //                       const SizedBox(height: 16),
// // // // // //                       // Display error message from ViewModel (if any)
// // // // // //                       if (viewModel.errorMessage != null)
// // // // // //                         Padding(
// // // // // //                           padding: const EdgeInsets.only(top: 8.0),
// // // // // //                           child: Text(
// // // // // //                             viewModel.errorMessage!,
// // // // // //                             style: const TextStyle(color: Colors.red),
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                       const SizedBox(height: 20),
// // // // // //                       CreateChatButton(
// // // // // //                         viewModel: viewModel,
// // // // // //                         formKey: _formKey,
// // // // // //                         nameController: nameController,
// // // // // //                         selectedImage: _selectedImage,
// // // // // //                       ),
// // // // // //                       const SizedBox(height: 16),
// // // // // //                     ],
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ),
// // // // // //           );
// // // // // //         },
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // import 'dart:io';
// // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/create_chat_button.dart';
// // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/custom_camera_button.dart';
// // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/custom_circle_avatar.dart';
// // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/new_chat_text_field.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:image_picker/image_picker.dart';
// // // // // import 'package:provider/provider.dart';

// // // // // class NewChatView extends StatefulWidget {
// // // // //   const NewChatView({super.key});

// // // // //   @override
// // // // //   _NewChatViewState createState() => _NewChatViewState();
// // // // // }

// // // // // class _NewChatViewState extends State<NewChatView> {
// // // // //   File? _selectedImage;
// // // // //   final _formKey = GlobalKey<FormState>();
// // // // //   final TextEditingController _nameController = TextEditingController();
// // // // //   final TextEditingController _emailController = TextEditingController();

// // // // //   Future<void> _pickImage() async {
// // // // //     final picker = ImagePicker();
// // // // //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

// // // // //     if (pickedFile != null) {
// // // // //       setState(() {
// // // // //         _selectedImage = File(pickedFile.path);
// // // // //       });
// // // // //     }
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return ChangeNotifierProvider(
// // // // //       create: (context) => ChatViewModel(ChatRepository()),
// // // // //       child: Consumer<ChatViewModel>(
// // // // //         builder: (context, viewModel, child) {
// // // // //           return Scaffold(
// // // // //             resizeToAvoidBottomInset: true,
// // // // //             backgroundColor: Colors.white,
// // // // //             appBar: AppBar(
// // // // //               iconTheme: const IconThemeData(color: Colors.white),
// // // // //               backgroundColor: AppColors.primaryColor,
// // // // //               elevation: 0,
// // // // //               title: const Text(
// // // // //                 'New Chat',
// // // // //                 style: TextStyle(
// // // // //                   fontSize: 25,
// // // // //                   fontWeight: FontWeight.bold,
// // // // //                   color: Colors.white,
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //             body: Padding(
// // // // //               padding: const EdgeInsets.all(16.0),
// // // // //               child: Form(
// // // // //                 key: _formKey,
// // // // //                 child: SingleChildScrollView(
// // // // //                   physics: const BouncingScrollPhysics(),
// // // // //                   child: Column(
// // // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                     children: [
// // // // //                       Center(
// // // // //                         child: Stack(
// // // // //                           children: [
// // // // //                             CustomCircleAvatar(selectedImage: _selectedImage),
// // // // //                             CustomCameraButton(onTap: _pickImage),
// // // // //                           ],
// // // // //                         ),
// // // // //                       ),
// // // // //                       const SizedBox(height: 50),
// // // // //                       NewChatTextField(
// // // // //                         controller: _nameController,
// // // // //                         hintText: 'Name',
// // // // //                         validator: (value) {
// // // // //                           if (value == null || value.trim().isEmpty) {
// // // // //                             return 'Name is required';
// // // // //                           }
// // // // //                           return null;
// // // // //                         },
// // // // //                         suffixIcon: Icons.person,
// // // // //                       ),
// // // // //                       const SizedBox(height: 30),
// // // // //                       NewChatTextField(
// // // // //                         controller: _emailController,
// // // // //                         hintText: 'Email',
// // // // //                         keyboardType: TextInputType.emailAddress,
// // // // //                         validator: (value) {
// // // // //                           if (value == null || value.trim().isEmpty) {
// // // // //                             return 'Email is required';
// // // // //                           }
// // // // //                           return null;
// // // // //                         },
// // // // //                         suffixIcon: Icons.email,
// // // // //                       ),
// // // // //                       if (viewModel.errorMessage != null)
// // // // //                         Padding(
// // // // //                           padding: const EdgeInsets.only(top: 8.0),
// // // // //                           child: Text(
// // // // //                             viewModel.errorMessage!,
// // // // //                             style: const TextStyle(color: Colors.red),
// // // // //                           ),
// // // // //                         ),
// // // // //                       const SizedBox(height: 20),
// // // // //                       CreateChatButton(
// // // // //                         viewModel: viewModel,
// // // // //                         formKey: _formKey,
// // // // //                         nameController: _nameController,
// // // // //                         emailController: _emailController,
// // // // //                         selectedImage: _selectedImage,
// // // // //                       ),
// // // // //                       const SizedBox(height: 16),
// // // // //                     ],
// // // // //                   ),
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //           );
// // // // //         },
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // import 'dart:io';
// // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // import 'package:attendance_app/features/chats/presentation/views/widgets/custom_camera_button.dart';
// // // // import 'package:attendance_app/features/chats/presentation/views/widgets/custom_circle_avatar.dart';
// // // // import 'package:attendance_app/features/chats/presentation/views/widgets/new_chat_text_field.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:image_picker/image_picker.dart';
// // // // import 'package:provider/provider.dart';

// // // // class NewChatView extends StatefulWidget {
// // // //   const NewChatView({super.key});

// // // //   @override
// // // //   _NewChatViewState createState() => _NewChatViewState();
// // // // }

// // // // class _NewChatViewState extends State<NewChatView> {
// // // //   File? _selectedImage;
// // // //   final _formKey = GlobalKey<FormState>();
// // // //   final TextEditingController _nameController = TextEditingController();
// // // //   final TextEditingController _emailController = TextEditingController();

// // // //   Future<void> _pickImage() async {
// // // //     final picker = ImagePicker();
// // // //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

// // // //     if (pickedFile != null) {
// // // //       setState(() {
// // // //         _selectedImage = File(pickedFile.path);
// // // //       });
// // // //     }
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return ChangeNotifierProvider(
// // // //       create: (context) => ChatViewModel(ChatRepository()),
// // // //       child: Consumer<ChatViewModel>(
// // // //         builder: (context, viewModel, child) {
// // // //           return Scaffold(
// // // //             resizeToAvoidBottomInset: true,
// // // //             backgroundColor: Colors.white,
// // // //             appBar: AppBar(
// // // //               iconTheme: const IconThemeData(color: Colors.white),
// // // //               backgroundColor: AppColors.primaryColor,
// // // //               elevation: 0,
// // // //               title: const Text(
// // // //                 'New Chat',
// // // //                 style: TextStyle(
// // // //                   fontSize: 25,
// // // //                   fontWeight: FontWeight.bold,
// // // //                   color: Colors.white,
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //             body: Padding(
// // // //               padding: const EdgeInsets.all(16.0),
// // // //               child: Form(
// // // //                 key: _formKey,
// // // //                 child: SingleChildScrollView(
// // // //                   physics: const BouncingScrollPhysics(),
// // // //                   child: Column(
// // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // //                     children: [
// // // //                       Center(
// // // //                         child: Stack(
// // // //                           children: [
// // // //                             CustomCircleAvatar(selectedImage: _selectedImage),
// // // //                             CustomCameraButton(onTap: _pickImage),
// // // //                           ],
// // // //                         ),
// // // //                       ),
// // // //                       const SizedBox(height: 50),
// // // //                       NewChatTextField(
// // // //                         controller: _nameController,
// // // //                         hintText: 'Name',
// // // //                         validator: (value) {
// // // //                           if (value == null || value.trim().isEmpty) {
// // // //                             return 'Name is required';
// // // //                           }
// // // //                           return null;
// // // //                         },
// // // //                         suffixIcon: Icons.person,
// // // //                       ),
// // // //                       const SizedBox(height: 30),
// // // //                       NewChatTextField(
// // // //                         controller: _emailController,
// // // //                         hintText: 'Email',
// // // //                         keyboardType: TextInputType.emailAddress,
// // // //                         validator: (value) {
// // // //                           if (value == null || value.trim().isEmpty) {
// // // //                             return 'Email is required';
// // // //                           }
// // // //                           return null;
// // // //                         },
// // // //                         suffixIcon: Icons.email,
// // // //                       ),
// // // //                       if (viewModel.errorMessage != null)
// // // //                         Padding(
// // // //                           padding: const EdgeInsets.only(top: 8.0),
// // // //                           child: Text(
// // // //                             viewModel.errorMessage!,
// // // //                             style: const TextStyle(color: Colors.red),
// // // //                           ),
// // // //                         ),
// // // //                       const SizedBox(height: 20),
// // // //                       ElevatedButton(
// // // //                         onPressed: () {
// // // //                           if (_formKey.currentState!.validate()) {
// // // //                             viewModel.addChatWithUser(
// // // //                               _emailController.text.trim(),
// // // //                               _nameController.text.trim(),
// // // //                               _selectedImage?.path ?? 'https://via.placeholder.com/150',
// // // //                             );
// // // //                             Navigator.pop(context);
// // // //                           }
// // // //                         },
// // // //                         style: ElevatedButton.styleFrom(
// // // //                           backgroundColor: AppColors.primaryColor,
// // // //                           padding: const EdgeInsets.symmetric(vertical: 15),
// // // //                           shape: RoundedRectangleBorder(
// // // //                             borderRadius: BorderRadius.circular(10),
// // // //                           ),
// // // //                         ),
// // // //                         child: const Center(
// // // //                           child: Text(
// // // //                             'Create Chat',
// // // //                             style: TextStyle(
// // // //                               fontSize: 18,
// // // //                               fontWeight: FontWeight.bold,
// // // //                               color: Colors.white,
// // // //                             ),
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                       const SizedBox(height: 16),
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //           );
// // // //         },
// // // //       ),
// // // //     );
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _nameController.dispose();
// // // //     _emailController.dispose();
// // // //     super.dispose();
// // // //   }
// // // // }

// // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:provider/provider.dart';

// // // class NewChatView extends StatefulWidget {
// // //   const NewChatView({super.key});

// // //   @override
// // //   _NewChatViewState createState() => _NewChatViewState();
// // // }

// // // class _NewChatViewState extends State<NewChatView> {
// // //   final _formKey = GlobalKey<FormState>();
// // //   final _nameController = TextEditingController();
// // //   final _emailController = TextEditingController();

// // //   @override
// // //   void dispose() {
// // //     _nameController.dispose();
// // //     _emailController.dispose();
// // //     super.dispose();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return ChangeNotifierProvider(
// // //       create: (context) => ChatViewModel(ChatRepository()),
// // //       child: Consumer<ChatViewModel>(
// // //         builder: (context, viewModel, child) {
// // //           return Scaffold(
// // //             appBar: AppBar(
// // //               title: const Text(
// // //                 'New Chat',
// // //                 style: TextStyle(
// // //                   fontSize: 25,
// // //                   fontWeight: FontWeight.bold,
// // //                   color: Colors.white,
// // //                 ),
// // //               ),
// // //               elevation: 0,
// // //             ),
// // //             body: Padding(
// // //               padding: const EdgeInsets.all(16.0),
// // //               child: Form(
// // //                 key: _formKey,
// // //                 child: Column(
// // //                   children: [
// // //                     GestureDetector(
// // //                       onTap: () {
// // //                         // مش هنحتاج onTap لأن الصورة هتتغير تلقائيًا
// // //                       },
// // //                       child: CircleAvatar(
// // //                         radius: 50,
// // //                         backgroundColor: AppColors.primaryColor,
// // //                         backgroundImage: viewModel.avatarUrl != null
// // //                             ? NetworkImage(viewModel.avatarUrl!)
// // //                             : null,
// // //                         child: viewModel.avatarUrl == null
// // //                             ? const Icon(
// // //                                 Icons.person,
// // //                                 size: 50,
// // //                                 color: Colors.white,
// // //                               )
// // //                             : null,
// // //                       ),
// // //                     ),
// // //                     const SizedBox(height: 20),
// // //                     TextFormField(
// // //                       cursorColor: AppColors.primaryColor,
// // //                       controller: _nameController,
// // //                       decoration: const InputDecoration(
// // //                         labelText: 'Name',
// // //                         labelStyle: TextStyle(
// // //                           color: AppColors.primaryColor,
// // //                         ),
// // //                         border: OutlineInputBorder(),
// // //                         focusedBorder: OutlineInputBorder(
// // //                           borderSide: BorderSide(
// // //                             color: AppColors.primaryColor,
// // //                             width: 2,
// // //                           ),
// // //                         ),
// // //                         prefixIcon: Icon(Icons.person),
// // //                       ),
// // //                       validator: (value) {
// // //                         if (value == null || value.trim().isEmpty) {
// // //                           return 'Please enter a name';
// // //                         }
// // //                         return null;
// // //                       },
// // //                     ),
// // //                     const SizedBox(height: 20),
// // //                     TextFormField(
// // //                       cursorColor: AppColors.primaryColor,
// // //                       controller: _emailController,
// // //                       decoration: const InputDecoration(
// // //                         labelText: 'Email',
// // //                         labelStyle: TextStyle(
// // //                           color: AppColors.primaryColor,
// // //                         ),
// // //                         border: OutlineInputBorder(),
// // //                         focusedBorder: OutlineInputBorder(
// // //                           borderSide: BorderSide(
// // //                             color: AppColors.primaryColor,
// // //                             width: 2,
// // //                           ),
// // //                         ),
// // //                         prefixIcon: Icon(Icons.email),
// // //                       ),
// // //                       validator: (value) {
// // //                         if (value == null || value.trim().isEmpty) {
// // //                           return 'Please enter an email';
// // //                         }
// // //                         if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
// // //                             .hasMatch(value)) {
// // //                           return 'Please enter a valid email';
// // //                         }
// // //                         return null;
// // //                       },
// // //                       onChanged: (value) {
// // //                         // استدعاء fetchUserByEmail لما الإيميل يتغير
// // //                         viewModel.fetchUserByEmail(value.trim());
// // //                       },
// // //                     ),
// // //                     const SizedBox(height: 20),
// // //                     ElevatedButton(
// // //                       onPressed: () async {
// // //                         if (_formKey.currentState!.validate()) {
// // //                           await viewModel.addChatWithUser(
// // //                             _emailController.text.trim(),
// // //                             _nameController.text.trim(),
// // //                             viewModel.avatarUrl ?? '',
// // //                           );
// // //                           if (viewModel.errorMessage == null) {
// // //                             Navigator.pop(context);
// // //                           } else {
// // //                             ScaffoldMessenger.of(context).showSnackBar(
// // //                               SnackBar(content: Text(viewModel.errorMessage!)),
// // //                             );
// // //                           }
// // //                         }
// // //                       },
// // //                       style: ElevatedButton.styleFrom(
// // //                         backgroundColor: AppColors.primaryColor,
// // //                         padding: const EdgeInsets.symmetric(
// // //                             horizontal: 50, vertical: 15),
// // //                       ),
// // //                       child: const Text(
// // //                         'Start Chat',
// // //                         style: TextStyle(
// // //                           fontSize: 18,
// // //                           color: Colors.white,
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:attendance_app/core/utils/app_colors.dart';
// // import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';

// // class NewChatView extends StatefulWidget {
// //   const NewChatView({super.key});

// //   @override
// //   _NewChatViewState createState() => _NewChatViewState();
// // }

// // class _NewChatViewState extends State<NewChatView> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _nameController = TextEditingController();
// //   final _emailController = TextEditingController();

// //   @override
// //   void dispose() {
// //     _nameController.dispose();
// //     _emailController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return ChangeNotifierProvider(
// //       create: (context) => ChatViewModel(ChatRepository()),
// //       child: Consumer<ChatViewModel>(
// //         builder: (context, viewModel, child) {
// //           return Scaffold(
// //             appBar: AppBar(
// //               title: const Text(
// //                 'New Chat',
// //                 style: TextStyle(
// //                   fontSize: 25,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.white,
// //                 ),
// //               ),
// //               elevation: 0,
// //             ),
// //             body: Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: Form(
// //                 key: _formKey,
// //                 child: Column(
// //                   children: [
// //                     CircleAvatar(
// //                       radius: 50,
// //                       backgroundColor: AppColors.primaryColor,
// //                       child: viewModel.avatarUrl != null
// //                           ? ClipOval(
// //                               child: Image.network(
// //                                 viewModel.avatarUrl!,
// //                                 width: 100,
// //                                 height: 100,
// //                                 fit: BoxFit.cover,
// //                                 errorBuilder: (context, error, stackTrace) {
// //                                   print('Error loading avatar: $error'); // تصحيح
// //                                   return const Icon(
// //                                     Icons.person,
// //                                     size: 50,
// //                                     color: Colors.white,
// //                                   );
// //                                 },
// //                               ),
// //                             )
// //                           : const Icon(
// //                               Icons.person,
// //                               size: 50,
// //                               color: Colors.white,
// //                             ),
// //                     ),
// //                     const SizedBox(height: 20),
// //                     TextFormField(
// //                       controller: _nameController,
// //                       decoration: const InputDecoration(
// //                         labelText: 'Name',
// //                         border: OutlineInputBorder(),
// //                         prefixIcon: Icon(Icons.person),
// //                       ),
// //                       validator: (value) {
// //                         if (value == null || value.trim().isEmpty) {
// //                           return 'Please enter a name';
// //                         }
// //                         return null;
// //                       },
// //                     ),
// //                     const SizedBox(height: 20),
// //                     TextFormField(
// //                       controller: _emailController,
// //                       decoration: const InputDecoration(
// //                         labelText: 'Email',
// //                         border: OutlineInputBorder(),
// //                         prefixIcon: Icon(Icons.email),
// //                       ),
// //                       validator: (value) {
// //                         if (value == null || value.trim().isEmpty) {
// //                           return 'Please enter an email';
// //                         }
// //                         if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
// //                             .hasMatch(value)) {
// //                           return 'Please enter a valid email';
// //                         }
// //                         return null;
// //                       },
// //                       onChanged: (value) {
// //                         viewModel.fetchUserByEmail(value.trim());
// //                       },
// //                     ),
// //                     const SizedBox(height: 20),
// //                     ElevatedButton(
// //                       onPressed: () async {
// //                         if (_formKey.currentState!.validate()) {
// //                           await viewModel.addChatWithUser(
// //                             _emailController.text.trim(),
// //                             _nameController.text.trim(),
// //                             viewModel.avatarUrl ?? '',
// //                           );
// //                           if (viewModel.errorMessage == null) {
// //                             Navigator.pop(context);
// //                           } else {
// //                             ScaffoldMessenger.of(context).showSnackBar(
// //                               SnackBar(
// //                                   content: Text(viewModel.errorMessage!)),
// //                             );
// //                           }
// //                         }
// //                       },
// //                       style: ElevatedButton.styleFrom(
// //                         backgroundColor: AppColors.primaryColor,
// //                         padding: const EdgeInsets.symmetric(
// //                             horizontal: 50, vertical: 15),
// //                       ),
// //                       child: const Text(
// //                         'Start Chat',
// //                         style: TextStyle(
// //                           fontSize: 18,
// //                           color: Colors.white,
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class NewChatView extends StatefulWidget {
//   const NewChatView({super.key});

//   @override
//   _NewChatViewState createState() => _NewChatViewState();
// }

// class _NewChatViewState extends State<NewChatView> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ChatViewModel(ChatRepository()),
//       child: Consumer<ChatViewModel>(
//         builder: (context, viewModel, child) {
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: AppColors.primaryColor,
//               title: const Text(
//                 'New Chat',
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               elevation: 0,
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundColor: AppColors.primaryColor,
//                       child: viewModel.avatarUrl != null &&
//                               viewModel.avatarUrl!.isNotEmpty
//                           ? ClipOval(
//                               child: Image.network(
//                                 viewModel.avatarUrl!,
//                                 width: 100,
//                                 height: 100,
//                                 fit: BoxFit.cover,
//                                 errorBuilder: (context, error, stackTrace) {
//                                   print(
//                                       'Error loading avatar in NewChatView: $error');
//                                   return const Icon(
//                                     Icons.person,
//                                     size: 50,
//                                     color: Colors.white,
//                                   );
//                                 },
//                               ),
//                             )
//                           : const Icon(
//                               Icons.person,
//                               size: 50,
//                               color: Colors.white,
//                             ),
//                     ),
//                     const SizedBox(height: 20),
//                     TextFormField(
//                       cursorColor: AppColors.primaryColor,
//                       controller: _nameController,
//                       decoration: const InputDecoration(
//                         labelText: 'Name',
//                         labelStyle: TextStyle(
//                           color: AppColors.primaryColor,
//                         ),
//                         border: OutlineInputBorder(),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: AppColors.primaryColor,
//                             width: 2,
//                           ),
//                         ),
//                         prefixIcon: Icon(
//                           Icons.person,
//                           color: AppColors.primaryColor,
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return 'Please enter a name';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     TextFormField(
//                       cursorColor: AppColors.primaryColor,
//                       controller: _emailController,
//                       decoration: const InputDecoration(
//                         labelText: 'Email',
//                         labelStyle: TextStyle(
//                           color: AppColors.primaryColor,
//                         ),
//                         border: OutlineInputBorder(),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: AppColors.primaryColor,
//                             width: 2,
//                           ),
//                         ),
//                         prefixIcon: Icon(
//                           Icons.email,
//                           color: AppColors.primaryColor,
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return 'Please enter an email';
//                         }
//                         if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
//                             .hasMatch(value)) {
//                           return 'Please enter a valid email';
//                         }
//                         return null;
//                       },
//                       onChanged: (value) {
//                         viewModel.fetchUserByEmail(value.trim());
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () async {
//                         if (_formKey.currentState!.validate()) {
//                           final viewModel = Provider.of<ChatViewModel>(context,
//                               listen: false);
//                           final email = _emailController.text.trim();
//                           // التحقق إذا كان فيه محادثة موجودة بالإيميل ده
//                           final chatExists =
//                               await viewModel.checkIfChatExists(email);
//                           print(
//                               'Chat exists for email $email: $chatExists'); // تسجيل للتحقق
//                           if (chatExists) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text(
//                                     'A chat with this email already exists.'),
//                               ),
//                             );
//                             return;
//                           }
//                           // إضافة المحادثة لو مافيش تكرار
//                           await viewModel.addChatWithUser(
//                             email,
//                             _nameController.text.trim(),
//                             viewModel.avatarUrl ?? '',
//                           );
//                           if (viewModel.errorMessage == null) {
//                             Navigator.pop(context);
//                           } else {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text(
//                                   viewModel.errorMessage!,
//                                 ),
//                               ),
//                             );
//                           }
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.primaryColor,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 50, vertical: 15),
//                       ),
//                       child: const Text(
//                         'Start Chat',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewChatView extends StatefulWidget {
  const NewChatView({super.key});

  @override
  _NewChatViewState createState() => _NewChatViewState();
}

class _NewChatViewState extends State<NewChatView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatViewModel(ChatRepository()),
      child: Consumer<ChatViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              title: const Text(
                'New Chat',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.primaryColor,
                      child: viewModel.avatarUrl != null &&
                              viewModel.avatarUrl!.isNotEmpty
                          ? ClipOval(
                              child: Image.network(
                                viewModel.avatarUrl!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  print(
                                      'خطأ في تحميل الصورة في NewChatView: $error');
                                  return const Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Colors.white,
                                  );
                                },
                              ),
                            )
                          : const Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.white,
                            ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      cursorColor: AppColors.primaryColor,
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          color: AppColors.primaryColor,
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                            width: 2,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      cursorColor: AppColors.primaryColor,
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: AppColors.primaryColor,
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                            width: 2,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter the email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        viewModel.fetchUserByEmail(value.trim());
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final viewModel = Provider.of<ChatViewModel>(context,
                              listen: false);
                          final email = _emailController.text.trim();

                          try {
                            // إضافة المحادثة مباشرة بدون التحقق من التكرار هنا
                            // لأن التحقق بيحصل في addChatWithUser
                            await viewModel.addChatWithUser(
                              email,
                              _nameController.text.trim(),
                              viewModel.avatarUrl ?? '',
                            );

                            if (viewModel.errorMessage == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Chat added successfully'),
                                ),
                              );
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    viewModel.errorMessage!,
                                  ),
                                ),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Failed to add chat: $e'),
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                      ),
                      child: const Text(
                        'Start Chat',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
