import 'results.dart';

class Reviews {
  String? status;
  String? copyright;
  bool? hasMore;
  int? numResults;
  List<Results>? results;

  Reviews(
      {this.status,
      this.copyright,
      this.hasMore,
      this.numResults,
      this.results});

  Reviews.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    copyright = json['copyright'];
    hasMore = json['has_more'];
    numResults = json['num_results'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['copyright'] = copyright;
    data['has_more'] = hasMore;
    data['num_results'] = numResults;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
