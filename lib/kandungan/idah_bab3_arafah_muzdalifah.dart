import 'package:flutter/material.dart';

import '../islamic_icons.dart';
import '../learning_module_screen.dart';
import '../shared_widgets.dart';

// ---------------------------------------------------------------------------
// MODUL 10 & 11 — Bab Ketiga al-Idah fi Manasik al-Hajj wa al-‘Umrah (Imam
// an-Nawawi, Shamela book_id 96232):
//   • al-Fasl ar-Rabi’ — Wukuf di Arafat (hlm. 260–292 [263–295])
//   • al-Fasl al-Khamis — Ifadah ke Muzdalifah (hlm. 292–301 [295–304])
//   • al-Fasl as-Sadis — Bertolak ke Mina (hlm. 301–306 [304–309])
// Rujukan halaman: page_id Shamela, diikuti halaman cetakan dalam kurungan.
// Bahan nota kaki ialah al-Ifsah (‘Abd al-Fattah Rawah) atau hashiyah Ibn
// Hajar al-Haytami yang dinukil di dalamnya — bukan kata-kata an-Nawawi.
// ---------------------------------------------------------------------------

// Doa yang sudah wujud dalam aplikasi — disalin huruf demi huruf daripada
// lib/learning_module_screen.dart (_duaMenujuArafah, _duaTahlilArafah,
// _duaNabiDiArafah, _duaMasyaril) dan lib/hajj_guide_screen.dart
// (_duaRabbanaMasyaril) supaya lafaz kekal seragam.
const ModuleDua _duaMenujuArafah = ModuleDua(
  title: 'Doa Dalam Perjalanan ke Arafah',
  arabic:
      'اللَّهُمَّ إِلَيْكَ تَوَجَّهْتُ، وَلِوَجْهِكَ الْكَرِيمِ '
      'أَرَدْتُ، فَاجْعَلْ ذَنْبِي مَغْفُورًا، وَحَجِّي مَبْرُورًا، '
      'ارْحَمْنِي وَلَا تُخَيِّبْنِي، إِنَّكَ عَلَىٰ كُلِّ شَيْءٍ '
      'قَدِيرٌ',
  translation:
      'Ya Allah, kepada-Mu aku menghadap, dan Wajah-Mu Yang Mulia yang aku '
      'harapkan; maka jadikanlah dosaku diampunkan dan Hajiku mabrur. '
      'Rahmatilah aku dan janganlah Engkau hampakan aku; sesungguhnya '
      'Engkau Maha Berkuasa atas segala sesuatu.',
  source:
      'Al-Idah (Fasal Wukuf di Arafah) — dianggap baik oleh sebahagian '
      'ulama; bukan hadis marfu’',
);

const ModuleDua _duaTahlilArafah = ModuleDua(
  title: 'Zikir Terbaik Hari Arafah',
  arabic:
      'لَا إِلَٰهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ '
      'الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ',
  translation:
      'Tiada Tuhan melainkan Allah Yang Esa, tiada sekutu bagi-Nya; '
      'bagi-Nya kerajaan dan bagi-Nya segala puji, dan Dia Maha Berkuasa '
      'atas segala sesuatu.',
  source:
      'Riwayat at-Tirmidhi: "Sebaik-baik doa ialah doa hari Arafah, dan '
      'sebaik-baik ucapanku dan para nabi sebelumku…"; dinukil an-Nawawi '
      'dalam al-Idah',
);

const ModuleDua _duaNabiDiArafah = ModuleDua(
  title: 'Doa Nabi SAW di Arafah',
  arabic:
      'اللَّهُمَّ لَكَ الْحَمْدُ كَالَّذِي نَقُولُ وَخَيْرًا مِمَّا '
      'نَقُولُ، اللَّهُمَّ لَكَ صَلَاتِي وَنُسُكِي وَمَحْيَايَ '
      'وَمَمَاتِي، وَإِلَيْكَ مَآبِي، وَلَكَ رَبِّي تُرَاثِي، '
      'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ عَذَابِ الْقَبْرِ، '
      'وَوَسْوَسَةِ الصَّدْرِ، وَشَتَاتِ الْأَمْرِ، اللَّهُمَّ إِنِّي '
      'أَعُوذُ بِكَ مِنْ شَرِّ مَا تَجِيءُ بِهِ الرِّيحُ',
  translation:
      'Ya Allah, bagi-Mu segala puji seperti yang kami ucapkan, dan lebih '
      'baik daripada apa yang kami ucapkan. Ya Allah, bagi-Mu '
      'solatku, ibadahku, hidupku dan matiku; kepada-Mu tempat kembaliku, '
      'dan milik-Mu, wahai Tuhanku, segala peninggalanku. Ya Allah, aku '
      'berlindung kepada-Mu daripada azab kubur, was-was di dalam dada dan '
      'urusan yang bercelaru. Ya Allah, aku berlindung kepada-Mu daripada '
      'keburukan yang dibawa oleh angin.',
  source:
      'Riwayat at-Tirmidhi daripada Ali r.a. — doa yang paling kerap '
      'dibaca Nabi SAW di Arafah, dinukil an-Nawawi dalam al-Idah; '
      'darjat sanadnya tidak disemak di sini',
);

const ModuleDua _duaMasyaril = ModuleDua(
  title: 'Doa di Masy’aril Haram',
  arabic:
      'اللَّهُمَّ كَمَا أَوْقَفْتَنَا فِيهِ وَأَرَيْتَنَا إِيَّاهُ، '
      'فَوَفِّقْنَا لِذِكْرِكَ كَمَا هَدَيْتَنَا، وَاغْفِرْ لَنَا '
      'وَارْحَمْنَا كَمَا وَعَدْتَنَا بِقَوْلِكَ وَقَوْلُكَ الْحَقُّ',
  translation:
      'Ya Allah, sebagaimana Engkau telah menghentikan kami di tempat ini '
      'dan memperlihatkannya kepada kami, maka berilah kami taufik untuk '
      'mengingati-Mu sebagaimana Engkau telah memberi kami hidayah; '
      'ampunilah dan rahmatilah kami sebagaimana Engkau janjikan dengan '
      'firman-Mu, dan firman-Mu adalah benar.',
  source:
      'Al-Idah (Fasal Bertolak ke Mina) — dianjurkan ulama ketika wuquf '
      'di Masy’aril Haram, disusuli al-Baqarah 2:198–199 serta '
      'memperbanyak doa "Rabbana atina…" (ringkasan)',
);

const ModuleDua _duaRabbanaMasyaril = ModuleDua(
  title: 'Doa yang Diperbanyak di Masy’aril Haram',
  arabic:
      'اللَّهُمَّ رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ '
      'حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
  translation:
      'Ya Allah, wahai Tuhan kami, berikanlah kami kebaikan di dunia dan '
      'kebaikan di akhirat, serta peliharalah kami daripada azab neraka.',
  source:
      'Al-Baqarah 2:201; al-Idah, Bab 3 (Fasal 6) menganjurkan doa ini '
      'diperbanyak di Masy’aril Haram',
);

// Doa baharu — dipetik daripada al-Idah dengan status yang dinyatakan.
const ModuleDua _duaIstiqamahArafah = ModuleDua(
  title: 'Doa Taubat dan Istiqamah di Arafah',
  arabic:
      'اللَّهُمَّ اغْفِرْ لِي مَغْفِرَةً مِنْ عِنْدِكَ تُصْلِحُ بِهَا '
      'شَأْنِي فِي الدَّارَيْنِ، وَارْحَمْنِي رَحْمَةً مِنْكَ أَسْعَدُ '
      'بِهَا فِي الدَّارَيْنِ، وَتُبْ عَلَيَّ تَوْبَةً نَصُوحًا لَا '
      'أَنْكُثُهَا أَبَدًا، وَأَلْزِمْنِي سَبِيلَ الِاسْتِقَامَةِ لَا '
      'أَزِيغُ عَنْهَا أَبَدًا',
  translation:
      'Ya Allah, ampunilah aku dengan keampunan daripada sisi-Mu yang '
      'memperbaiki urusanku di dunia dan akhirat; rahmatilah aku dengan '
      'rahmat daripada-Mu yang membahagiakan aku di dunia dan akhirat; '
      'terimalah taubatku sebagai taubat nasuha yang tidak akan aku '
      'langgar selama-lamanya; dan tetapkanlah aku di jalan istiqamah, '
      'tidak akan aku menyimpang daripadanya selama-lamanya.',
  source:
      'Al-Idah, Fasal ar-Rabi’ — antara "al-ad’iyah al-mukhtarah" (doa-doa '
      'pilihan) hari Arafah, hlm. 285 [288]; anjuran ulama dalam al-Idah, '
      'bukan hadis marfu’',
);

const ModuleDua _duaSampaiMuzdalifah = ModuleDua(
  title: 'Doa Ketika Sampai di Muzdalifah',
  arabic:
      'اللَّهُمَّ إِنِّي أَسْأَلُكَ أَنْ تَرْزُقَنِي جَوَامِعَ الْخَيْرِ '
      'كُلِّهِ، وَأَنْ تَصْرِفَ عَنِّي الشَّرَّ كُلَّهُ، لَا يَفْعَلُ '
      'ذَلِكَ وَلَا يَجُودُ بِهِ إِلَّا أَنْتَ',
  translation:
      'Ya Allah, aku memohon kepada-Mu agar Engkau mengurniakan kepadaku '
      'himpunan segala kebaikan, dan memalingkan daripadaku segala '
      'keburukan; tiada yang melakukannya dan tiada yang memurahkannya '
      'melainkan Engkau.',
  source:
      'Nota kaki al-Ifsah pada al-Idah, Fasal al-Khamis, hlm. 294 [297] — '
      'bukan matan an-Nawawi dan tiada takhrij hadis; doa umum yang baik '
      'dibaca',
);

