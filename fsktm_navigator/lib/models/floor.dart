class Floor {
  final String floorName;
  final String symbol;
  final String image;
  final List<Room> rooms;

  Floor({
    required this.floorName,
    required this.symbol,
    required this.image,
    required this.rooms,
  });

  factory Floor.fromJson(Map<String, dynamic> json) {
    return Floor(
      floorName: json['floorName'],
      symbol: json['symbol'],
      image: json['image'],
      rooms: (json['rooms'] as List)
          .map((room) => Room.fromJson(room))
          .toList(),
    );
  }
}

class Room {
  final String name;

  Room({required this.name});

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(name: json['name']);
  }
}
