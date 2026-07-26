SIJIL PENCAPAIAN HAJI PINTAR

Fail pakej:
1. main.dart
2. final_assessment_screen.dart
3. certificate_screen.dart

LANGKAH PEMASANGAN:
1. Backup folder projek.
2. Extract ZIP.
3. Gantikan:
   lib/main.dart
   lib/final_assessment_screen.dart
4. Tambah:
   lib/certificate_screen.dart
5. Dalam Terminal jalankan:
   flutter pub add pdf printing
   dart format lib
   flutter analyze
   flutter run -d chrome

FUNGSI:
- Hanya pengguna yang lulus penilaian 80% boleh menjana sijil.
- Pengguna memasukkan nama penuh.
- Markah terbaik digunakan pada sijil.
- Tarikh dan nombor sijil dijana serta disimpan dalam Hive.
- Pratonton/cetak PDF.
- Muat turun/kongsi PDF.
- Selepas lulus, panel Penilaian Akhir pada dashboard menjadi
  butang Lihat Sijil.

NOTA:
Sijil ialah sijil pencapaian aplikasi dan bukan sijil rasmi
pihak berkuasa atau agensi pengelola Haji.
