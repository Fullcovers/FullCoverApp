class Ticket {
  final int crossed;
  final int current;
  final String id;
  final String club;
  final String event;
  final String name;
  final int available;
  final int v;

  Ticket({
    required this.crossed,
    required this.current,
    required this.id,
    required this.club,
    required this.event,
    required this.name,
    required this.available,
    required this.v,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      crossed: json['data']['price']['crossed'],
      current: json['data']['price']['current'],
      id: json['data']['_id'],
      club: json['data']['club'],
      event: json['data']['event'],
      name: json['data']['name'],
      available: json['data']['available'],
      v: json['data']['__v'],
    );
  }
}
