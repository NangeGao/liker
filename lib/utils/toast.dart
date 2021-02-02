import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void globalShowToast(text) {
  // 先隐藏可能存在的toast
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: text,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    gravity: ToastGravity.CENTER,
  );
}

void globalCancelToast(text) {
  // 先隐藏可能存在的toast
  Fluttertoast.cancel();
}
