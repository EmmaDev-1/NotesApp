// lib/model/note_model.dart
class NoteModel {
  final String id;
  final String userId;
  final String title;
  final String? description;
  final DateTime? dueDate;
  final String priority;
  final String status;

  NoteModel({
    required this.id,
    required this.userId,
    required this.title,
    this.description,
    this.dueDate,
    required this.priority,
    this.status = 'Pending',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'dueDate': dueDate?.toIso8601String(),
      'priority': priority,
      'status': status,
    };
  }

  static NoteModel fromMap(String id, Map<String, dynamic> map) {
    return NoteModel(
      id: id,
      userId: map['userId'],
      title: map['title'],
      description: map['description'],
      dueDate: map['dueDate'] != null ? DateTime.parse(map['dueDate']) : null,
      priority: map['priority'],
      status: map['status'],
    );
  }
}
