import 'dart:io';
import 'package:banana/riverpod_sample/notify/mdl_listview_data.dart';
import 'package:banana/riverpod_sample/notify/btn_widget.dart';
import 'package:banana/main_tab.dart';
import 'package:banana/riverpod_sample/notify/listview.dart';
import 'package:banana/riverpod_sample/notify/todosnotifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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

    // String title2 = '';
    // List<Map<String, String>> lst = [
    //   {'id': '1', 'data': 'dog'},
    //   {'id': '2', 'data': 'cat'}
    // ];
    // try {
    //   title2 = lst
    //       .where((a) => a['id'].toString() == '1')
    //       .toList()[0]['data']
    //       .toString();
    // } catch (e) {
    //   print('err ===>>>' + e.toString());
    //   // throw(e.toString());
    //   // exitCode;
    // }
    // print('titles => ' + title2);

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

    // Test  start
    // useEffect(() {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     final lstData = todos.where((a) => a.id == '002').toList()[0];
    //     print('lstData');
    //     print(lstData.value);
    //     print('★★★update_before★★★');
    //     // try {
    //     ref.read(todosProvider.notifier).updateValue('002', lst);
    //     // } catch (e) {
    //     //   print('Err =>>>' + e.toString());
    //     // }
    //
    //     print('★★★update_after★★★');
    //
    //     var lstData2 = todos.where((a) => a.id == '002').toList()[0];
    //     print(lstData2.value);
    //     print('lstData2');
    //     // Test  end
    //   });
    // }, []);

    // ListDataを追加する。
    _addListData() {
      String itemA = 'Text4';
      String itemB = '5500';
      String itemC = '550';
      print('★★★item_set★★★');
      List<Map<String, dynamic>> item = [
        {
          'text': '{$itemA}',
          'price': '{$itemB}',
          'tax': '{$itemC}',
        }
      ];
      ref.read(todosProvider.notifier).updateValue('002', item);
      // ★★★★★Completed false⇒true★★★★★
      ref.read(todosProvider.notifier).toggle('002');

      print('★★★update_after3★★★');
      var lstData3 = todos.where((a) => a.id == '002').toList()[0];
      print(lstData3.value);
      print('lstData3');

      // List<Map<String, dynamic>> lsta = ListViewData().listviewdata;
    }

    final title =
        todos.where((a) => a.id == '001').toList()[0].value.toString();
    print('title ==>>' + title);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        // height: 500,
        child: Column(
          children: [
            ListViewWidGet(),
            BtnWidGet(
                title: title,
                onPressedCallback: () {
                  var x = _test('aa', 'b', 'c');
                  _addListData();
                  print('return = >' + x);
                }),
          ],
        ),
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
