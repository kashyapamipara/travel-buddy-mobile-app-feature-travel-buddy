import 'package:flutter/material.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';
import 'package:travel_buddy/models/check_screen_data/check_screen_data.dart';
import 'package:travel_buddy/services/api_call_handler.dart';
import 'package:travel_buddy/widgets/background_wrapper/background_wrapper.dart';

class CheckList extends StatefulWidget {
   final dynamic listData;
  CheckList(this.listData);
  @override
  State<CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  String? checkedItemId;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    // widget.listData[0].add({'item': {'_id': '6379cffa572dd3e326e054ad', 'type': 'transfer', 'transfer': {'name': 'Kalawad Road'}}, 'isChecked': 'true'});
    print(widget.listData[0]);
    print(widget.listData[2]['itemList']);
    return Scaffold(
        body: BackgroundWrapper(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: MediaQuery.of(context).size.height / 2.5,
                child: ListView.builder(
                  itemCount: widget.listData[2]['itemList'].length,
                  itemBuilder: (context, index) {
                    return widget.listData[2]['itemList'][index]['isChecked'] == true
                        ? Container(
                            height: 50,
                            child: Padding(
                              padding: EdgeInsets.only(left: 15, right: 23),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(widget.listData[2]['itemList'][index]['item'][
                                      widget.listData[2]['itemList'][index]['item']
                                          ['type']]['name']),
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : SizedBox();
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: MediaQuery.of(context).size.height / 2.5,
                child: ListView.builder(
                  itemCount: widget.listData[0].length,
                  itemBuilder: (context, index) {
                    return widget.listData[2]['itemList'][index]['isChecked'] == false
                        ? CheckboxListTile(
                            title: Text(widget.listData[0][index]['item']
                                    [widget.listData[0][index]['item']['type']]
                                ['name']),
                            value: widget.listData[0][index]['isChecked'],
                            onChanged: (val) {
                              setState(
                                () {
                                  widget.listData[0][index]['isChecked'] =
                                      !widget.listData[0][index]['isChecked'];
                                  checkedItemId =
                                      widget.listData[0][index]['item']['id'];
                                },
                              );
                            },
                          )
                        : SizedBox();
                  },
                ),
              ),
            ),
          ]),
        ),
        floatingActionButton: ElevatedButton(
          child: Text('Submit'),
          onPressed: () async {
            await ApiCallHandler().updateCheckList(
                id: checkedItemId!,
                isChecked: isChecked,
                bookingId: widget.listData[1]);
          },
        ));
  }
}
