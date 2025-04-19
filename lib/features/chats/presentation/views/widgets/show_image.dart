// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:image_downloader/image_downloader.dart'; // إضافة مكتبة التحميل

// class ShowImage extends StatelessWidget {
//   final String imageUrl;

//   const ShowImage({super.key, required this.imageUrl});

//   // دالة لتحميل الصورة
//   Future<void> _downloadImage(BuildContext context) async {
//     try {
//       // تحميل الصورة باستخدام image_downloader
//       await ImageDownloader.downloadImage(imageUrl);

//       // إظهار رسالة نجاح
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Image downloaded successfully!'),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } catch (e) {
//       // إظهار رسالة خطأ لو حصل مشكلة
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Failed to download image: $e'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(
//               Icons.download,
//               color: Colors.white,
//             ),
//             onPressed: () => _downloadImage(context), // استدعاء دالة التحميل
//           ),
//         ],
//       ),
//       body: Center(
//         child: CachedNetworkImage(
//           imageUrl: imageUrl,
//           fit: BoxFit.contain,
//           placeholder: (context, url) => const CircularProgressIndicator(
//             color: Colors.white,
//           ),
//           errorWidget: (context, url, error) => const Icon(
//             Icons.error,
//             color: Colors.red,
//             size: 50,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {
  final String imageUrl;

  const ShowImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.contain,
          placeholder: (context, url) => const CircularProgressIndicator(
            color: Colors.white,
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: Colors.red,
            size: 50,
          ),
        ),
      ),
    );
  }
}
