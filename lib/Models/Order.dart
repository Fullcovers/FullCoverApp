// class OrderModel {
//   final String id;
//   final String user;
//   final List<OrderItem> items;
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
    return OrderModel(
      id: json['_id'],
      user: json['user'],
      items: (json['items'] as List<dynamic>)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
      isValid: json['isValid'],
      isPaid: json['isPaid'],
      total: json['total'].toDouble(),
      paymentMethod: json['paymentMethod'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class OrderItem {
  final int quantity;
  final OrderTicket ticket;
  final String id;

  OrderItem({
    required this.quantity,
    required this.ticket,
    required this.id,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      quantity: json['quantity'],
      ticket: OrderTicket.fromJson(json['ticket']),
      id: json['_id'],
    );
  }
}

class OrderTicket {
  final Price price;
  final String id;
  final String club;
  final String event;
  final String name;
  final int available;
  final int v;
  final int coverPercent;

  OrderTicket({
    required this.price,
    required this.id,
    required this.club,
    required this.event,
    required this.name,
    required this.available,
    required this.v,
    required this.coverPercent,
  });

  factory OrderTicket.fromJson(Map<String, dynamic> json) {
    return OrderTicket(
      price: Price.fromJson(json['price']),
      id: json['_id'],
      club: json['club'],
      event: json['event'],
      name: json['name'],
      available: json['available'],
      v: json['__v'],
      coverPercent: json['cover_percent'],
    );
  }
}

class Price {
  final int crossed;
  final int current;

  Price({
    required this.crossed,
    required this.current,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      crossed: json['crossed'],
      current: json['current'],
    );
  }
}
