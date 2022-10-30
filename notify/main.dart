import 'dart:io';

import 'package:banana/riverpod_sample/notify/btn_widget.dart';
import 'package:banana/main_tab.dart';
import 'package:banana/riverpod_sample/notify/todosnotifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    // ProviderScope 以下の Widget で Riverpod が有効になるになる
    ProviderScope(child: MyApp()),
  );
}

// Future<void> main() async {
//   // 初期化処理
//   runApp(
//     // ProviderScope 以下の Widget で Riverpod が有効になるになる
//     ProviderScope(child: MyApp()),
//   );
// }

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  // final keyData= GlobalKey<_xxxxxWidgetState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // List<Map<String, dynamic>> newTodo = [{'id': '001', 'description': '', 'completed': false, 'title': ''}];

    // // List<Todo> newTodo = Todo('id': '001', 'description': '', 'completed': false, 'title': '');
    // Todo  newTodo = Todo(id: '001', description: '', completed: false, title: '');
    // ref.read(todosProvider.notifier).addTodo(newTodo);

    // ref.read(todosProvider.notifier).addTodo(Todo(id: '001', description: 'description', completed: false, title: 'title'));
    // ref.read(todosProvider.notifier).addTodo(
    //   // 適当なデータを渡しています
    //   Todo(
    //       id: '${ref.read(todosProvider.notifier).state.length}',
    //       description:
    //       'メモ${ref.read(todosProvider.notifier).state.length}',
    //       completed: false,
    //       title: 'title'
    //   ),);

    String title2 = '';
    List<Map<String, String>> lst = [
      {'id': '1', 'data': 'dog'},
      {'id': '2', 'data': 'cat'}
    ];
    try {
      title2 = lst
          .where((a) => a['id'].toString() == '5')
          .toList()[0]['data']
          .toString();
    } catch (e) {
      print('err ===>>>' + e.toString());
      // throw(e.toString());
      // exitCode;
    }
    print('titles => ' + title2);

    String c = '';
    final String b = '';
    String a = '';
    _test(String a, String b, String c) {
      b = a + b;
      print('実行されました！' + b + c);
      return b;
    }

    _test2() {
      print('実行後' + b);
    }

    List<Todo> todos = ref.watch(todosProvider);

    final title =
        todos.where((a) => a.id == '001').toList()[0].title.toString();
    print('title ==>>' + title);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        child: BtnWidGet(
            title: title,
            onPressedCallback: () {
              var x = _test('aa', 'b', 'c');
              print('return = >' + x);
            }),
      ), //BtnWidGet(title: title, onPressedCallback: _test('aaa', 'bbb'),),
    );
  }
}

// class TodoListView extends State<MyApp>{
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('test'),
//       ),
//       body:SizedBox(
//         child: BtnWidGet(title: 'title')
//       )
//       );
//   }
// }
