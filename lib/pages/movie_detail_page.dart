import 'package:flutter/material.dart';

import '../controllers/movie_detail_controller.dart';
import '../widgets/centered_message.dart';
import '../widgets/centered_progress.dart';
import '../widgets/chip_date.dart';
import '../widgets/rate.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;

  MovieDetailPage(this.movieId);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final _controller = MovieDetailController();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize() async {
    setState(() {
      _controller.loading = true;
    });

    await _controller.fetchMovieById(widget.movieId);

    setState(() {
      _controller.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildMovieDetail(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text(_controller.movieDetail?.title ?? ''),
    );
  }

  _buildMovieDetail() {
    if (_controller.loading) {
      return CenteredProgress();
    }

    if (_controller.movieError != null) {
      return CenteredMessage(
        message: _controller.movieError?.message ?? 'Erro desconhecido',
      );
    }

    // Aqui movieDetail é garantido
    final detail = _controller.movieDetail!;

    return ListView(
      children: [
        _buildCover(detail),
        _buildStatus(detail),
        _buildOverview(detail),
      ],
    );
  }

  _buildOverview(detail) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Text(
        detail.overview ?? '',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  _buildStatus(detail) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Rate(detail.voteAverage ?? 0),
          ChipDate(date: detail.releaseDate ?? DateTime.now()),
        ],
      ),
    );
  }

  _buildCover(detail) {
    final image = detail.backdropPath;
    return Image.network(
      'https://image.tmdb.org/t/p/w500${image ?? ''}',
      errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
    );
  }
}
