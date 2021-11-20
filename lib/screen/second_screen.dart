import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider_with_select/my_app_model.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final val = context.read<MyData>();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
            children: [
              const _SecondView(),
              ElevatedButton(
                  onPressed: () => val.incOne(),
                  child: const Text('one'))
            ]
        ),
      ),
    );
  }
}


class _SecondView extends StatelessWidget {
  const _SecondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final val = context.select((MyData value) => value.one);
    return Text('$val');
  }
}

