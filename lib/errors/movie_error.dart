abstract class MovieError implements Exception {
  final String message;

  MovieError(this.message);

  @override
  String toString() => message;
}

class MovieRepositoryError extends MovieError {
  MovieRepositoryError(String message) : super(message);
}
