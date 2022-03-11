import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;  
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

class Dowloadpdf extends StatefulWidget
{
 

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
  }
  
class _DowloadpdfState extends State<Dowloadpdf>
{
  @override
firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  Future<void> listExample() async {  
  firebase_storage.ListResult result =  
  await firebase_storage.FirebaseStorage.instance.ref().child('notes').listAll();  
  
  result.items.forEach((firebase_storage.Reference ref) {  
    print('Found file: $ref');  
  });  
  
  result.prefixes.forEach((firebase_storage.Reference ref) {  
    print('Found directory: $ref');  
  });  
}

Future<void> downloadURLExample() async {  
  String downloadURL = await firebase_storage.FirebaseStorage.instance  
  .ref('file/.pdf')  
      .getDownloadURL();  
  print(downloadURL);  
  PDFDocument doc = await PDFDocument.fromURL(downloadURL);  
  Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewPDF(doc)));  
}
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  void initState() {  
  // TODO: implement initState  
  super.initState();    
  listExample();  
  downloadURLExample();  
  print("done");  
}
}
class ViewPDF extends StatefulWidget {  
  PDFDocument document;  
  ViewPDF(this.document);  
  @override  
  _ViewPDFState createState() => _ViewPDFState();  
}  
  
class _ViewPDFState extends State<ViewPDF> {  
  @override  
  Widget build(BuildContext context) {  
    return  
         PDFViewer(document: widget.document);  
  }  
}
