import 'package:flutter/material.dart';
import 'package:final_app/User.dart';
import 'package:image_picker/image_picker.dart';



class SelectPhoto extends StatefulWidget{
  @override
  _SelectPhotoState createState() => _SelectPhotoState();
}
class _SelectPhotoState extends State<SelectPhoto> {
  var _curr = currentUser.image;
  PickedFile _image;
  ImagePicker _picker;
  String imagePath;

  String getImage() {
    if(_image != null && _curr != null) {
      setState(() => imagePath = _image.path);
    } else if (_image == null && _curr != null) {
      setState(() => imagePath = _curr);
    } else {
      setState(() => imagePath = null);
    }
    return imagePath;
  }
  @override
  void initState(){
    super.initState();
  }

  Future<void> _fromGallery() async {
    final _item = await _picker.getImage(source: ImageSource.gallery);
    setState(() => _image = _item);
  }
  Future<void> _fromCamera() async {
    final _item = await _picker.getImage(source: ImageSource.camera);
    setState(() => _image = _item);
  }
  Future<void> _removePhoto() async {
    setState(() => _image = null);
  }
  @override
  Widget build(BuildContext context) {
    Color _color = Theme.of(context).accentColor;

    return Center(
      // create the page for the edit profile page
      child: GestureDetector(
        onTap: () => _showBottomSheet(context),
        child: CircleAvatar(
          radius: 40,
          child: getImage() != null
              ? ClipOval(
            child: Image(image: AssetImage(getImage()),
                width: 90,
                height: 90,
                fit: BoxFit.cover),
          )
              : Container(
            decoration: BoxDecoration(
              color: _color,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(Icons.add_a_photo, color: Colors.white, size: 45,),
            width: 90,
            height: 90,
          ),
        ),
      ),
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