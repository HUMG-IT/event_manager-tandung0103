import 'dart:convert';

class EventModel {
  String? id;
  String? event;
  DateTime startTime;
  DateTime endTime;
  bool isAllDay;
  String subject;
  String notes;
  String recurrenceRule;

  EventModel({
    this.id,
    this.event,
    required this.startTime,
    required this.endTime,
    this.isAllDay = true,
    this.subject = '',
    required this.notes,
    required this.recurrenceRule,
  });

  EventModel copyWith({
    String? id,
    String? event,
    DateTime? startTime,
    DateTime? endTime,
    bool? isAllDay,
    String? subject,
    String? notes,
    String? recurrenceRule,
  }) {
    return EventModel(
      id: id ?? this.id,
      event: event ?? this.event,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isAllDay: isAllDay ?? this.isAllDay,
      subject: subject ?? this.subject,
      notes: notes ?? this.notes,
      recurrenceRule: recurrenceRule ?? this.recurrenceRule,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'event': event,
      'startTime': startTime.millisecondsSinceEpoch,
      'endTime': endTime.millisecondsSinceEpoch,
      'isAllDay': isAllDay,
      'subject': subject,
      'notes': notes,
      'recurrenceRule': recurrenceRule,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'],
      event: map['event'],
      startTime: DateTime.fromMillisecondsSinceEpoch(map['startTime']),
      endTime: DateTime.fromMillisecondsSinceEpoch(map['endTime']),
      isAllDay: map['isAllDay'] ?? false,
      subject: map['subject'] ?? '',
      notes: map['notes'] ?? '',
      recurrenceRule: map['recurrenceRule'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventModel(id: $id, event: $event, startTime: $startTime, endTime: $endTime, isAllDay: $isAllDay, subject: $subject, notes: $notes, recurrenceRule: $recurrenceRule)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventModel &&
        other.id == id &&
        other.event == event &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.isAllDay == isAllDay &&
        other.subject == subject &&
        other.notes == notes &&
        other.recurrenceRule == recurrenceRule;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        event.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        isAllDay.hashCode ^
        subject.hashCode ^
        notes.hashCode ^
        recurrenceRule.hashCode;
  }
}

extension EventModelExtensions on EventModel {
  String get formatedStartTimeString =>
      '${startTime.hour}:${startTime.minute.toString().padLeft(2, '0')}, ${startTime.day}/${startTime.month}/${startTime.year}';

  String get formatedEndTimeString =>
      '${endTime.hour}:${endTime.minute.toString().padLeft(2, '0')}, ${endTime.day}/${endTime.month}/${endTime.year}';
}
