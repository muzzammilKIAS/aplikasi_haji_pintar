# Ringkasan Refactor — Haji Pintar

## Cara guna
Gantikan kandungan folder `lib/` projek Flutter anda dengan fail-fail dalam
folder `lib/` ini (nama fail sama, jadi terus timpa). Lepas itu jalankan:

```
flutter analyze
flutter run -d chrome
```

Fail baharu yang ditambah: `home_dashboard.dart`, `tawaf_counter_screen.dart`,
`shared_widgets.dart`. Semua fail lain kekal nama sama tetapi kandungan
dikemas kini.

## Apa yang berubah

### 1. `shared_widgets.dart` (baharu)
Widget yang dulu disalin berulang kali kini satu sahaja:
- `HajjIconButton` — gantian untuk 7 class yang serupa 100%
  (`_CertificateIconButton`, `_AssessmentIconButton`, `_GuideIconButton`,
  `_ViewerIconButton`, `_LearningIconButton`, `_MapIconButton`,
  `_ThemeIconButton`).
- `GlassContainer`, `GlassButton`, `StatusPill`, `MiniInformation`,
  `GlowCircle`, `GlowDot` — dipindah keluar dari `main.dart` supaya boleh
  diguna semua skrin, bukan cuma dashboard.
- `HajjScreenHeader`, `HajjScaffold` — widget baharu untuk kegunaan skrin
  akan datang (belum digunakan pada skrin sedia ada lagi, supaya risiko
  perubahan rendah).

### 2. `main.dart` dipecahkan (2,578 baris → 53 baris)
- `main.dart` — kini cuma `main()`, Hive box global, dan `AplikasiHajiPintar`.
- `home_dashboard.dart` (baharu) — `HalamanUtama` dan semua widget khusus
  papan pemuka (panel, kad ciri, countdown Wukuf, dsb).
- `tawaf_counter_screen.dart` (baharu) — skrin kaunter Tawaf, kini berdiri
  sendiri.

### 3. Fail lain
Setiap fail skrin (`certificate_screen.dart`, `final_assessment_screen.dart`,
`hajj_guide_screen.dart`, `hajj_journey_viewer.dart`,
`learning_module_screen.dart`, `offline_map_screen.dart`,
`sai_counter_screen.dart`) kini import `shared_widgets.dart` dan guna
`HajjIconButton` dari situ, bukan class tempatan sendiri.

`splash_screen.dart` kini import `home_dashboard.dart` terus (bukan
`main.dart`) untuk elak struktur import yang pelik.

## Nota penting
Saya semak struktur secara manual (imbangan kurungan, rujukan silang, nama
class tak bertindih) tetapi **tiada Flutter SDK dalam persekitaran saya**,
jadi kod ini belum dijalankan `flutter analyze` / `flutter build` sebenar.
Sila jalankan kedua-dua arahan itu di komputer anda dahulu sebelum
digunakan dalam produksi.

## Belum disentuh
Logik aplikasi (Hive, PDF sijil, peta, penilaian, dsb) **tidak diubah** —
hanya struktur fail dan widget berulang. UI/UX belum dikemas lagi;
itu fasa seterusnya.
