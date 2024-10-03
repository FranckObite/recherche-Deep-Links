import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

import '../green.dart';
import '../red.dart';
import 'context_utility.dart';

class UniService {
  static String _code = '';
  static String get code => _code;
  static bool get hasCode => _code.isNotEmpty;

  static int get length => _code.length; //Pour moi meme

  static void reset() => _code = "";

  static init() async {
    try {
      final Uri? uri = await getInitialUri();

      uniHandler(uri);
    } on PlatformException {
      log("=== Failled to receive the code ==");
    } on FormatException {
      log("=== Wrong fromat code received ==");
    }

    uriLinkStream.listen((Uri? uri) async {
      uniHandler(uri);
    }, onError: (error) {
      log('On Urilink Error:  $error');
    });
  }

  static uniHandler(Uri? uri) {
    if (uri == null || uri.queryParameters.isEmpty) return;

    Map<String, dynamic> param = uri.queryParameters;

    String receivedCode = param['code'] ?? '';

    if (receivedCode == "green") {
      Navigator.push(ContextUtility.context!,
          MaterialPageRoute(builder: (_) => const Green()));
    } else {
      Navigator.push(ContextUtility.context!,
          MaterialPageRoute(builder: (_) => const Red()));
    }
  }
}
