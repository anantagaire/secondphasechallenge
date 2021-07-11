class NewsModel{

  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  Source? source;

  NewsModel({this.author, this.title, this.description, this.url, this.urlToImage,this.publishedAt, this.content, this.source});

  factory NewsModel.fromJson(Map<String, dynamic> json){
    return NewsModel(

      author: json['author']==null?'Unknown':json['author'],
      title: json['title']==null?'Unknown':json['title'],
      description: json['description']==null?'No Description':json['description'],
      url: json['url']==null?'Unknown':json['url'],
      urlToImage: json['urlToImage']==null?'https://banner2.cleanpng.com/20180605/wzl/kisspng-computer-icons-image-file-formats-no-image-5b16ff0d4b81e2.4246835515282337413093.jpg':json['urlToImage'],
     publishedAt: json['publishedAt']==null?'Unknown':json['publishedAt'].toString(),
      content: json['content']==null?'Unknown':json['content'],
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

      id: json['id']==null?'Unknown':json['id'],
      name: json['name']==null?'Unknown':json['name'],
    );
  }
}