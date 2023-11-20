// To parse this JSON data, do
//
//     final movieCategory = movieCategoryFromJson(jsonString);

import 'dart:convert';

MovieCategory movieCategoryFromJson(String str) =>
    MovieCategory.fromJson(json.decode(str));

String movieCategoryToJson(MovieCategory data) => json.encode(data.toJson());

class MovieCategory {
  List<Genre> genres;

  MovieCategory({
    required this.genres,
  });

  factory MovieCategory.fromJson(Map<String, dynamic> json) => MovieCategory(
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
      };
}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
