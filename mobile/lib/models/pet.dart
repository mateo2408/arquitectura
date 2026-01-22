class Pet {
  final int? id;
  final String name;
  final String species;
  final String breed;
  final String birthDate; // ISO format YYYY-MM-DD
  final int? ownerId;

  Pet({
    this.id,
    required this.name,
    required this.species,
    required this.breed,
    required this.birthDate,
    this.ownerId,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'],
      name: json['name'],
      species: json['species'],
      breed: json['breed'],
      birthDate: json['birthDate'],
      ownerId: json['ownerId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'species': species,
      'breed': breed,
      'birthDate': birthDate,
      'ownerId': ownerId,
    };
  }
}
