import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // 真っ直ぐの方が一般的みたい。
  // const ReusableCard({Key key}) : super(key: key);

  // @required がないとオプショナルになる
  ReusableCard({@required this.colour, this.cardChild, this.onTap});

  // final は immutable （不変）
  final Color colour;
  // const はここに使えない。
  // なぜかと言うと、コンパイル時に値が決まってメモリ領域が確保されるから。
  final Widget cardChild;

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
