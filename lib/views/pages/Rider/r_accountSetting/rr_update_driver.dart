import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class RR_Update_Driver extends StatefulWidget {
  const RR_Update_Driver({Key? key}) : super(key: key);

  @override
  State<RR_Update_Driver> createState() => _RR_Update_DriverState();
}

File? _image;
File? _image_Car;

class _RR_Update_DriverState extends State<RR_Update_Driver> {
  //For Profile image
  _imageFromCamera() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);
    // .pickImage(source: ImageSource.camera, imageQuality: 50);

    if (image != null) {
      setState(() {
        _image = File(image.path);
        // Navigator.pop(context);
        print(_image);
      });
    }
  }

  _imageFromGallery() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    // .pickImage(source: ImageSource.camera, imageQuality: 50);

    if (image != null) {
      setState(() {
        _image = File(image.path);
        print(_image!.path);
      });
    }
  }

  //Bottom Sheet For Profile Image
  void _showPicker(context1) {
    showModalBottomSheet(
        context: context1,
        builder: (BuildContext context) {
          didChangeDependencies();
          return SafeArea(
              child: Wrap(
            children: [
              // GestureDetector(
              //     onTap: () {
              //       Navigator.pop(context);
              //     },
              //     child: Text("Close")),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Gallery"),
                onTap: () {
                  _imageFromGallery();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Camera"),
                onTap: () {
                  _imageFromCamera();
                  Navigator.pop(context);
                },
              ),
            ],
          ));
        });
  }

  //For Cover Image
  _imageCoverFromCamera() async {
    XFile? imageC = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);
    // .pickImage(source: ImageSource.camera, imageQuality: 50);

    if (imageC != null) {
      setState(() {
        _image_Car = File(imageC.path);
        // Navigator.pop(context);
        print(_image_Car);
      });
    }
  }

  _imageCoverFromGallery() async {
    XFile? imageC = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    // .pickImage(source: ImageSource.camera, imageQuality: 50);

    if (imageC != null) {
      setState(() {
        _image_Car = File(imageC.path);
        print(_image_Car!.path);
      });
    }
  }

  //Bottom Sheet for Cover Image

  void _showPickerCover(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          didChangeDependencies();
          return SafeArea(
              child: Wrap(
            children: [
              Text("Cover Photo"),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Gallery"),
                onTap: () {
                  _imageCoverFromGallery();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Camera"),
                onTap: () {
                  _imageCoverFromCamera();
                  Navigator.pop(context);
                },
              ),
            ],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: _height,
          width: _width,
          child: Column(
            children: [
              Container(
                height: _height / 3,
                width: _width,
                color: Color.fromRGBO(196, 196, 196, 0.4),
                child: Stack(
                  children: [
                    Container(
                        width: _width,
                        child: _image_Car != null
                            ? Container(
                                width: _width,
                                child: Image.file(
                                  _image_Car!,
                                  // height: displayHeight(context) / 3,
                                  // width: displayWidth(context),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Image.asset(
                                "assets/images/foodimages/gradient_image.png",
                                fit: BoxFit.cover,
                                color: Colors.grey,
                              )),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 40.0, left: 17.0, right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
//back icon

                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Image.asset(
                                "assets/images/Vector.png",
                                color: Color.fromARGB(255, 0, 0, 0),
                              )), //back icon
                          Text("Category Title",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 0, 0, 0)))),
//Delete Button

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _image = null;
                                _image_Car = null;
                                // CategoryName.clear();
                              });
                            },
                            child: Image.asset(
                              "assets/Delete1.png",
                              color: Color.fromARGB(255, 7, 7, 7),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: _height * 0.2,
                      left: _width / 3.2,
                      child: GestureDetector(
                        onTap: () {
                          _showPickerCover(context);
                        },
                        child: Text(
                          "Upload Car Picture",
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 0.9),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

//profile pic

              Container(
                width: _width / 3,
                height: _height / 5.9,
                // color: Colors.amber,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: GestureDetector(
                        onTap: () => _showPicker(context),
                        child: Center(
                          child: _image != null
                              ? CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 60.0,
                                  child: ClipRRect(
                                    child: Image.file(
                                      _image!,
                                      height: 130,
                                      width: 130,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(150.0),
                                  ),
                                )
                              :
                              //  profileImage != null
                              //     ? CircleAvatar(
                              //         radius: 60.0,
                              //         child: ClipRRect(
                              //           child: Image.network(
                              //             profileImage!,
                              //             width: 130,
                              //             height: 130,
                              //             fit: BoxFit.fill,
                              //           ),
                              //           borderRadius:
                              //               BorderRadius.circular(150.0),
                              //         ),
                              //       )
                              CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 60.0,
                                  child: ClipRRect(
                                    child: Image.asset(
                                      "assets/profile1.png",
                                      width: 130,
                                      height: 130,
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(150.0),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 8,
                        // top: displayHeight(context) * 0.243,
                        // right: displayWidth(context) * 0.24,
                        child: GestureDetector(
                          onTap: () {
                            // _displaySuccessMotionToast(context);
                            _showPicker(context);
                          },
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  border: Border.all(
                                    color: Colors.red[500]!,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Image.asset("assets/images/Camera.png")),
                        )),
                  ],
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.035,
                alignment: Alignment.center,
                child: Text(
                  "Upload Profile Picture",
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                  )),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Container(
                  height: _height * 0.15,
                  width: _width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Profile Name",
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(0, 0, 0, 0.4))),
                      ),
                      TextField(
                          // controller: CategoryName,
                          ),
                    ],
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width * 0.75,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.deepOrangeAccent;
                        else if (states.contains(MaterialState.disabled))
                          return Colors.black54;
                        return Colors.black; // Use the component's default.
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black)))),
                  //buttonName: "Edit",
                  //buttonTextStyle: GoogleFonts.ubuntu(
                  //  textStyle: Constants.loginbuttonstyle()),
                  //buttoncolor: Constants.black_light,
                  //height: _height * 0.078,
                  //width: displayWidth(context) * 0.9,
                  //highlightColor: Constants.black_light,
                  onPressed: () {},
                  //  isButtonActive
                  //     ? () {
                  //         setState(() => isButtonActive = true);
                  //         Category_Post_Api(CategoryName.text.toString(),
                  //             _image.toString(), _imageCover.toString());

                  //         Navigator.pop(context);
                  //       }
                  //     : null,

                  child: Text(
                    "Update",
                  ),
                  //textStyle: TextStyle()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
