// import 'package:attendance_app/features/auth/presentations/views/login_screen.dart';
// import 'package:attendance_app/features/auth/presentations/views/widget/custom_card_option.dart';
// import 'package:flutter/material.dart';

// class AdminOrStudent extends StatelessWidget {
//   const AdminOrStudent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     ;

//     return Scaffold(
//       body: Container(
//         width: width,
//         decoration: const BoxDecoration(
//           color: Color(0xff70ACF4),
//           // gradient: LinearGradient(
//           //     colors: [Colors.blue.shade300, Colors.blue.shade700],
//           //     begin: Alignment.topLeft,
//           //     end: Alignment.bottomRight,
//           //   ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CustomCardOption(
//               height: height,
//               image: 'assets/images/manager.png',
//               name: 'Admin',
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const LoginScreen(),
//                   ),
//                 );
//               },
//             ),
//             const Text(
//               'OR',
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 15),
//             CustomCardOption(
//               height: height,
//               image: 'assets/images/student.png',
//               name: 'Student',
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const LoginScreen(),
//                   ),
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
