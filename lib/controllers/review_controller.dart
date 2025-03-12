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
      likes: 0,
    );

    final key = DateTime.now().millisecondsSinceEpoch.toString(); 
    storage.put(key, newReview);
    // print("Review saved with key: $key");
    reviews.add(newReview);
  }

  void likeReview(Review review) {
    final key = storage.keys.firstWhere((key) => storage.get(key) == review);
    final updatedReview = review.copyWith(likes: review.likes + 1);
    storage.put(key, updatedReview);

    final index = reviews.indexWhere((r) => r == review);
    if (index != -1) {
      reviews[index] = updatedReview;
    }
  }
}
