import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:printing/printing.dart';

class PDFViewerScreen extends StatefulWidget {
  final String pdfUrl;

  const PDFViewerScreen({required this.pdfUrl});

  @override
  _PDFViewerScreenState createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  late PDFViewController _pdfViewController;
  int _currentPage = 0;
  int _totalPages = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PDF(
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: false,
              pageFling: false,
              onViewCreated: _onPDFViewCreated,
              onPageChanged: _onPageChanged,
            ).fromUrl(widget.pdfUrl),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Page ${_currentPage + 1} of $_totalPages',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _pdfViewController.setPage(_currentPage - 1);
                },
                child: Icon(Icons.arrow_back),
              ),
              ElevatedButton(
                onPressed: () {
                  _pdfViewController.setPage(_currentPage + 1);
                },
                child: Icon(Icons.arrow_forward),
              ),
              ElevatedButton(
                onPressed: _printPDF,
                child: Icon(Icons.print),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onPDFViewCreated(PDFViewController pdfViewController) {
    setState(() {
      _pdfViewController = pdfViewController;
    });
  }

  void _onPageChanged(int? page, int? total) {
    setState(() {
      _currentPage = page ?? 0;
      _totalPages = total ?? 0;
    });
  }

  Future<void> _printPDF() async {
    final response = await http.get(Uri.parse(widget.pdfUrl));
    if (response.statusCode == 200) {
      final pdfBytes = response.bodyBytes;
      await Printing.layoutPdf(onLayout: (_) => pdfBytes);
    } else {
      // Handle the case when the PDF cannot be fetched
      // You can show an error message or perform any necessary error handling
      print('Failed to load the PDF');
    }
  }
}
