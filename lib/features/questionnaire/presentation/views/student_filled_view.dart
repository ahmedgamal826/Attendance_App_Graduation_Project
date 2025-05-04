import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentsFilledView extends StatelessWidget {
  final String courseId;

  const StudentsFilledView({Key? key, required this.courseId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Students Who Filled Questionnaires',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Courses')
            .doc(courseId)
            .collection('questionnaires')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading data'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.people_outline,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'No students have filled out questionnaires yet',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }

          final questionnaires = snapshot.data!.docs;
          return FutureBuilder<List<bool>>(
            future: _checkIfAnyStudentsFilled(questionnaires, courseId),
            builder: (context, filledSnapshot) {
              if (filledSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }
              if (filledSnapshot.hasError) {
                return const Center(child: Text('Error loading data'));
              }
              final hasAnyStudentsFilled =
                  filledSnapshot.data?.any((filled) => filled) ?? false;

              if (!hasAnyStudentsFilled) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people_outline,
                        size: 80,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'No students have filled out questionnaires yet',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: questionnaires.length,
                  itemBuilder: (context, index) {
                    final questionnaire = questionnaires[index];
                    final questionnaireId = questionnaire.id;

                    return FutureBuilder<QuerySnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('Courses')
                          .doc(courseId)
                          .collection('questionnaires')
                          .doc(questionnaireId)
                          .collection('filledBy')
                          .get(),
                      builder: (context, filledSnapshot) {
                        if (filledSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const SizedBox.shrink();
                        }
                        if (filledSnapshot.hasError) {
                          return const Text('Error loading filled data');
                        }
                        final filledDocs = filledSnapshot.data?.docs ?? [];
                        final studentUids = filledDocs
                            .map((doc) => doc['uid'] as String)
                            .toList();
                        if (studentUids.isEmpty) {
                          return const SizedBox.shrink();
                        }

                        return FutureBuilder<List<Map<String, dynamic>>>(
                          future: _getStudentNames(studentUids),
                          builder: (context, studentNamesSnapshot) {
                            if (studentNamesSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const SizedBox.shrink();
                            }
                            final studentNames =
                                studentNamesSnapshot.data ?? [];

                            return Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Questionnaire ${index + 1}',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    const Text(
                                      'Students who filled this questionnaire:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    studentNames.isEmpty
                                        ? const Text(
                                            'No students have filled this questionnaire yet.',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          )
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: studentNames
                                                .asMap()
                                                .entries
                                                .map((entry) {
                                              final studentIndex = entry.key;
                                              final studentName =
                                                  entry.value['name'] ??
                                                      'Unknown';
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4.0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      '${studentIndex + 1}. ',
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                    Text(
                                                      studentName,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<List<bool>> _checkIfAnyStudentsFilled(
      List<QueryDocumentSnapshot> questionnaires, String courseId) async {
    final List<bool> results = [];
    for (final questionnaire in questionnaires) {
      final questionnaireId = questionnaire.id;
      final snapshot = await FirebaseFirestore.instance
          .collection('Courses')
          .doc(courseId)
          .collection('questionnaires')
          .doc(questionnaireId)
          .collection('filledBy')
          .get();
      final filledDocs = snapshot.docs;
      results.add(filledDocs.isNotEmpty);
    }
    return results;
  }

  Future<List<Map<String, dynamic>>> _getStudentNames(List<String> uids) async {
    final List<Map<String, dynamic>> names = [];
    for (final uid in uids) {
      final doc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (doc.exists) {
        names.add({'name': doc.data()?['name'] ?? 'Unknown'});
      }
    }
    return names;
  }
}
