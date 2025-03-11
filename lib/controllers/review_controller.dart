import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../models/review.dart';

class ReviewController extends GetxController {
  final storage = Hive.box<Review>("reviews");
  var reviews = <Review>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadReviews();
  }

  void loadReviews() {
   //  print("Stored keys: ${storage.keys}");

    reviews.assignAll(storage.values.toList());
  }

  void addReview(String exhibitionName, String reviewerName, String comment, int rating) {
    if (reviewerName.isEmpty || comment.isEmpty) return;

    final newReview = Review(
      exhibitionName: exhibitionName,
      reviewerName: reviewerName,
      comment: comment,
      rating: rating,
    );

    final key = DateTime.now().millisecondsSinceEpoch.toString(); 
    storage.put(key, newReview);
    // print("Review saved with key: $key");
    reviews.add(newReview);
  }
}
