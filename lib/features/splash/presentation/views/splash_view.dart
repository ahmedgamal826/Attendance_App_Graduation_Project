// import 'package:attendance_app/features/splash/data/splash_logic.dart';
// import 'package:attendance_app/features/splash/presentation/views/widgets/animated_text.dart';
// import 'package:flutter/material.dart';

// class SplashView extends StatelessWidget {
//   const SplashView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset('assets/images/logo.gif'),
//               const SizedBox(height: 20),
//               AnimatedText(
//                 onFinished: () => SplashLogic.NavigateToChatHomeView(context),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/splash/data/splash_logic.dart';
import 'package:attendance_app/features/splash/presentation/views/widgets/animated_text.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/4.png',
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            AnimatedText(
              onFinished: () => SplashLogic.NavigateToChatHomeView(context),
            ),
          ],
        ),
      ),
    );
  }
}
