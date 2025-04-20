// // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// // // // // import 'package:cached_network_image/cached_network_image.dart';
// // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // import 'package:flutter/material.dart';

// // // // // class UserProfileView extends StatefulWidget {
// // // // //   const UserProfileView({super.key});

// // // // //   @override
// // // // //   _UserProfileViewState createState() => _UserProfileViewState();
// // // // // }

// // // // // class _UserProfileViewState extends State<UserProfileView> {
// // // // //   final TextEditingController _userNameController = TextEditingController();
// // // // //   final TextEditingController _userEmailController = TextEditingController();
// // // // //   final _formKey = GlobalKey<FormState>();
// // // // //   String? _avatarUrl = 'https://via.placeholder.com/150';
// // // // //   bool _isLoading = false;

// // // // //   @override
// // // // //   void initState() {
// // // // //     super.initState();
// // // // //     _loadUserData();
// // // // //   }

// // // // //   Future<void> _loadUserData() async {
// // // // //     setState(() => _isLoading = true);
// // // // //     final user = FirebaseAuth.instance.currentUser;
// // // // //     if (user != null) {
// // // // //       final repo = ChatRepository();
// // // // //       final userData = await repo.getUserByEmail(user.email ?? '');
// // // // //       if (userData != null) {
// // // // //         setState(() {
// // // // //           _userNameController.text = userData['name'] ?? user.displayName ?? '';
// // // // //           _userEmailController.text = user.email ?? '';
// // // // //           _avatarUrl = userData['image'] ?? user.photoURL ?? _avatarUrl;
// // // // //         });
// // // // //       } else {
// // // // //         setState(() {
// // // // //           _userNameController.text = user.displayName ?? '';
// // // // //           _userEmailController.text = user.email ?? '';
// // // // //           _avatarUrl = user.photoURL ?? _avatarUrl;
// // // // //         });
// // // // //       }
// // // // //     }
// // // // //     setState(() => _isLoading = false);
// // // // //   }

// // // // //   Future<void> _addChatWithUser() async {
// // // // //     if (_formKey.currentState!.validate()) {
// // // // //       setState(() => _isLoading = true);
// // // // //       try {
// // // // //         final repo = ChatRepository();
// // // // //         await repo.addChatWithUser(
// // // // //           _userEmailController.text.trim(),
// // // // //           _userNameController.text.trim(),
// // // // //           _avatarUrl ?? '',
// // // // //         );
// // // // //         Navigator.pop(context);
// // // // //       } catch (e) {
// // // // //         ScaffoldMessenger.of(context).showSnackBar(
// // // // //           SnackBar(content: Text('Failed to add chat: $e')),
// // // // //         );
// // // // //       } finally {
// // // // //         setState(() => _isLoading = false);
// // // // //       }
// // // // //     }
// // // // //   }

