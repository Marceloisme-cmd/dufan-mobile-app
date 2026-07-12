import 'package:hive/hive.dart';
import '../features/ticket/models/ticket_model.dart';

class TicketService {
  static final Box _box = Hive.box('tickets');

  static Future<void> buyTicket(TicketModel ticket) async {
    await _box.add(ticket.toMap());
  }

 static List<TicketModel> getUserTickets(String email) {
    final tickets = _box.values
        .where((e) => e['userEmail'] == email)
        .map((e) => TicketModel.fromMap(e))
        .toList();

    tickets.sort((a, b) => b.date.compareTo(a.date));

    return tickets;
  }

  static List<TicketModel> getActiveTickets(String email) {
    final tickets = _box.values
        .where((e) => e['userEmail'] == email && e['isUsed'] == false)
        .map((e) => TicketModel.fromMap(e))
        .toList();

    tickets.sort((a, b) => b.date.compareTo(a.date));

    return tickets;
  }

  static List<TicketModel> getHistoryTickets(String email) {
    final tickets = _box.values
        .where((e) => e['userEmail'] == email && e['isUsed'] == true)
        .map((e) => TicketModel.fromMap(e))
        .toList();

    tickets.sort((a, b) => b.date.compareTo(a.date));

    return tickets;
  }

  static Future<void> useTicket(String id) async {
    for (int i = 0; i < _box.length; i++) {
      final data = _box.getAt(i);

      if (data['id'] == id) {
        _box.putAt(i, {...data, 'isUsed': true});
        break;
      }
    }
  }

  static TicketModel? getTicketById(String id) {
    for (final item in _box.values) {
      if (item['id'] == id) {
        return TicketModel.fromMap(item);
      }
    }

    return null;
  }

  static bool ticketExists(String id) {
    return _box.values.any((e) => e['id'] == id);
  }

  static int getActiveTicketCount(String email) {
    return _box.values
        .where((e) => e['userEmail'] == email && e['isUsed'] == false)
        .length;
  }

  static int getUsedTicketCount(String email) {
    return _box.values
        .where((e) => e['userEmail'] == email && e['isUsed'] == true)
        .length;
  }
  
}
