import 'package:hive_flutter/hive_flutter.dart';

import '../models/hotel_booking_model.dart';

class HotelBookingService {
  static const String boxName = "hotel_bookings";

  static Future<Box> _box() async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box(boxName);
    }

    return await Hive.openBox(boxName);
  }

  // ================= SAVE =================

  static Future<void> saveBooking(HotelBookingModel booking) async {
    final box = await _box();

    await box.put(booking.id, booking.toMap());
  }

  // ================= GET ALL USER =================

  static Future<List<HotelBookingModel>> getUserBookings(String email) async {
    final box = await _box();

    final bookings = box.values
        .map((e) => HotelBookingModel.fromMap(Map<String, dynamic>.from(e)))
        .where((booking) => booking.userEmail == email)
        .toList();

    return bookings;
  }

  // ================= ACTIVE =================

  static Future<List<HotelBookingModel>> getActiveBookings(String email) async {
    final bookings = await getUserBookings(email);

    return bookings.where((booking) => booking.isCompleted == false).toList();
  }

  // ================= COMPLETED =================

  static Future<List<HotelBookingModel>> getCompletedBookings(
    String email,
  ) async {
    final bookings = await getUserBookings(email);

    return bookings.where((booking) => booking.isCompleted == true).toList();
  }

  // ================= UPDATE STATUS =================

  static Future<void> completeBooking(String id) async {
    final box = await _box();

    final data = box.get(id);

    if (data == null) {
      return;
    }

    final booking = HotelBookingModel.fromMap(Map<String, dynamic>.from(data));

    final updated = booking.copyWith(isCompleted: true);

    await box.put(id, updated.toMap());
  }

  // ================= DELETE =================

  static Future<void> deleteBooking(String id) async {
    final box = await _box();

    await box.delete(id);
  }
}
