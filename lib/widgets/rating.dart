import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../modules/review_controller.dart';

class StarRating extends StatefulWidget {
  const StarRating({Key? key}) : super(key: key);

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  Review_Controller get _read => context.read<Review_Controller>();
  Review_Controller get _watch => context.watch<Review_Controller>();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10),
        child: RatingBar.builder(
            minRating: 0,
            itemSize: 30,
            itemBuilder: (context, _) => const Icon(
              Icons.star_rate_rounded,
              color: Color(0xffF8B61A),
            ),
            onRatingUpdate: (rating) => _read.rating = rating));
  }
}
