import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'visit_session_stub.dart'
    if (dart.library.js_interop) 'visit_session_web.dart';

/// Jumlah kunjungan laman web melalui kaunter awam Abacus.
/// Satu kunjungan dikira sekali bagi setiap sesi pelayar; muat semula
/// halaman hanya membaca jumlah tanpa menambahnya.
class VisitCounter {
  const VisitCounter._();

  static const String _base = 'https://abacus.jasoncameron.dev';
  static const String _counter = 'hajipintar-my/kunjungan';

  static Future<int?>? _pending;

  /// `null` jika bukan web, pratonton tempatan, atau kaunter tidak dapat
  /// dihubungi — paparan disembunyikan dalam keadaan itu.
  static Future<int?> total() => _pending ??= _fetch();

  static Future<int?> _fetch() async {
    if (!kIsWeb) {
      return null;
    }
    final String host = Uri.base.host;
    final bool local = host == 'localhost' || host == '127.0.0.1';
    final bool count = !local && markVisitOnce();
    final Uri uri = Uri.parse('$_base/${count ? 'hit' : 'get'}/$_counter');
    try {
      final http.Response response = await http
          .get(uri)
          .timeout(const Duration(seconds: 8));
      if (response.statusCode != 200) {
        return null;
      }
      final Object? value = (jsonDecode(response.body) as Map)['value'];
      return value is int ? value : null;
    } catch (_) {
      return null;
    }
  }
}

/// 12345 → "12,345".
String formatVisitCount(int value) {
  final String digits = value.toString();
  final StringBuffer out = StringBuffer();
  for (int i = 0; i < digits.length; i++) {
    if (i > 0 && (digits.length - i) % 3 == 0) {
      out.write(',');
    }
    out.write(digits[i]);
  }
  return out.toString();
}
