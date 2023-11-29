

import 'dart:io';
// import 'package:dio/dio.dart';
import 'package:Veots/screens/constants.dart';
import 'package:Veots/widgets/send_accept.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:pdf_render/pdf_render_widgets.dart';

import 'package:Veots/screens/warranty.dart';
import 'package:Veots/widgets/ham.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/not_icon.dart';
import 'Notifications_view.dart';
import 'home_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
// import 'package:open_file/open_file.dart';



class  BillUpload extends StatefulWidget {
  const  BillUpload({super.key,required this.link, required this.warrantyPeriod, required this.Pimage, required this.prodName, required this.cashBackPts, required this.cashBackApp, 
      required this.i_value,
      required this.clientId,
      required this.batchNo,});
final String link;
final warrantyPeriod;
final Pimage;
final prodName;
final cashBackPts;
final cashBackApp;
final int i_value;
  final String clientId;
  final String batchNo;
  @override
  State< BillUpload> createState() => _MyWidgetState();
}

class _MyWidgetState extends State< BillUpload> {
//   final ImagePicker imgpicker = ImagePicker();
// List<XFile>? imagefiles;


//   openImages() async {
// try {
//     var pickedfiles = await imgpicker.pickMultiImage();
//     //you can use ImageCourse.camera for Camera capture
//     if(pickedfiles != null){
//         imagefiles = pickedfiles;
//         setState(() {
//         });
//     }else{
//         print("No image is selected.");
//     }
// }catch (e) {
//     print("error while picking file.");
// }
//   }

Album3? token;
  Future getData() async {
    
    print(widget.i_value);
    print(widget.clientId);
    print(widget.batchNo);
    print(MOB_not_EM);
    String type= MOB_not_EM! ? "mobile" :"email"; 
    token = await createAlbum56(
        widget.i_value.toString(), ID!, widget.clientId, widget.batchNo,File(myFuture.toString()),LOCATION,widget.link,type);
    print("ccccccccccccccccccccccccccccccc");
    print("token detais");
    print(token);
    print("ccccccccccccccccccccccccccccccccc");
    print("token message");
    print(token?.message);
    print("ccccccccccccccccccccccccccccccccc");
    print("coupon details");
    print(token?.couponDetails);
    return token;
  }

//  Future<dynamic> _upload() async {
//             if (file== null) return;
//             String fileName = file.path!.split('/').last;
//            FormData formData = new FormData.fromMap({
//   "name": hospitalNameEng,
//   "Services": servicejson,
//   "Image": {
//       "image": await MultipartFile.fromFile(imageFile.path,
//           filename: imageFileName, contentType: new MediaType('image', 'png')),
//       "type": "image/png"
//   },
// });
//            return await Dio()
//         .post("https://7fd2-61-1-116-149.in.ngrok.io/customer/claim-product",data:formData).
//     then((dynamic result){
//     print(result.toString());
// });
// }

final pdf = pw.Document();
createPDF() async {
    for (var img in imageFileList!) {
      final image = pw.MemoryImage(img.readAsBytesSync());

      pdf.addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context contex) {
            return pw.Center(child: pw.Image(image));
          }));
    }
  }
  
  //  savePDF() async {
  //   // await FileHandleApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  // }


      
      final ImagePicker imagePicker = ImagePicker();
      List<File>? imageFileList = [];

      Future<String?> selectImages() async {
         final PickedFile? selectedImages = (await 
                // ignore: deprecated_member_use
                imagePicker.getImage(source: ImageSource.gallery));
         File selected = File(selectedImages!.path);
              imageFileList!.add(selected);
           
          print("Image List Length:" + imageFileList!.length.toString());
          // final file = imageFileList!.first;
          setState((){
            
          });
          return imageFileList!.first.path;
      }


//image uploader
    var filepath;
