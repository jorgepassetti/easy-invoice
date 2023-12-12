import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double getTotalFromItemList(List<ItemStruct> items) {
  // return the sum of total inside each item
  double total = 0.0;
  for (var item in items) {
    total += item.total;
  }
  return total.toInt() / 100.0;
}

double getSubtotalFromItemList(List<ItemStruct> items) {
  // return the sum of total inside each item
  double total = 0.0;
  for (var item in items) {
    total += item.subtotal;
  }
  return total.toInt() / 100.0;
}