// // // // //   @override
// // // // //   void dispose() {
// // // // //     _userNameController.dispose();
// // // // //     _userEmailController.dispose();
// // // // //     super.dispose();
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         title: const Text(
// // // // //           'Profile',
// // // // //           style: TextStyle(
// // // // //             color: Colors.white,
// // // // //             fontWeight: FontWeight.bold,
// // // // //           ),
// // // // //         ),
// // // // //         backgroundColor: AppColors.primaryColor,
// // // // //         elevation: 0,
// // // // //         leading: IconButton(
// // // // //           icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // //           onPressed: () => Navigator.pop(context),
// // // // //         ),
// // // // //       ),
// // // // //       body: Container(
// // // // //         decoration: const BoxDecoration(
// // // // //           // gradient: LinearGradient(
// // // // //           //   begin: Alignment.topCenter,
// // // // //           //   end: Alignment.bottomCenter,
// // // // //           //   colors: [
// // // // //           //     AppColors.primaryColor.withOpacity(0.1),
// // // // //           //     Colors.white,
// // // // //           //   ],
// // // // //           // ),
// // // // //           color: Colors.white,
// // // // //         ),
// // // // //         child: _isLoading
// // // // //             ? const Center(child: CircularProgressIndicator())
// // // // //             : Padding(
// // // // //                 padding: const EdgeInsets.all(16.0),
// // // // //                 child: Form(
// // // // //                   key: _formKey,
// // // // //                   child: ListView(
// // // // //                     children: [
// // // // //                       Center(
// // // // //                         child: Container(
// // // // //                           decoration: BoxDecoration(
// // // // //                             shape: BoxShape.circle,
// // // // //                             boxShadow: [
// // // // //                               BoxShadow(
// // // // //                                 color: Colors.black.withOpacity(0.2),
// // // // //                                 blurRadius: 8,
// // // // //                                 offset: const Offset(0, 4),
// // // // //                               ),
// // // // //                             ],
// // // // //                           ),
// // // // //                           child: CircleAvatar(
// // // // //                             radius: 60,
// // // // //                             backgroundColor: AppColors.primaryColor,
// // // // //                             child: _avatarUrl != null && _avatarUrl!.isNotEmpty
// // // // //                                 ? ClipOval(
// // // // //                                     child: CachedNetworkImage(
// // // // //                                       imageUrl: _avatarUrl!,
// // // // //                                       width: 120,
// // // // //                                       height: 120,
// // // // //                                       fit: BoxFit.cover,
// // // // //                                       placeholder: (context, url) =>
// // // // //                                           const Center(
// // // // //                                         child: CircularProgressIndicator(
// // // // //                                           color: Colors.white,
// // // // //                                         ),
// // // // //                                       ),
// // // // //                                       errorWidget: (context, url, error) {
// // // // //                                         print(
// // // // //                                             'Error loading image: $error, URL: $url');
// // // // //                                         return const Icon(
// // // // //                                           Icons.person,
// // // // //                                           size: 60,
// // // // //                                           color: Colors.white,
// // // // //                                         );
// // // // //                                       },
// // // // //                                       fadeInDuration:
// // // // //                                           const Duration(milliseconds: 500),
// // // // //                                       errorListener: (error) {
// // // // //                                         print(
// // // // //                                             'CachedNetworkImage error: $error');
// // // // //                                       },
// // // // //                                     ),
// // // // //                                   )
// // // // //                                 : const Icon(
// // // // //                                     Icons.person,
// // // // //                                     size: 60,
// // // // //                                     color: Colors.white,
// // // // //                                   ),
// // // // //                           ),
// // // // //                         ),
// // // // //                       ),
// // // // //                       const SizedBox(height: 24),
// // // // //                       TextFormField(
// // // // //                         cursorColor: AppColors.primaryColor,
// // // // //                         controller: _userNameController,
// // // // //                         decoration: const InputDecoration(
// // // // //                           labelText: 'Name',
// // // // //                           labelStyle: TextStyle(
// // // // //                             color: AppColors.primaryColor,
// // // // //                           ),
// // // // //                           prefixIcon: Icon(
// // // // //                             Icons.person,
// // // // //                             color: AppColors.primaryColor,
// // // // //                           ),
// // // // //                           border: OutlineInputBorder(),
// // // // //                           focusedBorder: OutlineInputBorder(
// // // // //                             borderSide: BorderSide(
// // // // //                               color: AppColors.primaryColor,
// // // // //                               width: 2,
// // // // //                             ),
// // // // //                           ),
// // // // //                           filled: true,
// // // // //                           fillColor: Colors.white,
// // // // //                           contentPadding: EdgeInsets.symmetric(
// // // // //                               vertical: 16, horizontal: 12),
// // // // //                         ),
// // // // //                         validator: (value) {
// // // // //                           if (value == null || value.trim().isEmpty) {
// // // // //                             return 'Please enter a name';
// // // // //                           }
// // // // //                           return null;
// // // // //                         },
// // // // //                       ),
// // // // //                       const SizedBox(height: 16),
// // // // //                       TextFormField(
// // // // //                         enabled: false,
// // // // //                         controller: _userEmailController,
// // // // //                         decoration: InputDecoration(
// // // // //                           labelText: 'Email',
// // // // //                           prefixIcon: const Icon(Icons.email,
// // // // //                               color: AppColors.primaryColor),
// // // // //                           border: OutlineInputBorder(
// // // // //                             borderRadius: BorderRadius.circular(12),
// // // // //                           ),
// // // // //                           filled: true,
// // // // //                           fillColor: Colors.white,
// // // // //                           contentPadding: const EdgeInsets.symmetric(
// // // // //                               vertical: 16, horizontal: 12),
// // // // //                         ),
// // // // //                         keyboardType: TextInputType.emailAddress,
// // // // //                         validator: (value) {
// // // // //                           if (value == null || value.trim().isEmpty) {
// // // // //                             return 'Please enter an email';
// // // // //                           }
// // // // //                           if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
// // // // //                               .hasMatch(value)) {
// // // // //                             return 'Please enter a valid email';
// // // // //                           }
// // // // //                           return null;
// // // // //                         },
// // // // //                       ),
// // // // //                       const SizedBox(height: 24),
// // // // //                       ElevatedButton(
// // // // //                         onPressed: _isLoading ? null : _addChatWithUser,
// // // // //                         style: ElevatedButton.styleFrom(
// // // // //                           backgroundColor: AppColors.primaryColor,
// // // // //                           foregroundColor: Colors.white,
// // // // //                           padding: const EdgeInsets.symmetric(
// // // // //                               vertical: 16, horizontal: 24),
// // // // //                           shape: RoundedRectangleBorder(
// // // // //                             borderRadius: BorderRadius.circular(12),
// // // // //                           ),
// // // // //                           elevation: 4,
// // // // //                           shadowColor: Colors.black.withOpacity(0.3),
// // // // //                         ),
// // // // //                         child: _isLoading
// // // // //                             ? const SizedBox(
// // // // //                                 width: 24,
// // // // //                                 height: 24,
// // // // //                                 child: CircularProgressIndicator(
// // // // //                                   color: Colors.white,
// // // // //                                   strokeWidth: 2,
// // // // //                                 ),
// // // // //                               )
// // // // //                             : const Text(
// // // // //                                 'Add Chat with User',
// // // // //                                 style: TextStyle(
// // // // //                                   fontSize: 16,
// // // // //                                   fontWeight: FontWeight.bold,
// // // // //                                 ),
// // // // //                               ),
// // // // //                       ),
// // // // //                     ],
// // // // //                   ),
// // // // //                 ),
// // // // //               ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// // // // import 'package:cached_network_image/cached_network_image.dart';
// // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // import 'package:flutter/material.dart';

// // // // class UserProfileView extends StatefulWidget {
// // // //   const UserProfileView({super.key});

// // // //   @override
// // // //   _UserProfileViewState createState() => _UserProfileViewState();
// // // // }

// // // // class _UserProfileViewState extends State<UserProfileView> {
// // // //   final TextEditingController _userNameController = TextEditingController();
// // // //   final TextEditingController _userEmailController = TextEditingController();
// // // //   final _formKey = GlobalKey<FormState>();
// // // //   String? _avatarUrl;
// // // //   bool _isLoading = false;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _loadUserData();
// // // //   }

// // // //   Future<void> _loadUserData() async {
// // // //     setState(() => _isLoading = true);
// // // //     final user = FirebaseAuth.instance.currentUser;
// // // //     if (user != null) {
// // // //       final repo = ChatRepository();
// // // //       final userData = await repo.getUserByEmail(user.email ?? '');
// // // //       if (userData != null) {
// // // //         setState(() {
// // // //           _userNameController.text = userData['name'] ?? user.displayName ?? '';
// // // //           _userEmailController.text = user.email ?? '';
// // // //           _avatarUrl = userData['image'] ?? user.photoURL ?? _avatarUrl;
// // // //         });
// // // //       } else {
// // // //         setState(() {
// // // //           _userNameController.text = user.displayName ?? '';
// // // //           _userEmailController.text = user.email ?? '';
// // // //           _avatarUrl = user.photoURL ?? _avatarUrl;
// // // //         });
// // // //       }
// // // //     }
// // // //     setState(() => _isLoading = false);
// // // //   }

// // // //   Future<void> _saveChanges() async {
// // // //     if (_formKey.currentState!.validate()) {
// // // //       setState(() => _isLoading = true);
// // // //       try {
// // // //         final user = FirebaseAuth.instance.currentUser;
// // // //         if (user != null) {
// // // //           final repo = ChatRepository();
// // // //           // Update the name in the users collection using UID
// // // //           await repo.updateUserName(_userNameController.text.trim());

// // // //           // Update the displayName in Firebase Authentication (optional)
// // // //           await user.updateDisplayName(_userNameController.text.trim());

// // // //           // Show success message
// // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // //             const SnackBar(
// // // //               content: Text('Name updated successfully'),
// // // //               backgroundColor: Colors.green,
// // // //             ),
// // // //           );

// // // //           // Go back to the previous screen
// // // //           Navigator.pop(context);
// // // //         }
// // // //       } catch (e) {
// // // //         ScaffoldMessenger.of(context).showSnackBar(
// // // //           SnackBar(content: Text('Failed to update name: $e')),
// // // //         );
// // // //       } finally {
// // // //         setState(() => _isLoading = false);
// // // //       }
// // // //     }
// // // //   }

// // // //   Future<void> _addChatWithUser() async {
// // // //     if (_formKey.currentState!.validate()) {
// // // //       setState(() => _isLoading = true);
// // // //       try {
// // // //         final repo = ChatRepository();
// // // //         await repo.addChatWithUser(
// // // //           _userEmailController.text.trim(),
// // // //           _userNameController.text.trim(),
// // // //           _avatarUrl ?? '',
// // // //         );
// // // //         Navigator.pop(context);
// // // //       } catch (e) {
// // // //         ScaffoldMessenger.of(context).showSnackBar(
// // // //           SnackBar(content: Text('Failed to add chat: $e')),
// // // //         );
// // // //       } finally {
// // // //         setState(() => _isLoading = false);
// // // //       }
// // // //     }
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _userNameController.dispose();
// // // //     _userEmailController.dispose();
// // // //     super.dispose();
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: const Text(
// // // //           'Profile',
// // // //           style: TextStyle(
// // // //             color: Colors.white,
// // // //             fontWeight: FontWeight.bold,
// // // //           ),
// // // //         ),
// // // //         backgroundColor: AppColors.primaryColor,
// // // //         elevation: 0,
// // // //         leading: IconButton(
// // // //           icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // //           onPressed: () => Navigator.pop(context),
// // // //         ),
// // // //         actions: [
// // // //           IconButton(
// // // //             icon: const Icon(Icons.check, color: Colors.white),
// // // //             onPressed: _isLoading ? null : _saveChanges,
// // // //           ),
// // // //         ],
// // // //       ),
// // // //       body: Container(
// // // //         decoration: const BoxDecoration(
// // // //           color: Colors.white,
// // // //         ),
// // // //         child: _isLoading
// // // //             ? const Center(child: CircularProgressIndicator())
// // // //             : Padding(
// // // //                 padding: const EdgeInsets.all(16.0),
// // // //                 child: Form(
// // // //                   key: _formKey,
// // // //                   child: ListView(
// // // //                     children: [
// // // //                       Center(
// // // //                         child: Container(
// // // //                           decoration: BoxDecoration(
// // // //                             shape: BoxShape.circle,
// // // //                             boxShadow: [
// // // //                               BoxShadow(
// // // //                                 color: Colors.black.withOpacity(0.2),
// // // //                                 blurRadius: 8,
// // // //                                 offset: const Offset(0, 4),
// // // //                               ),
// // // //                             ],
// // // //                           ),
// // // //                           child: CircleAvatar(
// // // //                             radius: 60,
// // // //                             backgroundColor: AppColors.primaryColor,
// // // //                             child: _avatarUrl != null && _avatarUrl!.isNotEmpty
// // // //                                 ? ClipOval(
// // // //                                     child: CachedNetworkImage(
// // // //                                       imageUrl: _avatarUrl!,
// // // //                                       width: 120,
// // // //                                       height: 120,
// // // //                                       fit: BoxFit.cover,
// // // //                                       placeholder: (context, url) =>
// // // //                                           const Center(
// // // //                                         child: CircularProgressIndicator(
// // // //                                           color: Colors.white,
// // // //                                         ),
// // // //                                       ),
// // // //                                       errorWidget: (context, url, error) {
// // // //                                         print(
// // // //                                             'Error loading image: $error, URL: $url');
// // // //                                         return const Icon(
// // // //                                           Icons.person,
// // // //                                           size: 60,
// // // //                                           color: Colors.white,
// // // //                                         );
// // // //                                       },
// // // //                                       fadeInDuration:
// // // //                                           const Duration(milliseconds: 500),
// // // //                                       errorListener: (error) {
// // // //                                         print(
// // // //                                             'CachedNetworkImage error: $error');
// // // //                                       },
// // // //                                     ),
// // // //                                   )
// // // //                                 : const Icon(
// // // //                                     Icons.person,
// // // //                                     size: 60,
// // // //                                     color: Colors.white,
// // // //                                   ),
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                       const SizedBox(height: 24),
// // // //                       TextFormField(
// // // //                         cursorColor: AppColors.primaryColor,
// // // //                         controller: _userNameController,
// // // //                         decoration: const InputDecoration(
// // // //                           labelText: 'Name',
// // // //                           labelStyle: TextStyle(
// // // //                             color: AppColors.primaryColor,
// // // //                           ),
// // // //                           prefixIcon: Icon(
// // // //                             Icons.person,
// // // //                             color: AppColors.primaryColor,
// // // //                           ),
// // // //                           border: OutlineInputBorder(),
// // // //                           focusedBorder: OutlineInputBorder(
// // // //                             borderSide: BorderSide(
// // // //                               color: AppColors.primaryColor,
// // // //                               width: 2,
// // // //                             ),
// // // //                           ),
// // // //                           filled: true,
// // // //                           fillColor: Colors.white,
// // // //                           contentPadding: EdgeInsets.symmetric(
// // // //                               vertical: 16, horizontal: 12),
// // // //                         ),
// // // //                         validator: (value) {
// // // //                           if (value == null || value.trim().isEmpty) {
// // // //                             return 'Please enter a name';
// // // //                           }
// // // //                           return null;
// // // //                         },
// // // //                       ),
// // // //                       const SizedBox(height: 16),
// // // //                       TextFormField(
// // // //                         enabled: false,
// // // //                         controller: _userEmailController,
// // // //                         decoration: InputDecoration(
// // // //                           labelText: 'Email',
// // // //                           prefixIcon: const Icon(Icons.email,
// // // //                               color: AppColors.primaryColor),
// // // //                           border: OutlineInputBorder(
// // // //                             borderRadius: BorderRadius.circular(12),
// // // //                           ),
// // // //                           filled: true,
// // // //                           fillColor: Colors.white,
// // // //                           contentPadding: const EdgeInsets.symmetric(
// // // //                               vertical: 16, horizontal: 12),
// // // //                         ),
// // // //                         keyboardType: TextInputType.emailAddress,
// // // //                         validator: (value) {
// // // //                           if (value == null || value.trim().isEmpty) {
// // // //                             return 'Please enter an email';
// // // //                           }
// // // //                           if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
// // // //                               .hasMatch(value)) {
// // // //                             return 'Please enter a valid email';
// // // //                           }
// // // //                           return null;
// // // //                         },
// // // //                       ),
// // // //                       const SizedBox(height: 24),
// // // //                       ElevatedButton(
// // // //                         onPressed: _isLoading ? null : _addChatWithUser,
// // // //                         style: ElevatedButton.styleFrom(
// // // //                           backgroundColor: AppColors.primaryColor,
// // // //                           foregroundColor: Colors.white,
// // // //                           padding: const EdgeInsets.symmetric(
// // // //                               vertical: 16, horizontal: 24),
// // // //                           shape: RoundedRectangleBorder(
// // // //                             borderRadius: BorderRadius.circular(12),
// // // //                           ),
// // // //                           elevation: 4,
// // // //                           shadowColor: Colors.black.withOpacity(0.3),
// // // //                         ),
// // // //                         child: _isLoading
// // // //                             ? const SizedBox(
// // // //                                 width: 24,
// // // //                                 height: 24,
// // // //                                 child: CircularProgressIndicator(
// // // //                                   color: Colors.white,
// // // //                                   strokeWidth: 2,
// // // //                                 ),
// // // //                               )
// // // //                             : const Text(
// // // //                                 'Add Chat with User',
// // // //                                 style: TextStyle(
// // // //                                   fontSize: 16,
// // // //                                   fontWeight: FontWeight.bold,
// // // //                                 ),
// // // //                               ),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'dart:io';
// // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// // // import 'package:cached_network_image/cached_network_image.dart';
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:firebase_storage/firebase_storage.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:image_picker/image_picker.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';

// // // class UserProfileView extends StatefulWidget {
// // //   const UserProfileView({super.key});

// // //   @override
// // //   _UserProfileViewState createState() => _UserProfileViewState();
// // // }

// // // class _UserProfileViewState extends State<UserProfileView> {
// // //   final TextEditingController _userNameController = TextEditingController();
// // //   final TextEditingController _userEmailController = TextEditingController();
// // //   final _formKey = GlobalKey<FormState>();
// // //   String? _avatarUrl;
// // //   bool _isLoading = false;
// // //   File? _selectedImage;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _loadUserData();
// // //   }

// // //   Future<void> _loadUserData() async {
// // //     setState(() => _isLoading = true);
// // //     final user = FirebaseAuth.instance.currentUser;
// // //     if (user != null) {
// // //       final repo = ChatRepository();
// // //       final userData = await repo.getUserByEmail(user.email ?? '');
// // //       if (userData != null) {
// // //         setState(() {
// // //           _userNameController.text = userData['name'] ?? user.displayName ?? '';
// // //           _userEmailController.text = user.email ?? '';
// // //           _avatarUrl =
// // //               userData['image']?.toString().trim() ?? user.photoURL ?? '';
// // //         });
// // //       } else {
// // //         setState(() {
// // //           _userNameController.text = user.displayName ?? '';
// // //           _userEmailController.text = user.email ?? '';
// // //           _avatarUrl = user.photoURL ?? '';
// // //         });
// // //       }
// // //     }
// // //     setState(() => _isLoading = false);
// // //   }

// // //   Future<void> _pickImage() async {
// // //     final picker = ImagePicker();
// // //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

// // //     if (pickedFile != null) {
// // //       setState(() {
// // //         _selectedImage = File(pickedFile.path);
// // //       });

// // //       // رفع الصورة فورًا بعد اختيارها
// // //       await _uploadImageToStorage();
// // //     }
// // //   }

// // //   Future<void> _uploadImageToStorage() async {
// // //     if (_selectedImage == null) return;

// // //     setState(() => _isLoading = true);
// // //     try {
// // //       final user = FirebaseAuth.instance.currentUser;
// // //       if (user == null) {
// // //         throw Exception('No user currently logged in');
// // //       }

// // //       // رفع الصورة إلى Firebase Storage
// // //       final storageRef = FirebaseStorage.instance
// // //           .ref()
// // //           .child('user_images')
// // //           .child('${user.uid}.jpg');
// // //       await storageRef.putFile(_selectedImage!);
// // //       final downloadUrl = await storageRef.getDownloadURL();

// // //       // تحديث حقل image في Firestore
// // //       await FirebaseFirestore.instance
// // //           .collection('users')
// // //           .doc(user.uid)
// // //           .update({'image': downloadUrl});

// // //       setState(() {
// // //         _avatarUrl = downloadUrl;
// // //         _selectedImage = null;
// // //       });

// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         const SnackBar(
// // //           content: Text('Profile picture updated successfully'),
// // //           backgroundColor: Colors.green,
// // //         ),
// // //       );
// // //     } catch (e) {
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         SnackBar(content: Text('Failed to update profile picture: $e')),
// // //       );
// // //     } finally {
// // //       setState(() => _isLoading = false);
// // //     }
// // //   }

// // //   Future<void> _saveChanges() async {
// // //     if (_formKey.currentState!.validate()) {
// // //       setState(() => _isLoading = true);
// // //       try {
// // //         final user = FirebaseAuth.instance.currentUser;
// // //         if (user != null) {
// // //           final repo = ChatRepository();
// // //           await repo.updateUserName(_userNameController.text.trim());

// // //           // تحديث displayName في Firebase Authentication (اختياري)
// // //           await user.updateDisplayName(_userNameController.text.trim());

// // //           ScaffoldMessenger.of(context).showSnackBar(
// // //             const SnackBar(
// // //               content: Text('Name updated successfully'),
// // //               backgroundColor: Colors.green,
// // //             ),
// // //           );

// // //           Navigator.pop(context);
// // //         }
// // //       } catch (e) {
// // //         ScaffoldMessenger.of(context).showSnackBar(
// // //           SnackBar(content: Text('Failed to update name: $e')),
// // //         );
// // //       } finally {
// // //         setState(() => _isLoading = false);
// // //       }
// // //     }
// // //   }

// // //   Future<void> _addChatWithUser() async {
// // //     if (_formKey.currentState!.validate()) {
// // //       setState(() => _isLoading = true);
// // //       try {
// // //         final repo = ChatRepository();
// // //         await repo.addChatWithUser(
// // //           _userEmailController.text.trim(),
// // //           _userNameController.text.trim(),
// // //           _avatarUrl ?? '',
// // //         );
// // //         Navigator.pop(context);
// // //       } catch (e) {
// // //         ScaffoldMessenger.of(context).showSnackBar(
// // //           SnackBar(content: Text('A chat is already exist')),
// // //         );
// // //       } finally {
// // //         setState(() => _isLoading = false);
// // //       }
// // //     }
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _userNameController.dispose();
// // //     _userEmailController.dispose();
// // //     super.dispose();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text(
// // //           'Profile',
// // //           style: TextStyle(
// // //             color: Colors.white,
// // //             fontWeight: FontWeight.bold,
// // //           ),
// // //         ),
// // //         backgroundColor: AppColors.primaryColor,
// // //         elevation: 0,
// // //         leading: IconButton(
// // //           icon: const Icon(Icons.arrow_back, color: Colors.white),
// // //           onPressed: () => Navigator.pop(context),
// // //         ),
// // //         actions: [
// // //           IconButton(
// // //             icon: const Icon(Icons.check, color: Colors.white),
// // //             onPressed: _isLoading ? null : _saveChanges,
// // //           ),
// // //         ],
// // //       ),
// // //       body: Container(
// // //         decoration: const BoxDecoration(
// // //           color: Colors.white,
// // //         ),
// // //         child: _isLoading
// // //             ? const Center(child: CircularProgressIndicator())
// // //             : Padding(
// // //                 padding: const EdgeInsets.all(16.0),
// // //                 child: Form(
// // //                   key: _formKey,
// // //                   child: ListView(
// // //                     children: [
// // //                       Center(
// // //                         child: Stack(
// // //                           children: [
// // //                             Container(
// // //                               decoration: BoxDecoration(
// // //                                 shape: BoxShape.circle,
// // //                                 boxShadow: [
// // //                                   BoxShadow(
// // //                                     color: Colors.black.withOpacity(0.2),
// // //                                     blurRadius: 8,
// // //                                     offset: const Offset(0, 4),
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                               child: CircleAvatar(
// // //                                 radius: 60,
// // //                                 backgroundColor: AppColors.primaryColor,
// // //                                 child: _selectedImage != null
// // //                                     ? ClipOval(
// // //                                         child: Image.file(
// // //                                           _selectedImage!,
// // //                                           width: 120,
// // //                                           height: 120,
// // //                                           fit: BoxFit.cover,
// // //                                         ),
// // //                                       )
// // //                                     : _avatarUrl != null &&
// // //                                             _avatarUrl!.isNotEmpty
// // //                                         ? ClipOval(
// // //                                             child: CachedNetworkImage(
// // //                                               imageUrl: _avatarUrl!,
// // //                                               width: 120,
// // //                                               height: 120,
// // //                                               fit: BoxFit.cover,
// // //                                               placeholder: (context, url) =>
// // //                                                   const Center(
// // //                                                 child:
// // //                                                     CircularProgressIndicator(
// // //                                                   color: Colors.white,
// // //                                                 ),
// // //                                               ),
// // //                                               errorWidget:
// // //                                                   (context, url, error) {
// // //                                                 print(
// // //                                                     'Error loading image: $error, URL: $url');
// // //                                                 return const Icon(
// // //                                                   Icons.person,
// // //                                                   size: 60,
// // //                                                   color: Colors.white,
// // //                                                 );
// // //                                               },
// // //                                               fadeInDuration: const Duration(
// // //                                                   milliseconds: 500),
// // //                                               errorListener: (error) {
// // //                                                 print(
// // //                                                     'CachedNetworkImage error: $error');
// // //                                               },
// // //                                             ),
// // //                                           )
// // //                                         : const Icon(
// // //                                             Icons.person,
// // //                                             size: 60,
// // //                                             color: Colors.white,
// // //                                           ),
// // //                               ),
// // //                             ),
// // //                             Positioned(
// // //                               bottom: 0,
// // //                               right: 0,
// // //                               child: GestureDetector(
// // //                                 onTap: _pickImage,
// // //                                 child: Container(
// // //                                   padding: const EdgeInsets.all(8),
// // //                                   decoration: const BoxDecoration(
// // //                                     color: AppColors.primaryColor,
// // //                                     shape: BoxShape.circle,
// // //                                   ),
// // //                                   child: const Icon(
// // //                                     Icons.camera_alt,
// // //                                     color: Colors.white,
// // //                                     size: 24,
// // //                                   ),
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                       const SizedBox(height: 24),
// // //                       TextFormField(
// // //                         cursorColor: AppColors.primaryColor,
// // //                         controller: _userNameController,
// // //                         decoration: const InputDecoration(
// // //                           labelText: 'Name',
// // //                           labelStyle: TextStyle(
// // //                             color: AppColors.primaryColor,
// // //                           ),
// // //                           prefixIcon: Icon(
// // //                             Icons.person,
// // //                             color: AppColors.primaryColor,
// // //                           ),
// // //                           border: OutlineInputBorder(),
// // //                           focusedBorder: OutlineInputBorder(
// // //                             borderSide: BorderSide(
// // //                               color: AppColors.primaryColor,
// // //                               width: 2,
// // //                             ),
// // //                           ),
// // //                           filled: true,
// // //                           fillColor: Colors.white,
// // //                           contentPadding: EdgeInsets.symmetric(
// // //                               vertical: 16, horizontal: 12),
// // //                         ),
// // //                         validator: (value) {
// // //                           if (value == null || value.trim().isEmpty) {
// // //                             return 'Please enter a name';
// // //                           }
// // //                           if (value.trim().length < 2) {
// // //                             return 'Name must be at least 2 characters long';
// // //                           }
// // //                           return null;
// // //                         },
// // //                       ),
// // //                       const SizedBox(height: 16),
// // //                       TextFormField(
// // //                         enabled: false,
// // //                         controller: _userEmailController,
// // //                         decoration: InputDecoration(
// // //                           labelText: 'Email',
// // //                           prefixIcon: const Icon(Icons.email,
// // //                               color: AppColors.primaryColor),
// // //                           border: OutlineInputBorder(
// // //                             borderRadius: BorderRadius.circular(12),
// // //                           ),
// // //                           filled: true,
// // //                           fillColor: Colors.white,
// // //                           contentPadding: const EdgeInsets.symmetric(
// // //                               vertical: 16, horizontal: 12),
// // //                         ),
// // //                         keyboardType: TextInputType.emailAddress,
// // //                         validator: (value) {
// // //                           if (value == null || value.trim().isEmpty) {
// // //                             return 'Please enter an email';
// // //                           }
// // //                           if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
// // //                               .hasMatch(value)) {
// // //                             return 'Please enter a valid email';
// // //                           }
// // //                           return null;
// // //                         },
// // //                       ),
// // //                       const SizedBox(height: 24),
// // //                       ElevatedButton(
// // //                         onPressed: _isLoading ? null : _addChatWithUser,
// // //                         style: ElevatedButton.styleFrom(
// // //                           backgroundColor: AppColors.primaryColor,
// // //                           foregroundColor: Colors.white,
// // //                           padding: const EdgeInsets.symmetric(
// // //                               vertical: 16, horizontal: 24),
// // //                           shape: RoundedRectangleBorder(
// // //                             borderRadius: BorderRadius.circular(12),
// // //                           ),
// // //                           elevation: 4,
// // //                           shadowColor: Colors.black.withOpacity(0.3),
// // //                         ),
// // //                         child: _isLoading
// // //                             ? const SizedBox(
// // //                                 width: 24,
// // //                                 height: 24,
// // //                                 child: CircularProgressIndicator(
// // //                                   color: Colors.white,
// // //                                   strokeWidth: 2,
// // //                                 ),
// // //                               )
// // //                             : const Text(
// // //                                 'Add Chat with User',
// // //                                 style: TextStyle(
// // //                                   fontSize: 16,
// // //                                   fontWeight: FontWeight.bold,
// // //                                 ),
// // //                               ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //       ),
// // //     );
// // //   }
// // // }

// import 'dart:io';
// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserProfileView extends StatefulWidget {
//   const UserProfileView({super.key});

//   @override
//   _UserProfileViewState createState() => _UserProfileViewState();
// }

// class _UserProfileViewState extends State<UserProfileView> {
//   final TextEditingController _userNameController = TextEditingController();
//   final TextEditingController _userEmailController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   String? _avatarUrl;
//   bool _isLoading = false;
//   File? _selectedImage;

//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();
//   }

//   Future<void> _loadUserData() async {
//     setState(() => _isLoading = true);
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         // جلب بيانات المستخدم باستخدام UID مباشرة
//         final docSnapshot = await FirebaseFirestore.instance
//             .collection('users')
//             .doc(user.uid)
//             .get();

//         if (docSnapshot.exists) {
//           final userData = docSnapshot.data() as Map<String, dynamic>;
//           setState(() {
//             _userNameController.text =
//                 userData['name']?.toString() ?? user.displayName ?? '';
//             _userEmailController.text = user.email ?? '';
//             _avatarUrl =
//                 userData['image']?.toString().trim() ?? user.photoURL ?? '';
//           });
//           print('User data loaded successfully: $userData');
//         } else {
//           // إذا لم تكن الوثيقة موجودة، استخدام بيانات Firebase Auth كبديل
//           setState(() {
//             _userNameController.text = user.displayName ?? '';
//             _userEmailController.text = user.email ?? '';
//             _avatarUrl = user.photoURL ?? '';
//           });
//           print('No user document found in Firestore for UID: ${user.uid}');
//         }
//       } else {
//         print('No user currently logged in');
//       }
//     } catch (e) {
//       print('Error loading user data: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to load user data: $e')),
//       );
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _selectedImage = File(pickedFile.path);
//       });

//       // رفع الصورة فورًا بعد اختيارها
//       await _uploadImageToStorage();
//     }
//   }

//   Future<void> _uploadImageToStorage() async {
//     if (_selectedImage == null) return;

//     setState(() => _isLoading = true);
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user == null) {
//         throw Exception('No user currently logged in');
//       }

//       // رفع الصورة إلى Firebase Storage
//       final storageRef = FirebaseStorage.instance
//           .ref()
//           .child('user_images')
//           .child('${user.uid}.jpg');
//       await storageRef.putFile(_selectedImage!);
//       final downloadUrl = await storageRef.getDownloadURL();

//       // تحديث حقل image في Firestore
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(user.uid)
//           .update({'image': downloadUrl});

//       setState(() {
//         _avatarUrl = downloadUrl;
//         _selectedImage = null;
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Profile picture updated successfully'),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to update profile picture: $e')),
//       );
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   Future<void> _saveChanges() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() => _isLoading = true);
//       try {
//         final user = FirebaseAuth.instance.currentUser;
//         if (user != null) {
//           final repo = ChatRepository();
//           await repo.updateUserName(_userNameController.text.trim());

