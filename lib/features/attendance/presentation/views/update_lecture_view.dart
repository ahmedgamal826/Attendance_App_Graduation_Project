// // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // import 'package:attendance_app/features/attendance/cubits/cubit_admin/lecture_cubit.dart';
// // // // // // import 'package:attendance_app/features/attendance/models/lecture_model_admin.dart';
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:intl/intl.dart';
// // // // // // import 'package:flutter_bloc/flutter_bloc.dart';

// // // // // // class UpdateLecturePage extends StatefulWidget {
// // // // // //   final LectureModel lecture;

// // // // // //   const UpdateLecturePage({Key? key, required this.lecture}) : super(key: key);

// // // // // //   @override
// // // // // //   _UpdateLecturePageState createState() => _UpdateLecturePageState();
// // // // // // }

// // // // // // class _UpdateLecturePageState extends State<UpdateLecturePage> {
// // // // // //   late TextEditingController _lectureNameController;
// // // // // //   late TextEditingController _dateController;
// // // // // //   late TextEditingController _timeController;

// // // // // //   @override
// // // // // //   void initState() {
// // // // // //     super.initState();
// // // // // //     // تهيئة الحقول بالبيانات الحالية
// // // // // //     _lectureNameController = TextEditingController(text: widget.lecture.name);
// // // // // //     _dateController = TextEditingController(text: widget.lecture.date);
// // // // // //     _timeController = TextEditingController(text: widget.lecture.time);
// // // // // //   }

// // // // // //   @override
// // // // // //   void dispose() {
// // // // // //     _lectureNameController.dispose();
// // // // // //     _dateController.dispose();
// // // // // //     _timeController.dispose();
// // // // // //     super.dispose();
// // // // // //   }

// // // // // //   // دالة لاختيار التاريخ
// // // // // //   void _pickDate() async {
// // // // // //     DateTime? pickedDate = await showDatePicker(
// // // // // //       context: context,
// // // // // //       initialDate: DateTime.now(),
// // // // // //       firstDate: DateTime(2000),
// // // // // //       lastDate: DateTime(3000),
// // // // // //       builder: (context, child) {
// // // // // //         return Theme(
// // // // // //           data: Theme.of(context).copyWith(
// // // // // //             colorScheme: const ColorScheme.light(
// // // // // //               primary: AppColors.primaryColor,
// // // // // //               onPrimary: Colors.white,
// // // // // //               onSurface: Colors.black,
// // // // // //             ),
// // // // // //             textButtonTheme: TextButtonThemeData(
// // // // // //               style: TextButton.styleFrom(
// // // // // //                 foregroundColor: AppColors.primaryColor,
// // // // // //               ),
// // // // // //             ),
// // // // // //           ),
// // // // // //           child: child!,
// // // // // //         );
// // // // // //       },
// // // // // //     );

// // // // // //     if (pickedDate != null) {
// // // // // //       setState(() {
// // // // // //         _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
// // // // // //       });
// // // // // //     }
// // // // // //   }

// // // // // //   // دالة لاختيار الوقت
// // // // // //   void _pickTime() async {
// // // // // //     TimeOfDay? pickedTime = await showTimePicker(
// // // // // //       context: context,
// // // // // //       initialTime: TimeOfDay.now(),
// // // // // //       builder: (context, child) {
// // // // // //         return Theme(
// // // // // //           data: Theme.of(context).copyWith(
// // // // // //             colorScheme: const ColorScheme.light(
// // // // // //               primary: AppColors.primaryColor,
// // // // // //               onPrimary: Colors.white,
// // // // // //               onSurface: Colors.black,
// // // // // //             ),
// // // // // //             textButtonTheme: TextButtonThemeData(
// // // // // //               style: TextButton.styleFrom(
// // // // // //                 foregroundColor: AppColors.primaryColor,
// // // // // //               ),
// // // // // //             ),
// // // // // //           ),
// // // // // //           child: child!,
// // // // // //         );
// // // // // //       },
// // // // // //     );

// // // // // //     if (pickedTime != null) {
// // // // // //       setState(() {
// // // // // //         _timeController.text = pickedTime.format(context);
// // // // // //       });
// // // // // //     }
// // // // // //   }

// // // // // //   // دالة لتحديث بيانات المحاضرة
// // // // // //   void _updateLecture() {
// // // // // //     if (_lectureNameController.text.isEmpty ||
// // // // // //         _dateController.text.isEmpty ||
// // // // // //         _timeController.text.isEmpty) {
// // // // // //       ScaffoldMessenger.of(context).showSnackBar(
// // // // // //         const SnackBar(content: Text('Please fill all fields')),
// // // // // //       );
// // // // // //       return;
// // // // // //     }

// // // // // //     final updatedLecture = LectureModel(
// // // // // //       number: widget.lecture.number,
// // // // // //       name: _lectureNameController.text,
// // // // // //       date: _dateController.text,
// // // // // //       time: _timeController.text,
// // // // // //       isPresent: false,
// // // // // //     );

// // // // // //     context.read<LectureCubit>().updateLecture(updatedLecture);

// // // // // //     ScaffoldMessenger.of(context).showSnackBar(
// // // // // //       SnackBar(content: Text('Lecture ${widget.lecture.number} updated')),
// // // // // //     );

