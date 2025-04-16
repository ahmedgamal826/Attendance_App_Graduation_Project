import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final _firestore = FirebaseFirestore.instance;
  // Local state for dropdowns
  int startHour = 1;
  int startMinute = 0;
  String startPeriod = 'AM';
  int endHour = 1;
  int endMinute = 0;
  String endPeriod = 'AM';
  bool isLoading = false;
  String cameraStatus = 'closed'; // Track camera status

  @override
  void initState() {
    super.initState();
    _loadInitialSchedule();
    _listenToCameraStatus(); // Listen to camera status changes
  }

  // Load initial schedule from Firebase
  void _loadInitialSchedule() async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('schedule').doc('daily').get();
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        setState(() {
          startHour = data['start_hour_12'] ?? 1;
          startMinute = data['start_minute'] ?? 0;
          startPeriod = data['start_period'] ?? 'AM';
          endHour = data['end_hour_12'] ?? 1;
          endMinute = data['end_minute'] ?? 0;
          endPeriod = data['end_period'] ?? 'AM';
          cameraStatus = data['camera_status'] ?? 'closed';
        });
      }
    } catch (e) {
      print('Error loading initial schedule: $e');
    }
  }

  // Listen to camera status changes
  void _listenToCameraStatus() {
    _firestore.collection('schedule').doc('daily').snapshots().listen(
      (snapshot) {
        if (snapshot.exists) {
          final data = snapshot.data() as Map<String, dynamic>;
          setState(() {
            cameraStatus = data['camera_status'] ?? 'closed';
          });
        }
      },
      onError: (error) {
        print('Error listening to camera status: $error');
      },
    );
  }

  // Validate and save schedule
  void _saveSchedule() async {
    // Simple validation: Ensure end time is after start time
    int startHour24 = startHour;
    if (startPeriod == 'PM' && startHour != 12) startHour24 += 12;
    if (startPeriod == 'AM' && startHour == 12) startHour24 = 0;
    int endHour24 = endHour;
    if (endPeriod == 'PM' && endHour != 12) endHour24 += 12;
    if (endPeriod == 'AM' && endHour == 12) endHour24 = 0;

    int startMinutes = startHour24 * 60 + startMinute;
    int endMinutes = endHour24 * 60 + endMinute;

    if (endMinutes <= startMinutes) {
      _showErrorDialog('End time must be after start time.');
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await _firestore.collection('schedule').doc('daily').set({
        'start_hour_12': startHour,
        'start_minute': startMinute,
        'start_period': startPeriod,
        'end_hour_12': endHour,
        'end_minute': endMinute,
        'end_period': endPeriod,
        'camera_status': 'closed',
        'last_updated': Timestamp.now(),
      });
      _showSuccessDialog(
          'Schedule saved successfully: Start $startHour:${startMinute.toString().padLeft(2, '0')} $startPeriod, End $endHour:${endMinute.toString().padLeft(2, '0')} $endPeriod');
    } catch (e) {
      _showErrorDialog('Error saving schedule: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Close camera
  void _closeCamera() async {
    setState(() {
      isLoading = true;
    });

    try {
      await _firestore.collection('schedule').doc('daily').update({
        'camera_status': 'stopped',
      });
      _showSuccessDialog('Camera closed successfully.');
    } catch (e) {
      _showErrorDialog('Error closing camera: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Open camera
  void _openCamera() async {
    setState(() {
      isLoading = true;
    });

    try {
      await _firestore.collection('schedule').doc('daily').update({
        'camera_status': 'open',
      });
      _showSuccessDialog('Camera opened successfully.');
    } catch (e) {
      _showErrorDialog('Error opening camera: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Show success dialog
  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 10),
            Text('Success',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          ],
        ),
        content: Text(message, style: GoogleFonts.poppins()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK', style: GoogleFonts.poppins(color: Colors.blue)),
          ),
        ],
      ),
    );
  }

  // Show error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Row(
          children: [
            Icon(Icons.error, color: Colors.red),
            SizedBox(width: 10),
            Text('Error',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          ],
        ),
        content: Text(message, style: GoogleFonts.poppins()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK', style: GoogleFonts.poppins(color: Colors.blue)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade300, Colors.purple.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Custom AppBar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Set Attendance Schedule',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Camera Status Indicator
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          cameraStatus == 'open'
                              ? Icons.videocam
                              : Icons.videocam_off,
                          color: cameraStatus == 'open'
                              ? Colors.green
                              : Colors.red,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          cameraStatus == 'open'
                              ? 'Camera Open'
                              : 'Camera Closed',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: cameraStatus == 'open'
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                // Start Time
                Text(
                  'Start Time',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDropdown(
                      value: startHour,
                      items: List.generate(12, (index) => index + 1),
                      onChanged: (value) => setState(() => startHour = value!),
                      width: 80,
                    ),
                    Text(':',
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colors.white)),
                    _buildDropdown(
                      value: startMinute,
                      items: List.generate(60, (index) => index),
                      onChanged: (value) =>
                          setState(() => startMinute = value!),
                      width: 80,
                      format: (value) => value.toString().padLeft(2, '0'),
                    ),
                    SizedBox(width: 10),
                    _buildDropdown(
                      value: startPeriod,
                      items: ['AM', 'PM'],
                      onChanged: (value) =>
                          setState(() => startPeriod = value!),
                      width: 80,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                // End Time
                Text(
                  'End Time',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDropdown(
                      value: endHour,
                      items: List.generate(12, (index) => index + 1),
                      onChanged: (value) => setState(() => endHour = value!),
                      width: 80,
                    ),
                    Text(':',
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colors.white)),
                    _buildDropdown(
                      value: endMinute,
                      items: List.generate(60, (index) => index),
                      onChanged: (value) => setState(() => endMinute = value!),
                      width: 80,
                      format: (value) => value.toString().padLeft(2, '0'),
                    ),
                    SizedBox(width: 10),
                    _buildDropdown(
                      value: endPeriod,
                      items: ['AM', 'PM'],
                      onChanged: (value) => setState(() => endPeriod = value!),
                      width: 80,
                    ),
                  ],
                ),
                Spacer(),
                // Save Button
                Center(
                  child: ElevatedButton.icon(
                    onPressed: isLoading ? null : _saveSchedule,
                    icon: isLoading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Icon(Icons.save),
                    label: Text(
                      isLoading ? 'Saving...' : 'Save Schedule',
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue.shade700,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Close Camera Button
                Center(
                  child: ElevatedButton.icon(
                    onPressed: (isLoading || cameraStatus != 'open')
                        ? null
                        : _closeCamera,
                    icon: Icon(Icons.videocam_off),
                    label: Text(
                      isLoading ? 'Closing...' : 'Close Camera',
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade400,
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Open Camera Button
                Center(
                  child: ElevatedButton.icon(
                    onPressed: (isLoading || cameraStatus == 'open')
                        ? null
                        : _openCamera,
                    icon: Icon(Icons.videocam),
                    label: Text(
                      isLoading ? 'Opening...' : 'Open Camera',
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade400,
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Custom Dropdown Widget
  Widget _buildDropdown<T>({
    required T value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
    required double width,
    String Function(T)? format,
  }) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                format != null ? format(item) : item.toString(),
                style: GoogleFonts.poppins(
                    fontSize: 16, color: Colors.blue.shade700),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down, color: Colors.blue.shade700),
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
