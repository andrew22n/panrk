import 'package:course_app/screens/uploadscreen.dart';
import 'package:flutter/material.dart';


class UploadScreen extends StatelessWidget {
  final VideoService _videoService = VideoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Video'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            String? url = await _videoService.uploadVideo();
            if (url != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Upload complete')));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Upload failed')));
            }
          },
          child: Text("Pick and Upload Video", style: TextStyle(fontSize: 14),),
        ),
      ),
    );
  }
}
