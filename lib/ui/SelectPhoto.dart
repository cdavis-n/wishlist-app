import 'package:flutter/material.dart';
import 'package:final_app/User.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class SelectPhoto extends StatefulWidget{
  @override
  _SelectPhotoState createState() => _SelectPhotoState();
}
class _SelectPhotoState extends State<SelectPhoto> {

  @override
  void initState(){
    super.initState();
  }
  String _imagePath;
  PickedFile _image;
  getImagePath(Path path) async {
    return path.toString();
  }
  final _picker = ImagePicker();
  Future<void> _fromGallery() async {
    final _item = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = _item;
      _imagePath = _image.path;
    });
  }
  Future<void> _fromCamera() async {
    final _item = await _picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = _item;
      _imagePath = _image.path;
    });
  }
  Future<void> _removePhoto() async {
    setState(() => _image = null);
  }
  _getImage(PickedFile image) async {
    if(image != null) {

      ClipOval(
        child: Image(image: AssetImage(_image.path),
            width: 90,
            height: 90,
            fit: BoxFit.cover),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    Color _color = Theme.of(context).accentColor;
    return FutureBuilder<List<User>> (
      future: Provider.db.updateUserImage(currentUser, _imagePath),
    );
  }

  void _showBottomSheet(context){
    showModalBottomSheet(
        context: context,
        elevation: 2.0,
        builder: (BuildContext context){
          return Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            height: 240,
            child: Center (
              child: Wrap (
                children: [
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Take Photo'),
                    onTap: () {
                      _fromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Choose from Library'),
                    onTap: (){
                      _fromGallery();
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delete_forever),
                    title: Text('Remove Photo'),
                    onTap: () {
                      _removePhoto();
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    title: Text('Cancel',
                      textAlign: TextAlign.center,),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          );
        });
  }
}