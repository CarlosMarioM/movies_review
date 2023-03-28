import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<Widget> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      addAutomaticKeepAlives: true,
      physics: const BouncingScrollPhysics(),
      itemCount: movies.length,
      itemBuilder: ((context, index) {
        return movies[index];
      }),
    );
  }
}
