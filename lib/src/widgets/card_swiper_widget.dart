import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper({required this.peliculas});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: peliculas.length,
        itemBuilder: (context, index, realIndex) =>
            _MoviePosterImage(pelicula: peliculas[index]),
        options: CarouselOptions(
            autoPlay: true, aspectRatio: 2.0, enlargeCenterPage: true));
  }
}

class _MoviePosterImage extends StatelessWidget {
  const _MoviePosterImage({
    Key? key,
    required this.pelicula,
  }) : super(key: key);

  final Pelicula pelicula;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      image: NetworkImage(pelicula.getPosterImg()),
      placeholder: AssetImage('assets/img/no-image.jpg'),
      fit: BoxFit.cover,
    );
  }
}
