import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:provider_with_select/post/post_struct.dart';
import 'package:provider_with_select/security.dart';

String globalTitleText(String title) {
  return title
      .replaceAll("<p>",     "")
      .replaceAll("</p>",    "")
      .replaceAll("<br />",  "")
      .replaceAll("&#171;",  "«")
      .replaceAll("&#8230;", "…")
      .replaceAll("&#8217",  "'")
      .replaceAll("&#187;",  "»")
      .replaceAll("&#8212;", "—")
      .replaceAll("&#8211;", "—")
      .replaceAll("&nbsp;",  " ")
      .replaceAll("&#8220;", "“")
      .replaceAll("&#8221;", "”")
      .replaceAll("&hellip;","…")
      .replaceAll("';",      "'")
      .replaceAll("%2C",     ",")
      .replaceAll("%7B",     "{")
      .replaceAll("%7D",     "}")
      .replaceAll("&quot;",  "\"");

}

const video_witness = AspectStruct(
  id: 49,
  name: 'Видео свидетельства',
  aspect: 'video_witness',
  showItemTitleInMainPage: true,
  thisVideoFromCategories: false,
  title: 'СВИДЕТЕЛЬСТВА',
); // {49, 'video_witness' };
const video_word_ep = AspectStruct(
  id: 33,
  name: 'Слосо епископа',
  aspect: 'video_world_ep',
  title: 'СЛОВО ЕПИСКОПА',
); // {33, 'video_world_ep'};
const video_songs   = AspectStruct(
  id: 34,
  name: 'Песни церкви',
  aspect: 'video_songs',
  title: 'ПЕСНИ ЦЕРКВИ',
); // {34, 'video_songs'   };
const video_church  = AspectStruct(
  id: 37,
  name: 'Канал церкви',
  aspect: 'video_church',
  title: 'КАНАЛ ЦЕРКВИ',
); // {37, 'video_church'  };
const video_all     = AspectStruct(
  id: 15,
  name: 'Все видео',
  aspect: 'video_all',
  title: 'ВСЕ ВИДЕО',
);

class AspectStruct {
  final int id;
  final String aspect;
  final bool showItemTitleInMainPage;
  final bool thisVideoFromCategories;
  final String name;
  final String title;

  const AspectStruct({
    required this.id,
    required this.aspect,
    this.showItemTitleInMainPage = false,
    this.thisVideoFromCategories = true,
    this.name = '',
    this.title = '',
  });
}

Future<List<PostStruct>> fetchPost(int categoryID, int offsetNum) async {
  final url = getMySiteHttpLink(categoryID, offsetNum);

  final response = await http.get(Uri.parse(url));

  if (response.statusCode != 200) return [];

  return compute(parsePost, response.body);
}


/// -----------------------------------------------
List<PostStruct> parsePost(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<PostStruct>((json) => PostStruct.fromJson(json)).toList();
}