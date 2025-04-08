import 'package:attendance_app/features/questionnaire/data/models/question_model.dart';
import 'package:flutter/material.dart';

class QuestionContent extends StatelessWidget {
  final QuestionModel? question;

  const QuestionContent({this.question});

  @override
  Widget build(BuildContext context) {
    if (question == null) {
      return const Center(
        child: Text(
          'No questions available. Add a new question!',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    bool isTrueFalse = question!.type == 'TrueFalse';
    bool isEssay = question!.type == 'Essay';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.blueAccent.withOpacity(0.1),
          child: Text(
            question!.question,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: isEssay
              ? TextField(
                  decoration: InputDecoration(
                    hintText: 'Write your answer here...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                            color: Colors.blueAccent, width: 2)),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                  ),
                  maxLines: 5,
                )
              : isTrueFalse
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: question!.options.asMap().entries.map((entry) {
                        int idx = entry.key;
                        String option = entry.value;
                        return Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    idx == 0 ? Colors.green : Colors.red,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              child: Text(option,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white)),
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  : GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      padding: const EdgeInsets.all(8),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: question!.options.asMap().entries.map((entry) {
                        String option = entry.value;
                        return ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent,
                            padding: const EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text(option,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                              textAlign: TextAlign.center),
                        );
                      }).toList(),
                    ),
        ),
      ],
    );
  }
}