//           // تحديث displayName في Firebase Authentication (اختياري)
//           await user.updateDisplayName(_userNameController.text.trim());

//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Name updated successfully'),
//               backgroundColor: Colors.green,
//             ),
//           );

//           Navigator.pop(context);
//         }
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to update name: $e')),
//         );
//       } finally {
//         setState(() => _isLoading = false);
//       }
//     }
//   }

//   Future<void> _addChatWithUser() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() => _isLoading = true);
//       try {
//         final repo = ChatRepository();
//         await repo.addChatWithUser(
//           _userEmailController.text.trim(),
//           _userNameController.text.trim(),
//           _avatarUrl ?? '',
//         );
//         Navigator.pop(context);
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('A chat is already exist')),
//         );
//       } finally {
//         setState(() => _isLoading = false);
//       }
//     }
//   }

//   @override
//   void dispose() {
//     _userNameController.dispose();
//     _userEmailController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Profile',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: AppColors.primaryColor,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.check, color: Colors.white),
//             onPressed: _isLoading ? null : _saveChanges,
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           color: Colors.white,
//         ),
//         child: _isLoading
//             ? const Center(child: CircularProgressIndicator())
//             : Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Form(
//                   key: _formKey,
//                   child: ListView(
//                     children: [
//                       Center(
//                         child: Stack(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black.withOpacity(0.2),
//                                     blurRadius: 8,
//                                     offset: const Offset(0, 4),
//                                   ),
//                                 ],
//                               ),
//                               child: CircleAvatar(
//                                 radius: 60,
//                                 backgroundColor: AppColors.primaryColor,
//                                 child: _selectedImage != null
//                                     ? ClipOval(
//                                         child: Image.file(
//                                           _selectedImage!,
//                                           width: 120,
//                                           height: 120,
//                                           fit: BoxFit.cover,
//                                         ),
//                                       )
//                                     : _avatarUrl != null &&
//                                             _avatarUrl!.isNotEmpty
//                                         ? ClipOval(
//                                             child: CachedNetworkImage(
//                                               imageUrl: _avatarUrl!,
//                                               width: 120,
//                                               height: 120,
//                                               fit: BoxFit.cover,
//                                               placeholder: (context, url) =>
//                                                   const Center(
//                                                 child:
//                                                     CircularProgressIndicator(
//                                                   color: Colors.white,
//                                                 ),
//                                               ),
//                                               errorWidget:
//                                                   (context, url, error) {
//                                                 print(
//                                                     'Error loading image: $error, URL: $url');
//                                                 return const Icon(
//                                                   Icons.person,
//                                                   size: 60,
//                                                   color: Colors.white,
//                                                 );
//                                               },
//                                               fadeInDuration: const Duration(
//                                                   milliseconds: 500),
//                                               errorListener: (error) {
//                                                 print(
//                                                     'CachedNetworkImage error: $error');
//                                               },
//                                             ),
//                                           )
//                                         : const Icon(
//                                             Icons.person,
//                                             size: 60,
//                                             color: Colors.white,
//                                           ),
//                               ),
//                             ),
//                             Positioned(
//                               bottom: 0,
//                               right: 0,
//                               child: GestureDetector(
//                                 onTap: _pickImage,
//                                 child: Container(
//                                   padding: const EdgeInsets.all(8),
//                                   decoration: const BoxDecoration(
//                                     color: AppColors.primaryColor,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: const Icon(
//                                     Icons.camera_alt,
//                                     color: Colors.white,
//                                     size: 24,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//                       TextFormField(
//                         cursorColor: AppColors.primaryColor,
//                         controller: _userNameController,
//                         decoration: const InputDecoration(
//                           labelText: 'Name',
//                           labelStyle: TextStyle(
//                             color: AppColors.primaryColor,
//                           ),
//                           prefixIcon: Icon(
//                             Icons.person,
//                             color: AppColors.primaryColor,
//                           ),
//                           border: OutlineInputBorder(),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: AppColors.primaryColor,
//                               width: 2,
//                             ),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           contentPadding: EdgeInsets.symmetric(
//                               vertical: 16, horizontal: 12),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.trim().isEmpty) {
//                             return 'Please enter a name';
//                           }
//                           if (value.trim().length < 2) {
//                             return 'Name must be at least 2 characters long';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 16),
//                       TextFormField(
//                         enabled: false,
//                         controller: _userEmailController,
//                         decoration: InputDecoration(
//                           labelText: 'Email',
//                           prefixIcon: const Icon(Icons.email,
//                               color: AppColors.primaryColor),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           contentPadding: const EdgeInsets.symmetric(
//                               vertical: 16, horizontal: 12),
//                         ),
//                         keyboardType: TextInputType.emailAddress,
//                         validator: (value) {
//                           if (value == null || value.trim().isEmpty) {
//                             return 'Please enter an email';
//                           }
//                           if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
//                               .hasMatch(value)) {
//                             return 'Please enter a valid email';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 24),
//                       ElevatedButton(
//                         onPressed: _isLoading ? null : _addChatWithUser,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.primaryColor,
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 16, horizontal: 24),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           elevation: 4,
//                           shadowColor: Colors.black.withOpacity(0.3),
//                         ),
//                         child: _isLoading
//                             ? const SizedBox(
//                                 width: 24,
//                                 height: 24,
//                                 child: CircularProgressIndicator(
//                                   color: Colors.white,
//                                   strokeWidth: 2,
//                                 ),
//                               )
//                             : const Text(
//                                 'Add Chat with User',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//       ),
//     );
//   }
// }

