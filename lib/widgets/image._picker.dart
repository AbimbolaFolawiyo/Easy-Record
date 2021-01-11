import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final String text;
  final Function onSelectImage;
  File initialImage;
  File value;
  ImageInput(
    this.text,
    this.onSelectImage,
    this.initialImage,
    this.value,
  );
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;
  Future<void> _getImage(BuildContext context, ImageSource source) async {
    final imageFile = await ImagePicker.pickImage(
      source: source,
      maxWidth: 400,
    );
    setState(() {
      _storedImage = imageFile;
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
    Navigator.pop(context);
  }

  void _openImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150,
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text(
                  'Pick an Image',
                  style: TextStyle(
                    fontFamily: 'QuickSand',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  color: Colors.black54,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.camera_enhance,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Use Camera',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  onPressed: () {
                    _getImage(context, ImageSource.camera);
                  },
                ),
                FlatButton(
                  color: Colors.black54,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.image,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Use Gallery',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  onPressed: () {
                    _getImage(context, ImageSource.gallery);
                  },
                ),
              ],
            ),
          );
        });
  }

  Widget _setInitialImage(File storedImage, File initialImage) {
    if (storedImage == null && initialImage == null) {
      return Text('No Image choosen yet!',
          style: TextStyle(
            color: Colors.redAccent,
          ));
    } else if (storedImage == null && initialImage != null) {
      widget.onSelectImage(initialImage);
      return Image.file(
        widget.initialImage,
        fit: BoxFit.cover,
        height: 300,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
      );
    } else {
      return Image.file(
        _storedImage,
        fit: BoxFit.cover,
        height: 300,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () => _openImagePicker(context),
          child: Container(
            height: 40.0,
            child: Material(
              borderRadius: BorderRadius.circular(40),
              // shadowColor: Colors.orangeAccent,
              color: Colors.black38,
              // elevation: 7.0,
              child: Center(
                child: Text(
                  widget.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        // OutlineButton(
        //   borderSide: BorderSide(
        //     color: primaryColor,
        //     width: 2,
        //   ),
        //   onPressed: () {
        //     _openImagePicker(context);
        //   },
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       Icon(
        //         Icons.camera_alt,
        //         color: accentColor,
        //       ),
        //       SizedBox(
        //         width: 5,
        //       ),
        //       Text(
        //         widget.text,
        //         style: TextStyle(
        //           color: primaryColor,
        //           fontFamily: 'QuickSand',
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        SizedBox(
          height: 10,
        ),
        _setInitialImage(_storedImage, widget.initialImage),
        // (_storedImage == null && widget.initialImage == null)
        //     ? Text(
        //         'No Image choosen yet!',
        //       )
        //     : (_storedImage == null)
        //         // ? setInitialImage(widget.initialImage, widget.value)
        //         //  widget.initialImage = widget.value
        //         : Image.file(
        //             _storedImage,
        //             fit: BoxFit.cover,
        //             height: 300,
        //             width: MediaQuery.of(context).size.width,
        //             alignment: Alignment.center,
        //           ),
      ],
    );
  }
}
