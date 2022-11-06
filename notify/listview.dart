import 'package:banana/riverpod_sample/notify/mdl_listview_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banana/riverpod_sample/notify/todosnotifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListViewWidGet extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Map<String, dynamic>> listItems = [
      {
        'text': 'Item 1',
        'price': '6000',
        'tax': '600',
      },
      {
        'text': 'Item 2',
        'price': '8000',
        'tax': '800',
      },
      {
        'text': 'Item 3',
        'price': '9000',
        'tax': '900',
      },
    ];

    final isSwicth = useState(false);
    List itemChecked2 = [];
    List<Todo> todos = ref.watch(todosProvider);

    // modelクラスにデータを登録
    // ListViewData(listviewdata: listItems);
    // var a = ListViewData().listviewdat
    var bln =
        useState<bool>(todos.where((a) => a.id == '002').toList()[0].completed);
    // useEffect(() {
    //   bln = useState<bool>(
    //       todos.where((a) => a.id == '002').toList()[0].completed);
    // }, []);

    useEffect(() {
      // 初期値設定（訂正ボタン)
      Map<String, bool> mp = {'isChecked': false};
      for (var value in listItems) {
        itemChecked2.add(mp);
      }
      print('★★★★useEffect★★★★');
    }, []);

    final itemChecked = useState<List<dynamic>>([...itemChecked2]);

    useEffect(() {
      Future.microtask(() {
        print('■□■ntf_item■□■start');
        print(todos.where((a) => a.id == '002').toList()[0].completed);
        print('■□■ntf_item■□■end');

        if (todos.where((a) => a.id == '002').toList()[0].completed) {
          var ntf_item = todos.where((a) => a.id == '002').toList()[0];
          print('□□□ntf_item□□□');
          print(ntf_item.value[0]['text']);
          print(listItems.length);
          Map<String, dynamic> item = {
            'text': '${ntf_item.value[0]['text']}',
            'price': '${ntf_item.value[0]['price'].toString()}',
            'tax': '${ntf_item.value[0]['tax'].toString()}',
          };
          print(item);
          listItems.add(item);
          print(listItems.length);
          print('□□□ntf_item□□□');
          // listItems.add(ntf_item.value['text']);

          // ★★★★★Completed true⇒false★★★★★
          ref.read(todosProvider.notifier).toggle('002');
        }
      });
    }, [bln]);

    useEffect(() {
      // Listの件数が増えたら追加する
      print('Listの件数が増えたら追加する' + listItems.length.toString());
      if (listItems.length != itemChecked.value.length) {
        print('Listの件数が増えたら追加する==>>' + listItems.length.toString());
        Map<String, bool> mp = {'isChecked': false};
        itemChecked.value.add(mp);
      }
    }, [listItems.length]);

    print('itemChecked==>>');
    print(itemChecked.value);
    print('listItems=>' +
        listItems.length.toString() +
        ' ' +
        'itemChecked=>' +
        itemChecked.value.length.toString());
    print('==============');

    // useEffect(() {
    //   print('isSwicth==>>');
    //   print(isSwicth);
    // }, [isSwicth]);
    return Column(
      children: <Widget>[
        Container(
          height: 600,
          padding: EdgeInsets.all(4),
          // 配列を元にリスト表示
          child: ListView.builder(
            itemCount: listItems.length,
            itemBuilder: (context, index) {
              return Container(
                  height: 50,
                  color: index % 2 == 0 ? Colors.yellow[50] : Colors.green[50],
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          (index + 1).toString(),
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              listItems[index]['text'],
                              style: TextStyle(
                                  decoration: itemChecked.value[index]
                                          ['isChecked']
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  decorationColor: Colors.black,
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 200,
                                child: Text(
                                  ' 金額：' + listItems[index]['price'],
                                  style: TextStyle(
                                      decoration: itemChecked.value[index]
                                              ['isChecked']
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                      decorationColor: Colors.black,
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Container(
                                  child: Text(
                                    ' 税額：' + listItems[index]['tax'],
                                    style: TextStyle(
                                        decoration: itemChecked.value[index]
                                                ['isChecked']
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none,
                                        decorationColor: Colors.black,
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Container(
                        // ボタンの変更チェック
                        child: itemChecked.value[index]['isChecked']
                            //itemChecked.value[index]['isChecked']
                            ? ElevatedButton(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        Colors.orange.shade300,
                                        Colors.orange.shade500,
                                        Colors.orange.shade700,
                                      ],
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(7),
                                  child: const Text(
                                    '指定訂正',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                ),
                                onPressed: () {
                                  // 商品に訂正線
                                  print('訂正');
                                  // useEffect(() {
                                  print('onPressed' + index.toString());
                                  itemChecked.value[index] = {
                                    'isChecked': !itemChecked.value[index]
                                        ['isChecked']
                                  };
                                  isSwicth.value = !isSwicth.value;
                                  print(itemChecked.value);
                                  print(itemChecked.value[index]['isChecked']);
                                  print('onPressed' + index.toString());
                                  // }, [isSwicth]);
                                },
                              )
                            : GestureDetector(
                                onTap: () {
                                  print('onTap' + index.toString());

                                  itemChecked.value[index] = {
                                    'isChecked': !itemChecked.value[index]
                                        ['isChecked']
                                  };

                                  isSwicth.value = !isSwicth.value;
                                  print(itemChecked.value);
                                  print(itemChecked.value[index]['isChecked']);
                                  print('onTap' + index.toString());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue[300],
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(2),
                                  width: 50,
                                  height: 20,
                                  child: Center(
                                    child: Text(
                                      '指定訂正',
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ));
            },
          ),
        ),
      ],
    );
  }
}
