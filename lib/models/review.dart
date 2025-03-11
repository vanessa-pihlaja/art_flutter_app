import 'package:hive/hive.dart';

part 'review.g.dart';

@HiveType(typeId: 0)
class Review {
  @HiveField(0)
  final String exhibitionName;

  @HiveField(1)
  final String reviewerName;

  @HiveField(2)
  final String comment;

  @HiveField(3)
  final int rating;

  Review({
    required this.exhibitionName,
    required this.reviewerName,
    required this.comment,
    required this.rating,
  });

  Map toJson() => {
        "exhibitionName": exhibitionName,
        "reviewerName": reviewerName,
        "comment": comment,
        "rating": rating,
      };

  factory Review.fromJson(Map json) {
    return Review(
      exhibitionName: json['exhibitionName'],
      reviewerName: json['reviewerName'],
      comment: json['comment'],
      rating: json['rating'],
    );
  }
}
