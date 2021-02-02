import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import './data/class.dart';
import './components/imageUploader.dart';
import './utils/toast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _momentsImagePath;
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  FocusNode _likeAmountFocusNode = FocusNode();
  TextEditingController _likeAmountController = TextEditingController();

  onImageUploaded(uploadedImagePath) {
    if (uploadedImagePath != null) {
      setState(() {
        _momentsImagePath = uploadedImagePath;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('111111111, $_momentsImagePath');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageUploader(
              onImageUploaded: onImageUploaded,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 20,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: TextFormField(
                        controller: _likeAmountController,
                        focusNode: _likeAmountFocusNode,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.recommend),
                          border: InputBorder.none,
                          labelText: "输入点赞数量",
                          labelStyle: TextStyle(
                              // fontSize: 16,
                              ),
                          // helperText: "最大可设置为120",
                          counterText: "最大可设置为120",
                          fillColor: Colors.grey[100],
                          filled: true,
                        ),
                        keyboardType: TextInputType.datetime,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                        ],
                        maxLength: 3,
                        cursorWidth: 1,
                        validator: (value) {
                          if (value.isEmpty) {
                            return '请填写点赞数量';
                          }
                          if (int.parse(value) > 120) {
                            return '最大可设置为120';
                          }
                          return null;
                        },
                      ),
                    ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     prefixIcon: Icon(Icons.more_time_outlined),
                    //     border: InputBorder.none,
                    //     labelText: "设置发布时间",
                    //     labelStyle: TextStyle(
                    //       fontSize: 18,
                    //     ),
                    //     // helperText: "最大可设置为200",
                    //     // hintText: "输入点赞数量",
                    //     counterText: "最大可设置为200",
                    //     fillColor: Colors.grey[100],
                    //     filled: true,
                    //   ),
                    //   keyboardType: TextInputType.datetime,
                    //   inputFormatters: [
                    //     FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                    //   ],
                    //   maxLength: 3,
                    //   cursorWidth: 1,
                    // ),
                  ],
                ),
              ),
            ),
            FlatButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                if (_momentsImagePath == null) {
                  globalShowToast('请添加朋友圈截图');
                  return;
                }
                if (!_formKey.currentState.validate()) {
                  FocusScope.of(context)
                      .requestFocus(_likeAmountFocusNode); // 获取焦点
                  return;
                }
                _likeAmountFocusNode.unfocus();
                Navigator.of(context).pushNamed(
                  "moments",
                  arguments: ParamPeas(
                    _momentsImagePath,
                    int.parse(_likeAmountController.text),
                  ),
                );
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              minWidth: 200,
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.camera_outlined),
                  Text(
                    " 生成朋友圈",
                    style: TextStyle(
                        // fontSize: 18,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
