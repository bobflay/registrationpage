import 'dart:convert';

class Music {
  final String title;
  final String artist;
  final int views;
  final String url;
  final String coverPhoto;


  Music({
    required this.title,
    required this.artist,
    required this.views,
    required this.url,
    required this.coverPhoto
  });

  Map<String,dynamic> ToMap(){
    return {
      'title':title,
      'artist':artist,
      'views':views,
      'url':url,
      'coverPhoto':coverPhoto
    };
  }

  String toJson() => json.encode(ToMap());


  factory Music.fromjson(Map<String,dynamic> json){
    return Music(
        title: json['title'],
        artist: json['artist'],
        views: json['views'],
        url: json['url'],
        coverPhoto: json['cover_photo']
    );
  }

}