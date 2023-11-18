import 'package:flutter/material.dart';
import 'package:travels_app/core/constants/dissmension_constract.dart';
import 'package:travels_app/helper/asset_helper.dart';
import 'package:travels_app/helper/image_helper.dart';

class ItemAddGuestAndRoom extends StatefulWidget {
  const ItemAddGuestAndRoom(
      {Key? key, required this.title, required this.icon, this.innitData})
      : super(key: key);

  final String title;
  final String icon;
  final String? innitData;

  @override
  _ItemAddGuestAndRoomState createState() => _ItemAddGuestAndRoomState();
}

class _ItemAddGuestAndRoomState extends State<ItemAddGuestAndRoom> {
  late final TextEditingController _textEditingController;
  final FocusNode _focusNode = FocusNode();

  late int number;

  @override
  void initState() {
    super.initState();
    number = widget.innitData != null ? int.parse(widget.innitData!) : 0;
    _textEditingController =
        TextEditingController(text: widget.innitData.toString())
            ..addListener(() {
          number = int.parse(_textEditingController.text);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kTopPadding),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      padding: EdgeInsets.all(
        kMediumPadding,
      ),
      child: Row(
        children: [
          ImageHelper.loadFromAsset(
            widget.icon,
          ),
          SizedBox(
            width: kDefaultPadding,
          ),
          Text(
            widget.title,
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              if(number > 1){
                setState(() {
                  number--;
                  _textEditingController.text = number.toString();
                  if(_focusNode.hasFocus) {
                    _focusNode.unfocus();
                  }
                });
              }
            },
            child: ImageHelper.loadFromAsset(
              AssetHelper.icoDecre,
            ),
          ),
          Container(
            height: 35,
            width: 60,
            alignment: Alignment.center,
            child: TextField(
              controller: _textEditingController,
              textAlign: TextAlign.center,
              focusNode: _focusNode,
              enabled: true,
              autocorrect: false,
              maxLines: 1,
              minLines: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                    bottom: 18
                ),
              ),
              onChanged: (value) {},
              onSubmitted: (String submitValue) {},
            ),
          ),


          GestureDetector(
            onTap: () {
              setState(() {
                number++;
              });
              _textEditingController.text = number.toString();
              if(_focusNode.hasFocus) {
                _focusNode.unfocus();
              }
            },
            child: ImageHelper.loadFromAsset(AssetHelper.icoIncre),
          )
        ],
      ),
    );
  }
}
