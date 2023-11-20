import 'package:equatable/equatable.dart';
import 'package:tentwenty_movie_project/model/screeshot_model.dart';

class MovieImage extends Equatable {
  final List<Screenshot>? backdrops;
  final List<Screenshot>? posters;

  const MovieImage({this.backdrops, this.posters});

  factory MovieImage.fromJson(Map<String, dynamic> result) {
    if (result == null) {
      return MovieImage();
    }

    return MovieImage(
      backdrops: (result['backdrops'] as List)
              ?.map((b) => Screenshot.fromJson(b))
              ?.toList() ??
          List.empty(),
      posters: (result['posters'] as List)
              ?.map((b) => Screenshot.fromJson(b))
              ?.toList() ??
          List.empty(),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
