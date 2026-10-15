import 'package:flutter/material.dart';

import '../islamic_icons.dart';
import '../learning_module_screen.dart';
import '../shared_widgets.dart';

// ---------------------------------------------------------------------------
// MODUL 08 & 09 — Bab Ketiga al-Idah fi Manasik al-Hajj wa al-‘Umrah (Imam
// an-Nawawi, Shamela book_id 96232): al-Fasl al-Awwal (adab memasuki Makkah),
// al-Fasl ath-Thani (kaifiyat Tawaf) dan al-Fasl ath-Thalith (Sa’i).
//
// Rujukan halaman: page_id Shamela, diikuti nombor halaman cetakan dalam
// kurungan siku, contoh "hlm. 208 [211]". Bahan nota kaki (al-Ifsah oleh
// ‘Abd al-Fattah Rawah, termasuk nukilannya daripada hasyiah Ibn Hajar
// al-Haitami) dilabel dengan jelas dan tidak disandarkan kepada an-Nawawi.
//
// Doa yang sudah wujud dalam aplikasi disalin huruf demi huruf daripada
// lib/learning_module_screen.dart supaya lafaz dan sumber kekal seragam.
// ---------------------------------------------------------------------------

const List<LearningModuleData> idahModulesTawafSai = <LearningModuleData>[
  // -------------------------------------------------------------------------
  // MODUL 08 — Masuk Makkah & Tawaf
  // -------------------------------------------------------------------------
  LearningModuleData(
    number: '08',
    title: 'Masuk Makkah & Tawaf',
    subtitle:
        'Adab ketibaan, syarat sah dan sunat Tawaf menurut Fasal Pertama dan Kedua Bab Ketiga al-Idah.',
    icon: HajjIconType.tawaf,
    accent: Color(0xFF7A6CB1),
    sections: <LearningSection>[
      LearningSection(
        title: 'Adab memasuki Makkah',
        points: <String>[
          'Selepas berihram, terus menuju Makkah dahulu sebelum ke Arafah supaya tidak terlepas Tawaf Qudum, Sa’i awal, solat di Masjidil Haram dan sunat-sunat lain.',
          'Mandi sunat memasuki Makkah (di Zi Tuwa jika melaluinya) — disunatkan bagi semua orang, termasuk wanita haid, nifas dan kanak-kanak.',
          'Masuk dari arah atas Makkah (Thaniyyat Kada’) dan keluar dari arah bawah (Thaniyyat Kuda) ketika pulang.',
          'Masuk dengan berjalan kaki dan pada waktu siang lebih afdal menurut pendapat asah, walaupun masuk berkenderaan atau pada waktu malam tetap harus.',
          'Jaga diri daripada menyakiti orang dalam kesesakan, berlembut dengan orang yang menolak, dan hadirkan rasa hebat terhadap Tanah Suci.',
          'Orang dari luar Tanah Haram yang masuk bukan untuk Haji atau Umrah disunatkan berihram menurut pendapat asah.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Fasal Pertama Bab Ketiga ("Fi Adab Dukhuliha") mengandungi sebelas masalah. Imam an-Nawawi mengkritik jemaah yang terus ke Arafah sebelum memasuki Makkah kerana mereka terlepas banyak sunat, kemudian menganjurkan mandi di Zi Tuwa, masuk melalui Thaniyyat Kada’ dan keluar melalui Thaniyyat Kuda, berjalan kaki, masuk pada siang hari, dan menjaga orang lain dalam kesesakan (al-Idah, Fasal Fi Adab Dukhul Makkah, hlm. 189–196 [192–199]). Bagi gambaran ringkas ketibaan, lihat langkah "Ketibaan di Makkah" dalam Panduan Haji.',
          teksKitabArabic:
              'يَنْبَغِي أَنْ يَتَحَفَّظَ فِي دُخُولِهِ مِنْ إِيذَاءِ النَّاسِ فِي '
              'الزَّحْمَةِ، وَيَتَلَطَّفُ بِمَنْ يُزَاحِمُهُ، وَيَلْحَظُ بِقَلْبِهِ '
              'جَلَالَةَ الْبُقْعَةِ الَّتِي هُوَ فِيهَا وَالَّتِي هُوَ مُتَوَجِّهٌ '
              'إِلَيْهَا، وَيُمَهِّدُ عُذْرَ مَنْ زَاحَمَهُ، وَمَا نُزِعَتِ '
              'الرَّحْمَةُ إِلَّا مِنْ قَلْبِ شَقِيٍّ',
          permasalahan: <String>[
            'Masuk melalui Thaniyyat Kada’: Abu Bakr as-Saidalani dan sekumpulan ulama Khurasan berpendapat ia sunat hanya bagi yang kebetulan melaluinya. Imam an-Nawawi menolaknya sebagai "lemah dan tertolak", dan menegaskan ia nusuk yang disunatkan bagi setiap orang kerana Nabi SAW masuk melaluinya walaupun ia bukan arah laluan Baginda (hlm. 193 [196]).',
            'Berjalan kaki atau berkenderaan: khilaf ashab, asahnya berjalan kaki lebih afdal; atas pendapat ini ada yang berkata lebih utama berkaki ayam jika tidak bimbang najis dan tidak menyusahkan. Masuk siang atau malam: dua wajah, asahnya siang lebih afdal, dan wajah kedua menyamakan kedua-duanya (hlm. 193–194 [196–197]).',
            'Orang yang datang dari luar Tanah Haram bukan untuk nusuk: tiga pendapat — asah sunat berihram; kedua wajib; ketiga wajib bagi yang jarang masuk (seperti peniaga dan pengunjung) tetapi tidak bagi yang kerap keluar masuk (seperti pencari kayu api). Jika dikatakan wajib lalu dia masuk tanpa ihram, dia berdosa tetapi tiada qada dan tiada fidyah; hukum memasuki Tanah Haram sama dengan memasuki Makkah menurut asah (hlm. 194–196 [197–199]).',
            'Nota kaki al-Ifsah menukil hasyiah: kes ini dianggap "ganjil" kerana setiap nusuk wajib yang ditinggalkan biasanya perlu diqada atau dibayar kifarat; jawapannya, ihram di sini ialah "tahiyyah" memasuki Tanah Haram, maka ia luput bersama sebabnya, sama seperti tahiyyat al-masjid (hlm. 195–196 [198–199]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Melihat Kaabah dan memasuki Masjidil Haram',
        points: <String>[
          'Apabila mula terpandang Kaabah, angkat tangan dan berdoa — al-Idah menyebut doa orang Muslim mustajab ketika melihat Kaabah.',
          'Baca doa melihat Kaabah ("Allahumma zid hadha al-baita tasyrifan…"), kemudian mohon hajat dunia dan akhirat; yang paling penting ialah memohon keampunan.',
          'Hadirkan khusyuk dan rasa hina diri; jangan berdiri berdoa di tempat yang menghalang laluan orang.',
          'Jangan sibuk dahulu menyewa rumah, meletak barang atau menukar pakaian — sebahagian rombongan boleh menjaga barang sementara yang lain bertawaf.',
          'Masuk melalui Bab Bani Syaibah (kini dikenali sebagai Bab as-Salam) dengan kaki kanan dan doa masuk masjid; ketika keluar, kaki kiri dahulu dengan "wa iftah li abwaba fadlik".',
          'Terus ke Hajar Aswad dan mulakan Tawaf Qudum, iaitu "tahiyyah" Masjidil Haram — kecuali jika solat fardu berjemaah hampir didirikan, ada solat fardu yang luput, atau sunat ratibah yang takut terlepas; semua itu didahulukan.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'أَنَّ أَوَّلَ شَيْءٍ بَدَأَ بِهِ حِينَ قَدِمَ مَكَّةَ أَنَّهُ '
                  'تَوَضَّأَ ثُمَّ طَافَ بِالْبَيْتِ',
              terjemahan:
                  'Bahawa perkara pertama yang dimulakan oleh Nabi SAW ketika tiba di Makkah ialah berwuduk, kemudian bertawaf di Baitullah — asas sunat bersegera ke Tawaf sebelum urusan lain.',
              sumber:
                  'Riwayat al-Bukhari (no. 1642) dan Muslim (no. 1235) daripada ‘Aisyah r.a. melalui ‘Urwah; dinukil dalam nota kaki al-Ifsah, hlm. 199 [202]',
            ),
          ],
          teksKitab:
              'Masalah kesembilan hingga kesebelas Fasal Pertama: disunatkan mengangkat tangan ketika terpandang Baitullah kerana "telah datang (riwayat) bahawa doa orang Muslim mustajab ketika melihat Kaabah", lalu membaca doa tasyrif. Pada zaman an-Nawawi Kaabah sudah kelihatan dari tempat bernama Ra’s ar-Radm, dan di situ jemaah berhenti berdoa. Beliau menukil kisah seorang wanita yang wafat sebaik melekapkan dahinya ke dinding Kaabah serta syair Abu Bakr asy-Syibli sebagai gambaran khusyuk yang dituntut, kemudian menerangkan adab masuk masjid dan bersegera ke Tawaf (al-Idah, Fasal Fi Adab Dukhul Makkah, hlm. 196–201 [199–204]).',
          teksKitabArabic:
              'يَنْبَغِي أَنْ يَسْتَحْضِرَ عِنْدَ رُؤْيَةِ الْكَعْبَةِ مَا أَمْكَنَهُ '
              'مِنَ الْخُشُوعِ وَالتَّذَلُّلِ وَالْخُضُوعِ، فَهَذِهِ عَادَةُ '
              'الصَّالِحِينَ... لِأَنَّ رُؤْيَةَ الْبَيْتِ تُذَكِّرُ وَتُشَوِّقُ إِلَى '
              'رَبِّ الْبَيْتِ',
          permasalahan: <String>[
            'Mengangkat tangan ketika melihat Kaabah: nota kaki al-Ifsah menukil al-Majmu’ bahawa mazhab Syafi’i dan jumhur menganggapnya sunat, manakala Imam Malik tidak. Riwayat Jabir r.a. datang dengan dua lafaz yang berlawanan (Abu Dawud dan an-Nasa’i: Nabi SAW tidak melakukannya; at-Tirmidhi: "kami melakukannya"), dan ashab mendahulukan riwayat yang menetapkan kerana ia membawa tambahan ilmu (nota kaki al-Ifsah, hlm. 197 [200]).',
            'Masuk melalui Bab Bani Syaibah disunatkan bagi setiap orang yang datang dari mana-mana arah, tanpa khilaf (hlm. 199 [202]). Nota kaki al-Ifsah: pintu ini kini dinamakan Bab as-Salam; menurut hasyiah, hikmahnya ia berada di arah pintu Kaabah, Hajar Aswad dan Maqam.',
            'Doa masuk masjid yang dihimpun an-Nawawi tidak khusus bagi Masjidil Haram — ia sunat bagi setiap masjid; beliau menyatakan lafaznya dihimpun daripada beberapa hadis dalam as-Sahih dan selainnya (hlm. 200 [203]).',
            'Jika orang ramai sedang dihalang daripada bertawaf ketika dia masuk, dia solat tahiyyat al-masjid (hlm. 201 [204]). Nota kaki al-Ifsah: dua rakaat Tawaf turut menghasilkan tahiyyat al-masjid jika dia tidak duduk dengan sengaja sebelumnya; Tawaf Qudum pula tidak luput kerana duduk atau lewat, tetapi luput apabila dia sudah wukuf di Arafah (hlm. 200 [203]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Jenis-jenis Tawaf dan hukumnya',
        points: <String>[
          'Dalam Haji ada tiga Tawaf: Qudum (ketibaan), Ifadah (rukun) dan Wada’ (perpisahan); selain itu Tawaf sunat boleh diperbanyak.',
          'Tawaf Qudum sunat — tiada apa-apa ke atas orang yang meninggalkannya. Ia juga dinamakan Tawaf al-Wurud dan Tawaf at-Tahiyyah.',
          'Tawaf Ifadah rukun — Haji tidak sah tanpanya dan tidak boleh diganti dengan dam. Waktunya selepas wukuf dan selepas separuh malam Hari Raya Korban.',
          'Tawaf Wada’ wajib menurut pendapat asah (bukan rukun), dilakukan ketika hendak meninggalkan Makkah selepas selesai semua manasik.',
          'Jemaah Umrah tiada Tawaf Qudum berasingan — Tawaf Umrahnya sudah memadai bagi kedua-duanya.',
          'Orang yang hanya masuk Makkah selepas wukuf tiada Tawaf Qudum; tawaf pertamanya ialah Tawaf Ifadah walaupun dia berniat Qudum.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Di hujung Fasal Pertama, Imam an-Nawawi menghuraikan bahawa Tawaf Qudum mempunyai lima nama (al-Qudum, al-Qadim, al-Wurud, al-Warid, at-Tahiyyah), Tawaf Ifadah juga lima (al-Ifadah, az-Ziyarah, al-Fard, ar-Rukn, as-Sadar), dan Tawaf Wada’ turut dinamakan Tawaf as-Sadar. Beliau menetapkan hukum ketiga-tiganya dan menjelaskan bila Tawaf Qudum boleh berlaku (al-Idah, Fasal Fi Adab Dukhul Makkah, hlm. 201–203 [204–206]). Bagi rukun dan wajib Haji secara umum, lihat Modul 02.',
          teksKitabArabic:
              'ثُمَّ اعْلَمْ أَنَّ طَوَافَ الْقُدُومِ سُنَّةٌ لَيْسَ بِوَاجِبٍ فَلَوْ '
              'تَرَكَهُ لَمْ يَلْزَمْهُ شَيْءٌ، وَطَوَافُ الْإِفَاضَةِ رُكْنٌ لَا '
              'يَصِحُّ الْحَجُّ إِلَّا بِهِ وَلَا يُجْبَرُ بِدَمٍ وَلَا غَيْرِهِ، '
              'وَطَوَافُ الْوَدَاعِ وَاجِبٌ عَلَى الْأَصَحِّ وَلَيْسَ بِرُكْنٍ',
          permasalahan: <String>[
            'Tawaf Qudum hanya berlaku bagi orang yang berihram Haji ifrad atau qiran dari luar Makkah dan masuk sebelum wukuf; penduduk Makkah tiada Qudum. Jika jemaah Umrah berniat Qudum, tawafnya tetap jatuh sebagai Tawaf Umrah — sama seperti solat fardu yang memadai bagi tahiyyat al-masjid (hlm. 202–203 [205–206]).',
            'Status Tawaf Wada’ diperselisihkan: wajib menurut asah, dan ada satu qaul bahawa ia sunat seperti Qudum (hlm. 202 [205]). Perinciannya dalam Bab Kelima al-Idah.',
            'Nota kaki al-Ifsah: menurut mazhab Syafi’i dan Hanbali, waktu Tawaf Ifadah masuk selepas separuh malam 10 Zulhijjah, manakala menurut Imam Malik dan Abu Hanifah selepas terbit fajar (hlm. 203 [206]).',
            'Nota kaki al-Ifsah (daripada al-Majmu’): Abu Hanifah dan Ibn al-Mundhir sependapat bahawa meninggalkan Qudum tidak mewajibkan apa-apa; Abu Thawr mewajibkan dam; satu riwayat daripada Malik membezakan antara orang yang suntuk waktu sebelum wukuf dan yang tidak (hlm. 201 [204]).',
            'Nota kaki al-Ifsah menyebut bahawa syarat-syarat Tawaf terpakai bagi semua jenisnya: Qudum, Wada’, Nazar, sunat dan Tawaf tahallul; dalam Tawaf Nazar perlu diniatkan sebagai fardu (hlm. 208 [211] dan 226 [229]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Memulakan Tawaf di Hajar Aswad',
        points: <String>[
          'Pergi ke Hajar Aswad (di penjuru berhampiran pintu Kaabah, arah timur), hadapinya, lalu istilam (sapu dengan tangan), cium tanpa bunyi dan letakkan dahi di atasnya — diulang tiga kali — dengan syarat tidak menyakiti sesiapa.',
          'Lelaki memulakan idtiba’: bahagian tengah kain ihram di bawah ketiak kanan, kedua-dua hujungnya di atas bahu kiri, dan bahu kanan terdedah.',
          'Berdiri di sisi Hajar Aswad yang dekat dengan Rukun Yamani supaya seluruh batu berada di sebelah kanan, berniat, kemudian bergerak ke kanan sehingga melepasi batu; selepas itu berpusing supaya Kaabah di sebelah kiri.',
          'Seluruh badan mesti melintasi seluruh Hajar Aswad; jika tidak, pusingan itu tidak dikira.',
          'Laluan satu pusingan: Multazam dan pintu Kaabah → Rukun Iraqi → di belakang Hijr Ismail → Rukun Syami → Rukun Yamani → kembali ke Hajar Aswad. Tujuh pusingan menjadi satu Tawaf yang lengkap.',
          'Talbiyah dihentikan semasa Tawaf.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Awal Fasal Kedua ("Fi Kaifiyyat at-Tawaf") menerangkan kedudukan Hajar Aswad (tingginya dari lantai tiga hasta kurang tujuh jari), adab istilam, mencium dan sujud di atasnya, idtiba’, serta cara berdiri supaya seluruh badan melintasi seluruh batu. Beliau kemudian menegaskan: inilah sifat Tawaf yang jika dicukupkan sahaja sudah sah; selebihnya ialah perbuatan dan zikir pelengkap yang dihuraikan dalam bab sunat (al-Idah, Fasal Fi Kaifiyyat at-Tawaf, hlm. 203–207 [206–210]).',
          teksKitabArabic:
              'وَكَيْفِيَّةُ الطَّوَافِ أَنْ يُحَاذِيَ بِجَمِيعِهِ جَمِيعَ الْحَجَرِ '
              'الْأَسْوَدِ، فَلَا يَصِحُّ طَوَافُهُ حَتَّى يَمُرَّ بِجَمِيعِ بَدَنِهِ '
              'عَلَى جَمِيعِ الْحَجَرِ',
          permasalahan: <String>[
            'Menghadap Hajar Aswad ketika melintasinya pada awal pusingan pertama adalah sunat khusus pusingan itu; jika dia terus menjadikan Kaabah di kiri dari awal, Tawaf tetap sah tetapi terlepas kelebihan tersebut. Ia berbeza daripada menghadap Hajar Aswad sebelum Tawaf, yang merupakan sunnah tersendiri tanpa khilaf (hlm. 205, 222 [208, 225]).',
            'Nota kaki al-Ifsah: menurut Ibn Hajar, permulaan Tawaf yang sebenar ialah ketika berpusing (infital), maka niat mesti dihadirkan pada saat itu; ar-Ramli, al-Khatib dan Ibn Qasim pula berpendapat permulaannya sudah dikira dari langkah pertama menghadap batu (hlm. 205, 222 [208, 225]).',
            'Imam asy-Syafi’i memakruhkan penggunaan istilah "syawt" dan "dawr" bagi satu pusingan; Imam an-Nawawi berpendapat zahirnya tidak makruh kerana Ibn ‘Abbas r.a. menggunakan kalimah "syawt" dalam riwayat al-Bukhari dan Muslim (hlm. 207 [210]).',
            'Nota kaki al-Ifsah: mazhab Syafi’i menganjurkan idtiba’, manakala Imam Malik tidak kerana sebabnya (menunjukkan kekuatan kepada musyrikin) sudah tiada; ashab menjawab dengan kata-kata ‘Umar r.a. bahawa mereka tidak meninggalkan apa yang pernah dilakukan bersama Rasulullah SAW. Al-Ifsah juga mengingatkan orang berihram supaya tidak mencium Hajar Aswad jika batu itu berbau wangian (hlm. 203–204 [206–207]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Syarat dan wajib Tawaf',
        points: <String>[
          'Menutup aurat serta suci daripada hadas dan najis pada badan, pakaian dan tempat yang dipijak.',
          'Tawaf mesti di dalam masjid — sah di bahagian belakang, serambi dan bumbung (tingkat atas) masjid, tetapi tidak sah di luar masjid.',
          'Lengkap tujuh pusingan; jika ragu-ragu semasa Tawaf, ambil bilangan yang paling sedikit. Keraguan selepas selesai tidak menjejaskan.',
          'Tertib: bermula dari Hajar Aswad dan Kaabah sentiasa di sebelah kiri.',
          'Seluruh badan berada di luar Kaabah — termasuk Syazarwan dan Hijr Ismail (lihat tajuk seterusnya).',
          'Niat: wajib bagi Tawaf di luar Haji dan Umrah; dalam Haji dan Umrah lebih baik berniat, dan Tawaf tidak boleh dipalingkan kepada tujuan lain seperti mengejar orang berhutang.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'أَلَا لَا يَحُجُّ بَعْدَ الْعَامِ مُشْرِكٌ، وَلَا يَطُوفُ '
                  'بِالْبَيْتِ عُرْيَانٌ',
              terjemahan:
                  'Ketahuilah, selepas tahun ini tiada lagi orang musyrik yang boleh menunaikan Haji, dan tiada lagi orang yang bertawaf di Baitullah dalam keadaan bertelanjang — asas syarat menutup aurat dalam Tawaf.',
              sumber:
                  'Riwayat al-Bukhari (no. 1622) dan Muslim (no. 1347) daripada Abu Hurairah r.a.; dirujuk dalam nota kaki al-Ifsah, hlm. 208 [211]',
            ),
          ],
          teksKitab:
              'Imam an-Nawawi menyatakan Tawaf mengandungi syarat dan wajib yang tidak sah tanpanya — lapan perkara, sebahagiannya diperselisihkan: (1) menutup aurat dan suci daripada hadas dan najis, (2) di dalam masjid, (3) lengkap tujuh pusingan, (4) tertib, (5) seluruh badan di luar Baitullah, (6) niat, (7) muwalat dan (8) solat selepasnya — dua yang terakhir sunat menurut asah (al-Idah, Fasal Fi Kaifiyyat at-Tawaf, hlm. 208–228 [211–231]). Beliau menegaskan wanita merdeka yang terdedah walau sehelai rambut atau kuku kakinya, lalu pulang, sebenarnya pulang tanpa Haji atau Umrah yang sah.',
          teksKitabArabic:
              'وَمَنْ طَافَتْ مِنَ النِّسَاءِ الْحَرَائِرِ مَكْشُوفَةَ الرِّجْلِ أَوْ '
              'شَيْءٍ مِنْهَا أَوْ طَافَتْ كَاشِفَةَ جُزْءٍ مِنْ رَأْسِهَا لَمْ '
              'يَصِحَّ طَوَافُهَا، حَتَّى لَوْ ظَهَرَتْ شَعْرَةٌ مِنْ شَعْرِ '
              'رَأْسِهَا أَوْ ظُفْرِ رِجْلِهَا لَمْ يَصِحَّ طَوَافُهَا',
          permasalahan: <String>[
            'Bersentuhan kulit lelaki dan wanita ajnabi dalam kesesakan membatalkan wuduk orang yang menyentuh; bagi orang yang disentuh ada dua qaul asy-Syafi’i, dan asahnya juga batal. Jika berlanggar serentak, wuduk kedua-duanya batal tanpa khilaf. Tidak batal jika menyentuh mahram (asah), rambut, kuku atau gigi, atau berlapik kain (hlm. 217–218 [220–221]).',
            'Najis burung yang sukar dielakkan di kawasan Tawaf: sekumpulan ulama mutaakhirin memilih bahawa ia dimaafkan. An-Nawawi menyokongnya dengan fatwa Abu Zaid al-Marwazi, "apabila sesuatu urusan menjadi sempit, ia diluaskan", serta hujah bahawa sejak zaman Nabi SAW tiada sesiapa disuruh mengulang Tawaf kerananya (hlm. 219–220 [222–223]).',
            'Tawaf di bumbung masjid: sebahagian ashab mensyaratkan bangunan Kaabah lebih tinggi daripada bumbung itu; ar-Rafi’i menolak syarat ini (nota kaki al-Ifsah: an-Nawawi membenarkan penolakan itu dalam al-Majmu’). Masjid yang diperluas tetap sah dijadikan tempat Tawaf (hlm. 220 [223]).',
            'Mendukung orang berihram ketika Tawaf: jika pendukung halal atau sudah bertawaf untuk dirinya, Tawaf dikira bagi yang didukung. Jika pendukung berihram dan belum bertawaf, Tawaf jatuh untuk dirinya kecuali dia meniatkannya untuk yang didukung sahaja — menurut asah ketika itu ia jatuh untuk yang didukung (hlm. 227–228 [230–231]).',
            'Wanita haid yang tidak dapat menunggu suci untuk Tawaf Ifadah: nota kaki al-Ifsah membawa pendapat muktamad mutaakhirin Syafi’i (dia bertolak, kemudian bertahallul seperti muhsar apabila tidak dapat kembali, dan Tawaf kekal dalam tanggungannya), saranan at-Tuhfah supaya bertaqlid kepada Abu Hanifah atau satu riwayat Ahmad, serta pandangan Ibn Taimiyyah dan Ibn al-Qayyim yang mengesahkan Tawafnya kerana darurat — pengarang al-Ifsah menyifatkannya "wajih walaupun menyalahi mazhab di sisi mutaakhirin ashab". Ini bukan kata-kata an-Nawawi; rujuk mufti atau pembimbing bertauliah (nota kaki al-Ifsah, hlm. 209–217 [212–220]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Kesilapan lazim: arah, Syazarwan dan Hijr Ismail',
        points: <String>[
          'Jika Kaabah di sebelah kanan, atau berjalan sambil menghadap atau membelakangi Kaabah, atau berundur ke belakang, Tawaf tidak sah menurut pendapat asah.',
          'Syazarwan ialah binaan tapak rendah yang menganjur di kaki dinding Kaabah (kira-kira dua pertiga hasta tingginya) — ia sebahagian Kaabah. Berjalan di atasnya membatalkan pusingan.',
          'Menyentuh dinding Kaabah dengan tangan ketika berjalan di sebelah Syazarwan juga membatalkan pusingan itu, kerana sebahagian badan berada dalam ruang Kaabah.',
          'Ketika mencium Hajar Aswad, kepala berada dalam ruang Kaabah: tetapkan kaki di tempatnya sehingga berdiri tegak semula, barulah teruskan.',
          'Tawaf mesti di luar keseluruhan Hijr Ismail (kawasan berpagar separuh bulatan) — tidak boleh memotong melaluinya atau berjalan di atas dindingnya.',
          'Pusingan yang batal kerana kesilapan ini tidak dikira; ia mesti diganti sehingga lengkap tujuh pusingan yang sah.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              terjemahan:
                  'Hadis ‘Aisyah r.a. bahawa beliau bertanya Nabi SAW tentang dinding Hijr, adakah ia sebahagian Baitullah, lalu Baginda menjawab ya. Al-Idah turut menyebut riwayat dalam Sahih Muslim bahawa enam hasta daripada Hijr adalah sebahagian Baitullah, dan riwayat lain "hampir tujuh hasta".',
              sumber:
                  'Riwayat al-Bukhari (no. 1584) dan Muslim (no. 1333); al-Idah, hlm. 224–225 [227–228]. Lafaz Arab tidak dipetik kerana riwayatnya berbeza-beza.',
            ),
          ],
          teksKitab:
              'Wajib kelima dalam Fasal Kaifiyyat at-Tawaf: seluruh badan mesti berada di luar seluruh Baitullah, kerana Allah memerintahkan Tawaf "bil-Bait" (mengelilingi Baitullah), bukan "fil-Bait" (di dalamnya). Imam an-Nawawi menukil ukuran Syazarwan dan Hijr daripada Tarikh Makkah karya Abu al-Walid al-Azraqi — antaranya satu pusingan mengelilingi Kaabah dan Hijr berukuran 123 hasta dan 12 jari — serta memberi amaran tentang "satu perkara halus" ketika mencium Hajar Aswad. Pada wajib keempat pula beliau menegaskan bahawa kesilapan memulakan pusingan sebelum Hajar Aswad "sering dilalaikan dan merosakkan Haji ramai orang" (al-Idah, Fasal Fi Kaifiyyat at-Tawaf, hlm. 221–226 [224–229]).',
          teksKitabArabic:
              'فَلَوْ طَافَ عَلَى شَاذَرْوَانِ الْبَيْتِ أَوْ فِي الْحِجْرِ لَمْ يَصِحَّ '
              'طَوَافُهُ، لِأَنَّهُ طَافَ فِي الْبَيْتِ لَا بِالْبَيْتِ، وَقَدْ أَمَرَ '
              'اللَّهُ تَعَالَى بِالطَّوَافِ بِالْبَيْتِ',
          permasalahan: <String>[
            'Kadar Hijr yang termasuk Baitullah: ramai ashab — Abu Muhammad al-Juwaini, Imam al-Haramain dan al-Baghawi, dan ar-Rafi’i menganggapnya sahih — berpendapat hanya enam (ada yang berkata tujuh) hasta, maka sah Tawaf orang yang masuk ke Hijr tetapi meninggalkan jarak itu. Pendapat yang sahih, nas asy-Syafi’i dan pegangan jumhur ashab: wajib bertawaf di luar KESELURUHAN Hijr, kerana Nabi SAW dan Khulafa’ ar-Rasyidin bertawaf di luarnya (hlm. 224–225 [227–228]).',
            'Ibn as-Salah: riwayat tentang ukuran Hijr bercanggah (keseluruhannya, enam, lima, hampir tujuh hasta), maka diambil yang paling luas supaya kewajipan gugur dengan yakin. An-Nawawi menambah: andainya sebahagian Hijr bukan dari Baitullah sekalipun, pegangan dalam bab Haji ialah mengikut perbuatan Nabi SAW (hlm. 225 [228]).',
            'Nota kaki al-Ifsah (daripada al-Majmu’ dan Rahmat al-Ummah): Abu Hanifah berpendapat Tawaf dengan Kaabah di kanan, atau di dalam Hijr, perlu diulang selagi masih di Makkah; jika sudah pulang, ia ditampung dengan dam dan Tawafnya memadai — berbeza dengan mazhab Syafi’i, Maliki dan Hanbali yang tidak mengesahkannya (hlm. 247 [250]).',
            'Nota kaki al-Ifsah (I‘anat at-Talibin): kewujudan Syazarwan di setiap sisi Kaabah diperselisihkan dalam kalangan ulama Syafi’i, dan Abu Hanifah tidak mengakuinya di mana-mana sisi; malah ada satu wajah dalam mazhab bahawa menyentuh dinding Kaabah tidak menjejaskan kerana sebahagian besar badan masih di luar. Pendapat sahih an-Nawawi tetap: menyentuh dinding di atas Syazarwan membatalkan pusingan (hlm. 222–224 [225–227]).',
            'Nota kaki al-Ifsah menukil hasyiah: ramai menyangka Tawaf itu "ke kiri", sedangkan jemaah sebenarnya bergerak ke arah kanan dirinya dengan Kaabah di sebelah kirinya, sebagaimana hadis Jabir r.a. dalam Sahih Muslim (hlm. 221–222 [224–225]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Sunat-sunat Tawaf',
        points: <String>[
          'Berjalan kaki; bertawaf dengan kenderaan (kini kerusi roda) dibenarkan kerana uzur, dan menurut ashab tidak makruh walaupun tanpa uzur, selagi tidak menyakiti orang.',
          'Idtiba’ sepanjang tujuh pusingan, dan ramal (berjalan cepat dengan langkah pendek) pada tiga pusingan pertama — hanya bagi lelaki, dan hanya dalam Tawaf yang diikuti Sa’i.',
          'Istilam dan cium Hajar Aswad serta istilam Rukun Yamani (kemudian cium tangan) pada setiap pusingan; jika sesak, cukup berisyarat dengan tangan. Dua rukun Syami tidak disentuh.',
          'Lelaki disunatkan dekat dengan Kaabah, tetapi ramal lebih diutamakan daripada dekat. Wanita di pinggir kawasan Tawaf dan sunat bertawaf pada waktu malam.',
          'Berzikir, berdoa dan membaca al-Quran — doa ma’thur paling afdal, kemudian al-Quran, kemudian doa yang tidak ma’thur.',
          'Muwalat dan khusyuk: elakkan makan dan minum, bercakap sia-sia, jaga pandangan, dan jangan memandang rendah jemaah yang lemah atau tersilap — ajar mereka dengan lembut.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'كَانَ النَّبِيُّ ﷺ إِذَا طَافَ بِالْبَيْتِ الطَّوَافَ الْأَوَّلَ '
                  'خَبَّ ثَلَاثًا وَمَشَى أَرْبَعًا',
              terjemahan:
                  'Nabi SAW apabila melakukan tawaf pertama di Baitullah, Baginda berlari-lari anak (khabab) tiga pusingan dan berjalan biasa empat pusingan — dalil sunat ramal.',
              sumber:
                  'Riwayat al-Bukhari (no. 1617) dan Muslim (no. 1261) daripada Ibnu ‘Umar r.a. (lafaz sedikit berbeza antara riwayat)',
            ),
            DalilItem(
              arabic:
                  'لَمْ أَرَ النَّبِيَّ ﷺ يَسْتَلِمُ مِنَ الْبَيْتِ إِلَّا '
                  'الرُّكْنَيْنِ الْيَمَانِيَيْنِ',
              terjemahan:
                  'Aku tidak pernah melihat Nabi SAW menyentuh (istilam) mana-mana bahagian Baitullah kecuali dua rukun Yamani (penjuru Hajar Aswad dan Rukun Yamani).',
              sumber: 'Riwayat al-Bukhari (no. 1609) daripada Ibnu ‘Umar r.a.',
            ),
          ],
          teksKitab:
              'Imam an-Nawawi menyenaraikan lapan sunat dan adab Tawaf: (1) berjalan kaki, (2) idtiba’, (3) ramal, (4) istilam dan mencium Hajar Aswad serta istilam Rukun Yamani, (5) zikir-zikir yang disunatkan, (6) muwalat, (7) khusyuk dan beradab zahir batin "kerana Tawaf itu solat", dan (8) solat dua rakaat selepasnya (al-Idah, Fasal Fi Kaifiyyat at-Tawaf, hlm. 228–241 [231–244]). Doa-doa Tawaf yang beliau sebut terdapat di bahagian Doa modul ini.',
          teksKitabArabic:
              'فَالْمُحَافَظَةُ عَلَى الرَّمَلِ مَعَ الْبُعْدِ عَنِ الْبَيْتِ أَفْضَلُ '
              'مِنَ الْقُرْبِ بِلَا رَمَلٍ، لِأَنَّ الرَّمَلَ شِعَارٌ مُسْتَقِلٌّ، '
              'وَلِأَنَّ الرَّمَلَ فَضِيلَةٌ تَتَعَلَّقُ بِنَفْسِ الْعِبَادَةِ، '
              'وَالْقُرْبُ فَضِيلَةٌ تَتَعَلَّقُ بِمَوْضِعِ الْعِبَادَةِ',
          permasalahan: <String>[
            'Ramal hanya disyariatkan dalam satu Tawaf: menurut asah (jumhur) Tawaf yang diikuti Sa’i; qaul kedua, Tawaf Qudum dalam apa jua keadaan. Maka tiada ramal dalam Tawaf Wada’ dan Tawaf sunat. Orang yang sudah ramal dan Sa’i selepas Qudum tidak ramal lagi dalam Tawaf Ifadah; jika dia ramal tetapi belum Sa’i, dia ramal dalam Ifadah menurut pendapat sahih (hlm. 232–233 [235–236]).',
            'Ramal yang ditinggalkan pada tiga pusingan pertama tidak diqada pada empat pusingan terakhir. Jika terhalang kerana sesak, tunggu ruang jika ada harapan tanpa menyakiti orang; jika menjauh akan bercampur dengan barisan wanita, dekat tanpa ramal lebih utama; jika ramal mustahil, gerakkan badan meniru ramal (hlm. 230–232 [233–235]).',
            'Istilam Rukun Yamani: jumhur ashab berkata cium tangan selepas istilam, manakala Imam al-Haramain memberi pilihan cium dahulu atau istilam dahulu. Al-Qadi Abu at-Tayyib menganjurkan turut mengusap penjuru tempat Hajar Aswad — nota kaki al-Ifsah menukil hasyiah yang menyifatkannya "gharib da’if". Wanita tidak disunatkan istilam dan mencium kecuali ketika kawasan itu lengang pada waktu malam (hlm. 233–236 [236–239]).',
            'Muwalat sunat muakkad menurut asah (ada qaul wajib). Jika berhadas di tengah Tawaf, berwuduk lalu menyambung pusingan adalah harus menurut asah, walaupun memulakan semula lebih berhati-hati. Tawaf dihentikan untuk solat fardu berjemaah atau keperluan mendesak, tetapi makruh menghentikan Tawaf fardu untuk solat jenazah atau sunat ratibah (hlm. 239 [242]).',
            'Membaca al-Quran dalam Tawaf disunatkan menurut mazhab Syafi’i dan lebih afdal daripada doa yang tidak ma’thur; al-Halimi berpendapat tidak disunatkan. Nota kaki al-Ifsah: Imam Malik memakruhkannya, dan Ahmad mempunyai dua riwayat (hlm. 238 [241]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Solat sunat Tawaf, Multazam dan Zamzam',
        points: <String>[
          'Selepas tujuh pusingan, solat dua rakaat — sunat muakkad menurut asah. Afdal di belakang Maqam Ibrahim; jika sesak, di Hijr Ismail, kemudian di mana-mana dalam masjid, Tanah Haram, atau di luarnya.',
          'Rakaat pertama baca surah al-Kafirun, rakaat kedua al-Ikhlas; nyaring jika waktu malam dan perlahan jika siang. Kemudian berdoa di belakang Maqam.',
          'Solat ini tiada had waktu — tidak luput walaupun ditangguh hingga pulang ke tanah air, dan Tawaf tetap sah tanpanya.',
          'Selepas solat, sunat kembali istilam Hajar Aswad, kemudian keluar melalui Bab as-Safa ke tempat Sa’i (lihat Modul 09).',
          'Multazam ialah ruang antara Hajar Aswad dan pintu Kaabah, dinamakan demikian kerana orang melekap padanya ketika berdoa; al-Idah menyenaraikannya antara tempat doa mustajab menurut risalah al-Hasan al-Basri.',
          'Minum Zamzam: menghadap kiblat, menyebut nama Allah, meniatkan hajat (keampunan atau kesembuhan), bernafas tiga kali, minum hingga kenyang, kemudian memuji Allah (Bab Kelima al-Idah).',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic: 'وَاتَّخِذُوا مِنْ مَقَامِ إِبْرَاهِيمَ مُصَلًّى',
              terjemahan:
                  'Dan jadikanlah sebahagian Maqam Ibrahim itu tempat solat — asas sunat solat dua rakaat Tawaf di belakang Maqam (dinukil dalam nota kaki al-Ifsah).',
              sumber: 'Al-Baqarah (2):125',
            ),
            DalilItem(
              arabic: 'إِنَّهَا مُبَارَكَةٌ، إِنَّهَا طَعَامُ طُعْمٍ',
              terjemahan:
                  'Sesungguhnya ia (air Zamzam) diberkati; sesungguhnya ia makanan yang mengenyangkan.',
              sumber:
                  'Riwayat Muslim (no. 2473) daripada Abu Dzar r.a. Al-Idah (Bab Kelima, hlm. 397 [400]) menukilnya dengan tambahan "wa syifa’u suqm"; tambahan itu tidak terdapat dalam lafaz Muslim menurut semakan takhrij.',
            ),
          ],
          teksKitab:
              'Sunat kelapan Fasal Kaifiyyat at-Tawaf: dua rakaat Tawaf tidak terikat dengan tempat dan masa, bukan rukun dan bukan syarat Tawaf, dan tidak ditampung dengan dam — namun asy-Syafi’i menganjurkan menyembelih jika ia dilewatkan. Solat ini unik kerana boleh diwakilkan: orang yang diupah menunaikan Haji menunaikannya bagi pihak yang mengupah (asah). Pada awal Fasal as-Sa’i pula, an-Nawawi menukil pendapat al-Mawardi, Ibn Jarir at-Tabari dan al-Ghazali tentang singgah di Multazam selepas Tawaf, lalu memilih zahir hadis sahih: selepas solat tidak menyibukkan diri kecuali istilam Hajar Aswad, kemudian keluar ke Sa’i (al-Idah, hlm. 241–244 [244–247] dan 248–249 [251–252]).',
          teksKitabArabic:
              'وَلَا يَتَعَيَّنُ لَهُمَا مَكَانٌ وَلَا زَمَانٌ، بَلْ يَجُوزُ أَنْ '
              'يُصَلِّيَهُمَا بَعْدَ رُجُوعِهِ إِلَى وَطَنِهِ وَفِي غَيْرِهِ، وَلَا '
              'يَفُوتَانِ مَا دَامَ حَيًّا',
          permasalahan: <String>[
            'Jika seseorang solat fardu selepas Tawaf, ia memadai bagi dua rakaat Tawaf (seperti tahiyyat al-masjid) — nas qadim asy-Syafi’i dan pendapat as-Saidalani; Imam al-Haramain menganggapnya jauh. Langkah berhati-hati: tetap solat dua rakaat Tawaf selepas fardu itu (hlm. 243–244 [246–247]).',
            'Jika bertawaf beberapa kali tanpa solat, kemudian solat dua rakaat bagi setiap Tawaf, ia harus tetapi meninggalkan yang afdal. Nota kaki al-Ifsah menukil hasyiah: dua rakaat sahaja bagi semua Tawaf juga memadai menurut al-Majmu’, atas dasar ia sunat (hlm. 243 [246]).',
            'Turutan selepas solat: al-Mawardi menganjurkan ke Multazam dan berdoa di bawah Mizab dalam Hijr; Ibn Jarir: ke Multazam, kemudian istilam, lalu ke Sa’i; al-Ghazali: ke Multazam sebelum solat dua rakaat. Pilihan an-Nawawi mengikut hadis Jabir r.a. dan jumhur: terus istilam, kemudian ke Sa’i. Doa di Multazam ketika Tawaf Wada’ dihuraikan dalam Bab Kelima (hlm. 248–249 [251–252]).',
            'Hasyiah Ibn Hajar (dinukil nota kaki al-Ifsah) menyebut riwayat Musnad Ahmad bahawa Nabi SAW selepas Tawaf pergi ke Zamzam, minum dan menuang airnya ke atas kepala, kemudian kembali istilam lalu ke Safa; Ibn Jama’ah mempertikaikan kesahihannya, namun hasyiah berkata hadis da’if boleh diamalkan dalam perkara seperti ini (hlm. 248–249 [251–252]).',
            'Nota kaki al-Ifsah menukil pendapat ‘Izz ad-Din ibn ‘Abd as-Salam bahawa Tawaf rukun yang paling afdal kerana menyerupai solat; hasyiah Ibn Hajar mempertikaikannya dan menukil az-Zarkasyi bahawa wukuf ialah rukun paling afdal berdasarkan hadis "al-hajju ‘Arafah" (hlm. 245–246 [248–249]).',
          ],
        ),
      ),
    ],
    duas: <ModuleDua>[
      ModuleDua(
        title: 'Doa Memulakan Tawaf (di Hajar Aswad)',
        arabic:
            'بِسْمِ اللَّهِ وَاللَّهُ أَكْبَرُ، اللَّهُمَّ إِيمَانًا بِكَ، '
            'وَتَصْدِيقًا بِكِتَابِكَ، وَوَفَاءً بِعَهْدِكَ، وَاتِّبَاعًا لِسُنَّةِ '
            'نَبِيِّكَ مُحَمَّدٍ ﷺ',
        translation:
            'Dengan nama Allah, dan Allah Maha Besar. Ya Allah, (aku '
            'melakukannya) kerana beriman kepada-Mu, membenarkan Kitab-Mu, '
            'menunaikan janji-Mu dan mengikuti sunnah Nabi-Mu Muhammad SAW.',
        source:
            'Al-Idah (Fasal Kaifiyat Tawaf) — dibaca ketika istilam Hajar Aswad '
            'dan setiap kali bertentangan dengannya; doa anjuran ulama, al-Idah '
            'tidak menyandarkannya kepada hadis marfu’',
      ),
      ModuleDua(
        title: 'Doa Ketika Ramal (Tiga Pusingan Pertama)',
        arabic:
            'اللَّهُمَّ اجْعَلْهُ حَجًّا مَبْرُورًا، وَذَنْبًا مَغْفُورًا، '
            'وَسَعْيًا مَشْكُورًا',
        translation:
            'Ya Allah, jadikanlah ia Haji yang mabrur, dosa yang diampunkan dan '
            'usaha yang diterima.',
        source:
            'Al-Idah (Fasal Kaifiyat Tawaf) — doa yang disukai Imam as-Syafi’i '
            'ketika ramal; nota kaki muhaqqiq: turut dibaca jemaah Umrah kerana '
            'Umrah juga dinamakan "haji"',
      ),
      ModuleDua(
        title: 'Doa Empat Pusingan Terakhir',
        arabic:
            'اللَّهُمَّ اغْفِرْ وَارْحَمْ، وَاعْفُ عَمَّا تَعْلَمُ، وَأَنْتَ '
            'الْأَعَزُّ الْأَكْرَمُ',
        translation:
            'Ya Allah, ampunilah, rahmatilah dan maafkanlah apa yang Engkau '
            'ketahui; dan Engkaulah Yang Maha Perkasa lagi Maha Mulia.',
        source:
            'Al-Idah (Fasal Kaifiyat Tawaf) — doa yang disukai Imam as-Syafi’i '
            'bagi empat pusingan terakhir; bukan hadis marfu’',
      ),
      ModuleDua(
        title: 'Doa Antara Rukun Yamani dan Hajar Aswad',
        arabic:
            'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً '
            'وَقِنَا عَذَابَ النَّارِ',
        translation:
            'Wahai Tuhan kami, berikanlah kami kebaikan di dunia dan kebaikan '
            'di akhirat, serta peliharalah kami daripada azab neraka.',
        source:
            'Al-Baqarah 2:201. Al-Idah (Fasal Kaifiyat Tawaf): Imam as-Syafi’i '
            'menyebutnya paling disukai dalam tawaf (didahului "Allahumma"); '
            'ashab: lebih dituntut antara dua rukun. Doa paling kerap Nabi SAW '
            '(al-Bukhari dan Muslim daripada Anas r.a.)',
      ),
    ],
    academicInsight:
        'Fasal Pertama dan Kedua Bab Ketiga al-Idah memperlihatkan cara Imam '
        'an-Nawawi menyusun ibadah Tawaf secara bertingkat: adab ketibaan yang '
        'membina jiwa, syarat dan wajib yang menentukan sah, kemudian sunat '
        'yang menyempurnakan. Beliau berulang kali memberi amaran bahawa '
        'kesilapan yang kelihatan kecil — memulakan pusingan sebelum Hajar '
        'Aswad, menyentuh dinding di atas Syazarwan, atau memotong melalui '
        'Hijr — boleh merosakkan Haji ramai orang. Dalam masa yang sama, '
        'beliau mendahulukan maslahah orang lain: tidak bersesak di Hajar '
        'Aswad, ramal ditinggalkan jika membawa kepada bercampur dengan '
        'wanita, dan najis burung yang sukar dielakkan dimaafkan atas kaedah '
        '"apabila sempit, ia diluaskan". Ketepatan fiqh dan kelembutan akhlak '
        'berjalan seiring. Nota kaki al-Ifsah pula memperluas perbincangan '
        'kepada khilaf mazhab dan isu semasa seperti wanita haid yang tidak '
        'dapat menunggu, tetapi ia tetap tulisan pensyarah, bukan matan '
        'an-Nawawi.',
    reflectionQuestions: <String>[
      'Mengapakah Imam an-Nawawi mengutamakan ramal walaupun jauh daripada '
          'Kaabah berbanding dekat tanpa ramal, dan apakah kaedah yang '
          'mendasari pertimbangan ini?',
      'Bagaimanakah prinsip "mengikut perbuatan Nabi SAW" digunakan oleh '
          'an-Nawawi untuk menyelesaikan khilaf tentang kadar Hijr Ismail?',
      'Dalam keadaan sesak hari ini, bagaimanakah jemaah boleh mengimbangi '
          'keinginan mencium Hajar Aswad dengan larangan menyakiti orang lain?',
    ],
  ),

  // -------------------------------------------------------------------------
  // MODUL 09 — Sa’i
  // -------------------------------------------------------------------------
  LearningModuleData(
    number: '09',
    title: 'Sa’i',
    subtitle:
        'Syarat, sunat dan permasalahan Sa’i antara Safa dan Marwah menurut Fasal Ketiga Bab Ketiga al-Idah.',
    icon: HajjIconType.sai,
    accent: Color(0xFF2F8F79),
    sections: <LearningSection>[
      LearningSection(
        title: 'Dari Maqam ke Bukit Safa',
        points: <String>[
          'Selepas solat sunat Tawaf, kembali istilam Hajar Aswad, kemudian keluar melalui Bab as-Safa ke tempat Sa’i — turutan ini sabit daripada Rasulullah SAW.',
          'Naik ke Bukit Safa kira-kira setinggi seorang lelaki sehingga Kaabah kelihatan, lalu menghadap Kaabah.',
          'Lelaki yang beridtiba’ dalam Tawaf menanggalkannya ketika solat dua rakaat, kemudian mengembalikannya untuk Sa’i (pendapat asah).',
          'Tiada talbiyah di atas Safa menurut pendapat asah.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'إِنَّ الصَّفَا وَالْمَرْوَةَ مِنْ شَعَائِرِ اللَّهِ فَمَنْ حَجَّ '
                  'الْبَيْتَ أَوِ اعْتَمَرَ فَلَا جُنَاحَ عَلَيْهِ أَنْ يَطَّوَّفَ '
                  'بِهِمَا',
              terjemahan:
                  'Sesungguhnya Safa dan Marwah adalah sebahagian daripada syiar-syiar Allah; maka sesiapa yang menunaikan Haji ke Baitullah atau berumrah, tiada dosa baginya bersa’i antara kedua-duanya.',
              sumber: 'Al-Baqarah (2):158',
            ),
            DalilItem(
              arabic:
                  'فَبَدَأَ بِالصَّفَا فَرَقِيَ عَلَيْهِ حَتَّى رَأَى الْبَيْتَ '
                  'فَاسْتَقْبَلَ الْقِبْلَةَ فَوَحَّدَ اللَّهَ وَكَبَّرَهُ',
              terjemahan:
                  'Lalu Baginda memulakan dengan Safa, mendakinya sehingga melihat Baitullah, kemudian menghadap kiblat, mentauhidkan Allah dan membesarkan-Nya.',
              sumber:
                  'Riwayat Muslim (no. 1218) daripada Jabir r.a., dalam hadis panjang sifat Haji Nabi SAW',
            ),
          ],
          teksKitab:
              'Fasal Ketiga ("Fi as-Sa’yi wa ma yata’allaqu bih") dimulakan dengan turutan selepas solat Tawaf: istilam, keluar dari Bab as-Safa, dan naik Safa setinggi qamah sehingga Kaabah kelihatan — pada zaman an-Nawawi Kaabah kelihatan dari Safa melalui pintu Bab as-Safa, bukan dari atas dinding masjid, berbeza dengan Marwah (al-Idah, Fasal Fi as-Sa’yi, hlm. 248–250 [251–253]). Bagi kedudukan Sa’i sebagai rukun, lihat Modul 02.',
          teksKitabArabic:
              'إِذَا فَرَغَ مِنْ رَكْعَتَيِ الطَّوَافِ فَالسُّنَّةُ أَنْ يَرْجِعَ إِلَى '
              'الْحَجَرِ الْأَسْوَدِ فَيَسْتَلِمَهُ، ثُمَّ يَخْرُجُ مِنْ بَابِ '
              'الصَّفَا إِلَى الْمَسْعَى',
          permasalahan: <String>[
            'Hasyiah Ibn Hajar (dinukil nota kaki al-Ifsah): istilam kali ini turut disertai mencium dan sujud di atas Hajar Aswad, berdasarkan kaedah "diakhiri dengan apa yang dimulakan" (hlm. 248 [251]).',
            'Nota kaki al-Ifsah: Sa’i ialah rukun Haji dan Umrah di sisi Malik, asy-Syafi’i dan satu riwayat Ahmad, berdasarkan hadis "Ishau, fa inna Allah kataba ‘alaikum as-sa’y"; Abu Hanifah dan riwayat yang sahih daripada Ahmad menganggapnya wajib yang ditampung dengan dam (hlm. 248 [251]).',
            'Persinggahan di Multazam atau Zamzam sebelum ke Sa’i diperselisihkan; pilihan an-Nawawi ialah terus istilam lalu ke Safa (lihat Modul 08, tajuk "Solat sunat Tawaf, Multazam dan Zamzam").',
          ],
        ),
      ),
      LearningSection(
        title: 'Zikir dan doa di atas Safa dan Marwah',
        points: <String>[
          'Di atas Safa, menghadap Kaabah, bertahlil dan bertakbir dengan zikir yang dinaskan (lihat bahagian Doa).',
          'Kemudian berdoa apa sahaja hajat dunia dan akhirat; ashab menganggap baik doa "Allahumma innaka qulta…".',
          'Ulang zikir dan doa tiga kali: zikir pasti tiga kali, dan doa juga diulang menurut pendapat asah.',
          'Lakukan perkara yang sama setiap kali sampai di Safa dan Marwah.',
          'Antara Safa dan Marwah, baca "Rabbighfir warham…" atau al-Quran.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Imam an-Nawawi menyebut lafaz zikir di Safa, kemudian doa yang dianggap baik oleh ashab, dan menegaskan zikir diulang tiga kali; tentang mengulang doa ada khilaf dan asahnya disunatkan, kerana ia sabit dalam Sahih Muslim daripada perbuatan Rasulullah SAW. Dalam senarai sunat Sa’i, beliau menyebut doa sepanjang perjalanan dan bahawa membaca al-Quran lebih afdal (al-Idah, Fasal Fi as-Sa’yi, hlm. 250–251 [253–254]; Far’ Wajibat as-Sa’yi, hlm. 257 [260]).',
          teksKitabArabic:
              'ثُمَّ يُعِيدُ جَمِيعَ مَا سَبَقَ مِنَ الذِّكْرِ وَالدُّعَاءِ ثَانِيًا، '
              'ثُمَّ يُعِيدُ الذِّكْرَ ثَالِثًا. وَهَلْ يُعِيدُ الدُّعَاءَ؟ فِيهِ '
              'خِلَافٌ، الْأَصَحُّ أَنَّهُ يُسْتَحَبُّ إِعَادَتُهُ',
          permasalahan: <String>[
            'Nota kaki al-Ifsah: lafaz zikir di Safa ialah nas asy-Syafi’i yang dihimpun daripada hadis dan athar, antaranya hadis Jabir r.a. dalam Muslim. Ar-Rafi’i menambah "wa huwa hayyun la yamut" selepas "yuhyi wa yumit"; hasyiah Ibn Hajar mempertikaikan tambahan itu dan juga "biyadihi al-khair" kerana tidak warid (hlm. 250 [253]).',
            'Talbiyah di Safa: menurut asah tidak disunatkan; nota kaki al-Ifsah menyebut qaul marjuh asy-Syafi’i bahawa dia bertalbiyah (hlm. 251 [254]).',
            'Membaca al-Quran ketika Sa’i lebih afdal daripada zikir yang tidak warid, sama seperti dalam Tawaf (hlm. 257 [260], dengan huraian nota kaki al-Ifsah).',
            'Nota kaki al-Ifsah: doa "Allahumma innaka qulta…" ialah athar Ibnu ‘Umar r.a. dalam al-Muwatta’; doa "Rabbighfir warham…" diriwayatkan Ibn Abi Syaibah daripada Ibnu ‘Umar secara mauquf, manakala at-Tabarani dan al-Baihaqi meriwayatkan versi marfu’ yang lebih ringkas ketika berada antara dua tanda (hlm. 251, 257 [254, 260]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Berjalan dan berlari antara dua tanda hijau',
        points: <String>[
          'Turun dari Safa dengan berjalan biasa; apabila kira-kira enam hasta sebelum tanda hijau pertama, mula berlari kencang.',
          'Teruskan berlari hingga melepasi kawasan antara dua tanda hijau, kemudian berjalan biasa ke Marwah.',
          'Naik Marwah, ulang zikir dan doa seperti di Safa — itu satu perjalanan. Dari Marwah ke Safa perjalanan kedua, dan seterusnya hingga tujuh, bermula di Safa dan berakhir di Marwah.',
          'Larian disunatkan dalam setiap tujuh perjalanan; jika berjalan sahaja, Sa’i tetap sah tetapi terlepas kelebihannya.',
          'Wanita tidak berlari menurut pendapat asah — berjalan seperti biasa.',
          'Dalam kesesakan, meninggalkan larian lebih ringan daripada menyakiti orang Muslim; jika tidak mampu, gerakkan badan seolah-olah berlari.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              terjemahan:
                  'Hadis Ibnu ‘Umar r.a. tentang ramal yang sama turut menyebut bahawa Nabi SAW berlari di Batn al-Masil (dasar lembah antara dua tanda) ketika bersa’i antara Safa dan Marwah.',
              sumber:
                  'Riwayat al-Bukhari (no. 1617) dan Muslim (no. 1261) daripada Ibnu ‘Umar r.a. — sambungan hadis ramal; lafaz Arab bahagian ini tidak dipetik kerana belum disemak penuh',
            ),
          ],
          teksKitab:
              'An-Nawawi menggambarkan larian bermula kira-kira enam hasta sebelum tanda hijau yang tergantung di halaman masjid di sebelah kiri, hingga ke pertengahan antara dua tanda hijau — satu di penjuru masjid dan satu lagi bersambung dengan rumah al-‘Abbas r.a. Nota kaki al-Ifsah menjelaskan gambaran ini mengikut keadaan sebelum perluasan Masjidil Haram, dan rumah al-‘Abbas sudah dirobohkan (al-Idah, Fasal Fi as-Sa’yi, hlm. 251–252 [254–255]; sunat ketiga dan keempat Sa’i, hlm. 257–258 [260–261]).',
          teksKitabArabic:
              'وَتَرْكُ هَيْئَةِ السَّعْيِ أَهْوَنُ مِنْ إِيذَاءِ الْمُسْلِمِ أَوْ '
              'مِنْ تَعَرُّضِ نَفْسِهِ إِلَى الْأَذَى',
          permasalahan: <String>[
            'Wanita: asahnya dia tidak berlari langsung; satu pendapat lain, jika pada waktu malam dan tempat Sa’i lengang, dia seperti lelaki dan berlari di tempat larian (hlm. 257 [260]).',
            'Nota kaki al-Ifsah: larian hendaklah diniatkan sebagai mengikut sunnah, bukan bermain atau berlumba, jika tidak ia tiada pahala; dan tidak disunatkan berlari kencang ketika sesak atau sukar (hlm. 257 [260]).',
            'Nota kaki al-Ifsah: idtiba’ diteruskan sepanjang Sa’i menurut satu pendapat, atau hanya antara dua tanda hijau menurut pendapat lain (hlm. 229 [232]).',
            'Nota kaki al-Ifsah menukil hadis riwayat Ahmad daripada Habibah, seorang wanita Bani ‘Abd ad-Dar, bahawa kain Nabi SAW berpusing di pinggang Baginda kerana kuatnya larian; menurut Fath al-Bari, riwayat ini menjadi kuat apabila digabungkan dengan jalur lain dalam Sahih Ibn Khuzaimah (hlm. 252 [255]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Empat wajib Sa’i',
        points: <String>[
          'Menempuh seluruh jarak Safa–Marwah: tumit menyentuh pangkal Safa ketika bermula dan hujung jari kaki menyentuh Marwah ketika sampai (terbalik ketika kembali). Kurang walau sebahagian langkah, Sa’i tidak sah.',
          'Tertib: bermula di Safa. Jika bermula di Marwah, perjalanan pertama itu tidak dikira.',
          'Tujuh perjalanan: Safa ke Marwah dikira satu, Marwah ke Safa satu lagi. Jika ragu-ragu semasa Sa’i, ambil bilangan yang sedikit.',
          'Dilakukan selepas Tawaf yang sah — sama ada Tawaf Qudum atau Tawaf Ifadah.',
          'Naik ke atas bukit tidak wajib, tetapi sunat muakkad dan lebih berhati-hati untuk memastikan jarak penuh.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic: 'أَبْدَأُ بِمَا بَدَأَ اللَّهُ بِهِ',
              terjemahan:
                  'Aku mulakan dengan apa yang Allah mulakan (dalam firman-Nya, "Inna as-Safa wa al-Marwah…") — dalil wajib tertib bermula dari Safa.',
              sumber:
                  'Riwayat Muslim (no. 1218) daripada Jabir r.a.; nota kaki al-Ifsah menukilnya dengan lafaz suruhan "Ibda’u" (mulakanlah kamu), hlm. 254 [257]',
            ),
            DalilItem(
              arabic: 'اسْعَوْا فَإِنَّ اللَّهَ كَتَبَ عَلَيْكُمُ السَّعْيَ',
              terjemahan:
                  'Bersa’ilah kamu, kerana Allah telah mewajibkan Sa’i ke atas kamu.',
              sumber:
                  'Riwayat Ahmad (6/421); dinukil nota kaki al-Ifsah (hlm. 248 [251]) sebagai hujah rukun Sa’i',
            ),
          ],
          teksKitab:
              'Far’ "Fi Wajibat as-Sa’yi wa Syurutihi wa Sunanihi wa Adabih" menetapkan empat wajib: menempuh seluruh jarak, tertib, tujuh kali, dan berlaku selepas Tawaf yang sah. Imam an-Nawawi memberi amaran keras bahawa ramai orang pulang tanpa Haji dan tanpa Umrah kerana mencacatkan kewajipan jarak ini (al-Idah, Far’ Wajibat as-Sa’yi, hlm. 253–255 [256–258]).',
          teksKitabArabic:
              'فَاحْفَظْ مَا ذَكَرْنَاهُ فِي تَحْقِيقِ وَاجِبِ الْمَسَافَةِ، فَإِنَّ '
              'كَثِيرًا مِنَ النَّاسِ يَرْجِعُ بِغَيْرِ حَجٍّ وَلَا عُمْرَةٍ '
              'لِإِخْلَالِهِ بِوَاجِبِهِ',
          permasalahan: <String>[
            'Kewajipan naik bukit: Abu Hafs ibn al-Wakil mewajibkan naik setinggi qamah; an-Nawawi menyifatkannya da’if — yang sahih masyhur tidak wajib, tetapi naik itu langkah berhati-hati untuk keluar daripada khilaf. Beliau juga mengingatkan sebahagian anak tangga ketika itu baharu dibina, maka jangan meninggalkannya di belakang sehingga jarak tidak lengkap (hlm. 253–254 [256–257]).',
            'Pengiraan tujuh: sekumpulan ashab (Abu ‘Abd ar-Rahman Ibn binti asy-Syafi’i, Abu Hafs ibn al-Wakil dan Abu Bakr as-Sairafi) mengira pergi dan balik sebagai satu; an-Nawawi menegaskan ia "qaul fasid" yang disebut hanya sebagai amaran supaya tidak terpedaya (hlm. 254–255 [257–258]).',
            'Jika ketika kembali dari Marwah dia menyimpang melalui masjid atau jalan lain lalu memulakan perjalanan seterusnya dari Safa juga, perjalanan itu tidak dikira menurut mazhab sahih (hlm. 254 [257]).',
            'Jika dia yakin sudah lengkap tetapi seorang yang thiqah memberitahu masih berbaki, dia tidak wajib menambah tetapi sunat menambah. Jika selepas Sa’i dia yakin ada sebahagian Tawaf yang tertinggal, Sa’i tidak sah: sempurnakan Tawaf, kemudian ulang Sa’i (hlm. 255 [258], yang kedua daripada nota kaki al-Ifsah menukil hasyiah dan al-Majmu’).',
          ],
        ),
      ),
      LearningSection(
        title: 'Sa’i selepas Tawaf Qudum atau Tawaf Ifadah',
        points: <String>[
          'Sa’i sah selepas Tawaf Qudum atau Tawaf Ifadah, tetapi tidak selepas Tawaf Wada’.',
          'Jika Sa’i dilakukan selepas Tawaf Qudum, ia sudah dikira rukun; tidak perlu diulang selepas Tawaf Ifadah, malah makruh mengulanginya.',
          'Syaratnya tiada wukuf di Arafah di antara Tawaf dan Sa’i itu: jika seseorang Tawaf Qudum kemudian wukuf, Sa’inya mesti selepas Tawaf Ifadah.',
          'Jemaah Haji qiran juga hanya bersa’i sekali.',
          'Nota kaki al-Ifsah: bagi yang mampu, Sa’i selepas Tawaf Qudum lebih afdal kerana itulah yang sabit daripada perbuatan Nabi SAW.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'لَمْ يَطُفِ النَّبِيُّ ﷺ وَلَا أَصْحَابُهُ بَيْنَ الصَّفَا '
                  'وَالْمَرْوَةِ إِلَّا طَوَافًا وَاحِدًا، طَوَافَهُ الْأَوَّلَ',
              terjemahan:
                  'Nabi SAW dan para sahabat tidak bersa’i antara Safa dan Marwah melainkan sekali sahaja, iaitu Sa’i yang pertama.',
              sumber:
                  'Riwayat Muslim (no. 1215) daripada Jabir r.a.; dinukil dalam matan al-Idah, hlm. 256 [259]',
            ),
          ],
          teksKitab:
              'Wajib keempat Sa’i: ia mesti selepas Tawaf yang sah, sama ada Qudum atau Ziyarah (Ifadah); ia tidak terbayang berlaku selepas Tawaf Wada’ kerana Wada’ hanya dilakukan selepas semua manasik selesai — jika Sa’i masih berbaki, tawaf itu bukan Tawaf Wada’. Sa’i bukan ibadah tersendiri yang disyariatkan berulang; ia seperti wukuf, cukup dengan kadar rukun (al-Idah, Far’ Wajibat as-Sa’yi, hlm. 255–256 [258–259]).',
          teksKitabArabic:
              'وَتُكْرَهُ إِعَادَتُهُ بَعْدَ طَوَافِ الْإِفَاضَةِ، لِأَنَّ السَّعْيَ '
              'لَيْسَ مِنَ الْعِبَادَاتِ الْمُسْتَقِلَّةِ الَّتِي يُشْرَعُ '
              'تَكْرِيرُهَا وَالْإِكْثَارُ مِنْهَا',
          permasalahan: <String>[
            'Nota kaki al-Ifsah: menurut Syafi’i, Maliki dan Hanbali, Sa’i mesti selepas Tawaf rukun atau Qudum; menurut Hanafi ia sah selepas apa-apa Tawaf yang sah walaupun sunat — pendapat yang turut dipegang al-Adhra’i (hlm. 255 [258]).',
            'Qarin: hasyiah Ibn Hajar (dinukil nota kaki al-Ifsah) menegaskan tidak disunatkan mengulang Sa’i untuk keluar daripada khilaf Abu Hanifah yang mewajibkan dua Tawaf dan dua Sa’i bagi qarin, kerana khilaf hanya diraikan jika tidak bercanggah dengan sunnah sahih (hlm. 256 [259]).',
            'Nota kaki al-Ifsah: Sa’i kadangkala wajib diulang — contohnya kanak-kanak yang baligh atau hamba yang merdeka ketika di Arafah sedangkan dia sudah bersa’i selepas Tawaf Qudum (hlm. 256 [259]).',
            'Sa’i sebelum Tawaf tidak sah menurut asy-Syafi’i dan jumhur termasuk Malik, Abu Hanifah dan Ahmad (nota kaki al-Ifsah daripada al-Majmu’ dan al-Mughni, hlm. 259 [262]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Muwalat, taharah dan adab Sa’i',
        points: <String>[
          'Disunatkan suci dan menutup aurat; tetapi Sa’i tetap sah walaupun berhadas, berjunub, haid atau ada najis.',
          'Muwalat antara perjalanan, dan antara Tawaf dengan Sa’i, disunatkan; jika terpisah lama tanpa uzur, Sa’i tetap sah menurut pendapat sahih.',
          'Jika solat jemaah didirikan atau ada halangan, hentikan Sa’i, kemudian sambung dari tempat berhenti.',
          'Pilih waktu lengang untuk Tawaf dan Sa’i jika boleh.',
          'Tiada solat sunat khusus selepas Sa’i — asy-Syafi’i berkata: "Tiada solat dalam Sa’i."',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'افْعَلِي مَا يَفْعَلُ الْحَاجُّ، غَيْرَ أَنْ لَا تَطُوفِي '
                  'بِالْبَيْتِ حَتَّى تَطْهُرِي',
              terjemahan:
                  'Lakukanlah apa yang dilakukan oleh orang yang berhaji, kecuali jangan bertawaf di Baitullah sehingga engkau suci — nota kaki al-Ifsah menjadikannya dalil Sa’i sah tanpa taharah, kerana hanya Tawaf yang dikecualikan.',
              sumber:
                  'Riwayat al-Bukhari (no. 305) dan Muslim (no. 1211) daripada ‘Aisyah r.a.; dirujuk dalam nota kaki al-Ifsah, hlm. 257 [260]',
            ),
          ],
          teksKitab:
              'Sunat-sunat Sa’i ialah semua yang disebut dalam cara Sa’i selain empat wajib, antaranya bersa’i dalam keadaan suci dan menutup aurat, mencari waktu lengang, muwalat, dan tidak berkenderaan tanpa uzur. Tentang solat dua rakaat di atas Marwah yang dilihat Abu Muhammad al-Juwaini dilakukan orang ramai, al-Juwaini menganggapnya baik tetapi tidak sabit daripada Nabi SAW; Ibn as-Salah pula berkata ia patut dimakruhkan kerana "mencipta syiar baharu" (al-Idah, Far’ Wajibat as-Sa’yi, hlm. 256–259 [259–262]).',
          teksKitabArabic:
              'حَتَّى لَوْ رَجَعَ إِلَى وَطَنِهِ وَمَضَى عَلَيْهِ سِنُونَ كَثِيرَةٌ '
              'جَازَ أَنْ يَبْنِيَ عَلَى مَا مَضَى مِنْ سَعْيِهِ وَطَوَافِهِ، لَكِنِ '
              'الْأَفْضَلُ الِاسْتِئْنَافُ',
          permasalahan: <String>[
            'Pemisahan antara Tawaf dan Sa’i, atau antara perjalanan Sa’i, tidak menjejaskan selagi tiada rukun (wukuf) di antaranya — hingga orang yang pulang ke tanah air bertahun-tahun pun boleh menyambung, walaupun memulakan semula lebih afdal. Nota kaki al-Ifsah: ini juga pendapat asah mazhab Hanbali menurut al-Mughni, dengan athar Ibnu ‘Umar r.a. yang berwuduk lalu menyambung Sa’inya (hlm. 256, 258 [259, 261]).',
            'Solat dua rakaat selepas Sa’i di Marwah: al-Juwaini menganggapnya baik; Ibn as-Salah memakruhkannya; menurut nota kaki al-Ifsah, an-Nawawi dalam al-Majmu’ berkata pendapat Ibn as-Salah lebih zahir. Hasyiah Ibn Hajar menolak hujah sebahagian Hanafiyyah dengan hadis al-Muttalib bin Abi Wada’ah, kerana kalimah "sub’ih" (tujuh pusingan Tawafnya) tersalah baca sebagai "sa’yih" (Sa’inya) (hlm. 259 [262]).',
            'Jika solat fardu didirikan semasa Sa’i: menurut Syafi’i, Hanafi dan Hanbali, hentikan Sa’i dan solat, kemudian sambung; menurut Imam Malik, tidak dihentikan kecuali waktu sempit (nota kaki al-Ifsah daripada al-Majmu’ dan al-Mughni, hlm. 258–259 [261–262]).',
            'Taharah tidak disyaratkan dalam Sa’i menurut mazhab empat imam (nota kaki al-Ifsah, hlm. 257 [260]). Namun Sa’i mesti selepas Tawaf yang sah, dan Tawaf itu sendiri memerlukan taharah — maka wanita haid tidak boleh mendahulukan Sa’i sebelum Tawaf.',
          ],
        ),
      ),
      LearningSection(
        title: 'Sa’i berkenderaan dan bangunan Mas’a hari ini',
        points: <String>[
          'Afdal bersa’i dengan berjalan kaki; berkenderaan (termasuk kerusi roda) kerana uzur dibenarkan.',
          'Jika berkenderaan, pastikan kenderaan sampai ke hujung Safa dan Marwah sehingga tiada jarak yang tertinggal.',
          'Matan al-Idah tidak membincangkan Sa’i di tingkat atas kerana bangunan itu belum wujud pada zaman an-Nawawi.',
          'Nota kaki al-Ifsah merekodkan bahawa Mas’a telah diperluas dan ditambah tingkat, dan anak tangga lama sudah tiada; maka pastikan bermula dari hujung Safa dan berakhir di hujung Marwah.',
          'Bagi Tawaf pula, matan al-Idah jelas mengharuskan Tawaf di bumbung atau tingkat atas masjid (lihat Modul 08).',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'طَافَ رَسُولُ اللَّهِ ﷺ بِالْبَيْتِ فِي حَجَّةِ الْوَدَاعِ عَلَى '
                  'رَاحِلَتِهِ يَسْتَلِمُ الْحَجَرَ بِمِحْجَنِهِ',
              terjemahan:
                  'Rasulullah SAW bertawaf di Baitullah pada Haji Wada’ di atas tunggangannya, menyentuh Hajar Aswad dengan tongkat bengkoknya — asas keharusan beribadah di atas kenderaan.',
              sumber:
                  'Riwayat Muslim (no. 1273) daripada Jabir r.a. Nota kaki al-Ifsah (hlm. 252 [255]) menyebut bahawa menurut riwayat Muslim, Baginda pada mulanya bersa’i berjalan kaki, kemudian menunggang apabila orang ramai mengerumuninya.',
            ),
          ],
          teksKitab:
              'Wajib pertama Sa’i menyebut: walaupun berkenderaan, disyaratkan dia menggerakkan tunggangannya sehingga kakinya diletakkan di atas bukit atau sampai kepadanya, supaya tiada jarak yang tertinggal. Sunat kelima pula: afdal tidak berkenderaan dalam Sa’i kecuali kerana uzur, sebagaimana dalam Tawaf (al-Idah, Far’ Wajibat as-Sa’yi, hlm. 253 dan 258 [256 dan 261]).',
          teksKitabArabic:
              'حَتَّى لَوْ كَانَ رَاكِبًا اشْتُرِطَ أَنْ يُسَيِّرَ دَابَّتَهُ حَتَّى '
              'تَضَعَ حَافِرَهَا عَلَى الْجَبَلِ أَوْ إِلَيْهِ، حَتَّى لَا يَبْقَى '
              'مِنَ الْمَسَافَةِ شَيْءٌ',
          permasalahan: <String>[
            'Nota kaki al-Ifsah: berkenderaan tanpa uzur tidak makruh selagi tiada kesesakan; malah ia boleh menjadi haram jika pasti atau berat sangkaan ia menyakiti orang (hlm. 258 [261]).',
            'Tingkat atas Mas’a: tiada ketetapan dalam matan al-Idah. Nota kaki al-Ifsah hanya merekodkan bahawa pembinaan era Saudi selepas perluasan tahun 1372H menyambungkan Masjidil Haram dengan Mas’a, Safa dan Marwah, dan satu tingkat dibina di atas Mas’a; ia tidak membincangkan hukum bersa’i di tingkat itu. Bagi hukum semasa, rujuk fatwa berautoriti (hlm. 249 [252]).',
            'Nota kaki al-Ifsah menukil Syaikh ‘Abd Allah ibn Jasir (Mufid al-Anam): selepas binaan baharu, Sa’i hanya lengkap jika naik ke kawasan lapang di hujung, iaitu anak tangga terakhir (hlm. 252 [255]); al-Ifsah turut mencatat bahawa anak tangga lama sudah tiada dan laluan kini mudah bagi pejalan kaki dan kerusi roda (hlm. 253 [256]).',
            'Nota kaki al-Ifsah (dalam bab Tawaf): orang yang bertawaf di bumbung atau di atas tunggangan memulakan pusingan dengan menyetentangi bahagian penjuru Hajar Aswad pada aras mereka (hlm. 221 [224]).',
          ],
        ),
      ),
    ],
    duas: <ModuleDua>[
      ModuleDua(
        title: 'Zikir di Bukit Safa dan Marwah',
        arabic:
            'اللَّهُ أَكْبَرُ، اللَّهُ أَكْبَرُ، اللَّهُ أَكْبَرُ، وَلِلَّهِ '
            'الْحَمْدُ، اللَّهُ أَكْبَرُ عَلَىٰ مَا هَدَانَا، وَالْحَمْدُ '
            'لِلَّهِ عَلَىٰ مَا أَوْلَانَا، لَا إِلَٰهَ إِلَّا اللَّهُ وَحْدَهُ '
            'لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، يُحْيِي '
            'وَيُمِيتُ، بِيَدِهِ الْخَيْرُ، وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ، '
            'لَا إِلَٰهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، أَنْجَزَ '
            'وَعْدَهُ، وَنَصَرَ عَبْدَهُ، وَهَزَمَ الْأَحْزَابَ وَحْدَهُ، لَا '
            'إِلَٰهَ إِلَّا اللَّهُ، وَلَا نَعْبُدُ إِلَّا إِيَّاهُ، '
            'مُخْلِصِينَ لَهُ الدِّينَ وَلَوْ كَرِهَ الْكَافِرُونَ',
        translation:
            'Allah Maha Besar (3x), dan bagi Allah segala puji. Allah Maha '
            'Besar atas hidayah-Nya kepada kami, dan segala puji bagi Allah atas '
            'nikmat yang dikurniakan-Nya kepada kami. Tiada Tuhan melainkan Allah '
            'Yang Esa, tiada sekutu bagi-Nya; bagi-Nya kerajaan dan segala puji; '
            'Dia menghidupkan dan mematikan; di tangan-Nya segala kebaikan, dan '
            'Dia Maha Berkuasa atas segala sesuatu. Tiada Tuhan melainkan Allah '
            'Yang Esa; Dia menunaikan janji-Nya, menolong hamba-Nya dan '
            'mengalahkan golongan al-Ahzab dengan sendiri-Nya. Tiada Tuhan '
            'melainkan Allah, dan kami tidak menyembah selain-Nya, dengan '
            'mengikhlaskan agama bagi-Nya walaupun orang kafir membencinya.',
        source:
            'Al-Idah (Fasal as-Sa’i) — dibaca menghadap Kaabah dan diulang tiga '
            'kali di Safa dan Marwah; nota kaki al-Ifsah: lafaz nas Imam '
            'as-Syafi’i, berasaskan hadis Jabir r.a. riwayat Muslim',
      ),
      ModuleDua(
        title: 'Doa di Bukit Safa',
        arabic:
            'اللَّهُمَّ إِنَّكَ قُلْتَ وَقَوْلُكَ الْحَقُّ: ادْعُونِي أَسْتَجِبْ '
            'لَكُمْ، وَإِنَّكَ لَا تُخْلِفُ الْمِيعَادَ، وَإِنِّي أَسْأَلُكَ كَمَا '
            'هَدَيْتَنِي لِلْإِسْلَامِ أَنْ لَا تَنْزِعَهُ مِنِّي، وَأَنْ تَتَوَفَّانِي '
            'مُسْلِمًا',
        translation:
            'Ya Allah, sesungguhnya Engkau telah berfirman, dan firman-Mu adalah '
            'benar: "Berdoalah kepada-Ku, nescaya Aku perkenankan bagi kamu", '
            'dan Engkau tidak memungkiri janji. Aku memohon kepada-Mu, '
            'sebagaimana Engkau telah memberiku hidayah kepada Islam, agar '
            'Engkau tidak mencabutnya daripadaku dan mematikan aku sebagai '
            'seorang Muslim.',
        source:
            'Al-Idah (Fasal as-Sa’i) — dianggap baik oleh ashab, dibaca selepas '
            'zikir di Safa; nota kaki al-Ifsah: athar Ibnu Umar r.a. riwayat '
            'Malik dalam al-Muwatta’, bukan hadis marfu’',
      ),
      ModuleDua(
        title: 'Doa Sepanjang Sa’i dan di Lampu Hijau',
        arabic:
            'رَبِّ اغْفِرْ وَارْحَمْ، وَتَجَاوَزْ عَمَّا تَعْلَمُ، إِنَّكَ '
            'أَنْتَ الْأَعَزُّ الْأَكْرَمُ، اللَّهُمَّ آتِنَا فِي الدُّنْيَا '
            'حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
        translation:
            'Wahai Tuhanku, ampunilah, rahmatilah dan maafkanlah apa yang Engkau '
            'ketahui; sesungguhnya Engkaulah Yang Maha Perkasa lagi Maha Mulia. '
            'Ya Allah, berikanlah kami kebaikan di dunia dan kebaikan di '
            'akhirat, serta peliharalah kami daripada azab neraka.',
        source:
            'Al-Idah (Sunat-sunat Sa’i) — dibaca ketika berjalan dan berlari '
            'anak antara Safa dan Marwah; nota kaki al-Ifsah: riwayat Ibnu Abi '
            'Syaibah daripada Ibnu Umar r.a. (mauquf)',
      ),
    ],
    academicInsight:
        'Fasal Sa’i dalam al-Idah pendek tetapi padat, dan Imam an-Nawawi '
        'menekankan ketepatan jarak dan bilangan: tumit di Safa, jari kaki di '
        'Marwah, dan tujuh perjalanan dikira sehala. Beliau tidak teragak-agak '
        'menolak pendapat ashab yang dianggapnya tersasar — mewajibkan naik '
        'bukit, atau mengira pergi dan balik sebagai satu — kerana ia '
        'bercanggah dengan perbuatan Nabi SAW dan amalan umat. Sa’i juga '
        'diletakkan sebagai ibadah yang tidak berdiri sendiri: ia menumpang '
        'pada Tawaf yang sah, tidak disyariatkan berulang, dan tidak '
        'mensyaratkan taharah. Nota kaki al-Ifsah pula merakam perubahan '
        'fizikal Mas’a pada abad ke-14 Hijrah, memperlihatkan bagaimana kaedah '
        'klasik "tiada jarak yang tertinggal" terus menjadi neraca untuk '
        'menilai struktur baharu, walaupun matan sendiri tidak menyentuh '
        'persoalan tingkat atas.',
    reflectionQuestions: <String>[
      'Mengapakah Imam an-Nawawi menyamakan Sa’i dengan wukuf dari segi tidak '
          'disunatkan mengulanginya, berbeza dengan Tawaf yang boleh '
          'diperbanyak?',
      'Bagaimanakah prinsip "tiada jarak yang tertinggal" dalam al-Idah boleh '
          'dijadikan panduan apabila bersa’i di tingkat atas atau dengan '
          'kerusi roda hari ini?',
      'Apakah hikmah wanita tidak disunatkan berlari antara dua tanda hijau, '
          'sedangkan Sa’i itu sendiri mengenang usaha Siti Hajar?',
    ],
  ),
];
