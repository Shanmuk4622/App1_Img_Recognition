import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first


class RecScreen extends StatefulWidget {
  final File image;
  const RecScreen(this.image, {super.key});

  @override
  State<RecScreen> createState() => _RecScreenState();
}

class _RecScreenState extends State<RecScreen> {
  late TextRecognizer textRecognizer;
  String result = "";

  @override
  void initState() {
    super.initState();
    textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    doTextRec();
  }

  void doTextRec() async {
    InputImage inputImage = InputImage.fromFile(widget.image);
    final RecognizedText recognizedText =await textRecognizer.processImage(inputImage);
    // print(recognizedText);

    String text = recognizedText.text;
    for (TextBlock block in recognizedText.blocks) {
      final Rect rect = block.boundingBox;
      final List<Point<int>> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        for (TextElement element in line.elements) {
          // Same getters as TextBlock
        }
      }
    }
    result = text;
    // Update UI as well (optional)
    setState(() {
      result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Recognizer"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Image.file(widget.image),
              Card(
                margin: EdgeInsets.all(10),
                color: Colors.grey.shade300,
                child: Column(
                  children: [
                    Container(
                      color: Colors.blueAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.document_scanner, color: Colors.white),
                            Text(
                              "Results",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.copy, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        result,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}