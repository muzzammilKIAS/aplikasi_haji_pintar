# Redesign mockup: Elegant UI

Files added in this branch `redesign/ui-elegant`:

- design/redesign-homepage.html  — standalone static mockup of the new homepage (hero, features)
- design/styles.css              — theme CSS (Elegant Dark, Google Fonts included in HTML)

Cara pratonton (preview):
1. Clone the repo and checkout branch `redesign/ui-elegant`:
   git fetch origin redesign/ui-elegant && git checkout redesign/ui-elegant
2. Buka `design/redesign-homepage.html` di pelayar (double-click atau `open` command).

Nota integrasi:
- Jika repo menggunakan React/Vue/Next/Flutter, salin kandungan CSS ke fail global projek (contoh: `src/index.css` atau `public/styles.css`) dan masukkan pautan font pada `index.html` / head.
- Ganti markup HTML kepada komponen sesuai (`<Header/>`, `<Hero/>`, dsb.) jika diperlukan.
- Imej ilustrasi ditempatkan sementara di `/assets/illustration-1.svg`; pastikan path betul atau tukar kepada gambar sedia ada.

Tindakan seterusnya yang saya boleh buat untuk anda:
- Buka Pull Request dari branch ini ke default branch dan sertakan penerangan PR.
- Tukar markup ke komponen React / Vue (saya boleh buat PR yang mengubah fail sebenar jika anda mahu).
- Sediakan varian palet (light mode) dan automatikkan tema.

Beritahu saya pilihan anda: buka PR sekarang, atau saya terus tukar kod ke komponen (nyatakan framework jika mahu React/Vue/Vanilla).