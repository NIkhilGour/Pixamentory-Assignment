import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixametory/screens/tabs.dart';

void main() {
  runApp(const ProviderScope(child: MaterialApp(home: Tabs())));
}
