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
      floorName: json['floorName'] ?? '',
      symbol: json['symbol'] ?? '',
      image: json['image'] ?? '',
      rooms: (json['rooms'] as List? ?? [])
          .map((room) => Room.fromJson(room))
          .toList(),
    );
  }
}

class Room {
  final String name;
  final String type;
  final String floor;
  final String block;
  final String description;
  final String imagePath;

  Room({
    required this.name,
    required this.type,
    required this.floor,
    required this.block,
    required this.description,
    required this.imagePath,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      floor: json['floor'] ?? '',
      block: json['block'] ?? '',
      description: json['description'] ?? '',
      imagePath: json['imagePath'] ?? '',
    );
  }
}