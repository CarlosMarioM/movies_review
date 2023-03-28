import 'package:movie_review/model/review.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'dart:convert';

class ApiCalls {
  Future getReviews() async {
    var queryParams = {'api-key': apiKey};
    var uri = Uri.https(
        'api.nytimes.com', '/svc/movies/v2/reviews/picks.json', queryParams);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      Reviews reviews = Reviews.fromJson(
        jsonDecode(response.body),
      );
      return reviews;
    }
  }
}
