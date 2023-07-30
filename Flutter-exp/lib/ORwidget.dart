import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:temp/Profile.dart';

class QRImage extends StatefulWidget {
  const QRImage({super.key});

  @override
  State<QRImage> createState() => _QRImageState();
}

class _QRImageState extends State<QRImage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(dataQR.text.isNotEmpty){
    setState(() {

    });
    }
  }
  @override
  Widget build(BuildContext context) {
    return  QrImageView(

        data: dataQR.text,
      version: QrVersions.auto,
      embeddedImage:const AssetImage("assets/accident-car.png"),
        size: 200,
    );
  }
}