// // import 'dart:io';
// // import 'package:attendance_app/core/utils/app_colors.dart';
// // import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// // import 'package:cached_network_image/cached_network_image.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';

// // class UserProfileView extends StatefulWidget {
// //   const UserProfileView({super.key});

// //   @override
// //   _UserProfileViewState createState() => _UserProfileViewState();
// // }

// // class _UserProfileViewState extends State<UserProfileView> {
// //   final TextEditingController _userNameController = TextEditingController();
// //   final TextEditingController _userEmailController = TextEditingController();
// //   final _formKey = GlobalKey<FormState>();
// //   String? _avatarUrl;
// //   File? _selectedImage;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadUserData();
// //   }

// //   Future<void> _loadUserData() async {
// //     try {
// //       final user = FirebaseAuth.instance.currentUser;
// //       if (user != null) {
// //         final docSnapshot = await FirebaseFirestore.instance
// //             .collection('users')
// //             .doc(user.uid)
// //             .get();

// //         if (docSnapshot.exists) {
// //           final userData = docSnapshot.data() as Map<String, dynamic>;
// //           setState(() {
// //             _userNameController.text =
// //                 userData['name']?.toString() ?? user.displayName ?? '';
// //             _userEmailController.text = user.email ?? '';
// //             _avatarUrl =
// //                 userData['image']?.toString().trim() ?? user.photoURL ?? '';
// //           });
// //           print('User data loaded successfully: $userData');
// //         } else {
// //           setState(() {
// //             _userNameController.text = user.displayName ?? '';
// //             _userEmailController.text = user.email ?? '';
// //             _avatarUrl = user.photoURL ?? '';
// //           });
// //           print('No user document found in Firestore for UID: ${user.uid}');
// //         }
// //       } else {
// //         print('No user currently logged in');
// //       }
// //     } catch (e) {
// //       print('Error loading user data: $e');
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Failed to load user data: $e')),
// //       );
// //     }
// //   }

