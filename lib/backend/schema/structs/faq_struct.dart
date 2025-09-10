// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FaqStruct extends BaseStruct {
  FaqStruct({
    String? question,
    String? answer,
  })  : _question = question,
        _answer = answer;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  set answer(String? val) => _answer = val;

  bool hasAnswer() => _answer != null;

  static FaqStruct fromMap(Map<String, dynamic> data) => FaqStruct(
        question: data['question'] as String?,
        answer: data['answer'] as String?,
      );

  static FaqStruct? maybeFromMap(dynamic data) =>
      data is Map ? FaqStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'question': _question,
        'answer': _answer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'answer': serializeParam(
          _answer,
          ParamType.String,
        ),
      }.withoutNulls;

  static FaqStruct fromSerializableMap(Map<String, dynamic> data) => FaqStruct(
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        answer: deserializeParam(
          data['answer'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FaqStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FaqStruct &&
        question == other.question &&
        answer == other.answer;
  }

  @override
  int get hashCode => const ListEquality().hash([question, answer]);
}

FaqStruct createFaqStruct({
  String? question,
  String? answer,
}) =>
    FaqStruct(
      question: question,
      answer: answer,
    );