// // // // // //     Navigator.pop(context);
// // // // // //   }

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       backgroundColor: Colors.white,
// // // // // //       appBar: AppBar(
// // // // // //         iconTheme: const IconThemeData(color: Colors.white),
// // // // // //         backgroundColor: AppColors.primaryColor,
// // // // // //         centerTitle: true,
// // // // // //         title: Text(
// // // // // //           'Update Lecture ${widget.lecture.number}',
// // // // // //           style: const TextStyle(
// // // // // //             fontSize: 22,
// // // // // //             fontWeight: FontWeight.bold,
// // // // // //             color: Colors.white,
// // // // // //           ),
// // // // // //         ),
// // // // // //       ),
// // // // // //       body: Padding(
// // // // // //         padding: const EdgeInsets.all(16.0),
// // // // // //         child: SingleChildScrollView(
// // // // // //           child: Column(
// // // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //             children: [
// // // // // //               TextField(
// // // // // //                 controller: _lectureNameController,
// // // // // //                 decoration: InputDecoration(
// // // // // //                   labelText: 'Lecture Name',
// // // // // //                   labelStyle: const TextStyle(color: Colors.black),
// // // // // //                   enabledBorder: OutlineInputBorder(
// // // // // //                     borderRadius: BorderRadius.circular(12),
// // // // // //                     borderSide: const BorderSide(color: Colors.grey, width: 1),
// // // // // //                   ),
// // // // // //                   focusedBorder: OutlineInputBorder(
// // // // // //                     borderRadius: BorderRadius.circular(12),
// // // // // //                     borderSide: const BorderSide(
// // // // // //                         color: AppColors.primaryColor, width: 2),
// // // // // //                   ),
// // // // // //                   contentPadding:
// // // // // //                       const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
// // // // // //                 ),
// // // // // //               ),
// // // // // //               const SizedBox(height: 10),
// // // // // //               Container(
// // // // // //                 decoration: BoxDecoration(
// // // // // //                   color: Colors.white,
// // // // // //                   borderRadius: BorderRadius.circular(12),
// // // // // //                   boxShadow: [
// // // // // //                     BoxShadow(
// // // // // //                       color: Colors.grey.withOpacity(0.3),
// // // // // //                       blurRadius: 6,
// // // // // //                       offset: const Offset(0, 3),
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //                 child: TextField(
// // // // // //                   controller: _dateController,
// // // // // //                   readOnly: true,
// // // // // //                   onTap: _pickDate,
// // // // // //                   decoration: InputDecoration(
// // // // // //                     labelText: 'Select Date',
// // // // // //                     labelStyle: const TextStyle(color: Colors.black),
// // // // // //                     enabledBorder: OutlineInputBorder(
// // // // // //                       borderRadius: BorderRadius.circular(12),
// // // // // //                       borderSide:
// // // // // //                           const BorderSide(color: Colors.grey, width: 1),
// // // // // //                     ),
// // // // // //                     focusedBorder: OutlineInputBorder(
// // // // // //                       borderRadius: BorderRadius.circular(12),
// // // // // //                       borderSide: const BorderSide(
// // // // // //                           color: AppColors.primaryColor, width: 2),
// // // // // //                     ),
// // // // // //                     contentPadding: const EdgeInsets.symmetric(
// // // // // //                         vertical: 15, horizontal: 10),
// // // // // //                     suffixIcon: const Icon(Icons.calendar_today),
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ),
// // // // // //               const SizedBox(height: 10),
// // // // // //               Container(
// // // // // //                 decoration: BoxDecoration(
// // // // // //                   color: Colors.white,
// // // // // //                   borderRadius: BorderRadius.circular(12),
// // // // // //                   boxShadow: [
// // // // // //                     BoxShadow(
// // // // // //                       color: Colors.grey.withOpacity(0.3),
// // // // // //                       blurRadius: 6,
// // // // // //                       offset: const Offset(0, 3),
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //                 child: TextField(
// // // // // //                   controller: _timeController,
// // // // // //                   readOnly: true,
// // // // // //                   onTap: _pickTime,
// // // // // //                   decoration: InputDecoration(
// // // // // //                     labelText: 'Select Time',
// // // // // //                     labelStyle: const TextStyle(color: Colors.black),
// // // // // //                     enabledBorder: OutlineInputBorder(
// // // // // //                       borderRadius: BorderRadius.circular(12),
// // // // // //                       borderSide:
// // // // // //                           const BorderSide(color: Colors.grey, width: 1),
// // // // // //                     ),
// // // // // //                     focusedBorder: OutlineInputBorder(
// // // // // //                       borderRadius: BorderRadius.circular(12),
// // // // // //                       borderSide: const BorderSide(
// // // // // //                           color: AppColors.primaryColor, width: 2),
// // // // // //                     ),
// // // // // //                     contentPadding: const EdgeInsets.symmetric(
// // // // // //                         vertical: 15, horizontal: 10),
// // // // // //                     suffixIcon: const Icon(Icons.access_time),
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ),
// // // // // //               const SizedBox(height: 30),
// // // // // //               Center(
// // // // // //                 child: ElevatedButton(
// // // // // //                   style: ElevatedButton.styleFrom(
// // // // // //                     backgroundColor: AppColors.primaryColor,
// // // // // //                     padding: const EdgeInsets.symmetric(
// // // // // //                         horizontal: 40, vertical: 15),
// // // // // //                     shape: RoundedRectangleBorder(
// // // // // //                       borderRadius: BorderRadius.circular(10),
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                   onPressed: _updateLecture,
// // // // // //                   child: const Text(
// // // // // //                     'Update',
// // // // // //                     style: TextStyle(
// // // // // //                       fontSize: 20,
// // // // // //                       color: Colors.white,
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // import 'package:attendance_app/features/attendance/cubits/cubit_admin/lecture_cubit.dart';
// // // // // import 'package:attendance_app/features/attendance/cubits/cubit_admin/lecture_state.dart';
// // // // // import 'package:attendance_app/features/attendance/models/lecture_model_admin.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:intl/intl.dart';
// // // // // import 'package:flutter_bloc/flutter_bloc.dart';

// // // // // class UpdateLecturePage extends StatelessWidget {
// // // // //   final LectureModel lecture;
// // // // //   final String courseId;

