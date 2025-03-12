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

  @HiveField(4)
  final int likes;

  Review({
    required this.exhibitionName,
    required this.reviewerName,
    required this.comment,
    required this.rating,
    required this.likes, 
  });

  Map toJson() => {
        "exhibitionName": exhibitionName,
        "reviewerName": reviewerName,
        "comment": comment,
        "rating": rating,
        "likes": likes,
      };

  factory Review.fromJson(Map json) {
    return Review(
      exhibitionName: json['exhibitionName'],
      reviewerName: json['reviewerName'],
      comment: json['comment'],
      rating: json['rating'],
      likes: json['likes'],
    );
  }

  Review copyWith({
    String? exhibitionName,
    String? reviewerName,
    String? comment,
    int? rating,
    int? likes,
  }) {
    return Review(
      exhibitionName: exhibitionName ?? this.exhibitionName,
      reviewerName: reviewerName ?? this.reviewerName,
      comment: comment ?? this.comment,
      rating: rating ?? this.rating,
      likes: likes ?? this.likes,
    );
  }
}
