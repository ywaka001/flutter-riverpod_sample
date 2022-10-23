import 'package:banana/riverpod_sample/notify/btn_widget.dart';
import 'package:banana/main_tab.dart';
import 'package:banana/riverpod_sample/notify/todosnotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




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


class MyApp extends ConsumerWidget {
  const MyApp({super.key});

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


    List<Todo> todos = ref.watch(todosProvider);

    final title = todos.where((a) => a.id == '001').map((e) => e.title);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(child: BtnWidGet(title: title),),
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
