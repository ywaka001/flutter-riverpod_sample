import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  DropDownWidget({
    super.key,
    required this.label,
    required this.lists,
    @required this.onChangedCallBack,
    @required this.dropdownValue = '',
  });

  final label;
  final lists;
  final onChangedCallBack;
  String dropdownValue;
  // final double width;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  void initState() {
    widget.dropdownValue = widget.lists.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 70,
          child: Text(widget.label),
        ),
        Container(
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
            borderRadius: BorderRadius.circular(1),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: widget.dropdownValue,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              onChanged: (String? value) {
                setState(() {
                  print(value);
                  widget.dropdownValue = value!;
                });
                widget.onChangedCallBack?.call(value);
              },
              items: widget.lists.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(value),
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}
