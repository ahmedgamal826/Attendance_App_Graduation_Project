import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class StudentsFilledView extends StatelessWidget {
  const StudentsFilledView({Key? key}) : super(key: key);

  // بيانات وهمية للاستبيانات وأسماء الطلاب اللي ملّوها
  final List<Map<String, dynamic>> questionnaires = const [
    {
      'name': 'Questionnaire 1',
      'students': [
        'Mohamed Ahmed',
        'Sara Khaled',
        'Ahmed Mostafa',
        'Fatima Ali',
      ],
    },
    {
      'name': 'Questionnaire 2',
      'students': [
        'Youssef Hassan',
        'Nourhan Mahmoud',
        'Omar Ibrahim',
      ],
    },
    {
      'name': 'Questionnaire 3',
      'students': [
        'Laila Samir',
        'Khaled Omar',
        'Hana Youssef',
        'Amr Tarek',
        'Mariam Adel',
      ],
    },
  ];

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
      body: questionnaires.isEmpty
          ? const Center(
              child: Text(
                'No questionnaires have been filled yet.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: questionnaires.length,
                itemBuilder: (context, index) {
                  final questionnaire = questionnaires[index];
                  final students = questionnaire['students'] as List<String>;
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
                          // اسم الاستبيان
                          Text(
                            questionnaire['name'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 12),
                          // عنوان قايمة الطلاب
                          const Text(
                            'Students who filled this questionnaire:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // قايمة أسماء الطلاب
                          students.isEmpty
                              ? const Text(
                                  'No students have filled this questionnaire yet.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                      students.asMap().entries.map((entry) {
                                    final studentIndex = entry.key;
                                    final studentName = entry.value;
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
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
              ),
            ),
    );
  }
}
