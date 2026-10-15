import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'visit_session_stub.dart'
    if (dart.library.js_interop) 'visit_session_web.dart';

class VisitStats {
  const VisitStats({required this.total, required this.today});

  final int? total;
  final int? today;

  bool get isEmpty => total == null && today == null;
}

/// Jumlah kunjungan laman web melalui kaunter awam Abacus.
/// Satu kunjungan dikira sekali bagi setiap sesi pelayar; muat semula
/// halaman hanya membaca jumlah tanpa menambahnya.
class VisitCounter {
  const VisitCounter._();

  static const String _base = 'https://abacus.jasoncameron.dev';
  static const String _namespace = 'hajipintar-my';

  static Future<VisitStats>? _pending;

  /// Kaunter hanya wujud pada web; app telefon tidak memaparkannya.
  static bool get isAvailable => kIsWeb;

  static Future<VisitStats> stats() => _pending ??= _fetch();

  static Future<VisitStats> _fetch() async {
    final String host = Uri.base.host;
    final bool local = host == 'localhost' || host == '127.0.0.1';
    final bool count = !local && markVisitOnce();
    final List<int?> values = await Future.wait(<Future<int?>>[
      _read('kunjungan', count),
      _read('kunjungan-${_malaysiaDateKey()}', count),
    ]);
    return VisitStats(total: values[0], today: values[1]);
  }

  static Future<int?> _read(String key, bool count) async {
    final Uri uri = Uri.parse(
      '$_base/${count ? 'hit' : 'get'}/$_namespace/$key',
    );
    try {
      final http.Response response = await http
          .get(uri)
          .timeout(const Duration(seconds: 8));
      if (response.statusCode == 404) {
        return 0;
      }
      if (response.statusCode != 200) {
        return null;
      }
      final Object? value = (jsonDecode(response.body) as Map)['value'];
      return value is int ? value : null;
    } catch (_) {
      return null;
    }
  }

  static String _malaysiaDateKey() {
    final DateTime myt = DateTime.now().toUtc().add(const Duration(hours: 8));
    String two(int v) => v.toString().padLeft(2, '0');
    return '${myt.year}${two(myt.month)}${two(myt.day)}';
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
