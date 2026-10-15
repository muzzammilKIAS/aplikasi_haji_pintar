import 'package:web/web.dart' as web;

const String _key = 'hp_kunjungan_dikira';

/// `true` hanya pada kali pertama dalam sesi tab pelayar ini.
bool markVisitOnce() {
  try {
    final web.Storage storage = web.window.sessionStorage;
    if (storage.getItem(_key) != null) {
      return false;
    }
    storage.setItem(_key, '1');
    return true;
  } catch (_) {
    return true;
  }
}
