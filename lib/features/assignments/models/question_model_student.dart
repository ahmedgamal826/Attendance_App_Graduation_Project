// // Question Models
// enum QuestionType {
//   trueOrFalse,
//   multipleChoice,
// }
//
// class Question {
//   final String questionText;
//   final QuestionType questionType;
//   final int correctAnswer; // 0-based index of correct answer in options
//   final List<String> options;
//   final bool hasImage;
//   final String? imagePath;
//
//   Question({
//     required this.questionText,
//     required this.questionType,
//     required this.correctAnswer,
//     required this.options,
//     this.hasImage = false,
//     this.imagePath,
//   });
// }

// Student Question Models compatible with Admin models
enum QuestionType {
  trueOrFalse,
  multipleChoice,
  essayWithImage,
}

class StudentQuestion {
  final String id; // ID única para identificar la pregunta
  final String type; // "multiple_choice", "true_false", "file"
  final String question;
  final List<String> options;
  final String?
      correct; // La respuesta correcta (índice como string o true/false)
  final String? fileUrl; // URL del archivo adjunto a la pregunta (si hay)
  final String? fileName;
  final String? fileType;
  final int? fileSize;

  // Campos para tracking de la respuesta del estudiante
  int? selectedOption;
  String? uploadedFileUrl;
  String? uploadedFileName;
  bool? isAnswered;
  bool? isCorrect;

  StudentQuestion({
    required this.id,
    required this.type,
    required this.question,
    this.options = const [],
    this.correct,
    this.fileUrl,
    this.fileName,
    this.fileType,
    this.fileSize,
    this.selectedOption,
    this.uploadedFileUrl,
    this.uploadedFileName,
    this.isAnswered = false,
    this.isCorrect,
  });

  // Crear una pregunta estudiante a partir del modelo del administrador
  factory StudentQuestion.fromAdminModel(
      QuestionModel adminQuestion, int questionIndex) {
    return StudentQuestion(
      id: questionIndex.toString(),
      type: adminQuestion.type,
      question: adminQuestion.question,
      options: adminQuestion.options,
      correct: adminQuestion.correct,
      fileUrl: adminQuestion.fileUrl,
      fileName: adminQuestion.fileName,
      fileType: adminQuestion.fileType,
      fileSize: adminQuestion.fileSize,
    );
  }

  // Verificar si la respuesta es correcta
  bool checkAnswer() {
    if (type == 'multiple_choice' || type == 'true_false') {
      return selectedOption.toString() == correct;
    }
    // Para preguntas de archivo, el profesor debe calificar manualmente
    return false;
  }

  // Verificar si la pregunta ha sido respondida
  bool isQuestionAnswered() {
    // First check if the isAnswered flag is set
    if (isAnswered == true) {
      return true;
    }

    // If not set, then check based on question type
    if (type == 'multiple_choice' ||
        type == 'MCQ' ||
        type == 'true_false' ||
        type == 'TrueFalse') {
      return selectedOption != null;
    } else if (type == 'file') {
      return uploadedFileUrl != null && uploadedFileUrl!.isNotEmpty;
    }
    return false;
  }
}

// Para mantener compatibilidad con el código existente
class QuestionModel {
  final String type;
  final String question;
  final List<String> options;
  final String? correct;
  final String? fileUrl;
  final String? fileName;
  final String? fileType;
  final int? fileSize;

  QuestionModel({
    required this.type,
    required this.question,
    this.options = const [],
    this.correct,
    this.fileUrl,
    this.fileName,
    this.fileType,
    this.fileSize,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'question': question,
      'options': options,
      'correct': correct,
      'fileUrl': fileUrl,
      'fileName': fileName,
      'fileType': fileType,
      'fileSize': fileSize,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      type: map['type'] ?? '',
      question: map['question'] ?? '',
      options: List<String>.from(map['options'] ?? []),
      correct: map['correct'],
      fileUrl: map['fileUrl'],
      fileName: map['fileName'],
      fileType: map['fileType'],
      fileSize: map['fileSize'],
    );
  }
}

// Assignment page specific model to avoid conflicts
enum AssignmentQuestionType {
  trueOrFalse,
  multipleChoice,
}

class AssignmentQuestion {
  final String questionText;
  final AssignmentQuestionType questionType;
  final int correctAnswer; // 0-based index of correct answer in options
  final List<String> options;
  final bool hasImage;
  final String? imagePath;

  AssignmentQuestion({
    required this.questionText,
    required this.questionType,
    required this.correctAnswer,
    required this.options,
    this.hasImage = false,
    this.imagePath,
  });
}