const List<LearningModuleData>
idahModulesArafahMuzdalifah = <LearningModuleData>[
  // -------------------------------------------------------------------------
  // MODUL 10 — Hari Tarwiyah & Wukuf di Arafah
  // -------------------------------------------------------------------------
  LearningModuleData(
    number: '10',
    title: 'Hari Tarwiyah & Wukuf di Arafah',
    subtitle: 'Dari khutbah 7 Zulhijjah hingga terbenam matahari di Arafah.',
    icon: HajjIconType.arafah,
    accent: Color(0xFFC05C65),
    sections: <LearningSection>[
      LearningSection(
        title: 'Khutbah 7 Zulhijjah & Hari Tarwiyah di Mina',
        points: <String>[
          'Pada 7 Zulhijjah, selepas Zuhur, imam menyampaikan khutbah pertama '
              'daripada empat khutbah Haji di sisi Kaabah untuk menerangkan '
              'manasik yang akan datang.',
          'Pada 8 Zulhijjah (Hari Tarwiyah), jemaah keluar dari Makkah '
              'selepas Subuh menuju Mina. Jemaah Haji Tamattu’ dan penduduk '
              'Makkah berihram Haji dari Makkah pada hari ini.',
          'Sunat solat Zuhur, Asar, Maghrib, Isyak dan Subuh di Mina serta '
              'bermalam di sana — semuanya sunat, bukan wajib.',
          'Jika tidak bermalam di Mina pada malam 9 Zulhijjah, tiada dosa dan '
              'tiada dam; yang hilang hanyalah pahala sunat.',
          'Nama hari: 8 Tarwiyah, 9 Arafah, 10 Nahar, 11 al-Qarr, 12 Nafar '
              'Awal dan 13 Nafar Thani.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Fasal ar-Rabi’ (al-Wuquf bi ‘Arafat), al-Idah, hlm. 261–266 '
              '[264–269]: an-Nawawi menyebut empat khutbah Haji — 7 '
              'Zulhijjah di Makkah, hari Arafah, hari Nahar di Mina dan hari '
              'Nafar Awal di Mina — semuanya satu khutbah selepas Zuhur '
              'kecuali di Arafah (dua khutbah sebelum Zuhur). Jemaah keluar '
              'ke Mina pada 8 Zulhijjah selepas Subuh supaya dapat solat '
              'Zuhur di Mina; inilah pendapat sahih masyhur, manakala satu '
              'qaul lain menyebut mereka solat Zuhur di Makkah dahulu. '
              'Beliau menegaskan amalan di Mina pada hari itu sunat semata-'
              'mata.',
          teksKitabArabic:
              'وَكُلُّ ذَلِكَ مَسْنُونٌ لَيْسَ بِنُسُكٍ وَاجِبٍ، فَلَوْ لَمْ '
              'يَبِيتُوا بِهَا أَصْلًا وَلَمْ يَدْخُلُوهَا فَلَا شَيْءَ '
              'عَلَيْهِمْ، لَكِنْ فَاتَتْهُمُ السُّنَّةُ',
          permasalahan: <String>[
            'Jika 8 Zulhijjah jatuh pada hari Jumaat, an-Nawawi menyebut '
                'mereka keluar sebelum terbit fajar, kerana musafir pada hari '
                'Jumaat ke tempat yang tiada solat Jumaat adalah haram atau '
                'makruh. Hashiyah Ibn Hajar (dinukil al-Ifsah) menegaskan '
                'pendapat mazhab ialah haram bagi orang yang bermukim di '
                'Makkah (hlm. 263 [266]).',
            'Nota kaki al-Ifsah: Imam Malik dan Abu Hanifah berpendapat '
                'khutbah Haji hanya tiga dan tiada khutbah pada hari Nahar; '
                'Imam Ahmad pula tidak mensyariatkan khutbah 7 Zulhijjah '
                '(hlm. 261–262 [264–265]).',
            'Amalan banyak kumpulan hari ini membawa jemaah terus ke Arafah '
                'pada 8 Zulhijjah. An-Nawawi menyifatkan perbuatan memasuki '
                'Arafah pada hari kelapan sebagai "kesilapan yang menyalahi '
                'sunnah" kerana terlepas banyak sunnah; namun kerana semuanya '
                'sunat, Haji tetap sah dan tiada dam (hlm. 269 [272]).',
            'Nota kaki al-Ifsah mencatat Mina kini sudah menjadi kawasan '
                'berpenduduk, dan solat Jumaat serta solat fardu didirikan di '
                'Masjid al-Khaif — berbeza dengan zaman an-Nawawi yang '
                'menafikan Jumaat di Mina kerana tiada penduduk tetap '
                '(hlm. 264 [267]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Perjalanan ke Arafah: Namirah, Khutbah dan Jamak',
        points: <String>[
          'Selepas matahari terbit di Bukit Thabir pada 9 Zulhijjah, jemaah '
              'bergerak dari Mina ke Arafah sambil memperbanyak talbiyah.',
          'Sunat singgah di Namirah dan tidak memasuki Arafah sebelum '
              'gelincir matahari; sunat juga mandi untuk wukuf.',
          'Selepas gelincir matahari, imam berkhutbah dua kali di Masjid '
              'Ibrahim (Masjid Namirah), kemudian solat Zuhur dan Asar '
              'secara jamak taqdim dengan satu azan dan dua iqamah.',
          'Bacaan solat Zuhur dan Asar di sini perlahan (sirr), bukan '
              'nyaring seperti Jumaat.',
          'Selepas solat, segera ke tempat wukuf; jangan disibukkan dengan '
              'solat sunat lain selain rawatib.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Fasal ar-Rabi’, al-Idah, hlm. 267–272 [270–275]: khutbah '
              'pertama di Masjid Ibrahim menerangkan wukuf, syaratnya dan waktu '
              'bertolak ke Muzdalifah serta menggesa jemaah memperbanyak doa; '
              'imam duduk sekadar membaca surah al-Ikhlas, lalu bangun untuk '
              'khutbah kedua yang ringkas serentak dengan azan. An-Nawawi '
              'menyatakan pendapat asah bahawa jamak di Arafah disebabkan '
              'musafir, maka hanya musafir jarak jauh (dua marhalah) yang '
              'menjamak; tiada khilaf bahawa qasar hanya untuk musafir jarak '
              'jauh.',
          teksKitabArabic:
              'فَالسُّنَّةُ أَنْ يَمْكُثُوا بِنَمِرَةَ حَتَّى تَزُولَ '
              'الشَّمْسُ وَيَغْتَسِلُوا بِهَا لِلْوُقُوفِ ... ثُمَّ يَنْزِلُ '
              'فَيُصَلِّي بِالنَّاسِ الظُّهْرَ ثُمَّ الْعَصْرَ جَامِعًا '
              'بَيْنَهُمَا',
          permasalahan: <String>[
            'Sebab jamak: an-Nawawi menyebut satu pendapat (qil) bahawa jamak '
                'di Arafah kerana nusuk, maka mukim dan musafir sama; tetapi '
                'yang asah ialah kerana musafir. Nota kaki al-Ifsah: pendapat '
                'kerana nusuk ialah mazhab Maliki dan Hanbali; Abu Hanifah '
                'hanya membenarkan jamak di Arafah bagi yang solat bersama '
                'imam (hlm. 270–271 [273–274]).',
            'Jika imam musafir, dia mengqasar dan selepas salam berkata: '
                '"Wahai penduduk Makkah dan sesiapa yang perjalanannya '
                'pendek, sempurnakanlah solat kamu, kami ini kaum musafir." '
                'Jemaah yang status musafirnya tidak jelas (contohnya sudah '
                'lama bermukim di Makkah) wajar merujuk pembimbing Haji '
                '(hlm. 272 [275]).',
            'Sesiapa yang menjamak sendirian, atau solat satu bersama imam '
                'dan satu lagi sendirian, atau solat setiap satu pada '
                'waktunya — semuanya harus, cuma menyalahi sunnah '
                '(hlm. 272 [275]).',
            'Jika hari Arafah jatuh pada Jumaat, solat Jumaat tidak '
                'didirikan di Arafah kerana syaratnya ialah di tempat '
                'bermukim yang didiami penduduk tetap (hlm. 272 [275]).',
            'Nota kaki al-Ifsah (memetik al-Majmu’): khutbah pertama '
                'disampaikan sebelum azan, dan khutbah kedua bermula serentak '
                'dengan azan; Abu Hanifah berpendapat azan dahulu seperti '
                'Jumaat. Dalil mazhab: hadis Jabir dalam Sahih Muslim '
                '(hlm. 269–270 [272–273]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Sempadan Arafah: Wadi ‘Uranah Bukan Arafah',
        points: <String>[
          'Seluruh Arafah ialah tempat wukuf; di mana-mana bahagian pun sah.',
          'Wadi ‘Uranah, Namirah dan bahagian hadapan Masjid Ibrahim '
              '(Masjid Namirah) BUKAN sebahagian Arafah — wukuf di situ '
              'tidak sah.',
          'Arafah terletak di luar Tanah Haram; sempadan Haram dari arah ini '
              'ialah dua tanda di hujung al-Ma’zimain.',
          'Pastikan khemah atau tempat duduk berada di dalam papan tanda '
              'sempadan Arafah, terutama bagi yang berada berhampiran masjid.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic: 'وَقَفْتُ هَا هُنَا، وَعَرَفَةُ كُلُّهَا مَوْقِفٌ',
              terjemahan:
                  'Aku berwukuf di sini, dan seluruh Arafah adalah tempat '
                  'wukuf — tidak wajib berada di tempat Nabi SAW berwukuf.',
              sumber:
                  'Riwayat Muslim (no. 1218, hadis panjang Jabir r.a.) dan '
                  'Abu Dawud (no. 1907)',
            ),
          ],
          teksKitab:
              'Fasal ar-Rabi’, al-Idah, hlm. 273–276 [276–279]: Imam '
              'asy-Syafi’i mentakrifkan Arafah sebagai kawasan selepas Wadi '
              '‘Uranah hingga ke bukit-bukau di sebelah kebun Bani ‘Amir. '
              'An-Nawawi menegaskan Wadi ‘Uranah, Namirah dan Masjid Ibrahim '
              'bukan sebahagian Arafah menurut nas asy-Syafi’i. Beliau juga '
              'menukilkan pendapat Abu Muhammad al-Juwaini (dan dipegang '
              'ar-Rafi’i) bahawa bahagian hadapan masjid berada dalam Wadi '
              '‘Uranah manakala bahagian belakangnya di Arafah, dibezakan '
              'oleh batu-batu besar yang dihampar.',
          teksKitabArabic:
              'وَاعْلَمْ أَنَّهُ لَيْسَ مِنْ عَرَفَاتٍ وَادِي عُرَنَةَ وَلَا '
              'نَمِرَةُ وَلَا الْمَسْجِدُ الَّذِي يُصَلِّي فِيهِ الْإِمَامُ '
              'الْمُسَمَّى مَسْجِدَ إِبْرَاهِيمَ',
          permasalahan: <String>[
            'Menurut al-Juwaini, sesiapa yang berwukuf di bahagian hadapan '
                'masjid tidak sah wukufnya, manakala di bahagian belakang sah. '
                'An-Nawawi mencadangkan mungkin bahagian belakang itu ditambah '
                'selepas zaman asy-Syafi’i (hlm. 275 [278]).',
            'Nota kaki al-Ifsah (memetik al-Majmu’): wukuf di Batn ‘Uranah '
                'tidak sah di sisi Syafi’iyyah dan jumhur. Riwayat bahawa '
                'Imam Malik mengesahkannya dengan dam dinafikan oleh al-'
                '‘Abdari, yang menyatakan mazhab Malik juga tidak sah '
                '(hlm. 274–275 [277–278]).',
            'Nasihat nota kaki al-Ifsah: yang paling berhati-hati ialah '
                'berwukuf di luar hujung belakang masjid, kerana ukuran '
                'al-Fasi didapati sepadan dengan ukuran al-Azraqi yang '
                'sezaman dengan asy-Syafi’i (hlm. 275 [278]).',
            'Kawasan Masjid Namirah yang luas hari ini menyebabkan sebahagian '
                'jemaah menyangka mereka sudah berada di Arafah. Jika selepas '
                'solat jamak mereka kekal di bahagian yang bukan Arafah '
                'sehingga fajar 10 Zulhijjah, Haji mereka luput.',
          ],
        ),
      ),
      LearningSection(
        title: 'Waktu dan Syarat Sah Wukuf',
        points: <String>[
          'Waktu wukuf: dari gelincir matahari 9 Zulhijjah hingga terbit '
              'fajar 10 Zulhijjah.',
          'Kadar minimum: hadir walaupun sesaat di mana-mana bahagian Arafah '
              'dalam waktu tersebut.',
          'Syarat kedua: orang itu ahli ibadah — kanak-kanak dan orang tidur '
              'sah wukufnya, tetapi orang pengsan atau mabuk sepanjang waktu '
              'wukuf tidak sah.',
          'Sah walaupun tidak berniat wukuf, tidak tahu itu Arafah, sekadar '
              'melintas, atau tertidur di atas kenderaan — tetapi kehilangan '
              'kesempurnaan fadilat.',
          'Sesiapa terlepas waktu ini, luput Hajinya pada tahun itu.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic: 'الْحَجُّ عَرَفَةُ',
              terjemahan:
                  'Haji itu (ialah) Arafah — sesiapa yang sempat ke Arafah '
                  'sebelum terbit fajar malam Muzdalifah, dia mendapat Haji.',
              sumber:
                  'Riwayat Abu Dawud, at-Tirmidhi, an-Nasa’i dan Ibn Majah '
                  'daripada ‘Abd ar-Rahman bin Ya’mar; al-Majmu’ (dinukil '
                  'nota kaki al-Ifsah, hlm. 281 [284]) menyatakan sanad-'
                  'sanadnya sahih',
            ),
            DalilItem(
              arabic:
                  'مَنْ شَهِدَ صَلَاتَنَا هَذِهِ، وَقَدْ وَقَفَ بِعَرَفَةَ '
                  'قَبْلَ ذَلِكَ لَيْلًا أَوْ نَهَارًا، فَقَدْ تَمَّ حَجُّهُ',
              terjemahan:
                  'Sesiapa yang menghadiri solat kami ini (Subuh di '
                  'Muzdalifah) dan telah berwukuf di Arafah sebelumnya, '
                  'sama ada pada waktu malam atau siang, maka sempurnalah '
                  'Hajinya.',
              sumber:
                  'Hadis ‘Urwah bin Mudarris r.a. — riwayat at-Tirmidhi '
                  '(no. 891, katanya hasan sahih), Abu Dawud (no. 1950), '
                  'an-Nasa’i (no. 3041) dan Ibn Majah (no. 3016); lafaz '
                  'ringkas seperti dinukil nota kaki al-Ifsah daripada '
                  'al-Majmu’',
            ),
          ],
          teksKitab:
              'Fasal ar-Rabi’, far’ "Wajib al-wuquf", al-Idah, hlm. 276–278 '
              '[279–281]: wajib wukuf ada dua — berada di Arafah dalam waktu '
              'yang ditetapkan, dan menjadi ahli ibadah. An-Nawawi '
              'menyenaraikan pelbagai keadaan yang tetap sah: lalai, sambil '
              'berjual beli atau berbual, tidur, melintas dengan laju tanpa '
              'mengetahui itu Arafah, tertidur di atas unta yang melaluinya, '
              'atau mengejar penghutang atau binatang yang lari.',
          teksKitabArabic:
              'وَهُوَ مِنْ زَوَالِ الشَّمْسِ يَوْمِ عَرَفَةَ إِلَى طُلُوعِ '
              'الْفَجْرِ لَيْلَةَ الْعِيدِ، فَمَنْ حَصَلَ بِعَرَفَةَ فِي '
              'لَحْظَةٍ لَطِيفَةٍ مِنْ هَذَا الْوَقْتِ صَحَّ وُقُوفُهُ '
              'وَأَدْرَكَ الْحَجَّ، وَمَنْ فَاتَهُ ذَلِكَ فَقَدْ فَاتَهُ الْحَجُّ',
          permasalahan: <String>[
            'Nota kaki al-Ifsah: mazhab Malik, Abu Hanifah dan jumhur sama '
                'dengan Syafi’i (bermula gelincir matahari). Imam Ahmad '
                'berpendapat waktu wukuf bermula dari terbit fajar 9 '
                'Zulhijjah berdasarkan zahir hadis ‘Urwah (hlm. 276 [279]).',
            'Orang pengsan: yang asah dalam mazhab tidak sah wukufnya '
                '(nota kaki al-Ifsah: jika pengsan sepanjang waktu wukuf); '
                'Malik dan Abu Hanifah mengesahkannya (hlm. 277 [280]).',
            'Nota kaki al-Ifsah: Abu Thawr berpendapat orang yang melintas '
                'tanpa mengetahui tidak sah kerana tiada kehendak; para imam '
                'yang lain mengesahkannya berdasarkan umum hadis ‘Urwah '
                '(hlm. 278 [281]).',
            'Nota kaki al-Ifsah menegur salah faham terhadap "al-Hajju '
                '‘Arafah" — ia bermaksud rukun yang menentukan dapat atau '
                'luputnya Haji, bukan alasan untuk mengabaikan rukun, wajib '
                'dan sunat yang lain (hlm. 281 [284]). Kesan luput Haji: '
                'lihat Modul 02.',
          ],
        ),
      ),
      LearningSection(
        title: 'Sunnah dan Adab Wukuf',
        points: <String>[
          'Segera ke tempat wukuf selepas solat jamak.',
          'Tempat paling afdal ialah berhampiran batu-batu besar di kaki '
              'Jabal Rahmah, tempat Nabi SAW berwukuf — jika mudah dan tidak '
              'menyakiti orang lain.',
          'Mendaki Jabal Rahmah tiada fadilat khusus; wukuf sah di mana-mana '
              'bahagian Arafah.',
          'Afdal menghadap kiblat, berwuduk dan menutup aurat; wukuf orang '
              'berhadas, berjunub atau haid tetap sah.',
          'Jemaah Haji tidak berpuasa pada hari Arafah supaya kuat berdoa.',
          'Wanita afdal duduk dan berada di pinggir kawasan, jauh daripada '
              'kesesakan.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'مَا الْعَمَلُ فِي أَيَّامٍ أَفْضَلَ مِنْهَا فِي هَذِهِ '
                  'الْأَيَّامِ، قَالُوا: وَلَا الْجِهَادُ؟ قَالَ: وَلَا '
                  'الْجِهَادُ',
              terjemahan:
                  'Tiada amalan pada hari-hari lain yang lebih utama '
                  'daripada amalan pada hari-hari ini (sepuluh awal '
                  'Zulhijjah). Mereka bertanya: "Tidak juga jihad?" Baginda '
                  'menjawab: "Tidak juga jihad…"',
              sumber:
                  'Riwayat al-Bukhari (no. 969) daripada Ibn ‘Abbas r.a.; '
                  'dinukil an-Nawawi dalam sunnah keempat belas wukuf',
            ),
          ],
          teksKitab:
              'Fasal ar-Rabi’, "Sunan al-wuquf wa adabuh", al-Idah, hlm. '
              '278–288 [281–291]: an-Nawawi menyenaraikan empat belas sunnah '
              'dan adab, antaranya mandi di Namirah, tidak memasuki Arafah '
              'sebelum gelincir, menyegerakan wukuf, berada di sisi as-'
              'Sakhrat, berwukuf dalam keadaan berkenderaan jika lebih '
              'membantu doa, menghadap kiblat, tidak berpuasa, hadir hati, '
              'tidak berteduh tanpa keperluan, kekal hingga terbenam '
              'matahari, menjauhi pertengkaran, dan memperbanyak amal soleh '
              'pada sepuluh Zulhijjah.',
          teksKitabArabic:
              'وَهَذَا الَّذِي قَالَاهُ لَا أَصْلَ لَهُ، وَلَمْ يَرِدْ فِيهِ '
              'حَدِيثٌ صَحِيحٌ وَلَا ضَعِيفٌ، وَالصَّوَابُ الِاعْتِنَاءُ '
              'بِمَوْقِفِ رَسُولِ اللَّهِ ﷺ',
          permasalahan: <String>[
            'Petikan Arab di atas ialah sanggahan an-Nawawi terhadap Ibn '
                'Jarir at-Tabari dan al-Mawardi yang menganjurkan wukuf di '
                'atas Jabal Rahmah. Beliau juga menukil Imam al-Haramain: '
                'tiada nusuk dalam mendakinya walaupun menjadi kebiasaan '
                'orang (hlm. 278–279 [281–282]).',
            'Berkenderaan atau berjalan? Jika berjalan menyusahkan, '
                'melemahkan doa, atau dia orang yang menjadi rujukan, '
                'berkenderaan lebih afdal. Jika tidak, ada tiga qaul '
                'asy-Syafi’i: yang asah berkenderaan lebih afdal; kedua, '
                'berjalan; ketiga, sama sahaja (hlm. 279–280 [282–283]).',
            'Tidak berteduh (berpanas) lebih afdal kecuali ada uzur, '
                'seperti mudarat atau doa menjadi kurang. Nota kaki al-Ifsah: '
                'berteduh dengan sesuatu yang tidak menyentuh kepala harus di '
                'sisi Syafi’i dan Abu Hanifah, tetapi Malik dan Ahmad '
                'melarangnya (hlm. 286 [289]).',
            'Sunnah ke-13: jauhi pertengkaran, makian dan kata-kata buruk; '
                'malah kurangkan percakapan harus. Jangan memandang rendah '
                'orang yang lusuh pakaiannya, jangan menengking peminta, dan '
                'cegah kemungkaran dengan lembut (hlm. 287 [290]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Doa, Zikir dan Penghayatan di Arafah',
        points: <String>[
          'Wukuf ialah inti Haji; isilah dengan doa, tahlil, talbiyah, '
              'selawat, istighfar dan bacaan al-Quran secara bergilir.',
          'Angkat tangan ketika berdoa tetapi tidak melebihi kepala; '
              'rendahkan suara, kecuali talbiyah yang dinyaringkan.',
          'Ulang setiap doa tiga kali; mulakan dan akhiri dengan pujian dan '
              'selawat, dan tutup dengan "Amin".',
          'Doakan diri, ibu bapa, kaum kerabat, guru, sahabat dan seluruh '
              'umat Islam.',
          'Tidak perlu memaksa diri menyusun doa bersajak; doa yang lahir '
              'dengan khusyuk lebih utama.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'مَا مِنْ يَوْمٍ أَكْثَرَ مِنْ أَنْ يُعْتِقَ اللَّهُ فِيهِ '
                  'عَبْدًا مِنَ النَّارِ مِنْ يَوْمِ عَرَفَةَ',
              terjemahan:
                  'Tiada hari yang Allah lebih banyak membebaskan hamba '
                  'daripada neraka berbanding hari Arafah; dan Dia '
                  'membanggakan mereka di hadapan para malaikat.',
              sumber:
                  'Riwayat Muslim (no. 1348) daripada ‘A’isyah r.anha; juga '
                  'an-Nasa’i (no. 3003) dan Ibn Majah (no. 3014); dinukil '
                  'an-Nawawi dalam al-Idah',
            ),
          ],
          teksKitab:
              'Fasal ar-Rabi’, sunnah kesepuluh, al-Idah, hlm. 280–285 '
              '[283–288]: an-Nawawi menyebut doa di Arafah sebagai '
              '"sebahagian terbesar Haji, intipatinya dan tujuannya", '
              'menukilkan zikir terbaik hari Arafah dan doa Nabi SAW riwayat '
              '‘Ali r.a., lalu menyenaraikan "doa-doa pilihan". Beliau '
              'menukilkan kata-kata al-Fudayl bin ‘Iyad dan teguran Salim bin '
              '‘Abdillah kepada peminta sedekah: "Wahai yang lemah, pada hari '
              'ini kamu meminta kepada selain Allah?"',
          teksKitabArabic:
              'أَنْ يُكْثِرَ مِنَ الدُّعَاءِ وَالتَّهْلِيلِ وَقِرَاءَةِ '
              'الْقُرْآنِ، فَهَذِهِ وَظِيفَةُ هَذَا الْمَوْضِعِ الْمُبَارَكِ، '
              'وَلَا يُقَصِّرُ فِي ذَلِكَ، فَهُوَ مُعْظَمُ الْحَجِّ وَمُخُّهُ '
              'وَمَطْلُوبُهُ',
          permasalahan: <String>[
            'Doa bersajak: tidak perlu dipaksa, tetapi tidak mengapa jika '
                'sudah dihafal atau keluar tanpa dibuat-buat. Hashiyah Ibn '
                'Hajar (dinukil al-Ifsah) menambah bahawa orang yang mampu '
                'wajar mengelakkan kesalahan bahasa (lahn), manakala orang '
                'yang tidak mampu dimaafkan (hlm. 281–282 [284–285]).',
            'Dalam doa "ظَلَمْتُ نَفْسِي ظُلْمًا كَثِيرًا" terdapat riwayat '
                'dengan tha’ (كَثِيرًا) dan ba’ (كَبِيرًا); nota kaki '
                'al-Ifsah menukil saranan an-Nawawi supaya kedua-duanya '
                'disebut (hlm. 285 [288]).',
            'An-Nawawi menyebut dengan lafaz "qila" bahawa jika hari Arafah '
                'jatuh pada Jumaat, semua yang berwukuf diampunkan. Nota kaki '
                'al-Ifsah menukil Ibn al-Qayyim bahawa dakwaan ia menyamai 72 '
                'kali Haji adalah batil dan tiada asal (hlm. 283–284 '
                '[286–287]).',
            'An-Nawawi turut meriwayatkan hadis Talhah bin ‘Ubaidillah '
                'tentang syaitan paling hina pada hari Arafah dengan lafaz '
                '"rawaina"; takhrij dan darjatnya tidak disahkan di sini.',
          ],
        ),
      ),
      LearningSection(
        title: 'Kekal Hingga Terbenam Matahari',
        points: <String>[
          'Sunat kekal di Arafah sehingga matahari benar-benar terbenam, '
              'supaya wukuf merangkumi siang dan malam.',
          'Jika keluar sebelum terbenam lalu kembali ke Arafah sebelum fajar, '
              'tiada apa-apa ke atasnya.',
          'Jika tidak kembali, dia menyembelih dam; menurut pendapat asah '
              'dalam fasal ini, dam itu sunat, bukan wajib.',
          'Sesiapa yang hanya sampai ke Arafah pada waktu malam tidak '
              'dikenakan apa-apa, cuma terlepas fadilat.',
          'Jangan bertolak sebelum imam atau ketua rombongan tanpa uzur.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Fasal ar-Rabi’, sunnah kedua belas, al-Idah, hlm. 286 [289]: '
              'an-Nawawi menyebut dua qaul asy-Syafi’i tentang dam bagi orang '
              'yang meninggalkan Arafah sebelum terbenam matahari tanpa '
              'kembali; yang asah ialah dam itu mustahab. Orang yang tidak '
              'hadir pada siang hari tidak dikenakan apa-apa.',
          teksKitabArabic:
              'وَإِنْ لَمْ يَعُدْ أَرَاقَ دَمًا، وَهَلْ هُوَ وَاجِبٌ أَوْ '
              'مُسْتَحَبٌّ؟ فِيهِ قَوْلَانِ لِلشَّافِعِيِّ رَحِمَهُ اللَّهُ '
              'تَعَالَى: أَصَحُّهُمَا أَنَّهُ مُسْتَحَبٌّ',
          permasalahan: <String>[
            'Perhatian: dalam Fasal "A’mal al-Hajj thalathah aqsam" (hlm. 373 '
                '[376]), an-Nawawi menyenaraikan jam’ siang–malam di Arafah '
                'antara empat wajib yang diperselisihkan dan berkata "yang '
                'asah keempat-empatnya wajib". Nota kaki al-Ifsah di situ '
                'mengecualikan jam’ siang–malam kerana ia sunat seperti yang '
                'dinyatakan dalam fasal wukuf ini. Bandingkan dengan Modul 02.',
            'Nota kaki al-Ifsah (memetik al-Majmu’): Abu Hanifah dan Ahmad '
                'mewajibkan dam. Imam Malik berpendapat bahagian malam itulah '
                'yang menjadi asas wukuf; sesiapa tidak mendapat sedikit pun '
                'waktu malam, Hajinya luput (hlm. 276–277 [279–280]).',
            'Nota kaki al-Ifsah: yang menjadi khilaf hanyalah orang yang '
                'hadir siang lalu pergi sebelum terbenam kerana dia dianggap '
                'cuai meninggalkan wukuf; orang yang hanya hadir pada malam '
                'Nahar tidak dikenakan dam tanpa khilaf (hlm. 277 [280]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Kes Khusus: Silap Tarikh, Isyak dan Bid’ah',
        points: <String>[
          'Jika seluruh jemaah tersilap lalu berwukuf pada 10 Zulhijjah, Haji '
              'mereka sah tanpa dam.',
          'Jika tersilap ke 8 atau 11 Zulhijjah, atau berwukuf di luar '
              'Arafah, Haji tidak sah.',
          'Orang yang hampir terlepas wukuf sebelum fajar tetapi belum solat '
              'Isyak hendaklah mengutamakan wukuf (pendapat asah).',
          'Berkumpul berdoa pada hari Arafah di masjid negeri sendiri '
              '(at-ta’rif) diperselisihkan ulama dan tidak dianggap bid’ah '
              'yang berat.',
          'Menyalakan lilin di Jabal Arafah pada malam 9 Zulhijjah ialah '
              'bid’ah yang buruk menurut an-Nawawi.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Fasal ar-Rabi’, beberapa far’ terakhir, al-Idah, hlm. 288–292 '
              '[291–295]: an-Nawawi membincangkan kesilapan tarikh wukuf, '
              'pertembungan antara wukuf dan solat Isyak, hukum at-ta’rif di '
              'luar Arafah, serta bid’ah menyalakan lilin di Jabal Arafah '
              'yang menghimpunkan pembaziran harta, syiar Majusi, '
              'percampuran lelaki dan wanita, dan memasuki Arafah sebelum '
              'waktunya.',
          teksKitabArabic:
              'إِذَا غَلِطَ الْحُجَّاجُ فَوَقَفُوا فِي غَيْرِ يَوْمِ عَرَفَةَ '
              'نُظِرَ، إِنْ غَلِطُوا بِالتَّأْخِيرِ فَوَقَفُوا الْعَاشِرَ مِنْ '
              'ذِي الْحِجَّةِ أَجْزَأَهُمْ وَتَمَّ حَجُّهُمْ وَلَا شَيْءَ '
              'عَلَيْهِمْ',
          permasalahan: <String>[
            'Jika yang tersilap ke 10 Zulhijjah hanya sekumpulan kecil, '
                'bukan jemaah umum, Haji mereka tidak sah menurut pendapat '
                'asah. Orang yang kesaksiannya melihat anak bulan ditolak '
                'wajib berwukuf pada hari ke-9 menurut kiraannya sendiri, '
                'walaupun orang ramai berwukuf sehari kemudian (hlm. 289 '
                '[292]).',
            'Hashiyah Ibn Hajar (dinukil al-Ifsah): kesilapan akibat '
                'pengiraan hisab tidak termasuk "ghalat" yang dimaafkan '
                '(hlm. 288 [291]).',
            'Wukuf lawan Isyak: tiga wajh ashab — (1) asah: pergi ke Arafah '
                'dan lewatkan Isyak; (2) solat Isyak di tempatnya kerana solat '
                'segera tuntutannya; (3) solat secara solat syiddat al-khawf '
                'sambil bergerak ke Arafah (hlm. 290–291 [293–294]).',
            'At-ta’rif: sebahagian salaf mengamalkannya (al-Hasan al-Basri '
                'menyebut Ibn ‘Abbas yang mula-mula melakukannya; Imam Ahmad '
                'berkata "aku harap tidak mengapa"), manakala Nafi’, '
                'an-Nakha’i, Malik dan lain-lain memakruhkannya (hlm. 291 '
                '[294]).',
          ],
        ),
      ),
    ],
    duas: <ModuleDua>[
      _duaMenujuArafah,
      _duaTahlilArafah,
      _duaNabiDiArafah,
      _duaIstiqamahArafah,
    ],
    academicInsight:
        'Dalam al-Idah, Imam an-Nawawi membezakan dengan jelas antara '
        'had minimum yang menentukan sah atau luputnya Haji dengan '
        'kesempurnaan yang dikejar. Had minimumnya sangat ringan: hadir '
        'sesaat di mana-mana bahagian Arafah dalam tempoh antara gelincir '
        'matahari dan fajar, walaupun tertidur atau tidak tahu tempat itu '
        'Arafah. Sebaliknya, perbahasan tentang kesempurnaan memenuhi '
        'puluhan halaman, merangkumi Hari Tarwiyah, Namirah, empat belas '
        'sunnah wukuf dan adab berdoa. Beliau juga tegas menolak amalan '
        'yang tiada asas, seperti mengutamakan pendakian Jabal Rahmah, '
        'memasuki Arafah pada hari kelapan dan menyalakan lilin. Jemaah '
        'diajar untuk tenang tentang syarat sah, tetapi bersungguh-sungguh '
        'pada nilai rohani. Ketegasan beliau tentang sempadan Wadi ‘Uranah '
        'pula menunjukkan bahawa kesahan ibadah tetap bergantung pada '
        'ketepatan tempat dan waktu.',
    reflectionQuestions: <String>[
      'Mengapakah an-Nawawi begitu ringan tentang syarat sah wukuf (hadir '
          'sesaat walaupun tidur), tetapi begitu tegas tentang sempadan Wadi '
          '‘Uranah?',
      'Antara mendaki Jabal Rahmah dan duduk tenang berdoa di khemah, '
          'manakah lebih hampir dengan sunnah menurut al-Idah, dan mengapa?',
      'Bagaimanakah anda boleh menyusun masa dari Zuhur hingga Maghrib di '
          'Arafah supaya "intipati Haji" ini tidak terbazir?',
    ],
  ),

  // -------------------------------------------------------------------------
  // MODUL 11 — Muzdalifah & Bertolak ke Mina
  // -------------------------------------------------------------------------
  LearningModuleData(
    number: '11',
    title: 'Muzdalifah & Bertolak ke Mina',
    subtitle:
        'Ifadah, jamak, mabit, batu jamrah, Masy’aril Haram dan '
        'Muhassir.',
    icon: HajjIconType.muzdalifah,
    accent: Color(0xFF3887B6),
    sections: <LearningSection>[
      LearningSection(
        title: 'Ifadah dari Arafah dan Sempadan Muzdalifah',
        points: <String>[
          'Bertolak dari Arafah selepas pasti matahari terbenam, mengikut '
              'imam atau ketua rombongan.',
          'Bergerak dengan tenang sambil bertalbiyah dan berzikir; jika ada '
              'ruang lapang, boleh mempercepatkan perjalanan.',
          'Muzdalifah ialah kawasan antara al-Ma’zimain dan Wadi Muhassir, '
              'termasuk lereng dan bukit di kiri kanannya.',
          'Al-Ma’zimain dan Wadi Muhassir bukan sebahagian Muzdalifah.',
          'Muzdalifah termasuk dalam Tanah Haram, berbeza dengan Arafah.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'ثُمَّ أَفِيضُوا مِنْ حَيْثُ أَفَاضَ النَّاسُ وَاسْتَغْفِرُوا '
                  'اللَّهَ إِنَّ اللَّهَ غَفُورٌ رَحِيمٌ',
              terjemahan:
                  'Kemudian bertolaklah kamu dari tempat orang ramai '
                  'bertolak, dan mohonlah keampunan Allah; sesungguhnya '
                  'Allah Maha Pengampun lagi Maha Penyayang.',
              sumber: 'Al-Baqarah (2):199',
            ),
          ],
          teksKitab:
              'Fasal al-Khamis (al-Ifadah min ‘Arafat ila al-Muzdalifah), '
              'al-Idah, hlm. 292–293 [295–296]: sunnah ialah imam bertolak '
              'selepas pasti terbenam matahari dan orang ramai bersamanya, '
              'melewatkan Maghrib dengan niat jamak ke waktu Isyak, melalui '
              'jalan al-Ma’zimain. Jarak Makkah–Mina, Mina–Muzdalifah dan '
              'Muzdalifah–Arafah masing-masing satu farsakh (tiga batu).',
          teksKitabArabic:
              'وَلَيْسَ الْمَأْزِمَانِ وَلَا وَادِي مُحَسِّرٍ مِنْ '
              'مُزْدَلِفَةَ ... وَإِذَا سَارَ إِلَى الْمُزْدَلِفَةِ سَارَ '
              'مُلَبِّيًا مُكْثِرًا مِنْهَا، وَيَسِيرُ عَلَى هِينَتِهِ '
              'وَعَادَةِ مَشْيِهِ بِسَكِينَةٍ وَوَقَارٍ',
          permasalahan: <String>[
            'Hashiyah Ibn Hajar (dinukil al-Ifsah): makruh bagi jemaah '
                'bertolak sebelum imam tanpa uzur seperti kesesakan. Kata-'
                'kata an-Nawawi "tidak mengapa mendahului imam" bermaksud '
                'tidak haram, bukan tidak makruh (hlm. 292–294 [295–297]).',
            'Nota kaki al-Ifsah menghuraikan tiga kelajuan Nabi SAW: tenang '
                'ketika sesak, "al-‘anaq" (laju sederhana) ketika kurang '
                'sesak, dan "an-nass" (paling laju) ketika lapang '
                '(hlm. 293 [296]).',
            'Makna nama Wadi Muhassir menurut an-Nawawi: gajah tentera '
                'Abrahah keletihan (hasara) di situ. Nota kaki al-Ifsah '
                'menukil pandangan al-Fasi dan Ibn al-Athir bahawa gajah itu '
                'tidak pernah memasuki Tanah Haram (hlm. 293 [296]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Jamak Maghrib dan Isyak di Muzdalifah',
        points: <String>[
          'Maghrib dilewatkan dan dijamak takhir bersama Isyak di Muzdalifah.',
          'Jika bimbang waktu ikhtiyar Isyak akan habis sebelum sampai, solat '
              'jamak di pertengahan jalan.',
          'Sebaik tiba, solat dahulu sebelum menurunkan barang dan menyusun '
              'tempat.',
          'Satu azan dan dua iqamah (pendapat asah).',
          'Jika solat setiap satu pada waktunya, jamak taqdim, atau solat '
              'sendirian, solatnya sah, cuma terlepas fadilat.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic: 'الصَّلَاةُ أَمَامَكَ',
              terjemahan:
                  'Solat itu di hadapanmu (iaitu di Muzdalifah) — jawapan '
                  'Nabi SAW kepada Usamah bin Zaid r.a. yang mengingatkan '
                  'Baginda tentang solat Maghrib dalam perjalanan dari '
                  'Arafah.',
              sumber:
                  'Riwayat al-Bukhari (no. 1670) dan Muslim (no. 1280) '
                  'daripada Usamah bin Zaid r.a.',
            ),
          ],
          teksKitab:
              'Fasal al-Khamis, al-Idah, hlm. 294–295 [297–298]: jumhur ashab '
              'menyebut kedua-dua solat dilewatkan hingga ke Muzdalifah, '
              'manakala sebahagian ashab mensyaratkan selagi tidak bimbang '
              'terlepas waktu ikhtiyar Isyak (sepertiga malam menurut qaul '
              'asah, separuh malam menurut qaul lain). Asy-Syafi’i '
              'menganjurkan solat sebelum menurunkan barang berdasarkan '
              'hadis Usamah dalam Sahihain.',
          teksKitabArabic:
              'فَقَدِ اسْتَحَبَّ الشَّافِعِيُّ رَحِمَهُ اللَّهُ تَعَالَى أَنْ '
              'يُصَلِّيَ قَبْلَ حَطِّ رَحْلِهِ ... ثُمَّ إِنَّ الْجَمْعَ '
              'بَيْنَهُمَا يَكُونُ عَلَى الْأَصَحِّ بِأَذَانٍ وَبِإِقَامَتَيْنِ '
              'لَهُمَا',
          permasalahan: <String>[
            'Nota kaki al-Ifsah (memetik al-Majmu’): ulama sepakat harus '
                'jamak di Muzdalifah bagi musafir. Di sisi Syafi’i, '
                'Malik dan Ahmad, jamak di tempat lain atau pada waktu '
                'Maghrib juga harus; Abu Hanifah, ath-Thawri dan Dawud tidak '
                'membenarkannya sebelum Muzdalifah. Punca khilaf: jamak '
                'kerana musafir (Syafi’i) atau kerana nusuk (Hanafi) '
                '(hlm. 295 [298]).',
            'Bilangan azan dan iqamah — nota kaki al-Ifsah: satu azan dan '
                'dua iqamah ialah mazhab Syafi’i dan Ahmad berdasarkan hadis '
                'Jabir dalam Sahih Muslim; Abu Hanifah satu azan satu '
                'iqamah; Malik dua azan dua iqamah (hlm. 295 [298]).',
            'Hashiyah Ibn Hajar: perbuatan menambat unta di antara dua solat '
                'dalam hadis Usamah dikecualikan daripada sunnah '
                'berturut-turut (muwalat) dalam jamak takhir '
                '(hlm. 294 [297]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Mabit di Muzdalifah: Hukum dan Kadar Minimum',
        points: <String>[
          'Bermalam di Muzdalifah ialah nusuk, dan asy-Syafi’i mempunyai dua '
              'qaul tentang statusnya: wajib atau sunat.',
          'Kadar minimum: hadir sebentar di mana-mana bahagian Muzdalifah '
              'selepas tengah malam (nas asy-Syafi’i dalam al-Umm).',
          'Keluar selepas tengah malam, atau keluar sebelum tengah malam '
              'tetapi kembali sebelum fajar — tiada apa-apa.',
          'Tidak bermalam langsung, atau keluar sebelum tengah malam tanpa '
              'kembali — Haji sah, tetapi dikenakan dam.',
          'Yang afdal ialah kekal hingga Subuh, kemudian berwukuf di '
              'Masy’aril Haram sehingga hampir terbit matahari.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Fasal al-Khamis, al-Idah, hlm. 295–297 [298–300]: an-Nawawi '
              'menyebut dua qaul tanpa mentarjih di sini — jika mabit wajib, '
              'damnya wajib; jika sunat, damnya sunat. Beliau menegaskan '
              'bahawa nas al-Umm yang mencukupkan "sesaat" pada separuh '
              'kedua malam tidak diketahui oleh sebahagian ashab yang '
              'berpendapat sebaliknya, dan pendapat mereka tidak diterima. '
              'Tarjih wajib dinyatakan kemudian dalam Fasal "A’mal al-Hajj '
              'thalathah aqsam": "yang asah keempat-empatnya wajib" (hlm. 373 '
              '[376]).',
          teksKitabArabic:
              'فَإِذَا وَصَلُوا مُزْدَلِفَةَ بَاتُوا، وَهَذَا الْمَبِيتُ '
              'نُسُكٌ، وَهَلْ هُوَ وَاجِبٌ أَمْ سُنَّةٌ؟ قَوْلَانِ '
              'لِلشَّافِعِيِّ ... وَحَضَرَهَا سَاعَةً فِي النِّصْفِ الثَّانِي '
              'مِنَ اللَّيْلِ حَصَلَ الْمَبِيتُ',
          permasalahan: <String>[
            'Dua imam besar mazhab, Abu ‘Abd ar-Rahman Ibn Bint asy-Syafi’i '
                'dan Ibn Khuzaimah, berpendapat mabit Muzdalifah ialah RUKUN; '
                'maka an-Nawawi menyeru agar bersungguh-sungguh bermalam '
                'untuk keluar daripada khilaf. Nota kaki al-Ifsah: pendapat '
                'ini didahului lima tabi’in — ‘Alqamah, al-Aswad, asy-'
                'Sya’bi, an-Nakha’i dan al-Hasan al-Basri (hlm. 296–297 '
                '[299–300]).',
            'Hashiyah Ibn Hajar (dinukil al-Ifsah): melintas di Muzdalifah '
                'selepas tengah malam pun memadai, seperti di Arafah, menurut '
                'as-Subki. Bagi Imam Malik pula, perlu turun dan berhenti '
                '(hlm. 296 [299]).',
            'Mengapa Muzdalifah cukup sesaat sedangkan Mina perlu sebahagian '
                'besar malam? Hashiyah: kerana dalil Mina berbentuk perintah '
                '"bermalam", manakala Nabi SAW sendiri membenarkan golongan '
                'lemah bertolak selepas tengah malam (hlm. 296 [299]).',
            'Orang yang meninggalkan mabit kerana uzur tidak dikenakan apa-apa '
                '(al-Idah, Fasal ath-Thamin, hlm. 356 [359]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Malam Hari Raya di Muzdalifah',
        points: <String>[
          'Malam 10 Zulhijjah ialah malam yang agung kerana menghimpunkan '
              'kemuliaan masa, tempat (Tanah Haram) dan para tetamu Allah.',
          'Sunat mandi di Muzdalifah pada waktu malam untuk wukuf di '
              'Masy’aril Haram dan untuk Hari Raya; jika tiada air, '
              'bertayamum.',
          'Isi malam dengan solat, bacaan al-Quran, zikir, doa dan rintihan '
              'kepada Allah mengikut kemampuan.',
          'Selepas tengah malam, bersiap untuk ke Mina dan kutip batu.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Fasal al-Khamis, al-Idah, hlm. 297–298 [300–301]: an-Nawawi '
              'menyifatkan malam ini sebagai "malam yang menghimpunkan '
              'pelbagai kelebihan": kemuliaan masa dan tempat, serta '
              'kehadiran tetamu Allah yang tidak akan celaka orang yang '
              'duduk bersama mereka.',
          teksKitabArabic:
              'وَيُسْتَحَبُّ أَنْ يَغْتَسِلَ فِي مُزْدَلِفَةَ بِاللَّيْلِ '
              'لِلْوُقُوفِ بِالْمَشْعَرِ الْحَرَامِ وَلِلْعِيدِ ... فَيَنْبَغِي '
              'أَنْ يَعْتَنِيَ الْحَاضِرُ بِهَا بِإِحْيَائِهَا بِالْعِبَادَةِ '
              'مِنَ الصَّلَاةِ وَالتِّلَاوَةِ وَالذِّكْرِ وَالدُّعَاءِ '
              'وَالتَّضَرُّعِ',
          permasalahan: <String>[
            'Hashiyah Ibn Hajar (dinukil al-Ifsah): Ibn Jama’ah dan Ibn '
                'as-Salah menolak sunnah menghidupkan malam ini kerana Nabi '
                'SAW tidur selepas solat hingga fajar dan kerana penat jemaah. '
                'Ibn Hajar menolak hujah itu kerana ihya’ boleh berlaku dengan '
                'zikir dan tafakur, tidak semestinya berjaga sepanjang malam '
                '(hlm. 297–298 [300–301]).',
            'Nota kaki al-Ifsah: solat yang dimaksudkan ialah solat rawatib; '
                'solat sunat mutlak tidak disunatkan pada malam ini '
                '(hlm. 298 [301]).',
            'Nota kaki al-Ifsah: waktu mandi bermula selepas tengah malam, '
                'dan yang afdal selepas Subuh (hlm. 297 [300]). Secara '
                'praktikal, rehat yang cukup juga penting kerana hari Nahar '
                'ialah hari paling banyak amalan manasik.',
          ],
        ),
      ),
      LearningSection(
        title: 'Mengutip Batu untuk Jamrah',
        points: <String>[
          'Kutip tujuh biji batu di Muzdalifah untuk Jamrah ‘Aqabah pada '
              'hari Nahar; lebihkan sedikit sebagai simpanan.',
          'Saiz batu sebesar batu "khadhf" — lebih kecil daripada hujung '
              'jari, kira-kira sebesar biji kacang fava.',
          'Jangan memecahkan batu besar kecuali ada keperluan; kutip sahaja '
              'batu-batu kecil.',
          'Makruh mengambil batu dari masjid, tandas, tempat najis dan '
              'kawasan jamrah yang sudah dilontar; namun jika dilontar juga, '
              'tetap sah.',
          'Tidak makruh membasuh batu; asy-Syafi’i berkata beliau sentiasa '
              'melakukannya.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Fasal al-Khamis, al-Idah, hlm. 298–300 [301–303]: sebahagian '
              'ashab berpendapat batu untuk hari-hari Tasyriq (63 biji) juga '
              'dikutip di Muzdalifah, tetapi jumhur berpendapat yang lebih '
              'utama ialah mengutipnya di tempat lain. Kedua-dua pandangan '
              'dinukil daripada asy-Syafi’i. Mengutip pada waktu malam ialah '
              'pendapat jumhur dan yang terpilih (al-mukhtar), supaya tidak '
              'sibuk selepas Subuh.',
          teksKitabArabic:
              'وَيَأْخُذُ مِنَ الْمُزْدَلِفَةِ حَصَى الْجِمَارِ لِجَمْرَةِ '
              'الْعَقَبَةِ يَوْمَ النَّحْرِ، وَهِيَ سَبْعُ حَصِيَّاتٍ، '
              'وَالِاحْتِيَاطُ أَنْ يَزِيدَ فَرُبَّمَا سَقَطَ مِنْهَا شَيْءٌ',
          permasalahan: <String>[
            'Waktu mengutip: jumhur mengatakan pada waktu malam; ada pendapat '
                'selepas Subuh. Hashiyah Ibn Hajar (dinukil al-Ifsah) '
                'menyebut al-Isnawi mentarjih selepas Subuh berdasarkan '
                'hadis al-Fadl "التقط لي حصى" pada pagi Nahar, dan Ibn Hajar '
                'mengakui zahir hadis menyokongnya (hlm. 299 [302]).',
            'Sebab makruh mengambil dari kawasan jamrah: athar Ibn ‘Abbas '
                'r.a. — batu yang diterima akan diangkat, yang tidak diterima '
                'ditinggalkan; jika tidak, nescaya batu itu memenuhi ruang '
                'antara dua bukit. Sebahagian ashab memakruhkan seluruh Mina '
                '(hlm. 300 [303]).',
            'Makruh menggunakan batu yang lebih besar, dan ada larangan '
                'memecahkan batu di sini kerana serpihannya boleh '
                'mencederakan (hlm. 299–300 [302–303]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Golongan Lemah Bertolak Awal ke Mina',
        points: <String>[
          'Sunnah mendahulukan golongan lemah — wanita, warga emas, orang '
              'sakit dan seumpamanya — ke Mina selepas tengah malam, sebelum '
              'fajar.',
          'Tujuannya supaya mereka dapat melontar Jamrah ‘Aqabah sebelum '
              'kesesakan.',
          'Jemaah lain kekal di Muzdalifah sehingga solat Subuh.',
          'Solat Subuh di Muzdalifah disegerakan di awal waktu, lebih awal '
              'daripada hari-hari lain.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'اسْتَأْذَنَتْ سَوْدَةُ رَسُولَ اللَّهِ لَيْلَةَ جَمْعٍ، '
                  'وَكَانَتْ ثَقِيلَةً ثَبِطَةً، فَأَذِنَ لَهَا',
              terjemahan:
                  'Saudah r.anha meminta izin Rasulullah SAW pada malam '
                  'Muzdalifah (untuk bertolak lebih awal), kerana beliau '
                  'seorang yang berbadan berat dan lambat bergerak, lalu '
                  'Baginda mengizinkannya.',
              sumber:
                  'Riwayat al-Bukhari (no. 1681) dan Muslim (no. 1290) '
                  'daripada ‘A’isyah r.anha; dinukil nota kaki al-Ifsah',
            ),
            DalilItem(
              arabic:
                  'بَعَثَنِي رَسُولُ اللَّهِ فِي الثَّقَلِ وَفِي الضَّعَفَةِ '
                  'مِنْ جَمْعٍ بِلَيْلٍ',
              terjemahan:
                  'Rasulullah SAW mengutus aku bersama barang-barang dan '
                  'golongan lemah dari Muzdalifah pada waktu malam.',
              sumber:
                  'Riwayat Muslim (no. 1293) daripada Ibn ‘Abbas r.a.; juga '
                  'at-Tirmidhi (no. 892) dan Ibn Majah (no. 3026)',
            ),
          ],
          teksKitab:
              'Akhir Fasal al-Khamis dan awal Fasal as-Sadis (ad-Daf’ ila Mina), al-Idah, hlm. 300–301 '
              '[303–304]: an-Nawawi menyebut sunnah mendahulukan golongan '
              'lemah selepas tengah malam, manakala yang lain kekal untuk '
              'solat Subuh di Muzdalifah. Ashab menegaskan solat Subuh pada '
              'hari ini lebih dituntut disegerakan berbanding hari-hari lain, '
              'kerana tiada hari Haji yang lebih banyak amalannya daripada '
              'hari Nahar.',
          teksKitabArabic:
              'السُّنَّةُ أَنْ يُقَدِّمَ الضَّعَفَةَ مِنَ النِّسَاءِ '
              'وَغَيْرِهِنَّ قَبْلَ طُلُوعِ الْفَجْرِ إِلَى مِنًى لِيَرْمُوا '
              'جَمْرَةَ الْعَقَبَةِ قَبْلَ زَحْمَةِ النَّاسِ، وَيَكُونُ '
              'تَقْدِيمُهُمْ بَعْدَ نِصْفِ اللَّيْلِ',
          permasalahan: <String>[
            'Nota kaki al-Ifsah: wanita yang didahulukan hendaklah bersama '
                'mahram (hlm. 301 [304]).',
            'Nota kaki al-Ifsah: orang yang tidak lemah kekal hingga Subuh '
                'untuk keluar daripada khilaf ulama yang mewajibkan solat '
                'Subuh di Muzdalifah. Abu Hanifah mewajibkan dam ke atas '
                'orang yang tiada di Muzdalifah selepas fajar, kecuali '
                'kerana uzur (hlm. 297 [300]; hlm. 301 [304]).',
            'Dalam konteks hari ini, pergerakan bas biasanya diatur oleh '
                'pihak berkuasa. Selagi seseorang telah berada di Muzdalifah '
                'selepas tengah malam, mabitnya sudah terhasil menurut '
                'al-Idah walaupun bertolak sebelum Subuh.',
          ],
        ),
      ),
      LearningSection(
        title: 'Wukuf di Masy’aril Haram (Quzah)',
        points: <String>[
          'Selepas Subuh, jemaah bergerak ke Quzah — bukit kecil di hujung '
              'Muzdalifah yang dinamakan Masy’aril Haram.',
          'Daki jika mampu; jika tidak, berdiri di sisi atau di bawahnya '
              'sambil menghadap Kaabah.',
          'Berdoa, bertahmid, bertakbir, bertahlil, mentauhidkan Allah dan '
              'memperbanyak talbiyah.',
          'Jika berwukuf di bahagian lain Muzdalifah, asal sunnah tetap '
              'diperoleh.',
          'Bertolak ke Mina selepas langit sangat terang, sebelum matahari '
              'terbit.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'فَإِذَا أَفَضْتُمْ مِنْ عَرَفَاتٍ فَاذْكُرُوا اللَّهَ '
                  'عِنْدَ الْمَشْعَرِ الْحَرَامِ وَاذْكُرُوهُ كَمَا هَدَاكُمْ',
              terjemahan:
                  'Apabila kamu bertolak dari Arafah, maka sebutlah (nama) '
                  'Allah di sisi al-Masy’ar al-Haram, dan ingatlah Dia '
                  'sebagaimana Dia telah memberi petunjuk kepada kamu.',
              sumber: 'Al-Baqarah (2):198',
            ),
            DalilItem(
              arabic:
                  'كَانَ أَهْلُ الْجَاهِلِيَّةِ لَا يُفِيضُونَ مِنْ جَمْعٍ '
                  'حَتَّى تَطْلُعَ الشَّمْسُ، وَيَقُولُونَ: أَشْرِقْ ثَبِيرُ، '
                  'فَخَالَفَهُمْ',
              terjemahan:
                  'Orang Jahiliah tidak bertolak dari Muzdalifah sehingga '
                  'matahari terbit, sambil berkata "Terbitlah (matahari), '
                  'wahai Thabir!", lalu Nabi SAW menyalahi mereka dengan '
                  'bertolak sebelum matahari terbit.',
              sumber:
                  'Riwayat al-Bukhari (no. 1684) daripada ‘Umar r.a.; juga '
                  'Abu Dawud, at-Tirmidhi, an-Nasa’i dan Ibn Majah; dinukil '
                  'nota kaki al-Ifsah',
            ),
          ],
          teksKitab:
              'Fasal as-Sadis, al-Idah, hlm. 301–304 [304–307]: an-Nawawi '
              'menyatakan orang ramai telah menggantikan wukuf di Bukit Quzah '
              'dengan wukuf di sebuah binaan baharu di tengah Muzdalifah. Ada '
              'pendapat mengatakan asal sunnah tidak terhasil dengannya, '
              'tetapi yang azhar ialah ia terhasil, seperti yang ditegaskan '
              'ar-Rafi’i, berdasarkan hadis Sahih Muslim "Jam’ (Muzdalifah) '
              'seluruhnya tempat wukuf". Jika sunnah ini terlepas sepenuhnya, '
              'ia tidak perlu ditampung dengan dam.',
          teksKitabArabic:
              'فَإِذَا وَصَلُوا قُزَحَ ... وَهُوَ آخِرُ الْمُزْدَلِفَةِ، '
              'وَهُوَ جَبَلٌ صَغِيرٌ، وَهُوَ الْمَشْعَرُ الْحَرَامُ، صَعِدَهُ '
              'إِنْ أَمْكَنَهُ، وَإِلَّا وَقَفَ عِنْدَهُ أَوْ تَحْتَهُ',
          permasalahan: <String>[
            'Takrif al-Masy’ar al-Haram: menurut mazhab Syafi’i ialah Quzah; '
                'jumhur ahli tafsir, hadis dan sirah mentakrifkannya sebagai '
                'seluruh Muzdalifah (nota kaki al-Ifsah memetik al-Majmu’, '
                'hlm. 301–302 [304–305]).',
            'Nota kaki al-Ifsah: Quzah kini berada di dalam kawasan Masjid '
                'Masy’aril Haram (Masjid Muzdalifah) yang diperbaharui pada '
                '1397H; menara lama di atas Quzah terletak di sebelah kanan '
                'mihrab (hlm. 303 [306]).',
            'Hikmah bertolak sebelum matahari terbit ialah menyalahi amalan '
                'Jahiliah. Batas tunggu ialah "isfar" — pagi sudah sangat '
                'terang hingga wajah boleh dikenal (nota kaki al-Ifsah, hlm. '
                '304 [307]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Wadi Muhassir dan Tiba di Mina',
        points: <String>[
          'Bergerak ke Mina dengan tenang, bertalbiyah dan berzikir.',
          'Apabila sampai di Wadi Muhassir, percepatkan langkah atau '
              'kenderaan sejauh lontaran batu sehingga melepasi lebar lembah.',
          'Wadi Muhassir bukan sebahagian Muzdalifah dan bukan sebahagian '
              'Mina — ia lembah aliran air di antara keduanya.',
          'Ambil jalan tengah yang menuju ke Jamrah ‘Aqabah, dan mulakan '
              'amalan Mina dengan melontar Jamrah ‘Aqabah.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Fasal as-Sadis, al-Idah, hlm. 304–306 [307–309]: an-Nawawi '
              'menganjurkan supaya mempercepatkan langkah di Wadi Muhassir '
              'sejauh lontaran batu, kemudian keluar menuju Mina melalui '
              'jalan tengah yang menuju ke al-‘Aqabah. Beliau menegaskan '
              'Muhassir bukan sebahagian Muzdalifah mahupun Mina. Had Mina '
              'pula ialah antara Wadi Muhassir dan Jamrah ‘Aqabah (Fasal '
              'as-Sabi’).',
          teksKitabArabic:
              'وَلَيْسَ وَادِي مُحَسِّرٍ مِنَ الْمُزْدَلِفَةِ وَلَا مِنْ '
              'مِنًى، بَلْ هُوَ مَسِيلُ مَا بَيْنَهُمَا',
          permasalahan: <String>[
            'Kesan fiqh: jemaah yang "bermalam" di Wadi Muhassir tidak '
                'dikira mabit di Muzdalifah, dan pada malam-malam Tasyriq '
                'tidak dikira mabit di Mina. Pastikan khemah berada dalam '
                'sempadan yang betul.',
            'Nota kaki al-Ifsah (hashiyah): dalam al-Imla’ asy-Syafi’i tidak '
                'menganjurkan mempercepatkan langkah kerana belum sampai '
                'hadis kepadanya; kemudian dalam al-Umm beliau menetapkannya. '
                'Al-Majmu’ menyatakan sunnah ini disepakati (hlm. 304–305 '
                '[307–308]).',
            'Hikmah mempercepatkan langkah: menurut al-Majmu’, kaum Nasrani '
                'dahulu berhenti di situ; ada pendapat kerana ia tempat '
                'kebinasaan tentera bergajah. Al-Isnawi menyamakannya dengan '
                'perkampungan Thamud, namun hashiyah menukil bantahan bahawa '
                'azab tentera bergajah berlaku di al-Mughammas, bukan di sini '
                '(hlm. 305 [308]).',
            'Ukuran Wadi Muhassir menurut al-Azraqi ialah 545 hasta '
                '(nota kaki al-Ifsah, hlm. 293 [296]).',
          ],
        ),
      ),
    ],
    duas: <ModuleDua>[_duaSampaiMuzdalifah, _duaMasyaril, _duaRabbanaMasyaril],
    academicInsight:
        'Fasal kelima dan keenam al-Idah memperlihatkan keseimbangan fiqh '
        'antara rukhsah dan ihtiyat. Di satu sisi, mabit Muzdalifah cukup '
        'dengan hadir sesaat selepas tengah malam, golongan lemah digalakkan '
        'bertolak awal, dan wukuf di Masy’aril Haram dianggap memadai di '
        'mana-mana bahagian Muzdalifah. Di sisi lain, an-Nawawi tetap '
        'menyeru jemaah bersungguh-sungguh bermalam kerana dua imam mazhab '
        'menganggapnya rukun. Inilah prinsip keluar daripada khilaf. Beliau '
        'juga menyandarkan hukum pada nas yang sahih: menolak pendapat ashab '
        'yang tidak mengetahui nas al-Umm, dan menerima wukuf di binaan '
        'baharu berdasarkan hadis "Jam’ seluruhnya tempat wukuf". '
        'Pendekatan ini membantu jemaah moden yang bergantung pada jadual '
        'bas dan kesesakan memahami batas minimum yang sah, tanpa '
        'mengabaikan sunnah yang sempurna.',
    reflectionQuestions: <String>[
      'Mengapakah an-Nawawi menganjurkan "keluar daripada khilaf" dalam '
          'isu mabit Muzdalifah walaupun kadar minimumnya hanya sesaat '
          'selepas tengah malam?',
      'Apakah kesan fiqh jika khemah atau tempat berhenti jemaah berada di '
          'Wadi Muhassir, bukan di Muzdalifah atau Mina?',
      'Bagaimanakah kelonggaran untuk golongan lemah dalam hadis Saudah '
          'r.anha boleh diterapkan secara bertanggungjawab dalam pengurusan '
          'jemaah warga emas hari ini?',
    ],
  ),
];
