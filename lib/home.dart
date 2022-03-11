import 'dart:html';
import 'dart:io';
import 'dart:math';
import 'package:demo/downloadpdf.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'GetPdf.dart';

class Homescreen extends StatefulWidget
{
  

  @override
  State<StatefulWidget> createState() {
    return _HomescreenState();
    
  }
  
}

class _HomescreenState extends State<Homescreen>
{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("pdfapp"),backgroundColor: Colors.yellow,),

      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            SizedBox(
            height: 10.0,
          ),
          Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: ()
              {
                 
                Navigator.push(context, MaterialPageRoute(builder: (context)=>getPdfAndUpload()
                  
                ));
              }, child: Text("Save the pdf "),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
            Row(
               mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Dowloadpdf()
               ));
              
              }, child: Text("download the pdf"),
            ),
            ],
            ),],
      ),
    );
  }
    
  
   

  }


