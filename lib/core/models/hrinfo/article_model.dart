class ArticleModel {
  List<Article> items;
  String status;

  ArticleModel({this.items, this.status});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      items: json['data'] != null
          ? (json['data'] as List).map((i) => Article.fromJson(i)).toList()
          : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.items != null) {
      data['data'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Article {
  String desc;
  String fileSrc;
  String publishedAt;
  String topic;

  Article({
    this.desc,
    this.fileSrc,
    this.publishedAt,
    this.topic,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      desc: json['desc'],
      fileSrc: json['fileSrc'],
      publishedAt: json['publishedAt'],
      topic: json['topic'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    data['fileSrc'] = this.fileSrc;
    data['publishedAt'] = this.publishedAt;
    data['topic'] = this.topic;
    return data;
  }
}
