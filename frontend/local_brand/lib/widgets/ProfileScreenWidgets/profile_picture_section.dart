import 'package:flutter/material.dart';
import 'package:local_brand/screens/edit_user_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w500_f16.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w500_f24.dart';
class ProfilePictureSection extends StatefulWidget {
  const ProfilePictureSection({Key? key}) : super(key: key);

  @override
  State<ProfilePictureSection> createState() => _ProfilePictureSectionState();
}

class _ProfilePictureSectionState extends State<ProfilePictureSection> {
  void _TakePicture() async {
    final imagePicker = ImagePicker();
    //there is extra configuration to do in order to use the image_picker libary on ios (visit the documentaion)
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage == null) {
      return;
    }
    //because selected imag eis an x file we converted it to a file by casting through File(path)
    }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _TakePicture,
          child: Container(
            width: 8*12,
            height: 8*12,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage("https://www.shutterstock.com/image-vector/vector-design-avatar-dummy-sign-600nw-1290556063.jpg"),
                fit: BoxFit.cover,
              ),
              shape: OvalBorder(),
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextW500F24(text: 'Youssef')
       ,
        const SizedBox(height: 8*2),
        GestureDetector(
          onTap: (){Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditUserScreen(), // Replace with your widget
              )
          );},
          child: Container(
            height: 8*6,
            width: 8*20,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Color(0xFFE4E4E4),
                ),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Center(child: TextW500F16(color: Colors.black,link: false,text: 'Edit Profile',))
          ),
        ),
      ],
    );
  }
}
