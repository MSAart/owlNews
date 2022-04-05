class ArticleModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;

  ArticleModel({
    this.author,
    this.title,
    this.url,
    this.description,
    this.content,
    this.urlToImage,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: json['author'],
      title: json['title'],
      url: json['url'],
      description: json['description'],
      content: json['content'],
      urlToImage: json['urlToImage'],
    );
  }
}
