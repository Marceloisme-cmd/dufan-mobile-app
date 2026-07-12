class HotelBookingModel {
  final String id;

  final String userEmail;

  final String hotelName;

  final String pricePerNight;

  final int guest;

  final int room;

  final int totalNight;

  final int totalPrice;

  final DateTime checkInDate;

  final DateTime checkOutDate;

  final String paymentMethod;

  final DateTime bookingDate;

  final bool isCompleted;

  HotelBookingModel({
    required this.id,

    required this.userEmail,

    required this.hotelName,

    required this.pricePerNight,

    required this.guest,

    required this.room,

    required this.totalNight,

    required this.totalPrice,

    required this.checkInDate,

    required this.checkOutDate,

    required this.paymentMethod,

    required this.bookingDate,

    this.isCompleted = false,
  });

  // ================= TO MAP =================

  Map<String, dynamic> toMap() {
    return {
      "id": id,

      "userEmail": userEmail,

      "hotelName": hotelName,

      "pricePerNight": pricePerNight,

      "guest": guest,

      "room": room,

      "totalNight": totalNight,

      "totalPrice": totalPrice,

      "checkInDate": checkInDate.toIso8601String(),

      "checkOutDate": checkOutDate.toIso8601String(),

      "paymentMethod": paymentMethod,

      "bookingDate": bookingDate.toIso8601String(),

      "isCompleted": isCompleted,
    };
  }

  // ================= FROM MAP =================

  factory HotelBookingModel.fromMap(Map<String, dynamic> data) {
    return HotelBookingModel(
      id: data["id"],

      userEmail: data["userEmail"],

      hotelName: data["hotelName"],

      pricePerNight: data["pricePerNight"],

      guest: data["guest"] ?? 1,

      room: data["room"] ?? 1,

      totalNight: data["totalNight"] ?? 1,

      totalPrice: data["totalPrice"] ?? 0,

      checkInDate: DateTime.parse(data["checkInDate"]),

      checkOutDate: DateTime.parse(data["checkOutDate"]),

      paymentMethod: data["paymentMethod"] ?? "Unknown",

      bookingDate: DateTime.parse(data["bookingDate"]),

      isCompleted: data["isCompleted"] ?? false,
    );
  }

  // ================= COPY WITH =================

  HotelBookingModel copyWith({bool? isCompleted}) {
    return HotelBookingModel(
      id: id,

      userEmail: userEmail,

      hotelName: hotelName,

      pricePerNight: pricePerNight,

      guest: guest,

      room: room,

      totalNight: totalNight,

      totalPrice: totalPrice,

      checkInDate: checkInDate,

      checkOutDate: checkOutDate,

      paymentMethod: paymentMethod,

      bookingDate: bookingDate,

      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
