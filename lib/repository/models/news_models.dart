class NewsModel{

  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  Source? source;

  NewsModel({this.author, this.title, this.description, this.url, this.urlToImage, this.content, this.source});

  factory NewsModel.fromJson(Map<String, dynamic> json){
    return NewsModel(

      author: json['author']==null?'No author':json['author'],
      title: json['title']==null?'No Title':json['title'],
      description: json['description']==null?'No Description':json['description'],
      url: json['url']==null?'No Url':json['url'],
      urlToImage: json['urlToImage']==null?'No Image':json['urlToImage'],
     // publishedAt: json['publishedAt']==null?'NO publishing date':json['publishedAt'].toString(),
      content: json['content']==null?'No Content':json['content'],
      source: Source.fromJson(json['source']),

    );
  }


}

class Source{
  String? id;
  String? name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json)
  {
    return Source(

      id: json['id']==null?'No Id':json['id'],
      name: json['name']==null?'No Name':json['name'],
    );
  }
}