String my='nofile';
     var _scaffoldKey = new GlobalKey<ScaffoldState>();

  // Future<String> _calculation() async => Future<String>.delayed(
  //       const Duration(),
  //       () => 'Loaded',
  //     );

  // Future<void> getData() async {
  //   var a = await _pickFile().timeout(
  //     const Duration(),
  //     onTimeout: () => 'Error',
  //   );

  //   setState(() {
  //     myFuture = a;
  //   });
 bool loading=false;
 String? Filename;
 String? myFuture="";
 late PlatformFile file;
 Future<String?> _pickFile() async {
	
	// opens storage to pick files and the picked file or files
	// are assigned into result and if no file is chosen result is null.
	// you can also toggle "allowMultiple" true or false depending on your need
	final result = await FilePicker.platform.pickFiles(type: FileType.custom,allowedExtensions: ['png','jpg','jpeg']);

	// we get the file from result object
  if(result == null)
  {
    return null;
  }
	  file = result.files.first;
   setState(() { 
                Filename=file.name;
              });
      return file.path;
	// _openFile(file);
}
bool sub_visibility = false;
  @override 
   Container poweredby(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Powered By",
              style: TextStyle(
                  color: const Color(0xff002060),
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                  fontFamily: "Poppins Medium"),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.008,
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // color: Colors.red,
                      child: Image.asset(
                        'assets/veots_logo_wo_tl.png',
                        height: 20,
                        width: MediaQuery.of(context).size.width * 0.055,
                      ),
                    ),
                    Text(
                      "Veots",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontFamily: "Montserrat-SemiBold"),
                    ),
                  ],
                )),
          ]),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/50,),
            Container(
              // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/30, bottom: MediaQuery.of(context).size.height/20),
              // margin: EdgeInsets.only(top: 0),
              // color: Colors.red,
              child: Row(
                children: [
                  Container(
                    // color: Colors.yellow,
                    // alignment: Alignment.bottomRight,
                    height:MediaQuery.of(context).size.width * 0.08,
                      width: MediaQuery.of(context).size.width * 0.08,
                    child: IconButton(
                      onPressed: () {
                        // Navigator.of(context).pushAndRemoveUntil(
                        //   MaterialPageRoute(
                        //       builder: ((context) => HomeScreen(
                        //             first_time: 0,
                        //           ))),
                        //   (Route<dynamic> route) => false,
                        // );
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xff002060),
                        size: MediaQuery.of(context).size.width * 0.04,
                      )),),
                  
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width/15,
                  // ),
                  
                  Container(
                    // color: Colors.red,
                    child: Image.asset(
                      'assets/veots_logo_wo_tl.png',
                        height: MediaQuery.of(context).size.width * 0.08,
                        width: MediaQuery.of(context).size.width * 0.08,
                    ),
                  ),
                  
                  Spacer(),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.45,
                  // ),
                  Container(
                      height: MediaQuery.of(context).size.width * 0.08,
                      width: MediaQuery.of(context).size.width * 0.08,
                      decoration: BoxDecoration(
                        color: Color(0xff002060),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Center(
                        child: FittedBox(
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: 
                                   (context)=>HomeScreen(first_time: 0,
                                   mainLink: '',location_on: true,)), (route) => false);
                                },
                                icon: Icon(
                                  Icons.home,
                                  // size: MediaQuery.of(context).size.width * 0.06,
                                  color: Colors.white,
                                ))),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.015,
                  ),
                 Not_icon(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.015,
                  ),
                  Container(
                          height: MediaQuery.of(context).size.width * 0.08,
                          width: MediaQuery.of(context).size.width * 0.08,
                          decoration: BoxDecoration(
                            color: Color(0xff002060),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Center(
                            child: FittedBox(
                              child: 
                              InkWell(
                             onTap: (){
                        _scaffoldKey.currentState?.openDrawer();    },
                               child: Icon(
                                  Icons.menu,
                                  size: MediaQuery.of(context).size.width * 0.05,
                                  color: Colors.white,
                                ),
                            
        ),
                            ),
                          )),
                  SizedBox(width: 12,)
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Text(
              "Upload Bill",
              style: TextStyle(
                  color: Color(0xff002060),
                  // fontSize: MediaQuery.of(context).size.width * 0.07,
                  fontSize: 16,
                  // fontWeight: FontWeight.bold
                  fontFamily: "Poppins Medium"
                  ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 45,
            ),
            future_builder(),
            
            SizedBox(
              height: MediaQuery.of(context).size.height/20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
              "File name",
              style: TextStyle(
                  color: Color(0xff002060),
                  fontSize: MediaQuery.of(context).size.width * 0.023,
                  // fontWeight: FontWeight.bold
                  fontFamily: "Poppins Medium"
                  ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/80,),
            Container(
                            height: MediaQuery.of(context).size.height / 17,
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: EdgeInsets.all(15),
                           decoration: BoxDecoration(
                        // border: Border.all(color: logborder),
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffdfdfdf),
                      ),
                            
                                child: 
                                    Text( Filename==null?
                                  'Attach bill copy for us to analyse':'${Filename}',
                                  style: TextStyle(
                                   
                                  fontFamily: "Poppins Medium",
                                  fontSize: 9,
                                  color: Color(0xff002060)
                                  // fontSize: MediaQuery.of(context).size.width*0.030
                                  ),
                                 softWrap: false,
                                 maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                                ),
                              ),
                          
                          SizedBox(height: MediaQuery.of(context).size.height/80,),
                      Container(
                            height: MediaQuery.of(context).size.height / 17,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ElevatedButton(
                              onPressed: () async{
                                 myFuture= (await _pickFile()) ;
                                setState(() {
                                  print(myFuture);
                                  print(myFuture.toString());
                                  if (myFuture==null)
                                  {
                                    sub_visibility = false;
                                    Filename = null;
                                    my='nofile';
                                  }
                                  else{
                                    my='hasfile';
                                    sub_visibility = true;
                                  }
                                });
                                
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                                  primary: Color(0xff01b050)),
                              child: FittedBox(
                                child: 
                                    Text(
                                  'Upload',
                                  style: TextStyle(
                                  fontFamily: "Poppins Medium",
                                  fontSize: 14,
                                  // fontSize: MediaQuery.of(context).size.width*0.030
                                  ),
                                ),
                              ),
                            ),
                          ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/60,),
            sub_visibility == false ?
            Container(
                // alignment: Alignment.center,
                width: MediaQuery.of(context).size.width*0.678,
                child: Text("Upload the bill for the claimed product to undergo further steps",style: TextStyle(
                  color: Color(0xff002060),
                  fontSize: MediaQuery.of(context).size.width * 0.023,
                  fontFamily: "Poppins Medium"
                ),textAlign: TextAlign.center,),
              ) 
              :
                 Container(
                  child: 
                   Container(
                            height: MediaQuery.of(context).size.height / 15,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Color(0xff00b7ff), Color(0xffaa2aae)])),
                            child: ElevatedButton(
                              onPressed: () async{
                                print("bill uploaded");
                                setState(() {
                                  loading=true;
                                });
                                // _upload();
                                print(File(myFuture.toString()));
                                // createPDF();
                                // savePDF();
                                
                                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                                //              builder: (context) => Warranty(warrantyPeriod: widget.warrantyPeriod, Pimage: widget.Pimage, prodName: widget.prodName, cashBackPts: widget.cashBackPts, cashBackApp: widget.cashBackApp)
                                //            ));
                                await   getData();
                    if (token!.message == "successfull") {
                      setState(() {
                                  loading=false;
                                });
                      showDialog(
                           
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                          return WillPopScope(
                         onWillPop: () async => false,
                         child:AlertDialog(   
                              backgroundColor: Color(0xff002060),
                              titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                              shape: RoundedRectangleBorder(
                                  //<-- SEE HERE
                                  // side: BorderSide(
                                  //   color: Colors.greenAccent,
                                  // ),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              title: Stack(
                                children: [
                                  Container(
                                      height:
                                            50,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                        Color(0xff003296),
                                        Color(0xff662da4)
                                      ])),
                                      // color: Colors.blue,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              600) ...[
                                            Text(
                                              "Registration",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Poppins Medium",
                                                  // fontWeight: FontWeight.w400,
                                                  fontSize: 20),
                                            ),
                                          ] else
                                            Text(
                                              "Registration",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  // fontWeight: FontWeight.w400,
                                                  fontFamily: "Poppins Medium",
                                                  fontSize: 30),
                                            ),
                                        ],
                                      )),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: (() {
                                          Navigator.of(context).push(MaterialPageRoute(
                                             builder: (context) => Warranty(warrantyPeriod: widget.warrantyPeriod, Pimage: widget.Pimage , prodName: widget.prodName, cashBackPts: widget.cashBackPts, cashBackApp: widget.cashBackApp, claim_token: token,)
                                           ));
                                        //   bool warranty_res=false;
                                        //   bool cash_res=false;
                                        //  setState(() {
                                        //    if(widget.warrantyApp == true)
                                        //    {
                                        //    warranty_res=true;
                                        //    }
                                        //     else if(widget.snapshot.details["cashBackApp"] == true)
                                        //   {
                                        //     cash_res=true;
                                           
                                        //   }
                                        //  });
                                        //  Navigator.pop(context,warranty_res);
                                        //  if (warranty_res)
                                        //  {
                                        //     Navigator.of(context).push(MaterialPageRoute(
                                        //      builder: (context) => BillUpload(warrantyPeriod: widget.snapshot.details["warrantyPeriod"], Pimage: widget.snapshot.details["Pimage"], prodName: widget.snapshot.details["prodName"], cashBackPts: widget.snapshot.details["cashBackPts"], cashBackApp: widget.snapshot.details["cashBackApp"],)
                                        //    ));
                                        //  }
                                        //   else if(cash_res)
                                        //   {
                                        //     Navigator.of(context).push(MaterialPageRoute(
                                        //      builder: (context) => CashBack( cashBackPts: widget.snapshot.details["cashBackPts"], )
                                        //    ));
                                        //   }
                                        //   else{

                                        //   Navigator.of(context)
                                        //       .push(
                                        //     MaterialPageRoute(
                                        //         builder: ((context) =>
                                        //            NoCBWar()
                                        //             )
                                        //             ),
                                            
                                        //   );
                                        //   }
                                        //   // if(widget.snapshot.details["warrantyApp"] == true)
                                        //   // {
                                           
                                          //  Navigator.of(context).push(MaterialPageRoute(
                                          //    builder: (context) => Warranty(warrantyPeriod: widget.snapshot.details["warrantyPeriod"], Pimage: widget.snapshot.details["Pimage"], prodName: widget.snapshot.details["prodName"], cashBackPts: widget.snapshot.details["cashBackPts"], cashBackApp: widget.snapshot.details["cashBackApp"],)
                                          //  ));
                                          
                                        //   // }
                                        //   // else if(widget.snapshot.details["cashBackApp"] == true)
                                        //   // {
                                        //   //   Navigator.of(context).push(MaterialPageRoute(
                                        //   //    builder: (context) => CashBack( cashBackPts: widget.snapshot.details["cashBackPts"], )
                                        //   //  ));
                                        //   // }
                                        //   // else{
                                        //   // Navigator.of(context)
                                        //   //     .pushAndRemoveUntil(
                                        //   //   MaterialPageRoute(
                                        //   //       builder: ((context) =>
                                        //   //           HomeScreen(
                                        //   //             first_time: 0,
                                        //   //           ))),
                                        //   //   (Route<dynamic> route) => false,
                                        //   // );}

                                        }
                                        ),
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                        iconSize: 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              content: Text(
                                'Product Registered to you Successfully',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins Medium",
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                              ),
                            ));
                          });
                    } else if (token!.message ==
                        "Timeout!!! please Rescan the qr codes") {
                            setState(() {
                                  loading=false;
                                });
                      showDialog(
                          // barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Color(0xff002060),
                              titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                              shape: RoundedRectangleBorder(
                                  //<-- SEE HERE
                                  // side: BorderSide(
                                  //   color: Colors.greenAccent,
                                  // ),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              title: Stack(
                                children: [
                                  Container(
                                      height:
                                            50,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                        Color(0xff003296),
                                        Color(0xff662da4)
                                      ])),
                                      // color: Colors.blue,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              600) ...[
                                            Text(
                                              "Registration",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20),
                                            ),
                                          ] else
                                            Text(
                                              "Registration",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 30),
                                            ),
                                        ],
                                      )),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: (() {
                                          Navigator.pop(context);
                                        }),
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                        iconSize: 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              content: Text(
                                'Already Claimed/Timeout. Please try again with first QR code',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                              ),
                            );
                          });
                    } else if (token!.message ==
                        "This Product has been claimed by someone already.") {
                            setState(() {
                                  loading=false;
                                });
                      showDialog(
                          // barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Color(0xff002060),
                              titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                              shape: RoundedRectangleBorder(
                                  //<-- SEE HERE
                                  // side: BorderSide(
                                  //   color: Colors.greenAccent,
                                  // ),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              title: Stack(
                                children: [
                                  Container(
                                      height:
                                            50,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                        Color(0xff003296),
                                        Color(0xff662da4)
                                      ])),
                                      // color: Colors.blue,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              600) ...[
                                            Text(
                                              "Registration",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20),
                                            ),
                                          ] else
                                            Text(
                                              "Registration",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 30),
                                            ),
                                        ],
                                      )),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: (() {
                                          Navigator.pop(context);
                                        }),
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                        iconSize: 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              content: Text(
                                'This Product has been claimed by someone already.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                              ),
                            );
                          });
                    } else  {
                        setState(() {
                                  loading=false;
                                });
                      showDialog(
                          // barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Color(0xff002060),
                              titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                              shape: RoundedRectangleBorder(
                                  //<-- SEE HERE
                                  // side: BorderSide(
                                  //   color: Colors.greenAccent,
                                  // ),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              title: Stack(
                                children: [
                                  Container(
                                      height:
                                            50,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                        Color(0xff003296),
                                        Color(0xff662da4)
                                      ])),
                                      // color: Colors.blue,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              600) ...[
                                            Text(
                                              "Registration",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20),
                                            ),
                                          ] else
                                            Text(
                                              "Registration",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 30),
                                            ),
                                        ],
                                      )),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: (() {
                                          Navigator.pop(context);
                                        }),
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                        iconSize: 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              content: Text(
                                'Something went wrong!!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                              ),
                            );
                          });
                    }
                  
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent),
                              child: FittedBox(
                                child: 
                                    Text(
                                  'Submit',
                                  style: TextStyle(
                                  fontFamily: "Poppins Medium",
                                  fontSize: 13.5,
                                  // fontSize: MediaQuery.of(context).size.width*0.030
                                  ),
                                ),
                              ),
                            ),
                          )
                        
                 ),
          ],
        ),
      ),
      bottomNavigationBar: poweredby(context),
      drawer: HamWidget()
    )
    );
  }
  Widget future_builder(){
return FutureBuilder(
  //  future: myFuture,
  builder: (context, snapshot) {
 if (my=='nofile'){

    return Container(
              color: Color(0xff00b7ff),
              height: 300,
              width: 250,
             child: 
             Center(
              child: Text("Bill Preview", style: TextStyle(fontFamily: "Poppins Medium", fontSize: 9, color: Colors.black),),
             )
            );

  }
   else if(my=='hasfile')
  { print("hello");
      return   Container(
        width:300,
        height: 250,
        // child: GridView.builder(
        //                 itemCount: imageFileList!.length,
        //                gridDelegate: 
        //                   SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 2,crossAxisSpacing: 2,
        //                       crossAxisCount: 3),
        //                   itemBuilder: (BuildContext context, int index) {
        //                    return Image.file(File(imageFileList![index].path), 
        //                 fit: BoxFit.cover,);
        //              }),
        child: Center(child: Image.file(File(myFuture.toString()), )),
      );
  }

else {
   return Container(
              color: Color(0xff00b7ff),
              height: 300,
              width: 250,
            
            );
}

});
  }
  }
// class FileHandleApi {
//   // save pdf file function
//   static Future<File> saveDocument({
//     required String name,
//     required pw.Document pdf,
//   }) async {
//     final bytes = await pdf.save();

//     final dir = await getApplicationDocumentsDirectory();
//     final file = File('${dir.path}/$name');
//     await file.writeAsBytes(bytes);
//     return file;
//   }

//   // open pdf file function
//   static Future openFile(File file) async {
//     final url = file.path;

//     await OpenFile.open(url);
//   }
// }