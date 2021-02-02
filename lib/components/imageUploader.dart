import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageUploader extends StatefulWidget {
  final Function onImageUploaded;
  const ImageUploader({Key key, this.onImageUploaded}) : super(key: key);

  @override
  _ImageUploaderState createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  File _image;
  final picker = ImagePicker();

  Future _uploadImage() async {
    print(2222222222222);
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    print(pickedFile?.path);
    if (widget.onImageUploaded != null) {
      widget.onImageUploaded(pickedFile?.path);
    }

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _uploadImage();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfff3fff3),
          border: Border.all(
            width: 1,
            color: Colors.green[100],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: _image == null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed: _uploadImage,
                      backgroundColor: Colors.green[400],
                      elevation: 0,
                      child: Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                    Text(
                      '添加朋友圈截图',
                      style: TextStyle(
                        color: Colors.green[400],
                        height: 3,
                      ),
                    ),
                  ],
                ),
              )
            : Image.file(
                _image,
                // height: 400,
                // width: 300,
                fit: BoxFit.fitWidth,
              ),
      ),
    );
  }
}
