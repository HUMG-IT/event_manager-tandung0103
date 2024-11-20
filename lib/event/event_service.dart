import 'package:localstore/localstore.dart';
import 'event_model.dart';

class EventService {
  final db = Localstore.getInstance(useSupportDir: true);
  final path = 'events';

  /// Lấy danh sách tất cả sự kiện từ localstore.
  Future<List<EventModel>> getAllEvents() async {
    final eventsMap = await db.collection(path).get();
    if (eventsMap != null) {
      return eventsMap.entries.map((entry) {
        final eventData = entry.value as Map<String, dynamic>;
        eventData['id'] = entry.key.split('/').last;
        return EventModel.fromMap(eventData);
      }).toList();
    }
    return [];
  }

  /// Thêm hoặc cập nhật một sự kiện vào localstore.

  Future<void> saveEvent(EventModel item) async {
    item.id ??= db.collection(path).doc().id;
    await db.collection(path).doc(item.id).set(item.toMap());
  }

  /// Xóa một sự kiện khỏi localstore bằng ID.
  Future<void> deleteEvent(EventModel item) async {
    await db.collection(path).doc(item.id).delete();
  }
}
