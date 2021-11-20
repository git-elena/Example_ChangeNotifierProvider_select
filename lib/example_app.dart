import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_select/my_app_model.dart';
import 'package:provider_with_select/post/post_item.dart';
import 'package:provider_with_select/screen/second_screen.dart';

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>  ChangeNotifierProvider(
      create: (_) => MyData(),
      child: MaterialApp(
        // home: _View(),
        routes: {
          '/first' : (context) => const _View(),
          '/second': (context) => const SecondScreen(),
        },
        initialRoute: '/first',
      )
    );
}

/*
routes: {
        '/main': (context) => const MainForm(),
        '/main/list': (context) => const ListForm(),
        '/main/post': (context) => const PostForm(),
        '/main/categories': (context) => const CategoriesForm(),
      },
      initialRoute: '/main',
* */

class _View extends StatelessWidget {
  const _View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<MyData>();

    final ButtonStyle style =
    ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        primary: Colors.teal
    );

    return Scaffold(
      body: SafeArea(
        child:
        Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => state.one_one = 0,
              child: const Text('null one'),
            ),
            ElevatedButton(
                onPressed: () => state.incOne(),
                child: const Text('one'),
              style: style,
            ),
            ElevatedButton(
                onPressed: () => state.incTwo(),
                child: const Text('two'),
              style: style,
            ),
            const _ViewOne(),
            const _ViewTwo(),
            const _Row(),

            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/second'),
              child: const Text('Open\nScreen', textAlign: TextAlign.center,),
            ),
          ],
        )),
      )
    );
  }
}

class _Row extends StatefulWidget {
  const _Row({Key? key}) : super(key: key);

  @override
  _RowState createState() => _RowState();
}

class _RowState extends State<_Row> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent)
      {
        // TODO прокрутка в конец списка
        /// подгрузить ещё постов
        context.read<MyData>().morePosts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final postCount = context.select((MyData value) => value.list.posts.length);

    final model = context.read<MyData>();
    if (model.list.posts.isEmpty) {
      model.morePosts();
    }

    print('=> ListView');

    return SizedBox(
        height: 150,
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
          return ListPostItem(
              item: model.list.posts[index],
              didTap: () => print('tap :: $index'),
              isShowTitle: true);
          },
          itemCount: postCount,
    ));
  }
}


class _ViewOne extends StatelessWidget {
  const _ViewOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('=> one');
    final val = context.select((MyData value) => value.one);
    return Text('$val', style: const TextStyle(fontSize: 24),);
  }
}

class _ViewTwo extends StatelessWidget {
  const _ViewTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('=> two');
    final val = context.select((MyData value) => value.two);
    return Text('$val', style: const TextStyle(fontSize: 24),);
  }
}