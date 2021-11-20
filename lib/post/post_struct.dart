import 'package:provider_with_select/global.dart';

// TODO структура одного поста
class PostStruct {

  final int id;                       // 106421
  final String date;                  // "2021-08-13T17:24:35"
  final String title;               // "Свидетельство Кирилла и Юли"
  final String excerpt;             // "<p>YvHdJ1I5_7w</p>\n"
  final String featured_image_url;    // "https://app.helpcenter24.org/wp-content/uploads/2021/08/hqdefault-12.jpg"

  PostStruct({
    required this.id,
    required this.date,
    required this.title,
    required this.excerpt,
    required this.featured_image_url});

  factory PostStruct.fromJson(Map<String, dynamic> json) {
    return PostStruct(
        id: json['id'] ?? 0,
        date: json['date'] ?? '',
        title: globalTitleText(json['title']['rendered'] as String),
        excerpt: (json['excerpt']['rendered'] as String)
            .replaceAll("<p>", "")
            .replaceAll("</p>\n", "")
            .replaceAll("</p>", "")
        ,
        featured_image_url: json['featured_image_url'] ?? '');
  }
}