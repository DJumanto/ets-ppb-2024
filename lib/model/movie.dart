final String tableMovie = 'movies';

class MovieFields {
  static final List<String> values = [
    /// Add all fields
    id, image, rating, title, description, time
  ];

  static final String id = '_id';
  static final String image = 'image';
  static final String rating = 'rating';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';
}

class Movie {
  final int? id;
  final String image;
  final int rating;
  final String title;
  final String description;
  final DateTime createdTime;

  const Movie({
    this.id,
    required this.image,
    required this.rating,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  Movie copy({
    int? id,
    String? image,
    int? rating,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      Movie(
        id: id ?? this.id,
        image: image ?? this.image,
        rating: rating ?? this.rating,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  static Movie fromJson(Map<String, Object?> json) => Movie(
        id: json[MovieFields.id] as int?,
        image: json[MovieFields.image] as String,
        rating: json[MovieFields.rating] as int,
        title: json[MovieFields.title] as String,
        description: json[MovieFields.description] as String,
        createdTime: DateTime.parse(json[MovieFields.time] as String),
      );

  Map<String, Object?> toJson() => {
        MovieFields.id: id,
        MovieFields.title: title,
        MovieFields.image: image,
        MovieFields.rating: rating,
        MovieFields.description: description,
        MovieFields.time: createdTime.toIso8601String(),
      };
}
