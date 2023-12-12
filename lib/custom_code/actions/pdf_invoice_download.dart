// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../auth/firebase_auth/auth_util.dart';
import 'package:intl/intl.dart';
//import '../../backend/firebase_storage/storage.dart';
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

Future pdfInvoiceDownload(
  BuildContext context,
  InvoicesRecord invoiceDocument,
  String invoiceText,
  String dateText,
  String billToText,
  String paymentDueText,
  String paymentMethodText,
  String priceText,
  String qtyText,
  String taxText,
  String logo,
) async {
  final pdf = pw.Document();

  // add network image
  final netImage = await networkImage("https://www.nfet.net/nfet.jpg");

  // add asset image, IMPORTANT! Using assets will not work in Test/Run mode you can only test it using Web Publishing mode or using an actual device!
  //final bytes =
  //    (await rootBundle.load('assets/images/demo.png')).buffer.asUint8List();
  //final image = pw.MemoryImage(bytes);

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(invoiceText, style: pw.TextStyle(fontSize: 24)),
                    pw.SizedBox(height: 20),
                    pw.Text(invoiceText + ' No.: ' + invoiceDocument.number),
                    pw.Text(
                        '${dateText}: ${DateFormat('MMM, dd yyyy').format(invoiceDocument.date ?? DateTime.now())}'),
                  ],
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Image(
                      netImage,
                      width: 2.0 * 28.3465, // 2 cm converted to points
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('${billToText}:',
                        style: pw.TextStyle(fontSize: 18)),
                    pw.Text('${invoiceDocument.customerName}'),
                    pw.Text('${invoiceDocument.customerAddress}'),
                  ],
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(paymentDueText),
                    pw.Text('${invoiceDocument.paymentDue}',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 5),
                    pw.Text(paymentMethodText),
                    pw.Text('${invoiceDocument.paymentMethod}',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Text('${invoiceDocument.greetings}',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 20),
            pw.Text('Items:', style: pw.TextStyle(fontSize: 18)),
            pw.Container(
              child: pw.TableHelper.fromTextArray(
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                data: [
                  ['Item', qtyText, priceText, 'Total'],
                  for (var item in invoiceDocument.items)
                    [
                      item.name,
                      item.quantity.toString(),
                      '\$${(item.pricePerUnit / 100.0).toStringAsFixed(2)}',
                      '\$${(item.total / 100.0).toStringAsFixed(2)}',
                    ],
                ],
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Subtotal:'),
                pw.Text(
                    '\$${(invoiceDocument.subtotal / 100.0).toStringAsFixed(2)}'),
              ],
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('${taxText} (${invoiceDocument.taxesPercentage}%):'),
                pw.Text(
                    '\$${(invoiceDocument.taxes / 100.0).toStringAsFixed(2)}'),
              ],
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Total:'),
                pw.Text(
                    '\$${(invoiceDocument.total / 100.0).toStringAsFixed(2)}'),
              ],
            ),
          ],
        );
      },
    ),
  );

  final pdfSaved = await pdf.save();

  // Get the current date and time
  //final now = DateTime.now();

// Format the date and time as a string
  //final formattedDateTime =
  //    '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}_${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}-${now.second.toString().padLeft(2, '0')}';

// Set the file name to the formatted date and time string
  //final fileName = '$formattedDateTime.pdf';

// Set the directory where you want to store the file (e.g., a folder named 'pdfs' in your storage)
  //String directoryPath = '/users/' + currentUserUid + '/pdfs';

// Combine the directory path and file name to create the full storage path
  //final storagePath = '$directoryPath/$fileName';

  // SAVE IT TO FIREBASE STORE
  //final downloadUrl = await uploadData(storagePath, pdfSaved);
  // FFAppState().name = downloadUrl ?? '';

  // PRINT IT
  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdfSaved);
}