// // // // //   const UpdateLecturePage({
// // // // //     Key? key,
// // // // //     required this.lecture,
// // // // //     required this.courseId,
// // // // //   }) : super(key: key);

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return BlocProvider(
// // // // //       create: (context) => LectureCubit(courseId: courseId),
// // // // //       child: UpdateLectureContent(lecture: lecture),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class UpdateLectureContent extends StatefulWidget {
// // // // //   final LectureModel lecture;

// // // // //   const UpdateLectureContent({Key? key, required this.lecture}) : super(key: key);

// // // // //   @override
// // // // //   _UpdateLectureContentState createState() => _UpdateLectureContentState();
// // // // // }

// // // // // class _UpdateLectureContentState extends State<UpdateLectureContent> {
// // // // //   late TextEditingController _lectureNameController;
// // // // //   late TextEditingController _dateController;
// // // // //   late TextEditingController _timeController;

// // // // //   @override
// // // // //   void initState() {
// // // // //     super.initState();
// // // // //     _lectureNameController = TextEditingController(text: widget.lecture.name);
// // // // //     _dateController = TextEditingController(text: widget.lecture.date);
// // // // //     _timeController = TextEditingController(text: widget.lecture.time);
// // // // //   }

// // // // //   @override
// // // // //   void dispose() {
// // // // //     _lectureNameController.dispose();
// // // // //     _dateController.dispose();
// // // // //     _timeController.dispose();
// // // // //     super.dispose();
// // // // //   }

// // // // //   void _pickDate() async {
// // // // //     DateTime? pickedDate = await showDatePicker(
// // // // //       context: context,
// // // // //       initialDate: DateTime.now(),
// // // // //       firstDate: DateTime(2000),
// // // // //       lastDate: DateTime(3000),
// // // // //       builder: (context, child) {
// // // // //         return Theme(
// // // // //           data: Theme.of(context).copyWith(
// // // // //             colorScheme: const ColorScheme.light(
// // // // //               primary: AppColors.primaryColor,
// // // // //               onPrimary: Colors.white,
// // // // //               onSurface: Colors.black,
// // // // //             ),
// // // // //             textButtonTheme: TextButtonThemeData(
// // // // //               style: TextButton.styleFrom(
// // // // //                 foregroundColor: AppColors.primaryColor,
// // // // //               ),
// // // // //             ),
// // // // //           ),
// // // // //           child: child!,
// // // // //         );
// // // // //       },
// // // // //     );

// // // // //     if (pickedDate != null) {
// // // // //       setState(() {
// // // // //         _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
// // // // //       });
// // // // //     }
// // // // //   }

// // // // //   void _pickTime() async {
// // // // //     TimeOfDay? pickedTime = await showTimePicker(
// // // // //       context: context,
// // // // //       initialTime: TimeOfDay.now(),
// // // // //       builder: (context, child) {
// // // // //         return Theme(
// // // // //           data: Theme.of(context).copyWith(
// // // // //             colorScheme: const ColorScheme.light(
// // // // //               primary: AppColors.primaryColor,
// // // // //               onPrimary: Colors.white,
// // // // //               onSurface: Colors.black,
// // // // //             ),
// // // // //             textButtonTheme: TextButtonThemeData(
// // // // //               style: TextButton.styleFrom(
// // // // //                 foregroundColor: AppColors.primaryColor,
// // // // //               ),
// // // // //             ),
// // // // //           ),
// // // // //           child: child!,
// // // // //         );
// // // // //       },
// // // // //     );

// // // // //     if (pickedTime != null) {
// // // // //       setState(() {
// // // // //         _timeController.text = pickedTime.format(context);
// // // // //       });
// // // // //     }
// // // // //   }

// // // // //   void _updateLecture() {
// // // // //     if (_lectureNameController.text.isEmpty ||
// // // // //         _dateController.text.isEmpty ||
// // // // //         _timeController.text.isEmpty) {
// // // // //       ScaffoldMessenger.of(context).showSnackBar(
// // // // //         const SnackBar(content: Text('Please fill all fields')),
// // // // //       );
// // // // //       return;
// // // // //     }

// // // // //     final updatedLecture = LectureModel(
// // // // //       number: widget.lecture.number,
// // // // //       name: _lectureNameController.text,
// // // // //       date: _dateController.text,
// // // // //       time: _timeController.text,
// // // // //       isPresent: widget.lecture.isPresent,
// // // // //     );

// // // // //     context.read<LectureCubit>().updateLecture(updatedLecture);
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return BlocListener<LectureCubit, LectureState>(
// // // // //       listener: (context, state) {
// // // // //         if (state.status == LectureStatus.success) {
// // // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // // //             SnackBar(content: Text('Lecture ${widget.lecture.number} updated')),
// // // // //           );
// // // // //           Navigator.pop(context);
// // // // //         } else if (state.status == LectureStatus.failure) {
// // // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // // //             SnackBar(content: Text('Error: ${state.errorMessage}')),
// // // // //           );
// // // // //         }
// // // // //       },
// // // // //       child: Scaffold(
// // // // //         backgroundColor: Colors.white,
// // // // //         appBar: AppBar(
// // // // //           iconTheme: const IconThemeData(color: Colors.white),
// // // // //           backgroundColor: AppColors.primaryColor,
// // // // //           centerTitle: true,
// // // // //           title: Text(
// // // // //             'Update Lecture ${widget.lecture.number}',
// // // // //             style: const TextStyle(
// // // // //               fontSize: 22,
// // // // //               fontWeight: FontWeight.bold,
// // // // //               color: Colors.white,
// // // // //             ),
// // // // //           ),
// // // // //         ),
// // // // //         body: Padding(
// // // // //           padding: const EdgeInsets.all(16.0),
// // // // //           child: SingleChildScrollView(
// // // // //             child: Column(
// // // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // // //               children: [
// // // // //                 TextField(
// // // // //                   controller: _lectureNameController,
// // // // //                   decoration: InputDecoration(
// // // // //                     labelText: 'Lecture Name',
// // // // //                     labelStyle: const TextStyle(color: Colors.black),
// // // // //                     enabledBorder: OutlineInputBorder(
// // // // //                       borderRadius: BorderRadius.circular(12),
// // // // //                       borderSide: const BorderSide(color: Colors.grey, width: 1),
// // // // //                     ),
// // // // //                     focusedBorder: OutlineInputBorder(
// // // // //                       borderRadius: BorderRadius.circular(12),
// // // // //                       borderSide: const BorderSide(
// // // // //                           color: AppColors.primaryColor, width: 2),
// // // // //                     ),
// // // // //                     contentPadding: const EdgeInsets.symmetric(
// // // // //                         vertical: 15, horizontal: 10),
// // // // //                   ),
// // // // //                 ),
// // // // //                 const SizedBox(height: 10),
// // // // //                 Container(
// // // // //                   decoration: BoxDecoration(
// // // // //                     color: Colors.white,
// // // // //                     borderRadius: BorderRadius.circular(12),
// // // // //                     boxShadow: [
// // // // //                       BoxShadow(
// // // // //                         color: Colors.grey.withOpacity(0.3),
// // // // //                         blurRadius: 6,
// // // // //                         offset: const Offset(0, 3),
// // // // //                       ),
// // // // //                     ],
// // // // //                   ),
// // // // //                   child: TextField(
// // // // //                     controller: _dateController,
// // // // //                     readOnly: true,
// // // // //                     onTap: _pickDate,
// // // // //                     decoration: InputDecoration(
// // // // //                       labelText: 'Select Date',
// // // // //                       labelStyle: const TextStyle(color: Colors.black),
// // // // //                       enabledBorder: OutlineInputBorder(
// // // // //                         borderRadius: BorderRadius.circular(12),
// // // // //                         borderSide:
// // // // //                             const BorderSide(color: Colors.grey, width: 1),
// // // // //                       ),
// // // // //                       focusedBorder: OutlineInputBorder(
// // // // //                         borderRadius: BorderRadius.circular(12),
// // // // //                         borderSide: const BorderSide(
// // // // //                             color: AppColors.primaryColor, width: 2),
// // // // //                       ),
// // // // //                       contentPadding: const EdgeInsets.symmetric(
// // // // //                           vertical: 15, horizontal: 10),
// // // // //                       suffixIcon: const Icon(Icons.calendar_today),
// // // // //                     ),
// // // // //                   ),
// // // // //                 ),
// // // // //                 const SizedBox(height: 10),
// // // // //                 Container(
// // // // //                   decoration: BoxDecoration(
// // // // //                     color: Colors.white,
// // // // //                     borderRadius: BorderRadius.circular(12),
// // // // //                     boxShadow: [
// // // // //                       BoxShadow(
// // // // //                         color: Colors.grey.withOpacity(0.3),
// // // // //                         blurRadius: 6,
// // // // //                         offset: const Offset(0, 3),
// // // // //                       ),
// // // // //                     ],
// // // // //                   ),
// // // // //                   child: TextField(
// // // // //                     controller: _timeController,
// // // // //                     readOnly: true,
// // // // //                     onTap: _pickTime,
// // // // //                     decoration: InputDecoration(
// // // // //                       labelText: 'Select Time',
// // // // //                       labelStyle: const TextStyle(color: Colors.black),
// // // // //                       enabledBorder: OutlineInputBorder(
// // // // //                         borderRadius: BorderRadius.circular(12),
// // // // //                         borderSide:
// // // // //                             const BorderSide(color: Colors.grey, width: 1),
// // // // //                       ),
// // // // //                       focusedBorder: OutlineInputBorder(
// // // // //                         borderRadius: BorderRadius.circular(12),
// // // // //                         borderSide: const BorderSide(
// // // // //                             color: AppColors.primaryColor, width: 2),
// // // // //                       ),
// // // // //                       contentPadding: const EdgeInsets.symmetric(
// // // // //                           vertical: 15, horizontal: 10),
// // // // //                       suffixIcon: const Icon(Icons.access_time),
// // // // //                     ),
// // // // //                   ),
// // // // //                 ),
// // // // //                 const SizedBox(height: 30),
// // // // //                 Center(
// // // // //                   child: BlocBuilder<LectureCubit, LectureState>(
// // // // //                     builder: (context, state) {
// // // // //                       return ElevatedButton(
// // // // //                         style: ElevatedButton.styleFrom(
// // // // //                           backgroundColor: AppColors.primaryColor,
// // // // //                           padding: const EdgeInsets.symmetric(
// // // // //                               horizontal: 40, vertical: 15),
// // // // //                           shape: RoundedRectangleBorder(
// // // // //                             borderRadius: BorderRadius.circular(10),
// // // // //                           ),
// // // // //                         ),
// // // // //                         onPressed: state.status == LectureStatus.loading
// // // // //                             ? null
// // // // //                             : _updateLecture,
// // // // //                         child: state.status == LectureStatus.loading
// // // // //                             ? const CircularProgressIndicator(
// // // // //                                 color: Colors.white,
// // // // //                               )
// // // // //                             : const Text(
// // // // //                                 'Update',
// // // // //                                 style: TextStyle(
// // // // //                                   fontSize: 20,
// // // // //                                   color: Colors.white,
// // // // //                                 ),
// // // // //                               ),
// // // // //                       );
// // // // //                     },
// // // // //                   ),
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // import 'package:attendance_app/features/attendance/cubits/cubit_admin/lecture_cubit.dart';
// // // // import 'package:attendance_app/features/attendance/cubits/cubit_admin/lecture_state.dart';
// // // // import 'package:attendance_app/features/attendance/models/lecture_model_admin.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:intl/intl.dart';
// // // // import 'package:flutter_bloc/flutter_bloc.dart';

// // // // class UpdateLecturePage extends StatelessWidget {
// // // //   final LectureModel lecture;
// // // //   final String courseId;

// // // //   const UpdateLecturePage({
// // // //     Key? key,
// // // //     required this.lecture,
// // // //     required this.courseId,
// // // //   }) : super(key: key);

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return BlocProvider(
// // // //       create: (context) => LectureCubit(courseId: courseId),
// // // //       child: UpdateLectureContent(lecture: lecture),
// // // //     );
// // // //   }
// // // // }

// // // // class UpdateLectureContent extends StatefulWidget {
// // // //   final LectureModel lecture;

// // // //   const UpdateLectureContent({Key? key, required this.lecture}) : super(key: key);

// // // //   @override
// // // //   _UpdateLectureContentState createState() => _UpdateLectureContentState();
// // // // }

// // // // class _UpdateLectureContentState extends State<UpdateLectureContent> {
// // // //   late TextEditingController _lectureNameController;
// // // //   late TextEditingController _dateController;
// // // //   late TextEditingController _timeController;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _lectureNameController = TextEditingController(text: widget.lecture.name);
// // // //     _dateController = TextEditingController(text: widget.lecture.date);
// // // //     _timeController = TextEditingController(text: widget.lecture.time);
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _lectureNameController.dispose();
// // // //     _dateController.dispose();
// // // //     _timeController.dispose();
// // // //     super.dispose();
// // // //   }

// // // //   void _pickDate() async {
// // // //     DateTime? pickedDate = await showDatePicker(
// // // //       context: context,
// // // //       initialDate: DateTime.now(),
// // // //       firstDate: DateTime(2000),
// // // //       lastDate: DateTime(3000),
// // // //       builder: (context, child) {
// // // //         return Theme(
// // // //           data: Theme.of(context).copyWith(
// // // //             colorScheme: const ColorScheme.light(
// // // //               primary: AppColors.primaryColor,
// // // //               onPrimary: Colors.white,
// // // //               onSurface: Colors.black,
// // // //             ),
// // // //             textButtonTheme: TextButtonThemeData(
// // // //               style: TextButton.styleFrom(
// // // //                 foregroundColor: AppColors.primaryColor,
// // // //               ),
// // // //             ),
// // // //           ),
// // // //           child: child!,
// // // //         );
// // // //       },
// // // //     );

// // // //     if (pickedDate != null) {
// // // //       setState(() {
// // // //         _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
// // // //       });
// // // //     }
// // // //   }

// // // //   void _pickTime() async {
// // // //     TimeOfDay? pickedTime = await showTimePicker(
// // // //       context: context,
// // // //       initialTime: TimeOfDay.now(),
// // // //       builder: (context, child) {
// // // //         return Theme(
// // // //           data: Theme.of(context).copyWith(
// // // //             colorScheme: const ColorScheme.light(
// // // //               primary: AppColors.primaryColor,
// // // //               onPrimary: Colors.white,
// // // //               onSurface: Colors.black,
// // // //             ),
// // // //             textButtonTheme: TextButtonThemeData(
// // // //               style: TextButton.styleFrom(
// // // //                 foregroundColor: AppColors.primaryColor,
// // // //               ),
// // // //             ),
// // // //           ),
// // // //           child: child!,
// // // //         );
// // // //       },
// // // //     );

// // // //     if (pickedTime != null) {
// // // //       setState(() {
// // // //         _timeController.text = pickedTime.format(context);
// // // //       });
// // // //     }
// // // //   }

// // // //   void _updateLecture() {
// // // //     if (_lectureNameController.text.isEmpty ||
// // // //         _dateController.text.isEmpty ||
// // // //         _timeController.text.isEmpty) {
// // // //       ScaffoldMessenger.of(context).showSnackBar(
// // // //         const SnackBar(content: Text('Please fill all fields')),
// // // //       );
// // // //       return;
// // // //     }

// // // //     final updatedLecture = LectureModel(
// // // //       number: widget.lecture.number,
// // // //       name: _lectureNameController.text,
// // // //       date: _dateController.text,
// // // //       time: _timeController.text,
// // // //       isPresent: widget.lecture.isPresent,
// // // //     );

// // // //     context.read<LectureCubit>().updateLecture(updatedLecture).then((_) {
// // // //       // بعد ما ينجح التحديث، نعرض الرسالة ونرجع للصفحة الرئيسية
// // // //       ScaffoldMessenger.of(context).showSnackBar(
// // // //         SnackBar(content: Text('Lecture ${widget.lecture.number} updated')),
// // // //       );
// // // //       Navigator.pop(context);
// // // //     }).catchError((error) {
// // // //       // في حالة حدوث خطأ أثناء التحديث
// // // //       ScaffoldMessenger.of(context).showSnackBar(
// // // //         SnackBar(content: Text('Error: $error')),
// // // //       );
// // // //     });
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return BlocListener<LectureCubit, LectureState>(
// // // //       listener: (context, state) {
// // // //         if (state.status == LectureStatus.failure) {
// // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // //             SnackBar(content: Text('Error: ${state.errorMessage}')),
// // // //           );
// // // //         }
// // // //       },
// // // //       child: Scaffold(
// // // //         backgroundColor: Colors.white,
// // // //         appBar: AppBar(
// // // //           iconTheme: const IconThemeData(color: Colors.white),
// // // //           backgroundColor: AppColors.primaryColor,
// // // //           centerTitle: true,
// // // //           title: Text(
// // // //             'Update Lecture ${widget.lecture.number}',
// // // //             style: const TextStyle(
// // // //               fontSize: 22,
// // // //               fontWeight: FontWeight.bold,
// // // //               color: Colors.white,
// // // //             ),
// // // //           ),
// // // //         ),
// // // //         body: Padding(
// // // //           padding: const EdgeInsets.all(16.0),
// // // //           child: SingleChildScrollView(
// // // //             child: Column(
// // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // //               children: [
// // // //                 TextField(
// // // //                   controller: _lectureNameController,
// // // //                   decoration: InputDecoration(
// // // //                     labelText: 'Lecture Name',
// // // //                     labelStyle: const TextStyle(color: Colors.black),
// // // //                     enabledBorder: OutlineInputBorder(
// // // //                       borderRadius: BorderRadius.circular(12),
// // // //                       borderSide: const BorderSide(color: Colors.grey, width: 1),
// // // //                     ),
// // // //                     focusedBorder: OutlineInputBorder(
// // // //                       borderRadius: BorderRadius.circular(12),
// // // //                       borderSide: const BorderSide(
// // // //                           color: AppColors.primaryColor, width: 2),
// // // //                     ),
// // // //                     contentPadding: const EdgeInsets.symmetric(
// // // //                         vertical: 15, horizontal: 10),
// // // //                   ),
// // // //                 ),
// // // //                 const SizedBox(height: 10),
// // // //                 Container(
// // // //                   decoration: BoxDecoration(
// // // //                     color: Colors.white,
// // // //                     borderRadius: BorderRadius.circular(12),
// // // //                     boxShadow: [
// // // //                       BoxShadow(
// // // //                         color: Colors.grey.withOpacity(0.3),
// // // //                         blurRadius: 6,
// // // //                         offset: const Offset(0, 3),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                   child: TextField(
// // // //                     controller: _dateController,
// // // //                     readOnly: true,
// // // //                     onTap: _pickDate,
// // // //                     decoration: InputDecoration(
// // // //                       labelText: 'Select Date',
// // // //                       labelStyle: const TextStyle(color: Colors.black),
// // // //                       enabledBorder: OutlineInputBorder(
// // // //                         borderRadius: BorderRadius.circular(12),
// // // //                         borderSide:
// // // //                             const BorderSide(color: Colors.grey, width: 1),
// // // //                       ),
// // // //                       focusedBorder: OutlineInputBorder(
// // // //                         borderRadius: BorderRadius.circular(12),
// // // //                         borderSide: const BorderSide(
// // // //                             color: AppColors.primaryColor, width: 2),
// // // //                       ),
// // // //                       contentPadding: const EdgeInsets.symmetric(
// // // //                           vertical: 15, horizontal: 10),
// // // //                       suffixIcon: const Icon(Icons.calendar_today),
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //                 const SizedBox(height: 10),
// // // //                 Container(
// // // //                   decoration: BoxDecoration(
// // // //                     color: Colors.white,
// // // //                     borderRadius: BorderRadius.circular(12),
// // // //                     boxShadow: [
// // // //                       BoxShadow(
// // // //                         color: Colors.grey.withOpacity(0.3),
// // // //                         blurRadius: 6,
// // // //                         offset: const Offset(0, 3),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                   child: TextField(
// // // //                     controller: _timeController,
// // // //                     readOnly: true,
// // // //                     onTap: _pickTime,
// // // //                     decoration: InputDecoration(
// // // //                       labelText: 'Select Time',
// // // //                       labelStyle: const TextStyle(color: Colors.black),
// // // //                       enabledBorder: OutlineInputBorder(
// // // //                         borderRadius: BorderRadius.circular(12),
// // // //                         borderSide:
// // // //                             const BorderSide(color: Colors.grey, width: 1),
// // // //                       ),
// // // //                       focusedBorder: OutlineInputBorder(
// // // //                         borderRadius: BorderRadius.circular(12),
// // // //                         borderSide: const BorderSide(
// // // //                             color: AppColors.primaryColor, width: 2),
// // // //                       ),
// // // //                       contentPadding: const EdgeInsets.symmetric(
// // // //                           vertical: 15, horizontal: 10),
// // // //                       suffixIcon: const Icon(Icons.access_time),
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //                 const SizedBox(height: 30),
// // // //                 Center(
// // // //                   child: Row(
// // // //                     mainAxisAlignment: MainAxisAlignment.center,
// // // //                     children: [
// // // //                       BlocBuilder<LectureCubit, LectureState>(
// // // //                         builder: (context, state) {
// // // //                           return ElevatedButton(
// // // //                             style: ElevatedButton.styleFrom(
// // // //                               backgroundColor: AppColors.primaryColor,
// // // //                               padding: const EdgeInsets.symmetric(
// // // //                                   horizontal: 40, vertical: 15),
// // // //                               shape: RoundedRectangleBorder(
// // // //                                 borderRadius: BorderRadius.circular(10),
// // // //                               ),
// // // //                             ),
// // // //                             onPressed: state.status == LectureStatus.loading
// // // //                                 ? null
// // // //                                 : _updateLecture,
// // // //                             child: state.status == LectureStatus.loading
// // // //                                 ? const CircularProgressIndicator(
// // // //                                     color: Colors.white,
// // // //                                   )
// // // //                                 : const Text(
// // // //                                     'Update',
// // // //                                     style: TextStyle(
// // // //                                       fontSize: 20,
// // // //                                       color: Colors.white,
// // // //                                     ),
// // // //                                   ),
// // // //                           );
// // // //                         },
// // // //                       ),
// // // //                       const SizedBox(width: 20),
// // // //                       ElevatedButton(
// // // //                         style: ElevatedButton.styleFrom(
// // // //                           backgroundColor: Colors.grey,
// // // //                           padding: const EdgeInsets.symmetric(
// // // //                               horizontal: 40, vertical: 15),
// // // //                           shape: RoundedRectangleBorder(
// // // //                             borderRadius: BorderRadius.circular(10),
// // // //                           ),
// // // //                         ),
// // // //                         onPressed: () {
// // // //                           Navigator.pop(context);
// // // //                         },
// // // //                         child: const Text(
// // // //                           'Cancel',
// // // //                           style: TextStyle(
// // // //                             fontSize: 20,
// // // //                             color: Colors.white,
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // import 'package:attendance_app/features/attendance/cubits/cubit_admin/lecture_cubit.dart';
// // // import 'package:attendance_app/features/attendance/cubits/cubit_admin/lecture_state.dart';
// // // import 'package:attendance_app/features/attendance/models/lecture_model_admin.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:intl/intl.dart';
// // // import 'package:flutter_bloc/flutter_bloc.dart';

// // // class UpdateLecturePage extends StatelessWidget {
// // //   final LectureModel lecture;
// // //   final String courseId;

// // //   const UpdateLecturePage({
// // //     Key? key,
// // //     required this.lecture,
// // //     required this.courseId,
// // //   }) : super(key: key);

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return BlocProvider(
// // //       create: (context) => LectureCubit(courseId: courseId),
// // //       child: UpdateLectureContent(lecture: lecture),
// // //     );
// // //   }
// // // }

// // // class UpdateLectureContent extends StatefulWidget {
// // //   final LectureModel lecture;

// // //   const UpdateLectureContent({Key? key, required this.lecture}) : super(key: key);

// // //   @override
// // //   _UpdateLectureContentState createState() => _UpdateLectureContentState();
// // // }

// // // class _UpdateLectureContentState extends State<UpdateLectureContent> {
// // //   late TextEditingController _lectureNameController;
// // //   late TextEditingController _dateController;
// // //   late TextEditingController _timeController;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _lectureNameController = TextEditingController(text: widget.lecture.name);
// // //     _dateController = TextEditingController(text: widget.lecture.date);
// // //     _timeController = TextEditingController(text: widget.lecture.time);
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _lectureNameController.dispose();
// // //     _dateController.dispose();
// // //     _timeController.dispose();
// // //     super.dispose();
// // //   }

// // //   void _pickDate() async {
// // //     DateTime? pickedDate = await showDatePicker(
// // //       context: context,
// // //       initialDate: DateTime.now(),
// // //       firstDate: DateTime(2000),
// // //       lastDate: DateTime(3000),
// // //       builder: (context, child) {
// // //         return Theme(
// // //           data: Theme.of(context).copyWith(
// // //             colorScheme: const ColorScheme.light(
// // //               primary: AppColors.primaryColor,
// // //               onPrimary: Colors.white,
// // //               onSurface: Colors.black,
// // //             ),
// // //             textButtonTheme: TextButtonThemeData(
// // //               style: TextButton.styleFrom(
// // //                 foregroundColor: AppColors.primaryColor,
// // //               ),
// // //             ),
// // //           ),
// // //           child: child!,
// // //         );
// // //       },
// // //     );

// // //     if (pickedDate != null) {
// // //       setState(() {
// // //         _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
// // //       });
// // //     }
// // //   }

// // //   void _pickTime() async {
// // //     TimeOfDay? pickedTime = await showTimePicker(
// // //       context: context,
// // //       initialTime: TimeOfDay.now(),
// // //       builder: (context, child) {
// // //         return Theme(
// // //           data: Theme.of(context).copyWith(
// // //             colorScheme: const ColorScheme.light(
// // //               primary: AppColors.primaryColor,
// // //               onPrimary: Colors.white,
// // //               onSurface: Colors.black,
// // //             ),
// // //             textButtonTheme: TextButtonThemeData(
// // //               style: TextButton.styleFrom(
// // //                 foregroundColor: AppColors.primaryColor,
// // //               ),
// // //             ),
// // //           ),
// // //           child: child!,
// // //         );
// // //       },
// // //     );

// // //     if (pickedTime != null) {
// // //       setState(() {
// // //         _timeController.text = pickedTime.format(context);
// // //       });
// // //     }
// // //   }

// // //   void _updateLecture() {
// // //     if (_lectureNameController.text.isEmpty ||
// // //         _dateController.text.isEmpty ||
// // //         _timeController.text.isEmpty) {
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         const SnackBar(content: Text('Please fill all fields')),
// // //       );
// // //       return;
// // //     }

// // //     final updatedLecture = LectureModel(
// // //       number: widget.lecture.number,
// // //       name: _lectureNameController.text,
// // //       date: _dateController.text,
// // //       time: _timeController.text,
// // //       isPresent: widget.lecture.isPresent,
// // //     );

// // //     context.read<LectureCubit>().updateLecture(updatedLecture);
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return BlocListener<LectureCubit, LectureState>(
// // //       listener: (context, state) {
// // //         if (state.isUpdating && state.status == LectureStatus.success) {
// // //           ScaffoldMessenger.of(context).showSnackBar(
// // //             SnackBar(content: Text('Lecture ${widget.lecture.number} updated')),
// // //           );
// // //           Navigator.pop(context);
// // //         } else if (state.isUpdating && state.status == LectureStatus.failure) {
// // //           ScaffoldMessenger.of(context).showSnackBar(
// // //             SnackBar(content: Text('Error: ${state.errorMessage}')),
// // //           );
// // //         }
// // //       },
// // //       child: Scaffold(
// // //         backgroundColor: Colors.white,
// // //         appBar: AppBar(
// // //           iconTheme: const IconThemeData(color: Colors.white),
// // //           backgroundColor: AppColors.primaryColor,
// // //           centerTitle: true,
// // //           title: Text(
// // //             'Update Lecture ${widget.lecture.number}',
// // //             style: const TextStyle(
// // //               fontSize: 22,
// // //               fontWeight: FontWeight.bold,
// // //               color: Colors.white,
// // //             ),
// // //           ),
// // //         ),
// // //         body: Padding(
// // //           padding: const EdgeInsets.all(16.0),
// // //           child: SingleChildScrollView(
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 TextField(
// // //                   controller: _lectureNameController,
// // //                   decoration: InputDecoration(
// // //                     labelText: 'Lecture Name',
// // //                     labelStyle: const TextStyle(color: Colors.black),
// // //                     enabledBorder: OutlineInputBorder(
// // //                       borderRadius: BorderRadius.circular(12),
// // //                       borderSide: const BorderSide(color: Colors.grey, width: 1),
// // //                     ),
// // //                     focusedBorder: OutlineInputBorder(
// // //                       borderRadius: BorderRadius.circular(12),
// // //                       borderSide: const BorderSide(
// // //                           color: AppColors.primaryColor, width: 2),
// // //                     ),
// // //                     contentPadding: const EdgeInsets.symmetric(
// // //                         vertical: 15, horizontal: 10),
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 10),
// // //                 Container(
// // //                   decoration: BoxDecoration(
// // //                     color: Colors.white,
// // //                     borderRadius: BorderRadius.circular(12),
// // //                     boxShadow: [
// // //                       BoxShadow(
// // //                         color: Colors.grey.withOpacity(0.3),
// // //                         blurRadius: 6,
// // //                         offset: const Offset(0, 3),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                   child: TextField(
// // //                     controller: _dateController,
// // //                     readOnly: true,
// // //                     onTap: _pickDate,
// // //                     decoration: InputDecoration(
// // //                       labelText: 'Select Date',
// // //                       labelStyle: const TextStyle(color: Colors.black),
// // //                       enabledBorder: OutlineInputBorder(
// // //                         borderRadius: BorderRadius.circular(12),
// // //                         borderSide:
// // //                             const BorderSide(color: Colors.grey, width: 1),
// // //                       ),
// // //                       focusedBorder: OutlineInputBorder(
// // //                         borderRadius: BorderRadius.circular(12),
// // //                         borderSide: const BorderSide(
// // //                             color: AppColors.primaryColor, width: 2),
// // //                       ),
// // //                       contentPadding: const EdgeInsets.symmetric(
// // //                           vertical: 15, horizontal: 10),
// // //                       suffixIcon: const Icon(Icons.calendar_today),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 10),
// // //                 Container(
// // //                   decoration: BoxDecoration(
// // //                     color: Colors.white,
// // //                     borderRadius: BorderRadius.circular(12),
// // //                     boxShadow: [
// // //                       BoxShadow(
// // //                         color: Colors.grey.withOpacity(0.3),
// // //                         blurRadius: 6,
// // //                         offset: const Offset(0, 3),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                   child: TextField(
// // //                     controller: _timeController,
// // //                     readOnly: true,
// // //                     onTap: _pickTime,
// // //                     decoration: InputDecoration(
// // //                       labelText: 'Select Time',
// // //                       labelStyle: const TextStyle(color: Colors.black),
// // //                       enabledBorder: OutlineInputBorder(
// // //                         borderRadius: BorderRadius.circular(12),
// // //                         borderSide:
// // //                             const BorderSide(color: Colors.grey, width: 1),
// // //                       ),
// // //                       focusedBorder: OutlineInputBorder(
// // //                         borderRadius: BorderRadius.circular(12),
// // //                         borderSide: const BorderSide(
// // //                             color: AppColors.primaryColor, width: 2),
// // //                       ),
// // //                       contentPadding: const EdgeInsets.symmetric(
// // //                           vertical: 15, horizontal: 10),
// // //                       suffixIcon: const Icon(Icons.access_time),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 30),
// // //                 Center(
// // //                   child: Row(
// // //                     mainAxisAlignment: MainAxisAlignment.center,
// // //                     children: [
// // //                       BlocBuilder<LectureCubit, LectureState>(
// // //                         builder: (context, state) {
// // //                           return ElevatedButton(
// // //                             style: ElevatedButton.styleFrom(
// // //                               backgroundColor: AppColors.primaryColor,
// // //                               padding: const EdgeInsets.symmetric(
// // //                                   horizontal: 40, vertical: 15),
// // //                               shape: RoundedRectangleBorder(
// // //                                 borderRadius: BorderRadius.circular(10),
// // //                               ),
// // //                             ),
// // //                             onPressed: state.status == LectureStatus.loading
// // //                                 ? null
// // //                                 : _updateLecture,
// // //                             child: state.status == LectureStatus.loading
// // //                                 ? const CircularProgressIndicator(
// // //                                     color: Colors.white,
// // //                                   )
// // //                                 : const Text(
// // //                                     'Update',
// // //                                     style: TextStyle(
// // //                                       fontSize: 20,
// // //                                       color: Colors.white,
// // //                                     ),
// // //                                   ),
// // //                           );
// // //                         },
// // //                       ),
// // //                       const SizedBox(width: 20),
// // //                       ElevatedButton(
// // //                         style: ElevatedButton.styleFrom(
// // //                           backgroundColor: Colors.grey,
// // //                           padding: const EdgeInsets.symmetric(
// // //                               horizontal: 40, vertical: 15),
// // //                           shape: RoundedRectangleBorder(
// // //                             borderRadius: BorderRadius.circular(10),
// // //                           ),
// // //                         ),
// // //                         onPressed: () {
// // //                           Navigator.pop(context);
// // //                         },
// // //                         child: const Text(
// // //                           'Cancel',
// // //                           style: TextStyle(
// // //                             fontSize: 20,
// // //                             color: Colors.white,
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:attendance_app/core/utils/app_colors.dart';
// // import 'package:attendance_app/features/attendance/cubits/cubit_admin/lecture_cubit.dart';
// // import 'package:attendance_app/features/attendance/cubits/cubit_admin/lecture_state.dart';
// // import 'package:attendance_app/features/attendance/models/lecture_model_admin.dart';
// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';

// // class UpdateLecturePage extends StatelessWidget {
// //   final LectureModel lecture;
// //   final String courseId;

// //   const UpdateLecturePage({
// //     Key? key,
// //     required this.lecture,
// //     required this.courseId,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocProvider(
// //       create: (context) => LectureCubit(courseId: courseId),
// //       child: UpdateLectureContent(lecture: lecture),
// //     );
// //   }
// // }

// // class UpdateLectureContent extends StatefulWidget {
// //   final LectureModel lecture;

// //   const UpdateLectureContent({Key? key, required this.lecture}) : super(key: key);

// //   @override
// //   _UpdateLectureContentState createState() => _UpdateLectureContentState();
// // }

// // class _UpdateLectureContentState extends State<UpdateLectureContent> {
// //   late TextEditingController _lectureNameController;
// //   late TextEditingController _dateController;
// //   late TextEditingController _timeController;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _lectureNameController = TextEditingController(text: widget.lecture.name);
// //     _dateController = TextEditingController(text: widget.lecture.date);
// //     _timeController = TextEditingController(text: widget.lecture.time);
// //   }

// //   @override
// //   void dispose() {
// //     _lectureNameController.dispose();
// //     _dateController.dispose();
// //     _timeController.dispose();
// //     super.dispose();
// //   }

// //   void _pickDate() async {
// //     DateTime? pickedDate = await showDatePicker(
// //       context: context,
// //       initialDate: DateTime.now(),
// //       firstDate: DateTime(2000),
// //       lastDate: DateTime(3000),
// //       builder: (context, child) {
// //         return Theme(
// //           data: Theme.of(context).copyWith(
// //             colorScheme: const ColorScheme.light(
// //               primary: AppColors.primaryColor,
// //               onPrimary: Colors.white,
// //               onSurface: Colors.black,
// //             ),
// //             textButtonTheme: TextButtonThemeData(
// //               style: TextButton.styleFrom(
// //                 foregroundColor: AppColors.primaryColor,
// //               ),
// //             ),
// //           ),
// //           child: child!,
// //         );
// //       },
// //     );

// //     if (pickedDate != null) {
// //       setState(() {
// //         _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
// //       });
// //     }
// //   }

// //   void _pickTime() async {
// //     TimeOfDay? pickedTime = await showTimePicker(
// //       context: context,
// //       initialTime: TimeOfDay.now(),
// //       builder: (context, child) {
// //         return Theme(
// //           data: Theme.of(context).copyWith(
// //             colorScheme: const ColorScheme.light(
// //               primary: AppColors.primaryColor,
// //               onPrimary: Colors.white,
// //               onSurface: Colors.black,
// //             ),
// //             textButtonTheme: TextButtonThemeData(
// //               style: TextButton.styleFrom(
// //                 foregroundColor: AppColors.primaryColor,
// //               ),
// //             ),
// //           ),
// //           child: child!,
// //         );
// //       },
// //     );

// //     if (pickedTime != null) {
// //       setState(() {
// //         _timeController.text = pickedTime.format(context);
// //       });
// //     }
// //   }

// //   void _updateLecture() {
// //     if (_lectureNameController.text.isEmpty ||
// //         _dateController.text.isEmpty ||
// //         _timeController.text.isEmpty) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('Please fill all fields')),
// //       );
// //       return;
// //     }

// //     final updatedLecture = LectureModel(
// //       number: widget.lecture.number,
// //       name: _lectureNameController.text,
// //       date: _dateController.text,
// //       time: _timeController.text,
// //       isPresent: widget.lecture.isPresent,
// //     );

// //     context.read<LectureCubit>().updateLecture(updatedLecture);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocListener<LectureCubit, LectureState>(
// //       listener: (context, state) {
// //         if (state.isUpdating && state.status == LectureStatus.success) {
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(content: Text('Lecture ${widget.lecture.number} updated')),
// //           );
// //           // إضافة تأخير بسيط لضمان تحديث الواجهة قبل الخروج
// //           Future.delayed(const Duration(milliseconds: 500), () {
// //             Navigator.pop(context);
// //           });
// //         } else if (state.isUpdating && state.status == LectureStatus.failure) {
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(content: Text('Error: ${state.errorMessage}')),
// //           );
// //         }
// //       },
// //       child: Scaffold(
// //         backgroundColor: Colors.white,
// //         appBar: AppBar(
// //           iconTheme: const IconThemeData(color: Colors.white),
// //           backgroundColor: AppColors.primaryColor,
// //           centerTitle: true,
// //           title: Text(
// //             'Update Lecture ${widget.lecture.number}',
// //             style: const TextStyle(
// //               fontSize: 22,
// //               fontWeight: FontWeight.bold,
// //               color: Colors.white,
// //             ),
// //           ),
// //         ),
// //         body: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: SingleChildScrollView(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 TextField(
// //                   controller: _lectureNameController,
// //                   decoration: InputDecoration(
// //                     labelText: 'Lecture Name',
// //                     labelStyle: const TextStyle(color: Colors.black),
// //                     enabledBorder: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                       borderSide: const BorderSide(color: Colors.grey, width: 1),
// //                     ),
// //                     focusedBorder: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                       borderSide: const BorderSide(
// //                           color: AppColors.primaryColor, width: 2),
// //                     ),
// //                     contentPadding: const EdgeInsets.symmetric(
// //                         vertical: 15, horizontal: 10),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 10),
// //                 Container(
// //                   decoration: BoxDecoration(
// //                     color: Colors.white,
// //                     borderRadius: BorderRadius.circular(12),
// //                     boxShadow: [
// //                       BoxShadow(
// //                         color: Colors.grey.withOpacity(0.3),
// //                         blurRadius: 6,
// //                         offset: const Offset(0, 3),
// //                       ),
// //                     ],
// //                   ),
// //                   child: TextField(
// //                     controller: _dateController,
// //                     readOnly: true,
// //                     onTap: _pickDate,
// //                     decoration: InputDecoration(
// //                       labelText: 'Select Date',
// //                       labelStyle: const TextStyle(color: Colors.black),
// //                       enabledBorder: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(12),
// //                         borderSide:
// //                             const BorderSide(color: Colors.grey, width: 1),
// //                       ),
// //                       focusedBorder: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(12),
// //                         borderSide: const BorderSide(
// //                             color: AppColors.primaryColor, width: 2),
// //                       ),
// //                       contentPadding: const EdgeInsets.symmetric(
// //                           vertical: 15, horizontal: 10),
// //                       suffixIcon: const Icon(Icons.calendar_today),
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 10),
// //                 Container(
// //                   decoration: BoxDecoration(
// //                     color: Colors.white,
// //                     borderRadius: BorderRadius.circular(12),
// //                     boxShadow: [
// //                       BoxShadow(
// //                         color: Colors.grey.withOpacity(0.3),
// //                         blurRadius: 6,
// //                         offset: const Offset(0, 3),
// //                       ),
// //                     ],
// //                   ),
// //                   child: TextField(
// //                     controller: _timeController,
// //                     readOnly: true,
// //                     onTap: _pickTime,
// //                     decoration: InputDecoration(
// //                       labelText: 'Select Time',
// //                       labelStyle: const TextStyle(color: Colors.black),
// //                       enabledBorder: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(12),
// //                         borderSide:
// //                             const BorderSide(color: Colors.grey, width: 1),
// //                       ),
// //                       focusedBorder: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(12),
// //                         borderSide: const BorderSide(
// //                             color: AppColors.primaryColor, width: 2),
// //                       ),
// //                       contentPadding: const EdgeInsets.symmetric(
// //                           vertical: 15, horizontal: 10),
// //                       suffixIcon: const Icon(Icons.access_time),
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 30),
// //                 Center(
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       BlocBuilder<LectureCubit, LectureState>(
// //                         builder: (context, state) {
// //                           return ElevatedButton(
// //                             style: ElevatedButton.styleFrom(
// //                               backgroundColor: AppColors.primaryColor,
// //                               padding: const EdgeInsets.symmetric(
// //                                   horizontal: 40, vertical: 15),
// //                               shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(10),
// //                               ),
// //                             ),
// //                             onPressed: state.status == LectureStatus.loading
// //                                 ? null
// //                                 : _updateLecture,
// //                             child: state.status == LectureStatus.loading
// //                                 ? const CircularProgressIndicator(
// //                                     color: Colors.white,
// //                                   )
// //                                 : const Text(
// //                                     'Update',
// //                                     style: TextStyle(
// //                                       fontSize: 20,
// //                                       color: Colors.white,
// //                                     ),
// //                                   ),
// //                           );
// //                         },
// //                       ),
// //                       const SizedBox(width: 20),
// //                       ElevatedButton(
// //                         style: ElevatedButton.styleFrom(
// //                           backgroundColor: Colors.grey,
// //                           padding: const EdgeInsets.symmetric(
// //                               horizontal: 40, vertical: 15),
// //                           shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(10),
// //                           ),
// //                         ),
// //                         onPressed: () {
// //                           Navigator.pop(context);
// //                         },
// //                         child: const Text(
// //                           'Cancel',
// //                           style: TextStyle(
// //                             fontSize: 20,
// //                             color: Colors.white,
// //                           ),
// //                         ),
// //                       ),
// //                     ],
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

// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/attendance/cubits/cubit_admin/lecture_cubit.dart';
// import 'package:attendance_app/features/attendance/cubits/cubit_admin/lecture_state.dart';
// import 'package:attendance_app/features/attendance/models/lecture_model_admin.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class UpdateLecturePage extends StatelessWidget {
//   final LectureModel lecture;
//   final String courseId;

//   const UpdateLecturePage({
//     Key? key,
//     required this.lecture,
//     required this.courseId,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LectureCubit(courseId: courseId),
//       child: UpdateLectureContent(lecture: lecture),
//     );
//   }
// }

// class UpdateLectureContent extends StatefulWidget {
//   final LectureModel lecture;

//   const UpdateLectureContent({Key? key, required this.lecture})
//       : super(key: key);

//   @override
//   _UpdateLectureContentState createState() => _UpdateLectureContentState();
// }

// class _UpdateLectureContentState extends State<UpdateLectureContent> {
//   late TextEditingController _lectureNameController;
//   late TextEditingController _dateController;
//   late TextEditingController _timeController;

//   @override
//   void initState() {
//     super.initState();
//     _lectureNameController = TextEditingController(text: widget.lecture.name);
//     _dateController = TextEditingController(text: widget.lecture.date);
//     _timeController = TextEditingController(text: widget.lecture.time);
//   }

//   @override
//   void dispose() {
//     _lectureNameController.dispose();
//     _dateController.dispose();
//     _timeController.dispose();
//     super.dispose();
//   }

//   void _pickDate() async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(3000),
//       builder: (context, child) {
//         return Theme(
//           data: Theme.of(context).copyWith(
//             colorScheme: const ColorScheme.light(
//               primary: AppColors.primaryColor,
//               onPrimary: Colors.white,
//               onSurface: Colors.black,
//             ),
//             textButtonTheme: TextButtonThemeData(
//               style: TextButton.styleFrom(
//                 foregroundColor: AppColors.primaryColor,
//               ),
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );

//     if (pickedDate != null) {
//       setState(() {
//         _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
//       });
//     }
//   }

//   void _pickTime() async {
//     TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//       builder: (context, child) {
//         return Theme(
//           data: Theme.of(context).copyWith(
//             colorScheme: const ColorScheme.light(
//               primary: AppColors.primaryColor,
//               onPrimary: Colors.white,
//               onSurface: Colors.black,
//             ),
//             textButtonTheme: TextButtonThemeData(
//               style: TextButton.styleFrom(
//                 foregroundColor: AppColors.primaryColor,
//               ),
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );

//     if (pickedTime != null) {
//       setState(() {
//         _timeController.text = pickedTime.format(context);
//       });
//     }
//   }

//   void _updateLecture() {
//     if (_lectureNameController.text.isEmpty ||
//         _dateController.text.isEmpty ||
//         _timeController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please fill all fields')),
//       );
//       return;
//     }

//     final updatedLecture = LectureModel(
//       number: widget.lecture.number,
//       name: _lectureNameController.text,
//       date: _dateController.text,
//       time: _timeController.text,
//       isPresent: widget.lecture.isPresent,
//     );

//     context.read<LectureCubit>().updateLecture(updatedLecture);
//     // الخروج مباشرة بعد التعديل كحل بديل
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Lecture ${widget.lecture.number} updated')),
//     );
//     Future.delayed(const Duration(milliseconds: 500), () {
//       Navigator.pop(context);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<LectureCubit, LectureState>(
//       listener: (context, state) {
//         print(
//             'BlocListener state: status=${state.status}, isUpdating=${state.isUpdating}'); // للتصحيح
//         if (state.isUpdating && state.status == LectureStatus.success) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Lecture ${widget.lecture.number} updated')),
//           );
//           Future.delayed(const Duration(milliseconds: 500), () {
//             Navigator.pop(context);
//           });
//         } else if (state.isUpdating && state.status == LectureStatus.failure) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Error: ${state.errorMessage}')),
//           );
//         }
//       },
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           iconTheme: const IconThemeData(color: Colors.white),
//           backgroundColor: AppColors.primaryColor,
//           centerTitle: true,
//           title: Text(
//             'Update Lecture ${widget.lecture.number}',
//             style: const TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextField(
//                   controller: _lectureNameController,
//                   decoration: InputDecoration(
//                     labelText: 'Lecture Name',
//                     labelStyle: const TextStyle(color: Colors.black),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide:
//                           const BorderSide(color: Colors.grey, width: 1),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: const BorderSide(
//                           color: AppColors.primaryColor, width: 2),
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(
//                         vertical: 15, horizontal: 10),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.3),
//                         blurRadius: 6,
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: TextField(
//                     controller: _dateController,
//                     readOnly: true,
//                     onTap: _pickDate,
//                     decoration: InputDecoration(
//                       labelText: 'Select Date',
//                       labelStyle: const TextStyle(color: Colors.black),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide:
//                             const BorderSide(color: Colors.grey, width: 1),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(
//                             color: AppColors.primaryColor, width: 2),
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(
//                           vertical: 15, horizontal: 10),
//                       suffixIcon: const Icon(Icons.calendar_today),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.3),
//                         blurRadius: 6,
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: TextField(
//                     controller: _timeController,
//                     readOnly: true,
//                     onTap: _pickTime,
//                     decoration: InputDecoration(
//                       labelText: 'Select Time',
//                       labelStyle: const TextStyle(color: Colors.black),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide:
//                             const BorderSide(color: Colors.grey, width: 1),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(
//                             color: AppColors.primaryColor, width: 2),
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(
//                           vertical: 15, horizontal: 10),
//                       suffixIcon: const Icon(Icons.access_time),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 Center(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       BlocBuilder<LectureCubit, LectureState>(
//                         builder: (context, state) {
//                           return ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: AppColors.primaryColor,
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 40, vertical: 15),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                             onPressed: state.status == LectureStatus.loading
//                                 ? null
//                                 : _updateLecture,
//                             child: state.status == LectureStatus.loading
//                                 ? const CircularProgressIndicator(
//                                     color: Colors.white,
//                                   )
//                                 : const Text(
//                                     'Update',
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                           );
//                         },
//                       ),
//                       const SizedBox(width: 20),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.grey,
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 40, vertical: 15),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Text(
//                           'Cancel',
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/attendance/cubits/cubit_admin/lecture_cubit.dart';
import 'package:attendance_app/features/attendance/cubits/cubit_admin/lecture_state.dart';
import 'package:attendance_app/features/attendance/models/lecture_model_admin.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateLecturePage extends StatelessWidget {
  final LectureModel lecture;
  final String courseId;
  final LectureCubit lectureCubit; // استقبال LectureCubit

  const UpdateLecturePage({
    Key? key,
    required this.lecture,
    required this.courseId,
    required this.lectureCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: lectureCubit, // استخدام LectureCubit الممرر
      child: UpdateLectureContent(lecture: lecture),
    );
  }
}

class UpdateLectureContent extends StatefulWidget {
  final LectureModel lecture;

  const UpdateLectureContent({Key? key, required this.lecture}) : super(key: key);

  @override
  _UpdateLectureContentState createState() => _UpdateLectureContentState();
}

class _UpdateLectureContentState extends State<UpdateLectureContent> {
  late TextEditingController _lectureNameController;
  late TextEditingController _dateController;
  late TextEditingController _timeController;

  @override
  void initState() {
    super.initState();
    _lectureNameController = TextEditingController(text: widget.lecture.name);
    _dateController = TextEditingController(text: widget.lecture.date);
    _timeController = TextEditingController(text: widget.lecture.time);
  }

  @override
  void dispose() {
    _lectureNameController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  void _pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      setState(() {
        _timeController.text = pickedTime.format(context);
      });
    }
  }

  void _updateLecture() {
    if (_lectureNameController.text.isEmpty ||
        _dateController.text.isEmpty ||
        _timeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    final updatedLecture = LectureModel(
      number: widget.lecture.number,
      name: _lectureNameController.text,
      date: _dateController.text,
      time: _timeController.text,
      isPresent: widget.lecture.isPresent,
    );

    context.read<LectureCubit>().updateLecture(updatedLecture);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LectureCubit, LectureState>(
      listener: (context, state) {
        print('BlocListener state: status=${state.status}, isUpdating=${state.isUpdating}'); // للتصحيح
        if (state.status == LectureStatus.success && state.isUpdating) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Lecture ${widget.lecture.number} updated')),
          );
          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.pop(context);
          });
        } else if (state.status == LectureStatus.failure && state.isUpdating) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.errorMessage}')),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: Text(
            'Update Lecture ${widget.lecture.number}',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _lectureNameController,
                  decoration: InputDecoration(
                    labelText: 'Lecture Name',
                    labelStyle: const TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.grey, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor, width: 2),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _dateController,
                    readOnly: true,
                    onTap: _pickDate,
                    decoration: InputDecoration(
                      labelText: 'Select Date',
                      labelStyle: const TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                            color: AppColors.primaryColor, width: 2),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      suffixIcon: const Icon(Icons.calendar_today),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _timeController,
                    readOnly: true,
                    onTap: _pickTime,
                    decoration: InputDecoration(
                      labelText: 'Select Time',
                      labelStyle: const TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                            color: AppColors.primaryColor, width: 2),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      suffixIcon: const Icon(Icons.access_time),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocBuilder<LectureCubit, LectureState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: state.status == LectureStatus.loading
                                ? null
                                : _updateLecture,
                            child: state.status == LectureStatus.loading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    'Update',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                          );
                        },
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
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