// //   Future<void> _pickImage() async {
// //     final picker = ImagePicker();
// //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

// //     if (pickedFile != null) {
// //       setState(() {
// //         _selectedImage = File(pickedFile.path);
// //       });

// //       await _uploadImageToStorage();
// //     }
// //   }

// //   Future<void> _uploadImageToStorage() async {
// //     if (_selectedImage == null) return;

// //     try {
// //       final user = FirebaseAuth.instance.currentUser;
// //       if (user == null) {
// //         throw Exception('No user currently logged in');
// //       }

// //       final storageRef = FirebaseStorage.instance
// //           .ref()
// //           .child('user_images')
// //           .child('${user.uid}.jpg');
// //       await storageRef.putFile(_selectedImage!);
// //       final downloadUrl = await storageRef.getDownloadURL();

// //       await FirebaseFirestore.instance
// //           .collection('users')
// //           .doc(user.uid)
// //           .update({'image': downloadUrl});

// //       setState(() {
// //         _avatarUrl = downloadUrl;
// //         _selectedImage = null;
// //       });

// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(
// //           content: Text('Profile picture updated successfully'),
// //           backgroundColor: Colors.green,
// //         ),
// //       );
// //     } catch (e) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Failed to update profile picture: $e')),
// //       );
// //     }
// //   }

