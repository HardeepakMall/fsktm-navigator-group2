class Location {
  final String id;
  final String name;
  final String type;
  final String floor;
  final String block; // e.g., "room", "lab", "facility"
  final String description;
  final String imagePath;

  Location({
    required this.id,
    required this.name,
    required this.type,
    required this.floor,
    required this.block,
    required this.description,
    required this.imagePath,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'] ?? '', // Provide a default value if 'id' is missing
      name: json['name'] ?? '', // Provide a default value if 'name' is missing
      type: json['type'] ?? '', // Provide a default value if 'type' is missing
      floor:
          json['floor'] ?? '', // Provide a default value if 'floor' is missing
      block:
          json['block'] ?? '', // Provide a default value if 'block' is missing
      description:
          json['description'] ??
          '', // Provide a default value if 'description' is missing
      imagePath:
          json['imagePath'] ??
          'assets/images/default_room.png', // Provide a default value if 'imagePath' is missing
    );
  }
}
