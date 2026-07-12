class TicketModel {
  final String id;
  final String userEmail;
  final String title;
  final String price;
  final int quantity;
  final int totalPrice;
  final DateTime date;
  final bool isUsed;

  TicketModel({
    required this.id,
    required this.userEmail,
    required this.title,
    required this.price,
    required this.quantity,
    required this.totalPrice,
    required this.date,
    this.isUsed = false,
  });

 Map<String, dynamic> toMap() {
  return {
    'id': id,
    'userEmail': userEmail,
    'title': title,
    'price': price,
    'quantity': quantity,
    'totalPrice': totalPrice,
    'date': date.toIso8601String(),
    'isUsed': isUsed,
  };
}

  factory TicketModel.fromMap(Map data) {
  return TicketModel(
    id: data['id'],
    userEmail: data['userEmail'],
    title: data['title'],
    price: data['price'],
    quantity: data['quantity'] ?? 1,
    totalPrice: data['totalPrice'] ?? int.parse(data['price']),
    date: DateTime.parse(data['date']),
    isUsed: data['isUsed'],
  );
}
}