// //   Future<void> _saveChanges() async {
// //     if (_formKey.currentState!.validate()) {
// //       try {
// //         final user = FirebaseAuth.instance.currentUser;
// //         if (user != null) {
// //           final repo = ChatRepository();
// //           await repo.updateUserName(_userNameController.text.trim());

// //           await user.updateDisplayName(_userNameController.text.trim());

// //           ScaffoldMessenger.of(context).showSnackBar(
// //             const SnackBar(
// //               content: Text('Name updated successfully'),
// //               backgroundColor: Colors.green,
// //             ),
// //           );

// //           Navigator.pop(context);
// //         }
// //       } catch (e) {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(content: Text('Failed to update name: $e')),
// //         );
// //       }
// //     }
// //   }

// //   Future<void> _addChatWithUser() async {
// //     if (_formKey.currentState!.validate()) {
// //       try {
// //         final repo = ChatRepository();
// //         await repo.addChatWithUser(
// //           _userEmailController.text.trim(),
// //           _userNameController.text.trim(),
// //           _avatarUrl ?? '',
// //         );
// //         Navigator.pop(context);
// //       } catch (e) {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(content: Text('A chat is already exist')),
// //         );
// //       }
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     _userNameController.dispose();
// //     _userEmailController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text(
// //           'Profile',
// //           style: TextStyle(
// //             color: Colors.white,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         backgroundColor: AppColors.primaryColor,
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: Colors.white),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.check, color: Colors.white),
// //             onPressed: _saveChanges,
// //           ),
// //         ],
// //       ),
// //       body: Container(
// //         decoration: const BoxDecoration(
// //           color: Colors.white,
// //         ),
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Form(
// //             key: _formKey,
// //             child: ListView(
// //               children: [
// //                 Center(
// //                   child: Stack(
// //                     children: [
// //                       Container(
// //                         decoration: BoxDecoration(
// //                           shape: BoxShape.circle,
// //                           boxShadow: [
// //                             BoxShadow(
// //                               color: Colors.black.withOpacity(0.2),
// //                               blurRadius: 8,
// //                               offset: const Offset(0, 4),
// //                             ),
// //                           ],
// //                         ),
// //                         child: CircleAvatar(
// //                           radius: 60,
// //                           backgroundColor: AppColors.primaryColor,
// //                           child: _selectedImage != null
// //                               ? ClipOval(
// //                                   child: Image.file(
// //                                     _selectedImage!,
// //                                     width: 120,
// //                                     height: 120,
// //                                     fit: BoxFit.cover,
// //                                   ),
// //                                 )
// //                               : _avatarUrl != null && _avatarUrl!.isNotEmpty
// //                                   ? ClipOval(
// //                                       child: CachedNetworkImage(
// //                                         imageUrl: _avatarUrl!,
// //                                         width: 120,
// //                                         height: 120,
// //                                         fit: BoxFit.cover,
// //                                         placeholder: (context, url) =>
// //                                             const Center(
// //                                           child: CircularProgressIndicator(
// //                                             color: Colors.white,
// //                                           ),
// //                                         ),
// //                                         errorWidget: (context, url, error) {
// //                                           print(
// //                                               'Error loading image: $error, URL: $url');
// //                                           return const Icon(
// //                                             Icons.person,
// //                                             size: 60,
// //                                             color: Colors.white,
// //                                           );
// //                                         },
// //                                         fadeInDuration:
// //                                             const Duration(milliseconds: 500),
// //                                         errorListener: (error) {
// //                                           print(
// //                                               'CachedNetworkImage error: $error');
// //                                         },
// //                                       ),
// //                                     )
// //                                   : const Icon(
// //                                       Icons.person,
// //                                       size: 60,
// //                                       color: Colors.white,
// //                                     ),
// //                         ),
// //                       ),
// //                       Positioned(
// //                         bottom: 0,
// //                         right: 0,
// //                         child: GestureDetector(
// //                           onTap: _pickImage,
// //                           child: Container(
// //                             padding: const EdgeInsets.all(8),
// //                             decoration: const BoxDecoration(
// //                               color: AppColors.primaryColor,
// //                               shape: BoxShape.circle,
// //                             ),
// //                             child: const Icon(
// //                               Icons.camera_alt,
// //                               color: Colors.white,
// //                               size: 24,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 const SizedBox(height: 24),
// //                 TextFormField(
// //                   cursorColor: AppColors.primaryColor,
// //                   controller: _userNameController,
// //                   decoration: const InputDecoration(
// //                     labelText: 'Name',
// //                     labelStyle: TextStyle(
// //                       color: AppColors.primaryColor,
// //                     ),
// //                     prefixIcon: Icon(
// //                       Icons.person,
// //                       color: AppColors.primaryColor,
// //                     ),
// //                     border: OutlineInputBorder(),
// //                     focusedBorder: OutlineInputBorder(
// //                       borderSide: BorderSide(
// //                         color: AppColors.primaryColor,
// //                         width: 2,
// //                       ),
// //                     ),
// //                     filled: true,
// //                     fillColor: Colors.white,
// //                     contentPadding:
// //                         EdgeInsets.symmetric(vertical: 16, horizontal: 12),
// //                   ),
// //                   validator: (value) {
// //                     if (value == null || value.trim().isEmpty) {
// //                       return 'Please enter a name';
// //                     }
// //                     if (value.trim().length < 2) {
// //                       return 'Name must be at least 2 characters long';
// //                     }
// //                     return null;
// //                   },
// //                 ),
// //                 const SizedBox(height: 16),
// //                 TextFormField(
// //                   enabled: false,
// //                   controller: _userEmailController,
// //                   decoration: InputDecoration(
// //                     labelText: 'Email',
// //                     prefixIcon:
// //                         const Icon(Icons.email, color: AppColors.primaryColor),
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                     ),
// //                     filled: true,
// //                     fillColor: Colors.white,
// //                     contentPadding: const EdgeInsets.symmetric(
// //                         vertical: 16, horizontal: 12),
// //                   ),
// //                   keyboardType: TextInputType.emailAddress,
// //                   validator: (value) {
// //                     if (value == null || value.trim().isEmpty) {
// //                       return 'Please enter an email';
// //                     }
// //                     if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
// //                         .hasMatch(value)) {
// //                       return 'Please enter a valid email';
// //                     }
// //                     return null;
// //                   },
// //                 ),
// //                 const SizedBox(height: 24),
// //                 ElevatedButton(
// //                   onPressed: _addChatWithUser,
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: AppColors.primaryColor,
// //                     foregroundColor: Colors.white,
// //                     padding: const EdgeInsets.symmetric(
// //                         vertical: 16, horizontal: 24),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                     ),
// //                     elevation: 4,
// //                     shadowColor: Colors.black.withOpacity(0.3),
// //                   ),
// //                   child: const Text(
// //                     'Add Chat with User',
// //                     style: TextStyle(
// //                       fontSize: 16,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

