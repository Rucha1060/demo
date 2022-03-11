import 'dart:html';


import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;  
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';



class getPdfAndUpload extends StatelessWidget
{


  Future<firebase_storage.UploadTask?> uploadFile(File file) async {  
  if (file == null) {  
    
    return null;  
  } 

  firebase_storage.UploadTask uploadTask;  
  
  
  firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance .ref().child('files') .child('/some-file.pdf');  
  
  final metadata = firebase_storage.SettableMetadata(  
      contentType: 'file/pdf',  
      customMetadata: {'picked-file-path':file.relativePath<String> });  
  print("Uploading..");  
  
    //uploadTask = ref.putData(await file.readAsBytes(), metadata);  
  
  print("done succesfully");  
  //return Future.value(uploadTask);  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: RaisedButton(
        onPressed: () async {   
final path = await FlutterDocumentPicker.openDocument();  
   print(path);  
   
  
     File? file = File (<String>path);
   
     firebase_storage.UploadTask? task = await uploadFile(file);  
     Navigator.pop(context);
 
},
      child:Text("select file")), 
      ),
      

    );
    throw UnimplementedError();
  }

}