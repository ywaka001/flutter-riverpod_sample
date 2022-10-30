import 'package:banana/riverpod_sample/notify/todosnotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banana/riverpod_sample/notify/getdata.dart';



class BtnWidGet extends StatefulWidget {
  BtnWidGet({super.key, required this.title, required this.onPressedCallback}); //

  final title;
  final Function onPressedCallback;

  @override
  State<BtnWidGet> createState() => _BtnWidGetState();
}

class _BtnWidGetState extends State<BtnWidGet> {
  List<Map<String, String>>items = GetData();



  _updateTitle(WidgetRef ref) {

    List<Todo> todos = ref.watch(todosProvider);

    final title = todos.where((a) => a.id == '002').map((e) => e.title);
    print('チェックテスト1：' + title.toString());

    if(title.toString() == '()'){
      print('追加処理：' + '002');

      ref.read(todosProvider.notifier).addTodo(Todo(id: '002', description: 'description', completed: false, title: 'title 02'));
      final title2 = todos.where((a) => a.id == '002').map((e) => e.title);
      print('チェックテスト2：' + title2.toString());

    }

  }


  // late var keyData = '';
  // void _RtnData(a){
  //   setState(() {
  //     keyData = a;
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    // ⑤ Consumerを利用し、コールバックのrefから状態を取得する。readメソッドを利用しているため、状態に変更があった時でもリビルドは行われない。
    return Consumer(builder: (context, ref, child) {
      print('called WidgetC#build');
      final notifier = ref.read(todosProvider.notifier);
      print(notifier.state);
      //   return ElevatedButton(
      //       onPressed: () {
      //         notifier.increment();
      //       },
      //       child: const Icon(Icons.add));
      // });
      return
        Container(
          child: ElevatedButton(
            child: Text(widget.title.toString()),
            onPressed: (){
              var a = widget.onPressedCallback().toString();
              print ('btnの中' + a);
            },


            // onPressed: () =>
            // {
            //   print('aaaa==>>' + items[0]['cd'].toString()),
            //   _updateTitle(ref),
            // }
          ),
        );
    });
  }
}