import 'dart:io';
import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  _UserProfileViewState createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userEmailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _avatarUrl;
  bool _isLoading = false;
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    setState(() => _isLoading = true);
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final docSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (docSnapshot.exists) {
          final userData = docSnapshot.data() as Map<String, dynamic>;
          setState(() {
            _userNameController.text =
                userData['name']?.toString() ?? user.displayName ?? '';
            _userEmailController.text = user.email ?? '';
            _avatarUrl =
                userData['image']?.toString().trim() ?? user.photoURL ?? '';
          });
          print('User data loaded successfully: $userData');
        } else {
          setState(() {
            _userNameController.text = user.displayName ?? '';
            _userEmailController.text = user.email ?? '';
            _avatarUrl = user.photoURL ?? '';
          });
          print('No user document found in Firestore for UID: ${user.uid}');
        }
      } else {
        print('No user currently logged in');
      }
    } catch (e) {
      print('Error loading user data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load user data: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });

      await _uploadImageToStorage();
    }
  }

  Future<void> _uploadImageToStorage() async {
    if (_selectedImage == null) return;

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('No user currently logged in');
      }

      final storageRef = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child('${user.uid}.jpg');
      await storageRef.putFile(_selectedImage!);
      final downloadUrl = await storageRef.getDownloadURL();

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({'image': downloadUrl});

      setState(() {
        _avatarUrl = downloadUrl;
        _selectedImage = null;
      });

      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Profile picture updated successfully'),
      //     backgroundColor: Colors.green,
      //   ),
      // );

      print('Profile picture updated successfully');
    } catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Failed to update profile picture: $e')),
      // );

      print('Failed to update profile picture: $e');
    }
  }

  // Future<void> _saveChanges() async {
  //   if (_formKey.currentState!.validate()) {
  //     setState(() => _isLoading = true);
  //     try {
  //       final user = FirebaseAuth.instance.currentUser;
  //       if (user != null) {
  //         final repo = ChatRepository();
  //         await repo.updateUserName(_userNameController.text.trim());

  //         await user.updateDisplayName(_userNameController.text.trim());

  //         ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(
  //             content: Text('Name updated successfully'),
  //             backgroundColor: Colors.green,
  //           ),
  //         );

  //         Navigator.pop(context);
  //       }
  //     } catch (e) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Failed to update name: $e')),
  //       );
  //     } finally {
  //       setState(() => _isLoading = false);
  //     }
  //   }
  // }

  // void _saveChanges() {
  //   if (_formKey.currentState!.validate()) {
  //     final user = FirebaseAuth.instance.currentUser;
  //     if (user != null) {
  //       final repo = ChatRepository();
  //       // Fire-and-forget: Update name in the background
  //       repo.updateUserName(_userNameController.text.trim()).then((_) {
  //         // ScaffoldMessenger.of(context).showSnackBar(
  //         //   const SnackBar(
  //         //     content: Text('Name updated successfully'),
  //         //     backgroundColor: Colors.green,
  //         //   ),
  //         // );

  //         print('Name updated successfully');
  //       }).catchError((e) {
  //         // ScaffoldMessenger.of(context).showSnackBar(
  //         //   SnackBar(content: Text('Failed to update name: $e')),
  //         // );

  //         print('Failed to update name: $e');
  //       });

  //       user.updateDisplayName(_userNameController.text.trim()).then((_) {
  //         print('Firebase display name updated');
  //       }).catchError((e) {
  //         print('Error updating Firebase display name: $e');
  //       });

  //       // Close the screen immediately
  //       Navigator.pop(context);
  //     }
  //   }
  // }

  Future<void> _saveChanges() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      try {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          final repo = ChatRepository();
          await repo.updateUserName(_userNameController.text.trim());
          await user.updateDisplayName(_userNameController.text.trim());

          // تحديث الصورة إذا تم اختيار صورة جديدة
          if (_selectedImage != null) {
            await _uploadImageToStorage();
          }

          // تحديث جميع الشاتات المرتبطة بالمستخدم
          final chatsSnapshot = await FirebaseFirestore.instance
              .collection('chats')
              .where('participants', arrayContains: user.uid)
              .get();

          for (var chatDoc in chatsSnapshot.docs) {
            final chatData = chatDoc.data();
            final names = Map<String, dynamic>.from(chatData['names'] ?? {});
            final avatars =
                Map<String, dynamic>.from(chatData['avatars'] ?? {});

            names[user.uid] = _userNameController.text.trim();
            if (_avatarUrl != null && _avatarUrl!.isNotEmpty) {
              avatars[user.uid] = _avatarUrl;
            }

            await FirebaseFirestore.instance
                .collection('chats')
                .doc(chatDoc.id)
                .update({
              'names': names,
              'avatars': avatars,
              'timestamp': FieldValue.serverTimestamp(),
            });
          }

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile updated successfully'),
              backgroundColor: Colors.green,
            ),
          );

          Navigator.pop(context);
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update profile: $e')),
        );
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _addChatWithUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      try {
        final repo = ChatRepository();
        await repo.addChatWithUser(
          _userEmailController.text.trim(),
          _userNameController.text.trim(),
          _avatarUrl ?? '',
        );
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('A chat is already exist')),
        );
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _userEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check, color: Colors.white),
            onPressed: _isLoading ? null : _saveChanges,
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ))
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 60,
                                backgroundColor: AppColors.primaryColor,
                                child: _selectedImage != null
                                    ? ClipOval(
                                        child: Image.file(
                                          _selectedImage!,
                                          width: 120,
                                          height: 120,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : _avatarUrl != null &&
                                            _avatarUrl!.isNotEmpty
                                        ? ClipOval(
                                            child: CachedNetworkImage(
                                              imageUrl: _avatarUrl!,
                                              width: 120,
                                              height: 120,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              errorWidget:
                                                  (context, url, error) {
                                                print(
                                                    'Error loading image: $error, URL: $url');
                                                return const Icon(
                                                  Icons.person,
                                                  size: 60,
                                                  color: Colors.white,
                                                );
                                              },
                                              fadeInDuration: const Duration(
                                                  milliseconds: 500),
                                              errorListener: (error) {
                                                print(
                                                    'CachedNetworkImage error: $error');
                                              },
                                            ),
                                          )
                                        : const Icon(
                                            Icons.person,
                                            size: 60,
                                            color: Colors.white,
                                          ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: _pickImage,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    color: AppColors.primaryColor,
                                    shape: BoxShape.circle,
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
                      const SizedBox(height: 24),
                      TextFormField(
                        cursorColor: AppColors.primaryColor,
                        controller: _userNameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(
                            color: AppColors.primaryColor,
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: AppColors.primaryColor,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.primaryColor,
                              width: 2,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter a name';
                          }
                          if (value.trim().length < 2) {
                            return 'Name must be at least 2 characters long';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        enabled: false,
                        controller: _userEmailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: const Icon(Icons.email,
                              color: AppColors.primaryColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter an email';
                          }
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: _isLoading ? null : _addChatWithUser,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                          shadowColor: Colors.black.withOpacity(0.3),
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'Add Chat with User',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}