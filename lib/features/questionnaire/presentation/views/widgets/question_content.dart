// import 'package:attendance_app/features/questionnaire/data/models/question_model.dart';
// import 'package:flutter/material.dart';

// class QuestionContent extends StatelessWidget {
//   final QuestionModel? question;

//   const QuestionContent({this.question});

//   @override
//   Widget build(BuildContext context) {
//     if (question == null) {
//       return const Center(
//         child: Text(
//           'No questions available. Add a new question!',
//           style: TextStyle(fontSize: 18, color: Colors.grey),
//         ),
//       );
//     }

//     bool isTrueFalse = question!.type == 'TrueFalse';
//     bool isEssay = question!.type == 'Essay';

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Container(
//           padding: const EdgeInsets.all(16.0),
//           color: Colors.blueAccent.withOpacity(0.1),
//           child: Text(
//             question!.question,
//             style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         const SizedBox(height: 30),
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: isEssay
//               ? TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Write your answer here...',
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: Colors.grey.shade300)),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: Colors.grey.shade300)),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(
//                             color: Colors.blueAccent, width: 2)),
//                     filled: true,
//                     fillColor: Colors.white.withOpacity(0.9),
//                   ),
//                   maxLines: 5,
//                 )
//               : isTrueFalse
//                   ? Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: question!.options.asMap().entries.map((entry) {
//                         int idx = entry.key;
//                         String option = entry.value;
//                         return Expanded(
//                           child: Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 8.0),
//                             child: ElevatedButton(
//                               onPressed: () {},
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor:
//                                     idx == 0 ? Colors.green : Colors.red,
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 20),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(12)),
//                               ),
//                               child: Text(option,
//                                   style: const TextStyle(
//                                       fontSize: 18, color: Colors.white)),
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     )
//                   : GridView.count(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 16,
//                       mainAxisSpacing: 16,
//                       padding: const EdgeInsets.all(8),
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       children: question!.options.asMap().entries.map((entry) {
//                         String option = entry.value;
//                         return ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.orangeAccent,
//                             padding: const EdgeInsets.all(20),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12)),
//                           ),
//                           child: Text(option,
//                               style: const TextStyle(
//                                   fontSize: 18, color: Colors.white),
//                               textAlign: TextAlign.center),
//                         );
//                       }).toList(),
//                     ),
//         ),
//       ],
//     );
//   }
// }

import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/questionnaire/data/models/question_model.dart';
import 'package:flutter/material.dart';

class QuestionContent extends StatefulWidget {
  final QuestionModel? question;
  final Function(String)? onAnswerSelected;
  final String? selectedAnswer; // إضافة الإجابة المحددة مسبقًا

  const QuestionContent({
    Key? key,
    required this.question,
    this.onAnswerSelected,
    this.selectedAnswer,
  }) : super(key: key);

  @override
  State<QuestionContent> createState() => _QuestionContentState();
}

class _QuestionContentState extends State<QuestionContent> {
  String? selectedAnswer;
  TextEditingController essayController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedAnswer = widget.selectedAnswer;
    if (widget.selectedAnswer != null && widget.question?.type == 'Essay') {
      essayController.text = widget.selectedAnswer!;
    }
  }

  @override
  void didUpdateWidget(QuestionContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.question != widget.question ||
        oldWidget.selectedAnswer != widget.selectedAnswer) {
      selectedAnswer = widget.selectedAnswer;
      if (widget.question?.type == 'Essay' && widget.selectedAnswer != null) {
        essayController.text = widget.selectedAnswer!;
      } else if (widget.question?.type == 'Essay') {
        essayController.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.question == null) {
      return const Center(
        child: Text('No question selected'),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question!.question,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildAnswerOptions(),
        ],
      ),
    );
  }

  Widget _buildAnswerOptions() {
    switch (widget.question!.type) {
      case 'MCQ':
        return Column(
          children: widget.question!.options.map((option) {
            bool isSelected = selectedAnswer == option;
            return Card(
              color: isSelected ? AppColors.primaryColor : Colors.white,
              elevation: isSelected ? 4 : 1,
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                title: Text(
                  option,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedAnswer = option;
                  });
                  if (widget.onAnswerSelected != null) {
                    widget.onAnswerSelected!(option);
                  }
                },
                trailing: isSelected
                    ? const Icon(Icons.check_circle, color: Colors.white)
                    : null,
              ),
            );
          }).toList(),
        );
      case 'TrueFalse':
        return Column(
          children: widget.question!.options.map((option) {
            bool isSelected = selectedAnswer == option;
            return Card(
              color: isSelected ? AppColors.primaryColor : Colors.white,
              elevation: isSelected ? 4 : 1,
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                title: Text(
                  option,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedAnswer = option;
                  });
                  if (widget.onAnswerSelected != null) {
                    widget.onAnswerSelected!(option);
                  }
                },
                trailing: isSelected
                    ? const Icon(Icons.check_circle, color: Colors.white)
                    : null,
              ),
            );
          }).toList(),
        );
      case 'Essay':
        return TextField(
          controller: essayController,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: 'Type your answer here...',
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 2,
              ),
            ),
            filled: true,
            fillColor: selectedAnswer != null && selectedAnswer!.isNotEmpty
                ? Colors.blue.shade50
                : Colors.white,
          ),
          onChanged: (value) {
            setState(() {
              selectedAnswer = value;
            });
            if (widget.onAnswerSelected != null) {
              widget.onAnswerSelected!(value);
            }
          },
        );
      default:
        return const Text('Unsupported question type');
    }
  }

  @override
  void dispose() {
    essayController.dispose();
    super.dispose();
  }
}
