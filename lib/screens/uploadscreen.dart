import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class VideoService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  Future<String?> uploadVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      File video = File(pickedFile.path);
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      try {
        TaskSnapshot snapshot = await _storage.ref('uploads/$fileName').putFile(video);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        return downloadUrl;
      } catch (e) {
        print(e.toString());
        return null;
      }
    } else {
      return null;
    }
  }
}
