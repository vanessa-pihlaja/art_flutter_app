class Article {
  const Article({
    required this.title,
    required this.author,
    required this.content,
    required this.imageUrl,
  });

  final String title;
  final String content;
  final String author;
  final List<String> imageUrl;
}

class Exhibition {
  const Exhibition({
    required this.name,
    required this.place,
    required this.dates,
    required this.info,
    required this.imageUrl,
  });

  final String name;
  final String place;
  final String dates;
  final String info;
  final String imageUrl;
}

class Place {
  const Place({
    required this.name,
    required this.address,
  });

  final String name;
  final String address;
}