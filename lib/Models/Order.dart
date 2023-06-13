class OrderModel {
  final String id;
  final String user;
  final List<OrderItem> items;
  final bool isValid;
  final bool isPaid;
  final double total;
  final String paymentMethod;
  final DateTime createdAt;
  final DateTime updatedAt;

  OrderModel({
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

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return OrderModel(
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

// class OrderModel {
//   final String id;
//   final String user;
//   final List<OrderItem> items;
//   final List<OrderallItem> allitems;
//   final bool isValid;
//   final bool isPaid;
//   final double total;
//   final String paymentMethod;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   OrderModel({
//     required this.id,
//     required this.user,
//     required this.items,
//     required this.allitems,
//     required this.isValid,
//     required this.isPaid,
//     required this.total,
//     required this.paymentMethod,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory OrderModel.fromJson(Map<String, dynamic> json) {
//     final data = json['data'];
//     return OrderModel(
//       id: data['_id'],
//       user: data['user'],
//       items: (data['items'] as List<dynamic>)
//           .map((item) => OrderItem.fromJson(item))
//           .toList(),
//       allitems: (data['allitems'] as List<dynamic>)
//           .map((item) => OrderallItem.fromJson(item))
//           .toList(),
//       isValid: data['isValid'],
//       isPaid: data['isPaid'],
//       total: data['total'].toDouble(),
//       paymentMethod: data['paymentMethod'],
//       createdAt: DateTime.parse(data['createdAt']),
//       updatedAt: DateTime.parse(data['updatedAt']),
//     );
//   }
// }

// class OrderItem {
//   final int quantity;
//   final String ticket;
//   final String id;

//   OrderItem({
//     required this.quantity,
//     required this.ticket,
//     required this.id,
//   });

//   factory OrderItem.fromJson(Map<String, dynamic> json) {
//     return OrderItem(
//       quantity: json['quantity'],
//       ticket: json['ticket'],
//       id: json['_id'],
//     );
//   }
// }

// class OrderallItem {
//   final int quantity;
//   final OrderTicket ticket;
//   final String id;

//   OrderallItem({
//     required this.quantity,
//     required this.ticket,
//     required this.id,
//   });

//   factory OrderallItem.fromJson(Map<String, dynamic> json) {
//     return OrderallItem(
//       quantity: json['quantity'],
//       ticket: OrderTicket.fromJson(json['ticket']),
//       id: json['_id'],
//     );
//   }
// }

// class OrderTicket {
//   final OrderPrice price;
//   final String id;
//   final String club;
//   final String event;
//   final String name;
//   final int available;

//   OrderTicket({
//     required this.price,
//     required this.id,
//     required this.club,
//     required this.event,
//     required this.name,
//     required this.available,
//   });

//   factory OrderTicket.fromJson(Map<String, dynamic> json) {
//     return OrderTicket(
//       price: OrderPrice.fromJson(json['price']),
//       id: json['_id'],
//       club: json['club'],
//       event: json['event'],
//       name: json['name'],
//       available: json['available'],
//     );
//   }
// }

// class OrderPrice {
//   final int crossed;
//   final int current;

//   OrderPrice({
//     required this.crossed,
//     required this.current,
//   });

//   factory OrderPrice.fromJson(Map<String, dynamic> json) {
//     return OrderPrice(
//       crossed: json['crossed'],
//       current: json['current'],
//     );
//   }
// }
