import 'package:provider_with_select/global.dart';
import 'package:provider_with_select/post/post_struct.dart';

class ListModel {

  final List<PostStruct> posts = [];
  int _offsetNum = 0;
  String title  = '';
  AspectStruct aspect;
  int currentIndex = -1;

  ListModel({
    required this.aspect
  });

  void morePosts(Function() notify) async {
    final posts = await fetchPost(aspect.id, _offsetNum);
    if (posts.isEmpty) return;
    this.posts.addAll(posts);
    _offsetNum++;
    notify();
  }

}