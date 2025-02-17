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
    required this.museum,
    required this.dates,
    required this.info,
    required this.imageUrl,
  });

  final String name;
  final String museum;
  final String dates;
  final String info;
  final String imageUrl;
}

class Museum {
  const Museum({
    required this.name,
    required this.city,
    required this.address,
    required this.imageUrl,
  });

  final String name;
  final String city;
  final String address;
  final String imageUrl;
}