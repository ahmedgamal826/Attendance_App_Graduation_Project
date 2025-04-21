import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class ShowPDF extends StatefulWidget {
  final String pdfUrl;
  final String? fileName;

  const ShowPDF({super.key, required this.pdfUrl, this.fileName});

  @override
  _ShowPDFState createState() => _ShowPDFState();
}

class _ShowPDFState extends State<ShowPDF> {
  String? _localPath;
  bool _isLoading = true;
  bool _isPDF = true;

  @override
  void initState() {
    super.initState();
    _checkAndDownloadFile();
  }

  Future<void> _checkAndDownloadFile() async {
    try {
      print('Checking file: ${widget.fileName}, URL: ${widget.pdfUrl}');
      if (widget.fileName != null &&
          !widget.fileName!.toLowerCase().endsWith('.pdf')) {
        print('File is not PDF: ${widget.fileName}');
        setState(() {
          _isPDF = false;
          _isLoading = false;
        });
        return;
      }

      print('Downloading PDF from: ${widget.pdfUrl}');
      final response = await http.get(Uri.parse(widget.pdfUrl));
      print(
          'Response status: ${response.statusCode}, Length: ${response.bodyBytes.length}');
      if (response.statusCode != 200) {
        throw Exception('Failed to download PDF: ${response.statusCode}');
      }
      final bytes = response.bodyBytes;
      final dir = await getTemporaryDirectory();
      print('Saving PDF to: ${dir.path}/temp.pdf');
      final file = File('${dir.path}/temp.pdf');
      await file.writeAsBytes(bytes);
      print('File size: ${await file.length()} bytes');
      setState(() {
        _localPath = file.path;
        _isLoading = false;
      });
      print('PDF saved successfully: $_localPath');
    } catch (e) {
      print('Error downloading file: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load file: $e')),
        );
        Navigator.pop(context);
      }
    }
  }

  Future<void> _openInExternalApp() async {
    final Uri uri = Uri.parse(widget.pdfUrl);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error opening file: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    if (_localPath != null) {
      File(_localPath!).delete().catchError((e) {
        print('Error deleting temp file: $e');
      });
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.fileName ?? 'View File'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ))
          : _isPDF && _localPath != null
              ? PDFView(
                  filePath: _localPath!,
                  onError: (error) {
                    print('PDFView error: $error');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error loading PDF: $error')),
                    );
                  },
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        widget.fileName!.toLowerCase().endsWith('.doc') ||
                                widget.fileName!.toLowerCase().endsWith('.docx')
                            ? Icons.description
                            : Icons.insert_drive_file,
                        size: 50,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'This file is not a PDF: ${widget.fileName ?? "Unknown"}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _openInExternalApp,
                        child: const Text('Open in External App'),
                      ),
                    ],
                  ),
                ),
    );
  }
}
