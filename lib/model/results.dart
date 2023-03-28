import 'link.dart';
import 'multimedia.dart';

class Results {
  String? displayTitle;
  String? mpaaRating;
  int? criticsPick;
  String? byline;
  String? headline;
  String? summaryShort;
  String? publicationDate;
  String? openingDate;
  String? dateUpdated;
  Link? link;
  Multimedia? multimedia;

  Results(
      {this.displayTitle,
      this.mpaaRating,
      this.criticsPick,
      this.byline,
      this.headline,
      this.summaryShort,
      this.publicationDate,
      this.openingDate,
      this.dateUpdated,
      this.link,
      this.multimedia});

  Results.fromJson(Map<String, dynamic> json) {
    displayTitle = json['display_title'];
    mpaaRating = json['mpaa_rating'];
    criticsPick = json['critics_pick'];
    byline = json['byline'];
    headline = json['headline'];
    summaryShort = json['summary_short'];
    publicationDate = json['publication_date'];
    openingDate = json['opening_date'];
    dateUpdated = json['date_updated'];
    link = json['link'] != null ? Link.fromJson(json['link']) : null;
    multimedia = json['multimedia'] != null
        ? Multimedia.fromJson(json['multimedia'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['display_title'] = displayTitle;
    data['mpaa_rating'] = mpaaRating;
    data['critics_pick'] = criticsPick;
    data['byline'] = byline;
    data['headline'] = headline;
    data['summary_short'] = summaryShort;
    data['publication_date'] = publicationDate;
    data['opening_date'] = openingDate;
    data['date_updated'] = dateUpdated;
    if (link != null) {
      data['link'] = link!.toJson();
    }
    if (multimedia != null) {
      data['multimedia'] = multimedia!.toJson();
    }
    return data;
  }
}
