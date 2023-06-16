class OrderValidationModel {
  final String id;
  final String user;
  final List<OrderItem> items;
  final bool isValid;
  final bool isPaid;
  final double total;
  final String paymentMethod;
  final DateTime createdAt;
  final DateTime updatedAt;

  OrderValidationModel({
    required this.id,
    required this.user,
    required this.items,
    required this.isValid,
    required this.isPaid,
    required this.total,
    required this.paymentMethod,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderValidationModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return OrderValidationModel(
      id: data['_id'],
      user: data['user'],
      items: (data['items'] as List<dynamic>)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
      isValid: data['isValid'],
      isPaid: data['isPaid'],
      total: data['total'].toDouble(),
      paymentMethod: data['paymentMethod'],
      createdAt: DateTime.parse(data['createdAt']),
      updatedAt: DateTime.parse(data['updatedAt']),
    );
  }
}

class OrderItem {
  final int quantity;
  final String ticket;
  final String id;

  OrderItem({
    required this.quantity,
    required this.ticket,
    required this.id,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      quantity: json['quantity'],
      ticket: json['ticket'],
      id: json['_id'],
    );
  }
}
