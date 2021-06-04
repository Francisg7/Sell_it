import 'dart:io';


import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class FBStorage {
  static Future<String> uploadPostImages({@required String productID,@required File productImageFile}) async {
    try {
      String fileName = 'Assets/images/$productID/productImage';
      StorageReference reference = FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = reference.putFile(productImageFile);
      StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
      String productImageURL = await storageTaskSnapshot.ref.getDownloadURL();
      return productImageURL;
    }catch(e) {
      return null;
    }
  }
}