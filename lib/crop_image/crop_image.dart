import 'package:crop_image/crop_image.dart';
import 'package:flutter/material.dart';

class CropImage extends StatefulWidget {
  CropImage({super.key});

  @override
  State<CropImage> createState() => _CropImageState();
}

class _CropImageState extends State<CropImage> {
final controller = CropController(
    aspectRatio: 0.7,
    defaultCrop: const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crop Image")),
      body: CropImage(


      ),
    );
  }
}
