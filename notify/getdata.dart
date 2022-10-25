import 'package:flutter/material.dart';

List<Map<String, String>>GetData(){

  final List<Map<String, String>>items = [
    {
      'cd': 'aaaa1',
      'value': 'ttttttt1',
    },
    {
      'cd': 'aaaa2',
      'value': 'ttttttt2',
    },
  ];

  print(items);
  return items;
}