import 'package:flutter/material.dart';

import '../islamic_icons.dart';
import '../learning_module_screen.dart';
import '../shared_widgets.dart';

// ---------------------------------------------------------------------------
// MODUL 14 & 15 — berdasarkan al-Idah fi Manasik al-Hajj wa al-‘Umrah karangan
// Imam an-Nawawi (Shamela, book_id 96232):
//   * Bab 5: al-Muqam bi Makkah wa Tawaf al-Wada’ (hlm. 385–442)
//   * Bab 6: Ziarah Qabr Rasulillah SAW (hlm. 443–465)
// Rujukan halaman: page_id Shamela, diikuti halaman cetakan dalam [ ].
// Bahan nota kaki (al-Ifsah oleh ‘Abd al-Fattah Rawah, termasuk nukilan
// hasyiah Ibn Hajar al-Haytami) dilabel secara jelas dan tidak dinisbahkan
// kepada Imam an-Nawawi.
// ---------------------------------------------------------------------------

const List<LearningModuleData> idahModulesBab5Bab6 = <LearningModuleData>[
  // =========================================================================
  // MODUL 14 — BERMUKIM DI MAKKAH & TAWAF WADA’ (Bab 5)
  // =========================================================================
  LearningModuleData(
    number: '14',
    title: 'Bermukim di Makkah & Tawaf Wada’',
    subtitle:
        'Kelebihan Makkah, adab di Masjidil Haram, hukum Tanah Haram dan Tawaf Wada’.',
    icon: HajjIconType.tawafWada,
    accent: Color(0xFF7A6CB1),
    sections: <LearningSection>[
      // 1. Kelebihan Makkah (masalah 1, 13, 35)
      LearningSection(
        title: 'Kelebihan Makkah dan gandaan pahala',
        points: <String>[
          'Menurut mazhab Syafi’i, Makkah ialah tempat paling afdal di muka bumi.',
          'Selepas selesai manasik, rebutlah baki masa di Makkah dengan memperbanyak Umrah dan Tawaf sunat.',
          'Solat di Masjidil Haram lebih afdal daripada solat di masjid lain; gandaan pahala turut meliputi puasa, sedekah, bacaan al-Quran dan ketaatan lain.',
          'Tinggal lama (mujawarah) di Makkah adalah sunat, kecuali bagi orang yang bimbang dirinya terjebak dalam dosa atau hilang rasa hormat kepada Tanah Haram.',
          'Ingat pesanan Umar r.a.: satu kesalahan di Makkah lebih berat baginya daripada tujuh puluh kesalahan di tempat lain.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'وَاللَّهِ إِنَّكِ لَخَيْرُ أَرْضِ اللَّهِ، وَأَحَبُّ أَرْضِ '
                  'اللَّهِ إِلَى اللَّهِ، وَلَوْلَا أَنِّي أُخْرِجْتُ مِنْكِ مَا '
                  'خَرَجْتُ',
              terjemahan:
                  'Demi Allah, sesungguhnya engkau (Makkah) adalah sebaik-baik '
                  'bumi Allah dan bumi Allah yang paling dicintai-Nya; '
                  'sekiranya aku tidak dikeluarkan daripadamu, nescaya aku '
                  'tidak akan keluar — dalil utama mazhab bahawa Makkah lebih '
                  'afdal daripada Madinah.',
              sumber:
                  'Riwayat at-Tirmidhi (al-Manaqib, no. 3925) dan Ibn Majah '
                  '(al-Manasik, no. 3108) daripada ‘Abdullah bin ‘Adi bin '
                  'al-Hamra’ r.a.; at-Tirmidhi menilainya hasan sahih — '
                  'dinukil dalam al-Idah, Bab 5, masalah 1',
            ),
            DalilItem(
              arabic:
                  'صَلَاةٌ فِي مَسْجِدِي هَذَا خَيْرٌ مِنْ أَلْفِ صَلَاةٍ '
                  'فِيمَا سِوَاهُ إِلَّا الْمَسْجِدَ الْحَرَامَ',
              terjemahan:
                  'Satu solat di masjidku ini lebih baik daripada seribu solat '
                  'di masjid lain, kecuali Masjidil Haram.',
              sumber:
                  'Riwayat al-Bukhari dan Muslim daripada Abu Hurairah r.a., '
                  'sebagaimana dinukil dalam al-Idah, Bab 5, masalah 1',
            ),
          ],
          teksKitab:
              'Dalam masalah pertama Bab Kelima (al-Muqam bi Makkah wa Tawaf '
              'al-Wada’), Imam an-Nawawi menyatakan bahawa Makkah tempat paling '
              'afdal menurut mazhab Syafi’i, pendapat majoriti fuqaha dan '
              'riwayat yang lebih sahih daripada Imam Ahmad, sedangkan Imam '
              'Malik berpendapat Madinah lebih afdal. Beliau lalu menganjurkan '
              'jemaah merebut masa bermukim dengan memperbanyak Umrah dan '
              'Tawaf (al-Idah, Bab 5, masalah 1, hlm. 385–386 [388–389]). '
              'Dalam masalah ke-13 beliau memilih bahawa mujawarah di Makkah '
              'sunat selagi tidak dikhuatiri terjerumus ke dalam perkara '
              'terlarang (hlm. 399–400 [402–403]).',
          teksKitabArabic:
              'مَكَّةُ أَفْضَلُ بِقَاعِ الْأَرْضِ عِنْدَنَا وَعِنْدَ جَمَاعَةٍ '
              'مِنَ الْعُلَمَاءِ ... فَيَنْبَغِي لِلْحَاجِّ أَنْ يَغْتَنِمَ '
              'بَعْدَ قَضَاءِ مَنَاسِكِهِ مُدَّةَ مُقَامِهِ بِمَكَّةَ، '
              'وَيَسْتَكْثِرَ مِنَ الِاعْتِمَارِ وَمِنَ الطَّوَافِ فِي '
              'الْمَسْجِدِ الْحَرَامِ',
          permasalahan: <String>[
            'Tawaf sunat atau solat sunat, mana lebih afdal di Masjidil '
                'Haram? Imam an-Nawawi menukil Ibnu Abbas, Sa’id bin Jubair, '
                '‘Ata’ dan Mujahid: bagi penduduk Makkah solat lebih afdal, '
                'manakala bagi orang luar (ghuraba’) Tawaf lebih afdal; '
                'pengarang al-Hawi pula berpendapat Tawaf lebih afdal secara '
                'umum (Bab 5, masalah 1).',
            'Mujawarah: Abu Hanifah memakruhkannya kerana bimbang jemu, '
                'hilang rasa hormat dan terjebak dosa; Imam Ahmad dan '
                'lain-lain menganggapnya sunat. Pendapat pilihan an-Nawawi: '
                'sunat, kecuali jika kuat sangkaan akan terjerumus ke dalam '
                'perkara terlarang (masalah 13).',
            'Kadar gandaan 100,000 bagi solat di Masjidil Haram tidak '
                'disebut dalam matan al-Idah pada masalah ini; ia dihuraikan '
                'dalam nota kaki al-Ifsah (menukil hasyiah Ibn Hajar) '
                'berdasarkan riwayat Ibnu az-Zubair r.a. Dalam masalah ke-35, '
                'an-Nawawi menukil al-Hasan al-Basri bahawa puasa sehari dan '
                'sedekah sedirham di Makkah bernilai seratus ribu.',
            'Adakah dosa juga berganda di Makkah? Matan menukil athar Umar '
                'r.a. tentang beratnya kesalahan di Makkah. Nota kaki al-Ifsah '
                'membincangkan sama ada gandaan dosa itu dari sudut bilangan '
                '(pendapat Mujahid) atau dari sudut beratnya sahaja (pendapat '
                'Ibn Taimiyyah yang dirajihkan oleh pengarang nota kaki).',
          ],
        ),
      ),

      // 2. Adab di Masjidil Haram (masalah 2–4, 10, 12)
      LearningSection(
        title: 'Adab dan amalan di Masjidil Haram',
        points: <String>[
          'Tawaf sunat di luar Haji tidak disertai ramal atau idtiba’.',
          'Jangan mencium atau mengusap Maqam Ibrahim, dan jangan istilam dua rukun Syami — perbuatan itu bid’ah.',
          'Ketika duduk di masjid, hadapkan wajah ke Kaabah dan pandanglah ia dengan iman dan mengharap pahala; memandang Kaabah ialah ibadah.',
          'Niatkan iktikaf setiap kali masuk Masjidil Haram; puasa bukan syarat iktikaf dalam mazhab Syafi’i.',
          'Sunat mengkhatamkan al-Quran di Makkah sebelum pulang.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Masalah 2 hingga 4 Bab Kelima menjelaskan adab di Masjidil '
              'Haram: tiada ramal dan idtiba’ di luar Tawaf Haji, larangan '
              'mencium dan istilam Maqam Ibrahim, serta galakan duduk '
              'menghadap Kaabah dan memandangnya (al-Idah, Bab 5, masalah 2–4, '
              'hlm. 389–390 [392–393]). Masalah ke-10 menganjurkan niat iktikaf '
              'setiap kali masuk masjid (hlm. 395 [398]), dan masalah ke-12 '
              'menganjurkan khatam al-Quran di Makkah (hlm. 399 [402]).',
          teksKitabArabic:
              'لَا يُقَبِّلُ مَقَامَ إِبْرَاهِيمَ وَلَا يَسْتَلِمُهُ فَإِنَّهُ '
              'بِدْعَةٌ ... يُسْتَحَبُّ لِمَنْ جَلَسَ فِي الْمَسْجِدِ الْحَرَامِ '
              'أَنْ يَكُونَ وَجْهُهُ إِلَى الْكَعْبَةِ، فَيَقْرُبُ مِنْهَا '
              'وَيَنْظُرُ إِلَيْهَا إِيمَانًا وَاحْتِسَابًا، فَإِنَّ النَّظَرَ '
              'إِلَيْهَا عِبَادَةٌ',
          permasalahan: <String>[
            'Tawaf tidak makruh pada bila-bila masa, dan solat sunat juga '
                'tidak makruh pada waktu-waktu larangan di Makkah dan seluruh '
                'Tanah Haram, berbeza dengan tempat lain (matan, masalah 1). '
                'Nota kaki al-Ifsah menukil al-Majmu’ bahawa Imam Malik '
                'memakruhkan solat tawaf pada waktu larangan.',
            'Larangan mencium Maqam Ibrahim: an-Nawawi menukil kemakruhannya '
                'daripada Ibnu az-Zubair dan Mujahid. Hasyiah Ibn Hajar '
                '(dalam nota kaki) menjelaskan bahawa cium dan istilam ialah '
                'ibadah yang hanya thabit pada Hajar Aswad dengan nas, maka '
                'tidak boleh diqiaskan kepada Maqam.',
            'Hadis-hadis kelebihan memandang Kaabah yang disenaraikan dalam '
                'nota kaki (riwayat Ibn al-Jawzi, al-Azraqi dan lain-lain) '
                'bukan daripada matan; an-Nawawi sendiri hanya berkata "telah '
                'datang banyak athar" tentangnya.',
            'Iktikaf berterusan selagi berada di dalam masjid dan terputus '
                'apabila keluar; apabila masuk semula, niat diperbaharui.',
          ],
        ),
      ),

      // 3. Masuk Kaabah & Hijr (masalah 5–9, 34)
      LearningSection(
        title: 'Memasuki Kaabah dan Hijr Ismail',
        points: <String>[
          'Sunat memasuki Kaabah tanpa alas kaki dan solat di dalamnya, sebaiknya di tempat Nabi SAW solat — kira-kira tiga hasta dari dinding di hadapan pintu.',
          'Di dalam Kaabah, sibukkan diri dengan doa dan khusyuk; jangan mendongak melihat siling.',
          'Jika memasukinya menyebabkan bersesak dan menyakiti orang lain, ia bukan lagi sunat bahkan haram.',
          'Hijr Ismail sebahagian daripada Baitullah dan lebih mudah dimasuki; perbanyakkan doa di dalamnya.',
          'Jauhi amalan rekaan seperti "al-‘Urwah al-Wuthqa" dan "pusat dunia" yang pernah diada-adakan di dalam Kaabah.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Masalah 5 hingga 9 Bab Kelima membincangkan sunat memasuki '
              'Kaabah, adab di dalamnya, amaran Ibn as-Solah tentang dua bid’ah '
              'yang pernah diada-adakan, hukum solat fardu dan sunat di '
              'dalamnya, serta galakan memasuki Hijr (al-Idah, Bab 5, masalah '
              '5–9, hlm. 390–394 [393–397]). Imam an-Nawawi menegaskan bahawa '
              'menyakiti orang demi suatu amalan sunat adalah haram.',
          teksKitabArabic:
              'وَكَيْفَ يَنْبَغِي لِعَاقِلٍ أَنْ يَرْتَكِبَ الْأَذَى '
              'الْمُحَرَّمَ لِيُحَصِّلَ أَمْرًا لَوْ سَلِمَ مِنَ الْأَذَى '
              'لَكَانَ سُنَّةً، وَأَمَّا مَعَ الْأَذَى فَلَيْسَ بِسُنَّةٍ بَلْ '
              'حَرَامٌ',
          permasalahan: <String>[
            'Solat sunat di dalam Kaabah lebih afdal daripada di luarnya. '
                'Solat fardu pula: jika ada harapan berjemaah ramai di luar, '
                'di luar lebih afdal; jika tidak, di dalam lebih afdal '
                '(masalah 8). Nota kaki al-Ifsah menjelaskan kaedahnya: '
                'kelebihan yang berkait dengan zat ibadah (jemaah) didahulukan '
                'atas kelebihan tempat.',
            'Jika solat di dalam Kaabah menghadap pintu yang terbuka, solat '
                'sah hanya jika ambangnya setinggi kira-kira dua pertiga hasta; '
                'jika lebih rendah, tidak sah (masalah 8).',
            'Solat berjemaah di dalam Kaabah: daripada lima kedudukan makmum, '
                'sah pada empat dan tidak sah pada yang kelima (belakang makmum '
                'menghadap wajah imam) menurut pendapat asah.',
            'Menghadap Hijr semata-mata tanpa menghadap binaan Kaabah, '
                'sedangkan mampu, tidak sah solatnya menurut pendapat asah '
                '(masalah 34); kerana kedudukan Hijr sebagai sebahagian Baitullah '
                'thabit dengan dalil zanni, sedangkan kiblat mesti diyakini '
                '(huraian nota kaki).',
            'Khilaf mazhab (dinukil nota kaki daripada al-Majmu’): Syafi’i dan '
                'Abu Hanifah mengharuskan fardu dan sunat di dalam Kaabah; Malik '
                'dan Ahmad hanya mengharuskan sunat mutlak.',
          ],
        ),
      ),

      // 4. Zamzam (masalah 11)
      LearningSection(
        title: 'Air Zamzam dan adab meminumnya',
        points: <String>[
          'Sunat minum air Zamzam dan memperbanyakkannya.',
          'Minum dengan menghadap kiblat, sebut nama Allah, dan berdoa mengikut hajat — keampunan, kesembuhan dan sebagainya.',
          'Minum dengan tiga kali nafas sehingga kenyang (tadalla’), kemudian ucapkan alhamdulillah.',
          'Air Zamzam dan air Tanah Haram lain boleh dibawa pulang ke negara masing-masing.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic: 'إِنَّهَا مُبَارَكَةٌ، إِنَّهَا طَعَامُ طُعْمٍ',
              terjemahan:
                  'Sesungguhnya ia (air Zamzam) diberkati; sesungguhnya ia '
                  'makanan yang mengenyangkan.',
              sumber:
                  'Riwayat Muslim (Fada’il as-Sahabah, no. 2473) daripada Abu '
                  'Dzar r.a. Al-Idah menukilnya dengan tambahan "wa syifa’ '
                  'suqm" (penawar penyakit); tambahan itu tidak ditemui dalam '
                  'lafaz Sahih Muslim yang disemak — perlu semakan takhrij',
            ),
            DalilItem(
              arabic: 'مَاءُ زَمْزَمَ لِمَا شُرِبَ لَهُ',
              terjemahan:
                  'Air Zamzam (memberi manfaat) menurut niat ia diminum.',
              sumber:
                  'Riwayat Ibn Majah (al-Manasik, no. 3062) dan Ahmad (3/372) '
                  'daripada Jabir r.a. Statusnya diperselisihkan; hasyiah Ibn '
                  'Hajar (dalam nota kaki al-Ifsah) menyatakan yang muktamad di '
                  'sisi muhaqqiq ialah hasan atau sahih',
            ),
          ],
          teksKitab:
              'Masalah ke-11 Bab Kelima menganjurkan minum Zamzam dan '
              'memperbanyakkannya. Imam an-Nawawi menyebut ramai ulama telah '
              'meminumnya untuk hajat besar lalu memperolehnya, kemudian '
              'mengajar doa ketika meminumnya serta adab tiga nafas dan '
              'tadalla’ (al-Idah, Bab 5, masalah 11, hlm. 395–398 [398–401]). '
              'Keharusan membawa air Zamzam keluar disebut dalam masalah ke-20 '
              '(hlm. 409 [412]).',
          teksKitabArabic:
              'وَيُسْتَحَبُّ أَنْ يَتَنَفَّسَ ثَلَاثًا وَيَتَضَلَّعَ مِنْهُ، '
              'أَيْ يَمْتَلِئَ، فَإِذَا فَرَغَ حَمِدَ اللَّهَ تَعَالَى',
          permasalahan: <String>[
            'Membawa air Zamzam keluar dari Tanah Haram harus kerana air '
                'sentiasa diganti (yustakhlaf), berbeza dengan tanah dan batu '
                'Tanah Haram yang tidak boleh dibawa keluar (masalah 20). '
                'Hasyiah Ibn Hajar (dalam nota kaki) menambah: bahkan sunat '
                'membawanya kerana Nabi SAW pernah memintanya dihadiahkan.',
            'Nota kaki al-Ifsah menukil riwayat Ibn Majah daripada Ibnu Abbas '
                'r.a. tentang cara minum (menghadap kiblat, tiga nafas, '
                'tadalla’) dan perbezaan orang beriman dengan munafik yang '
                'tidak minum sehingga kenyang; status riwayat ini tidak '
                'disemak di sini.',
            'Kisah Abu Dzar r.a. yang hidup sebulan hanya dengan air Zamzam '
                '(Sahih Muslim) menjadi asas makna "ta’am tu’m" — ia dihuraikan '
                'dalam nota kaki, bukan matan.',
          ],
        ),
      ),

      // 5. Tempat bersejarah, Kaabah & kiswah (masalah 14, 21–22, 29–31, 36–38)
      LearningSection(
        title: 'Tempat bersejarah, sejarah Kaabah dan kiswahnya',
        points: <String>[
          'Sunat menziarahi tempat-tempat yang masyhur kelebihannya di Makkah, seperti tempat kelahiran Nabi SAW, rumah Khadijah r.a., Dar al-Arqam, Gua Hira’ dan Gua Thur.',
          'Haram mengambil wangian Kaabah walaupun untuk tabarruk; jika mahu, sapukan wangian sendiri pada Kaabah lalu ambil semula.',
          'Jangan memotong, membawa pulang, menjual atau membeli kain kiswah Kaabah.',
          'Kaabah ialah rumah ibadah pertama di bumi; menurut an-Nawawi ia telah dibina lima kali.',
          'Banyak tapak bersejarah telah berubah fungsi atau hilang akibat pembesaran Masjidil Haram — ziarahlah tanpa amalan yang tidak bersandar dalil.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'إِنَّ أَوَّلَ بَيْتٍ وُضِعَ لِلنَّاسِ لَلَّذِي بِبَكَّةَ '
                  'مُبَارَكًا وَهُدًى لِلْعَالَمِينَ ۝ فِيهِ آيَاتٌ بَيِّنَاتٌ '
                  'مَقَامُ إِبْرَاهِيمَ وَمَنْ دَخَلَهُ كَانَ آمِنًا',
              terjemahan:
                  'Sesungguhnya rumah (ibadah) pertama yang dibina untuk '
                  'manusia ialah yang di Bakkah (Makkah), yang diberkati dan '
                  'menjadi petunjuk bagi seluruh alam. Padanya terdapat '
                  'tanda-tanda yang nyata, (antaranya) Maqam Ibrahim; dan '
                  'sesiapa yang memasukinya amanlah dia.',
              sumber:
                  'Ali ‘Imran (3):96–97 — dipetik dalam al-Idah, masalah 29',
            ),
            DalilItem(
              arabic:
                  'نَزَلَ الْحَجَرُ الْأَسْوَدُ مِنَ الْجَنَّةِ وَهُوَ أَشَدُّ '
                  'بَيَاضًا مِنَ اللَّبَنِ، فَسَوَّدَتْهُ خَطَايَا بَنِي آدَمَ',
              terjemahan:
                  'Hajar Aswad turun dari syurga dalam keadaan lebih putih '
                  'daripada susu, lalu ia dihitamkan oleh dosa-dosa anak Adam.',
              sumber:
                  'Riwayat at-Tirmidhi (al-Hajj, no. 877) daripada Ibnu Abbas '
                  'r.a.; beliau menilainya hasan sahih — dinukil dalam al-Idah, '
                  'Bab 5, masalah 29',
            ),
          ],
          teksKitab:
              'Masalah ke-14 menyenaraikan tempat-tempat bersejarah di Makkah '
              '(dikatakan lapan belas tempat) (al-Idah, Bab 5, hlm. 401–402 '
              '[404–405]). Masalah ke-21 dan ke-22 melarang mengambil wangian '
              'dan kiswah Kaabah (hlm. 410–411 [413–414]). Masalah ke-29 hingga '
              'ke-38 pula menghuraikan sejarah Kaabah, Masjidil Haram, nama-nama '
              'Makkah, kiswah, hiasan emas dan wangian Kaabah (hlm. 420–442 '
              '[423–445]).',
          teksKitabArabic:
              'لَا يَجُوزُ أَخْذُ شَيْءٍ مِنْ طِيبِ الْكَعْبَةِ لَا '
              'لِلتَّبَرُّكِ وَلَا لِغَيْرِهِ، وَمَنْ أَخَذَ شَيْئًا مِنْ '
              'ذَلِكَ لَزِمَهُ رَدُّهُ إِلَيْهَا، فَإِنْ أَرَادَ التَّبَرُّكَ '
              'أَتَى بِطِيبٍ مِنْ عِنْدِهِ فَمَسَحَهَا بِهِ ثُمَّ أَخَذَهُ',
          permasalahan: <String>[
            'Kiswah Kaabah: Ibn ‘Abdan berpendapat tidak harus memotong, '
                'memindah, menjual atau membelinya, dan ar-Rafi’i tidak '
                'membantahnya. Ibn as-Solah pula berpendapat urusannya '
                'diserahkan kepada pemerintah untuk dijual atau diberi '
                'mengikut maslahat Baitulmal — dan an-Nawawi menilai pendapat '
                'ini "hasan" (masalah 22).',
            'Kaabah dibina lima kali menurut an-Nawawi: oleh malaikat atau '
                'Adam, Ibrahim, Quraisy, Ibnu az-Zubair dan al-Hajjaj; ada '
                'pendapat menambah binaan ‘Amaliqah dan Jurhum. Nota kaki '
                'al-Ifsah mencatat binaan yang wujud kini ialah binaan Sultan '
                'Murad (1040H) selepas banjir besar 1039H.',
            '"Ayat-ayat yang nyata" pada Baitullah menurut pilihan an-Nawawi: '
                'manasik, keamanan orang yang takut, batu jamrah yang tidak '
                'menimbun walaupun dilontar berzaman, burung yang tidak terbang '
                'di atasnya, dan kebinasaan tentera bergajah.',
            'Matan menyebut kebanyakan tempat bersejarah itu sebagai masjid '
                'pada zaman pengarang; nota kaki (abad ke-14H) mencatat ia telah '
                'bertukar menjadi perpustakaan, sekolah atau termasuk dalam '
                'pembesaran jalan.',
          ],
        ),
      ),

      // 6. Tanah Haram (masalah 20, 23–28, 32–33)
      LearningSection(
        title: 'Kehormatan dan sempadan Tanah Haram',
        points: <String>[
          'Tanah Haram ialah kawasan yang mengelilingi Makkah dan diberi hukum kehormatan yang sama dengannya.',
          'Sempadannya: kira-kira 3 batu (mil) dari arah Madinah (sebelum Tan’im), 7 dari arah Yaman, 7 dari arah Iraq, 9 dari arah Ji’ranah, 7 dari arah Taif (di Batn Namirah) dan 10 dari arah Jeddah.',
          'Haram memburu, memotong pokok dan rumput Tanah Haram — termasuk bagi orang yang tidak berihram.',
          'Jangan bawa pulang tanah atau batu Tanah Haram; barang tercicir (luqatah) di sana tidak boleh dimiliki, hanya boleh diambil untuk diumumkan.',
          'Makruh membawa senjata di Makkah tanpa keperluan.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'إِنَّ هَذَا الْبَلَدَ حَرَّمَهُ اللَّهُ يَوْمَ خَلَقَ '
                  'السَّمَاوَاتِ وَالْأَرْضَ، فَهُوَ حَرَامٌ بِحُرْمَةِ اللَّهِ '
                  'إِلَى يَوْمِ الْقِيَامَةِ',
              terjemahan:
                  'Sesungguhnya negeri ini telah diharamkan (dimuliakan) oleh '
                  'Allah sejak hari Dia mencipta langit dan bumi; maka ia haram '
                  'dengan pengharaman Allah hingga hari kiamat.',
              sumber:
                  'Riwayat al-Bukhari (al-Hajj, no. 1834) dan Muslim (al-Hajj, '
                  'no. 1353) daripada Ibnu Abbas r.a., disabdakan pada hari '
                  'pembukaan Makkah — dinukil dalam al-Idah, Bab 5, masalah 24',
            ),
            DalilItem(
              arabic:
                  'وَمَنْ يُرِدْ فِيهِ بِإِلْحَادٍ بِظُلْمٍ نُذِقْهُ مِنْ '
                  'عَذَابٍ أَلِيمٍ',
              terjemahan:
                  'Dan sesiapa yang berniat melakukan penyelewengan secara '
                  'zalim di dalamnya, Kami akan merasakan kepadanya azab yang '
                  'pedih.',
              sumber:
                  'Al-Hajj (22):25 — dikaitkan dengan kehormatan Tanah Haram '
                  'dalam nota kaki al-Ifsah (masalah 13)',
            ),
          ],
          teksKitab:
              'Masalah ke-23 Bab Kelima menetapkan sempadan Tanah Haram yang '
              'diteliti sendiri oleh Imam an-Nawawi berdasarkan al-Azraqi, '
              'ashab dan al-Mawardi (al-Idah, Bab 5, hlm. 411–413 [414–416]). '
              'Masalah ke-25 menyenaraikan tujuh belas hukum yang membezakan '
              'Tanah Haram daripada negeri lain (hlm. 414–418 [417–421]), '
              'diikuti masalah jual beli rumah Makkah, status pembukaan Makkah, '
              'hudud di Tanah Haram, larangan membawa senjata dan fardu kifayah '
              'menghidupkan Haji setiap tahun (hlm. 418–420, 435 [421–423, '
              '438]).',
          teksKitabArabic:
              'اعْلَمْ أَنَّ الْحَرَمَ الْكَرِيمَ هُوَ مَا طَافَ بِمَكَّةَ '
              'وَأَحَاطَ بِهَا مِنْ جَوَانِبِهَا، جَعَلَ اللَّهُ عَزَّ وَجَلَّ '
              'لَهُ حُكْمَهَا فِي الْحُرْمَةِ تَشْرِيفًا لَهَا',
          permasalahan: <String>[
            'Adakah Makkah haram sejak awal atau hanya selepas doa Nabi '
                'Ibrahim? Pendapat sahih menurut an-Nawawi: ia haram sejak '
                'penciptaan langit dan bumi; Nabi Ibrahim hanya menzahirkan '
                'pengharamannya (masalah 24).',
            'Antara hukum khusus Tanah Haram (masalah 25): orang bukan Islam '
                'dilarang memasukinya menurut Syafi’i dan jumhur (Abu Hanifah '
                'mengharuskan selagi tidak menetap); diyat pembunuhan '
                'diperberatkan; sembelihan dam dan hadyu khusus di sana; tiada '
                'dam tamattu’ dan qiran bagi penduduknya; nazar mengunjunginya '
                'mewajibkan Haji atau Umrah.',
            'Masuk Makkah tanpa ihram: khilaf sama ada wajib atau sunat '
                'berihram; nota kaki menjelaskan pendapat sahih Syafi’iyyah '
                'ialah makruh meninggalkannya, berbeza dengan Malik dan Ahmad '
                'yang mewajibkannya.',
            'Hudud dan qisas: Syafi’i berpendapat ia dilaksanakan di Tanah '
                'Haram walaupun jenayah berlaku di luar lalu pelaku berlindung '
                'di dalamnya; Abu Hanifah berpendapat pelaku itu dipaksa keluar '
                'dahulu (masalah 28).',
            'Rumah di Makkah harus dijual, dibeli dan disewa dalam mazhab '
                'Syafi’i kerana Makkah dibuka secara sulh (damai); Malik, Abu '
                'Hanifah, al-Awza’i dan ath-Thawri tidak mengharuskannya '
                '(masalah 26–27; khilaf dihuraikan dalam nota kaki).',
          ],
        ),
      ),

      // 7. Tawaf Wada’: hukum (masalah 15, 17)
      LearningSection(
        title: 'Tawaf Wada’: hukum, siapa wajib dan uzur',
        points: <String>[
          'Tawaf Wada’ wajib bagi orang yang mahu keluar dari Makkah menurut pendapat yang lebih sahih; meninggalkannya dikenakan dam.',
          'Orang yang mahu terus bermukim di Makkah tidak perlu Tawaf Wada’.',
          'Jika mahu pulang terus dari Mina, jemaah tetap wajib masuk ke Makkah untuk Tawaf Wada’.',
          'Wanita haid dan nifas tidak wajib Tawaf Wada’ dan tiada dam; disunatkan dia berdiri di pintu Masjidil Haram dan berdoa.',
          'Keluar tanpa Tawaf Wada’ adalah dosa; wajib kembali selagi belum mencapai jarak qasar — jika kembali, dam gugur.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'أُمِرَ النَّاسُ أَنْ يَكُونَ آخِرُ عَهْدِهِمْ بِالْبَيْتِ، '
                  'إِلَّا أَنَّهُ خُفِّفَ عَنِ الْمَرْأَةِ الْحَائِضِ',
              terjemahan:
                  'Orang ramai diperintahkan supaya urusan terakhir mereka '
                  'ialah di Baitullah, kecuali diberi keringanan kepada wanita '
                  'yang haid.',
              sumber:
                  'Riwayat al-Bukhari (al-Hajj, no. 1755) dan Muslim (al-Hajj, '
                  'no. 1328) daripada Ibnu Abbas r.a. — dinukil dalam nota kaki '
                  'al-Ifsah sebagai dalil pengecualian wanita haid',
            ),
          ],
          teksKitab:
              'Dalam masalah ke-15 Bab Kelima, Imam an-Nawawi menegaskan Tawaf '
              'Wada’ wajib menurut pendapat yang lebih sahih dan wajib dam jika '
              'ditinggalkan; pendapat kedua mengatakannya sunat dan damnya juga '
              'sunat. Wanita haid dan nifas dikecualikan. Sesiapa yang keluar '
              'tanpanya wajib kembali selagi belum mencapai jarak qasar (al-Idah, '
              'Bab 5, masalah 15, hlm. 402–404 [405–407]). Masalah ke-17 '
              'membincangkan sama ada Tawaf Wada’ sebahagian manasik atau ibadah '
              'tersendiri (hlm. 405–406 [408–409]).',
          teksKitabArabic:
              'وَهَذَا الطَّوَافُ وَاجِبٌ عَلَى أَصَحِّ الْقَوْلَيْنِ، '
              'وَيَجِبُ بِتَرْكِهِ دَمٌ ... وَلَا يَجِبُ طَوَافُ الْوَدَاعِ '
              'عَلَى الْحَائِضِ وَالنُّفَسَاءِ، وَلَا دَمَ عَلَيْهِمَا لِتَرْكِهِ',
          permasalahan: <String>[
            'Kembali selepas mencapai jarak qasar tidak menggugurkan dam. '
                'Wanita haid yang suci sebelum meninggalkan binaan Makkah wajib '
                'Tawaf Wada’; jika sudah keluar dari binaan Makkah, tidak wajib '
                'kembali (matan, masalah 15).',
            'Manasik atau ibadah tersendiri? Imam al-Haramain: sebahagian '
                'manasik, maka tidak wajib atas bukan jemaah Haji. Al-Baghawi, '
                'al-Mutawalli dan lain-lain: ibadah tersendiri bagi sesiapa yang '
                'mahu meninggalkan Makkah sejauh jarak qasar, sama ada penduduk '
                'Makkah atau bukan — dan ar-Rafi’i menilainya asah. An-Nawawi '
                'menyokongnya dengan hadis Muslim bahawa muhajir boleh bermukim '
                'tiga hari "selepas menunaikan nusuknya", iaitu sebelum Tawaf '
                'Wada’ (masalah 17).',
            'Nota kaki al-Ifsah (menukil hasyiah) menyamakan dengan wanita '
                'haid: wanita istihadah dalam tempoh haidnya, penghidap salas '
                'yang bimbang mengotori masjid, orang yang dipaksa, dan orang '
                'yang takut pada orang zalim atau ketinggalan rombongan — uzur '
                'ini menggugurkan dosa dan dam.',
            'Khilaf mazhab (nota kaki menukil al-Majmu’): Abu Hanifah dan Ahmad '
                'mewajibkan Tawaf Wada’ seperti pendapat asah Syafi’i, manakala '
                'Malik menganggapnya sunat tanpa apa-apa denda.',
          ],
        ),
      ),

      // 8. Waktu & adab perpisahan (masalah 16, 18, 19)
      LearningSection(
        title: 'Waktu Tawaf Wada’ dan adab perpisahan',
        points: <String>[
          'Lakukan Tawaf Wada’ selepas semua urusan selesai, dan terus berangkat selepasnya.',
          'Jika berlengah untuk urusan lain — membeli barang, membayar hutang, menziarahi kawan atau melawat orang sakit — Tawaf Wada’ wajib diulang.',
          'Urusan keberangkatan seperti membeli bekalan, mengikat barang atau solat berjemaah yang diiqamahkan tidak menjejaskan Tawaf Wada’.',
          'Selepas tawaf: solat dua rakaat di belakang Maqam, berdoa di Multazam, minum Zamzam, istilam dan cium Hajar Aswad, kemudian beredar.',
          'Keluar seperti biasa dengan membelakangkan Kaabah; berjalan mengundur (qahqara) tiada asal sunnahnya dan makruh.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Masalah ke-16 Bab Kelima menetapkan Tawaf Wada’ dilakukan selepas '
              'semua urusan dan disusuli terus dengan keberangkatan (al-Idah, '
              'Bab 5, hlm. 404–405 [407–408]). Masalah ke-18 menghuraikan adab '
              'selepasnya: solat sunat tawaf, doa di Multazam sambil berpaut pada '
              'kelambu Kaabah, minum Zamzam dan istilam Hajar Aswad; wanita haid '
              'membaca doa itu di pintu masjid (hlm. 406–408 [409–411]). Masalah '
              'ke-19 membetulkan cara keluar dari masjid (hlm. 408–409 '
              '[411–412]).',
          teksKitabArabic:
              'وَالْمَذْهَبُ الصَّحِيحُ ... إِنَّهُ يَخْرُجُ وَيُوَلِّي '
              'ظَهْرَهُ إِلَى الْكَعْبَةِ، وَلَا يَمْشِي قَهْقَرَى كَمَا '
              'يَفْعَلُهُ كَثِيرٌ مِنَ النَّاسِ',
          permasalahan: <String>[
            'Cara keluar: Abu ‘Abdillah az-Zubairi berpendapat keluar dengan '
                'pandangan ke arah Kaabah; ada yang berkata menoleh kepadanya '
                'seperti orang bersedih; mazhab yang sahih (al-Halimi, '
                'al-Mawardi dan lain-lain) — keluar membelakanginya tanpa '
                'berjalan mengundur. An-Nawawi turut menukil kemakruhan berdiri '
                'di pintu masjid memandang Kaabah ketika mahu pulang daripada '
                'Ibnu Abbas dan Mujahid.',
            'Khilaf mazhab (nota kaki menukil al-Majmu’): Malik, Ahmad dan Daud '
                'bersetuju dengan Syafi’i bahawa berlengah tanpa uzur mewajibkan '
                'ulangan; Abu Hanifah berpendapat bermukim selepas Tawaf Wada’ '
                'tidak menjejaskannya walaupun sebulan.',
            'Hasyiah Ibn Hajar (dalam nota kaki): jika perlu berhenti lama untuk '
                'membeli bekalan atau mengikat barang yang banyak, ia tidak '
                'menjejaskan Tawaf Wada’ kerana ia sebahagian urusan '
                'keberangkatan.',
            'Doa di Multazam disusun oleh ulama; hasyiah (dinukil nota kaki) '
                'menyatakan ia tidak diriwayatkan secara marfu’. Amalan '
                'melekapkan dada dan pipi di Multazam bersandar pada riwayat Abu '
                'Dawud daripada ‘Amr bin Syu’aib yang dinukil dalam nota kaki.',
          ],
        ),
      ),
    ],
    duas: <ModuleDua>[
      ModuleDua(
        title: 'Doa Ketika Minum Air Zamzam',
        arabic:
            'اللَّهُمَّ إِنَّهُ بَلَغَنِي أَنَّ رَسُولَكَ ﷺ قَالَ: «مَاءُ زَمْزَمَ '
            'لِمَا شُرِبَ لَهُ»، اللَّهُمَّ وَإِنِّي أَشْرَبُهُ لِتَغْفِرَ لِي، '
            'اللَّهُمَّ فَاغْفِرْ لِي',
        translation:
            'Ya Allah, telah sampai kepadaku bahawa Rasul-Mu SAW bersabda: '
            '"Air Zamzam itu menurut apa yang diniatkan ketika meminumnya." Ya '
            'Allah, aku meminumnya agar Engkau mengampuniku, maka ampunilah aku.',
        source:
            'Al-Idah (Bab Bermukim di Makkah) — dibaca menghadap kiblat; boleh '
            'diganti dengan hajat lain seperti memohon sembuh. Hadis "Ma’ '
            'Zamzam lima syuriba lah" riwayat Ibnu Majah dan Ahmad daripada '
            'Jabir r.a.',
      ),
      ModuleDua(
        title: 'Doa di Multazam Ketika Wada’',
        arabic:
            'اللَّهُمَّ الْبَيْتُ بَيْتُكَ، وَالْعَبْدُ عَبْدُكَ وَابْنُ '
            'أَمَتِكَ، حَمَلْتَنِي عَلَىٰ مَا سَخَّرْتَ لِي مِنْ خَلْقِكَ '
            'حَتَّىٰ صَيَّرْتَنِي فِي بِلَادِكَ، وَبَلَّغْتَنِي بِنِعْمَتِكَ '
            'حَتَّىٰ أَعَنْتَنِي عَلَىٰ قَضَاءِ مَنَاسِكِكَ، فَإِنْ كُنْتَ '
            'رَضِيتَ عَنِّي فَازْدَدْ عَنِّي رِضًا، وَإِلَّا فَمُنَّ الْآنَ '
            'قَبْلَ أَنْ تَنْأَىٰ عَنْ بَيْتِكَ دَارِي وَيَبْعُدَ عَنْهُ '
            'مَزَارِي، هَـٰذَا أَوَانُ انْصِرَافِي إِنْ أَذِنْتَ لِي، غَيْرَ '
            'مُسْتَبْدِلٍ بِكَ وَلَا بَيْتِكَ، وَلَا رَاغِبٍ عَنْكَ وَلَا '
            'عَنْ بَيْتِكَ، اللَّهُمَّ فَأَصْحِبْنِي الْعَافِيَةَ فِي '
            'بَدَنِي، وَالْعِصْمَةَ فِي دِينِي، وَأَحْسِنْ مُنْقَلَبِي، '
            'وَارْزُقْنِي طَاعَتَكَ مَا أَبْقَيْتَنِي، وَاجْمَعْ لِي خَيْرَيِ '
            'الدُّنْيَا وَالْآخِرَةِ، إِنَّكَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ',
        translation:
            'Ya Allah, rumah ini rumah-Mu, dan hamba ini hamba-Mu, anak kepada '
            'hamba perempuan-Mu. Engkau membawaku dengan apa yang Engkau '
            'tundukkan untukku daripada makhluk-Mu sehingga sampai ke negeri-Mu, '
            'dan Engkau menyampaikan aku dengan nikmat-Mu sehingga Engkau '
            'membantuku menunaikan manasik-Mu. Jika Engkau telah reda kepadaku, '
            'tambahkanlah keredaan-Mu; jika belum, kurniakanlah sekarang sebelum '
            'rumahku jauh daripada rumah-Mu dan jauh tempat ziarahku. Inilah '
            'masa aku beredar, jika Engkau izinkan, tanpa menggantikan-Mu atau '
            'rumah-Mu, dan tanpa berpaling daripada-Mu atau rumah-Mu. Ya Allah, '
            'iringilah aku dengan '
            'kesihatan tubuh dan pemeliharaan agama, perelokkanlah kepulanganku, '
            'kurniakanlah aku ketaatan kepada-Mu sepanjang hayatku, dan '
            'himpunkanlah bagiku kebaikan dunia dan akhirat; sesungguhnya Engkau '
            'Maha Berkuasa atas segala sesuatu.',
        source:
            'Al-Idah (Bab Tawaf Wada’) — dibaca di Multazam selepas solat sunat '
            'tawaf Wada’; nota kaki al-Ifsah menukil al-Hasyiah: doa '
            'ini tidak diriwayatkan secara marfu’',
      ),
    ],
    academicInsight:
        'Bab Kelima al-Idah menunjukkan bahawa Imam an-Nawawi tidak menamatkan '
        'perbahasan Haji dengan manasik semata-mata; beliau menyusun "fiqh '
        'bermukim" yang menyeimbangkan peluang dan tanggungjawab. Di satu '
        'pihak, Makkah ialah tempat paling afdal menurut mazhab Syafi’i dan '
        'pahala ketaatan di sana berganda, maka jemaah digalakkan '
        'memperbanyak Umrah, Tawaf dan iktikaf. Di pihak lain, kehormatan '
        'Tanah Haram menuntut disiplin — tidak membawa keluar tanah dan batunya, '
        'tidak mengambil wangian atau kiswah Kaabah, dan tidak menyakiti orang '
        'demi amalan sunat. Tawaf Wada’ pula diletakkan sebagai penutup yang '
        'wajib menurut pendapat asah, dengan keringanan jelas bagi wanita haid '
        'dan nifas. Perbahasan al-ashab sama ada ia sebahagian manasik atau '
        'ibadah tersendiri memberi kesan praktikal: orang yang terus menetap di '
        'Makkah tidak dituntut melakukannya.',
    reflectionQuestions: <String>[
      'Mengapakah Imam an-Nawawi menyatakan bahawa memasuki Kaabah dengan '
          'menyakiti orang lain bukan lagi sunat bahkan haram? Apakah kaedah '
          'fiqh di sebaliknya?',
      'Apakah kesan praktikal perbezaan pendapat sama ada Tawaf Wada’ '
          'sebahagian manasik Haji atau ibadah yang tersendiri?',
      'Bagaimanakah jemaah boleh mengimbangi galakan bermukim lama di Makkah '
          'dengan amaran Umar r.a. tentang beratnya dosa di Tanah Haram?',
    ],
  ),

  // =========================================================================
  // MODUL 15 — ZIARAH MADINAH (Bab 6)
  // =========================================================================
  LearningModuleData(
    number: '15',
    title: 'Ziarah Madinah',
    subtitle:
        'Kelebihan Madinah, adab ziarah makam Rasulullah SAW, Raudhah, Baqi’ dan Quba’.',
    icon: HajjIconType.madinah,
    accent: Color(0xFF2F8F79),
    sections: <LearningSection>[
      // 1. Kelebihan & niat (pendahuluan, masalah 1–2, 5, 17–18)
      LearningSection(
        title: 'Kelebihan Madinah dan niat ziarah',
        points: <String>[
          'Selepas selesai Haji atau Umrah, jemaah digalakkan menuju ke Madinah untuk menziarahi makam Rasulullah SAW — antara qurbah yang paling penting.',
          'Niatkan juga musafir ke Masjid Nabawi dan solat di dalamnya sebagai ibadah kepada Allah.',
          'Madinah ialah bumi paling afdal selepas Makkah menurut sebahagian ulama, dan paling afdal secara mutlak menurut sebahagian yang lain.',
          'Antara namanya: al-Madinah, Tabah, Taibah dan ad-Dar.',
          'Sunat berpuasa dan bersedekah kepada penduduk Madinah sekadar mampu, kerana mereka jiran Rasulullah SAW.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic: 'مَنْ زَارَ قَبْرِي وَجَبَتْ لَهُ شَفَاعَتِي',
              terjemahan:
                  'Sesiapa yang menziarahi kuburku, wajiblah baginya syafaatku.',
              sumber:
                  'Riwayat al-Bazzar dan ad-Daraqutni daripada Ibnu Umar r.a., '
                  'sebagaimana dinukil dalam al-Idah, Bab 6, masalah 1. Status '
                  'sanadnya dipertikaikan oleh ramai ahli hadis; takhrij tidak '
                  'dapat disahkan dengan alat semakan yang digunakan',
            ),
            DalilItem(
              arabic:
                  'مَنْ صَبَرَ عَلَى لَأْوَاءِ الْمَدِينَةِ وَشِدَّتِهَا كُنْتُ '
                  'لَهُ شَهِيدًا أَوْ شَفِيعًا يَوْمَ الْقِيَامَةِ',
              terjemahan:
                  'Sesiapa yang bersabar atas kesusahan dan kesempitan hidup di '
                  'Madinah, aku akan menjadi saksi atau pemberi syafaat baginya '
                  'pada hari kiamat.',
              sumber:
                  'Lafaz menurut nukilan al-Idah (Bab 6, masalah 17) sebagai '
                  'riwayat Muslim daripada Ibnu Umar dan Abu Hurairah r.a.; lafaz '
                  'dalam Sahih Muslim (al-Hajj, no. 1377) berbeza sedikit',
            ),
          ],
          teksKitab:
              'Bab Keenam al-Idah dibuka dengan nama-nama Madinah, kemudian '
              'masalah pertama menegaskan ziarah makam Rasulullah SAW antara '
              'qurbah yang terpenting, dan masalah kedua menganjurkan niat '
              'musafir ke Masjid Nabawi serta solat di dalamnya (al-Idah, Bab 6, '
              'hlm. 443–444 [446–447]). Masalah ke-17 dan ke-18 menganjurkan '
              'mujawarah di Madinah dengan syarat yang sama seperti di Makkah, '
              'serta puasa dan sedekah kepada jiran Rasulullah SAW (hlm. 457 '
              '[460]).',
          teksKitabArabic:
              'إِذَا انْصَرَفَ الْحُجَّاجُ وَالْمُعْتَمِرُونَ مِنْ مَكَّةَ '
              'فَلْيَتَوَجَّهُوا إِلَى مَدِينَةِ رَسُولِ اللَّهِ ﷺ لِزِيَارَةِ '
              'تُرْبَتِهِ ﷺ، فَإِنَّهَا مِنْ أَهَمِّ الْقُرُبَاتِ وَأَنْجَحِ '
              'الْمَسَاعِي',
          permasalahan: <String>[
            'Ziarah Madinah tidak termasuk rukun atau wajib Haji. An-Nawawi '
                'menegaskan kaedah yang sama ketika menolak dakwaan orang awam '
                'bahawa ziarah Baitulmaqdis atau makam Nabi Ibrahim "menyempurnakan '
                'Haji": ziarah itu qurbah tersendiri, tidak berkait dengan Haji '
                '(masalah 23).',
            'Nama "Yathrib" turut disebut dalam matan; hasyiah Ibn Hajar (dalam '
                'nota kaki) mengkritiknya kerana ia nama jahiliah yang diubah '
                'oleh Rasulullah SAW, dan menyebut lafaz itu mungkin hanya '
                'terdapat dalam draf awal al-Idah.',
            'Mujawarah di Madinah sunat dengan syarat seperti di Makkah: selagi '
                'tidak dikhuatiri terjerumus ke dalam perkara terlarang atau '
                'hilang rasa hormat (masalah 17).',
          ],
        ),
      ),

      // 2. Perjalanan & masuk (masalah 3–6)
      LearningSection(
        title: 'Adab dalam perjalanan dan ketika masuk Masjid Nabawi',
        points: <String>[
          'Perbanyakkan selawat dan salam ke atas Nabi SAW sepanjang perjalanan, lebih-lebih lagi apabila ternampak pepohon dan kawasan Tanah Haram Madinah.',
          'Sunat mandi sebelum masuk Madinah dan memakai pakaian yang paling bersih.',
          'Hayati kemuliaan Madinah dan Rasulullah SAW; penuhi hati dengan rasa hormat seolah-olah melihat baginda.',
          'Di pintu masjid, baca doa masuk masjid seperti di Masjidil Haram dan dahulukan kaki kanan.',
          'Terus ke Raudhah dan solat tahiyyatul masjid di sisi mimbar sebelum menuju ke makam.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Masalah 3 hingga 6 Bab Keenam menyusun adab perjalanan ke Madinah '
              'dan cara memasuki Masjid Nabawi: memperbanyak selawat, mandi dan '
              'berpakaian bersih, menghayati kemuliaan tempat, kemudian menuju '
              'Raudhah — antara mimbar dan makam — untuk solat tahiyyatul masjid '
              '(al-Idah, Bab 6, masalah 3–6, hlm. 444–446 [447–449]).',
          teksKitabArabic:
              'يُسْتَحَبُّ أَنْ يَغْتَسِلَ قَبْلَ دُخُولِهِ وَيَلْبَسَ أَنْظَفَ '
              'ثِيَابِهِ ... وَيَدْخُلُ فَيَقْصِدُ الرَّوْضَةَ الْكَرِيمَةَ، '
              'وَهِيَ مَا بَيْنَ الْمِنْبَرِ وَالْقَبْرِ، فَيُصَلِّي تَحِيَّةَ '
              'الْمَسْجِدِ بِجَنْبِ الْمِنْبَرِ',
          permasalahan: <String>[
            'Tempat solat Nabi SAW: an-Nawawi menukil daripada Kitab al-Madinah '
                'bahawa jaraknya dari mimbar 14 hasta dan sejengkal. Nota kaki '
                'al-Ifsah mencatat binaan masjid telah berubah, tetapi tempat itu '
                'ditandai "Hadha musalla an-Nabi SAW" di sisi mihrab.',
            'Hasyiah Ibn Hajar (dalam nota kaki): jika tempat solat Nabi SAW '
                'tidak dapat dicapai, solat di bahagian Raudhah yang terdekat; '
                'dan apabila solat berjemaah, saf pertama didahulukan.',
            'Selepas tahiyyatul masjid, bersyukur kepada Allah dengan hati dan '
                'lisan. Hasyiah (dalam nota kaki) menyatakan sujud syukur tidak '
                'disunatkan di sini, berbeza dengan pendapat sebahagian Hanafiyyah.',
            'Solat tahiyyatul masjid didahulukan sebelum salam di makam; nota '
                'kaki menyokongnya dengan riwayat Malik daripada Jabir r.a.',
          ],
        ),
      ),

      // 3. Salam di makam (masalah 7)
      LearningSection(
        title: 'Cara memberi salam di makam Rasulullah SAW',
        points: <String>[
          'Berdiri membelakangi kiblat dan menghadap dinding makam, kira-kira empat hasta darinya.',
          'Tundukkan pandangan, kosongkan hati daripada urusan dunia, dan hayati di hadapan siapa kita berdiri.',
          'Beri salam dengan suara sederhana, tidak meninggikan suara.',
          'Sekurang-kurangnya ucapkan: "As-salamu ’alaika ya Rasulallah"; lafaz yang lebih panjang boleh dibaca jika mampu.',
          'Sampaikan salam titipan orang lain, kemudian berundur kira-kira sehasta ke kanan untuk memberi salam kepada Abu Bakar r.a., dan sehasta lagi untuk Umar r.a.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'يَا أَيُّهَا الَّذِينَ آمَنُوا لَا تَرْفَعُوا أَصْوَاتَكُمْ '
                  'فَوْقَ صَوْتِ النَّبِيِّ وَلَا تَجْهَرُوا لَهُ بِالْقَوْلِ '
                  'كَجَهْرِ بَعْضِكُمْ لِبَعْضٍ',
              terjemahan:
                  'Wahai orang-orang yang beriman, janganlah kamu meninggikan '
                  'suara kamu melebihi suara Nabi, dan janganlah kamu bercakap '
                  'kepadanya dengan suara yang keras sebagaimana sesetengah kamu '
                  'bercakap kepada sesetengah yang lain.',
              sumber:
                  'Al-Hujurat (49):2 — dikaitkan oleh nota kaki al-Ifsah dengan '
                  'adab merendahkan suara ketika memberi salam di makam',
            ),
          ],
          teksKitab:
              'Masalah ke-7 Bab Keenam menghuraikan cara berdiri di makam, lafaz '
              'salam yang panjang, lafaz ringkas para salaf, cara menyampaikan '
              'salam titipan, dan salam kepada Abu Bakar dan Umar r.a. (al-Idah, '
              'Bab 6, masalah 7, hlm. 447–451 [450–454]). Imam an-Nawawi juga '
              'menukil lafaz ringkas Ibnu Umar r.a. dan lafaz Imam Malik.',
          teksKitabArabic:
              'السَّلَامُ عَلَيْكَ يَا رَسُولَ اللَّهِ، السَّلَامُ عَلَيْكَ '
              'يَا أَبَا بَكْرٍ، السَّلَامُ عَلَيْكَ يَا أَبَتَاهُ',
          permasalahan: <String>[
            'Membelakangi kiblat ketika memberi salam ialah mazhab Syafi’i dan '
                'jumhur, seperti seseorang menghadap baginda semasa hidupnya; '
                'hasyiah (dalam nota kaki) mencatat Abu Hanifah berpendapat lain.',
            'Bagi yang tidak mampu menghafal lafaz panjang atau kesuntukan masa, '
                'memadai sebahagiannya; sekurang-kurangnya "as-salamu ’alaika ya '
                'Rasulallah". Ibnu Umar r.a. sendiri sangat ringkas: salam kepada '
                'Rasulullah SAW, kepada Abu Bakar, dan kepada bapanya (Umar).',
            'Kedudukan tiga makam: an-Nawawi memaparkan tiga gambaran dan '
                'menyatakan yang masyhur ialah gambaran pertama — kepala Abu '
                'Bakar setentang bahu Rasulullah SAW. Nota kaki menyandarkannya '
                'kepada riwayat al-Hakim daripada al-Qasim bin Muhammad.',
            'Selepas itu an-Nawawi menganjurkan kembali ke hadapan wajah baginda '
                'untuk bertawassul, lalu menukil kisah al-‘Utbi dan seorang Arab '
                'badwi yang dianggap baik oleh ashab. Ia kisah yang dinukil, '
                'bukan hadis; penggunaannya diperselisihkan dalam kalangan ulama.',
          ],
        ),
      ),

      // 4. Doa, Raudhah & mimbar (masalah 7 lanjutan, 22)
      LearningSection(
        title: 'Berdoa, Raudhah dan mimbar',
        points: <String>[
          'Selepas salam, pergi ke arah kepala makam, berdiri antara makam dan tiang, menghadap kiblat, memuji Allah dan berdoa untuk diri, ibu bapa, guru, kerabat dan seluruh umat Islam.',
          'Kemudian ke Raudhah dan perbanyakkan doa serta solat di situ.',
          'Berdiri di sisi mimbar dan berdoa.',
          'Kelebihan solat seribu kali ganda di Masjid Nabawi khusus bagi kawasan masjid pada zaman Nabi SAW menurut an-Nawawi — tetapi ketika berjemaah, saf pertama tetap lebih utama.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'مَا بَيْنَ بَيْتِي وَمِنْبَرِي رَوْضَةٌ مِنْ رِيَاضِ '
                  'الْجَنَّةِ، وَمِنْبَرِي عَلَى حَوْضِي',
              terjemahan:
                  'Kawasan antara rumahku dan mimbarku ialah satu taman daripada '
                  'taman-taman syurga, dan mimbarku berada di atas telagaku.',
              sumber:
                  'Riwayat al-Bukhari (no. 1196) dan Muslim (no. 1391) daripada '
                  'Abu Hurairah r.a. Al-Idah menukilnya dengan lafaz "ma baina '
                  'qabri wa minbari"; hasyiah (dalam nota kaki) menjelaskan tiada '
                  'percanggahan kerana makam baginda berada di dalam rumahnya',
            ),
          ],
          teksKitab:
              'Selepas salam, Imam an-Nawawi menganjurkan berdoa di arah kepala '
              'makam sambil menghadap kiblat, kemudian ke Raudhah dan mimbar '
              '(al-Idah, Bab 6, masalah 7, hlm. 451–452 [454–455]). Dalam masalah '
              'ke-22 beliau menghuraikan sejarah binaan Masjid Nabawi dan '
              'mengingatkan bahawa gandaan pahala solat khusus bagi kawasan '
              'masjid pada zaman Rasulullah SAW (hlm. 459–464 [462–467]).',
          teksKitabArabic:
              'فَيَنْبَغِي أَنْ تَعْتَنِيَ بِالْمُحَافَظَةِ عَلَى الصَّلَاةِ '
              'فِيمَا كَانَ فِي عَهْدِ الرَّسُولِ ﷺ ... لَكِنْ إِذَا صَلَّى '
              'جَمَاعَةً فَالتَّقَدُّمُ إِلَى الصَّفِّ الْأَوَّلِ ثُمَّ مَا '
              'يَلِيهِ أَفْضَلُ',
          permasalahan: <String>[
            'Adakah gandaan seribu meliputi kawasan perluasan masjid? An-Nawawi '
                'berpendapat tidak, berdasarkan isyarat "masjidku ini". Nota kaki '
                'mencatat as-Subki dan lain-lain bersetuju, manakala al-Muhibb '
                'at-Tabari dan riwayat daripada Imam Malik berpendapat gandaan '
                'meliputi perluasan; hasyiah Ibn Hajar mempertahankan pendapat '
                'an-Nawawi.',
            'Makna "mimbarku di atas telagaku": al-Khattabi (dinukil dalam '
                'matan) mentafsirkan sesiapa yang tekun beribadah di sisi mimbar '
                'akan diberi minum dari telaga baginda. Hasyiah (dalam nota kaki) '
                'lebih cenderung memahami Raudhah dan mimbar secara zahir.',
            'Sejarah masjid (riwayat al-Bukhari dalam matan): pada zaman Nabi '
                'SAW dibina dengan bata tanah, beratap pelepah dan bertiang batang '
                'tamar; Abu Bakar tidak menambah, Umar membesarkannya dengan '
                'bahan yang sama, Uthman membinanya dengan batu berukir.',
            'Hasyiah (dalam nota kaki): tiada beza antara solat fardu dan sunat '
                'dari segi gandaan pahala, berbeza dengan sebahagian Malikiyyah '
                'dan Hanafiyyah.',
          ],
        ),
      ),

      // 5. Larangan & makruh di makam (masalah 8, 14, 15)
      LearningSection(
        title: 'Adab di makam: yang dilarang dan makruh',
        points: <String>[
          'Tidak harus bertawaf mengelilingi makam Nabi SAW.',
          'Makruh melekapkan perut atau belakang pada dinding makam, mengusapnya dengan tangan atau menciumnya.',
          'Adab yang betul ialah menjauh, sebagaimana seseorang menjauh jika berada di hadapan baginda semasa hayatnya.',
          'Jangan terpengaruh dengan amalan orang awam; keberkatan terletak pada apa yang menepati syarak.',
          'Elakkan bid’ah seperti makan tamar sayhani di Raudhah atau memotong rambut lalu mencampaknya ke dalam lampu masjid.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Masalah ke-8 Bab Keenam menegaskan larangan bertawaf di makam dan '
              'kemakruhan melekap, mengusap dan mencium dindingnya, berdasarkan '
              'al-Halimi dan kesepakatan ulama (al-Idah, Bab 6, masalah 8, hlm. '
              '453 [456]). Masalah ke-14 menyenaraikan bid’ah orang awam di '
              'Raudhah, dan masalah ke-15 menukil pendapat Imam Malik tentang '
              'penduduk Madinah yang berdiri di makam setiap kali masuk dan '
              'keluar masjid (hlm. 456 [459]).',
          teksKitabArabic:
              'لَا يَجُوزُ أَنْ يُطَافَ بِقَبْرِ النَّبِيِّ ﷺ، وَيُكْرَهُ '
              'إِلْصَاقُ الْبَطْنِ وَالظَّهْرِ بِجِدَارِ الْقَبْرِ ... '
              'وَيُكْرَهُ مَسْحُهُ بِالْيَدِ وَتَقْبِيلُهُ، بَلِ الْأَدَبُ أَنْ '
              'يَبْعُدَ مِنْهُ كَمَا يَبْعُدُ مِنْهُ لَوْ حَضَرَ فِي حَيَاتِهِ ﷺ',
          permasalahan: <String>[
            'An-Nawawi menegaskan: sesiapa yang menyangka mengusap dengan tangan '
                'lebih berkat, itu kejahilan dan kelalaian, kerana keberkatan '
                'hanya pada apa yang menepati syarak dan pendapat ulama. Beliau '
                'menukil kata-kata al-Fudail bin ‘Iyad: ikutlah jalan petunjuk '
                'walaupun sedikit pengikutnya, dan jangan tertipu dengan ramainya '
                'orang yang binasa.',
            'Imam Malik memakruhkan penduduk Madinah berdiri di makam setiap kali '
                'masuk dan keluar masjid, tetapi mengharuskannya bagi orang luar '
                'serta penduduk yang baru pulang atau mahu bermusafir. Al-Baji '
                'menjelaskan perbezaannya: orang luar datang khusus untuk '
                'ziarah. Nota kaki menukil as-Subki: ini selaras dengan kaedah '
                'sadd adh-dhara’i Malik, manakala tiga mazhab lain menggalakkan '
                'kekerapan.',
            'Matan menukil doa Nabi SAW "Ya Allah, jangan jadikan kuburku berhala '
                'yang disembah" sebagai sandaran Malik; takhrij lafaz ini tidak '
                'dapat disahkan dengan alat semakan yang digunakan.',
            'Nota kaki al-Ifsah mencatat bid’ah-bid’ah yang disebut an-Nawawi '
                '(tamar sayhani, memotong rambut) tidak lagi wujud pada zaman '
                'pengarang nota kaki.',
          ],
        ),
      ),

      // 6. Baqi’, Uhud, Quba’ (masalah 10–13)
      LearningSection(
        title: 'Baqi’, syuhada Uhud, Quba’ dan tempat ziarah lain',
        points: <String>[
          'Sunat keluar ke Baqi’ setiap hari, terutamanya hari Jumaat, selepas memberi salam kepada Rasulullah SAW.',
          'Di Baqi’, ziarahi kubur Ibrahim putera Rasulullah SAW, Uthman, al-Abbas, al-Hasan bin Ali dan lain-lain, dan akhiri dengan kubur Safiyyah r.a., ibu saudara Rasulullah SAW.',
          'Sunat menziarahi kubur syuhada Uhud — afdalnya hari Khamis, bermula dengan Hamzah r.a.; keluar awal selepas Subuh supaya sempat Zohor berjemaah di Masjid Nabawi.',
          'Sangat digalakkan ke Masjid Quba’, lebih utama pada hari Sabtu, dengan niat mendekatkan diri kepada Allah dan solat di dalamnya.',
          'Sunat menziarahi lebih kurang tiga puluh tempat bersejarah di Madinah dan tujuh telaga yang digunakan Nabi SAW, mengikut kemampuan.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic: 'الصَّلَاةُ فِي مَسْجِدِ قُبَاءٍ كَعُمْرَةٍ',
              terjemahan: 'Solat di Masjid Quba’ (pahalanya) seperti Umrah.',
              sumber:
                  'Riwayat at-Tirmidhi (as-Solah, no. 324) dan Ibn Majah (no. '
                  '1411) daripada Usaid bin Zuhair r.a. — dinukil dalam al-Idah, '
                  'Bab 6, masalah 12 (an-Nawawi menyifatkannya sahih)',
            ),
            DalilItem(
              arabic:
                  'كَانَ رَسُولُ اللَّهِ ﷺ يَأْتِي مَسْجِدَ قُبَاءٍ رَاكِبًا '
                  'وَمَاشِيًا',
              terjemahan:
                  'Rasulullah SAW biasa mendatangi Masjid Quba’ dengan '
                  'berkenderaan dan berjalan kaki.',
              sumber:
                  'Riwayat Muslim (al-Hajj, no. 1399) daripada Ibnu Umar r.a.; '
                  'al-Idah menyandarkannya kepada al-Bukhari dan Muslim dengan '
                  'tambahan "lalu baginda solat dua rakaat di dalamnya"',
            ),
          ],
          teksKitab:
              'Masalah ke-10 hingga ke-13 Bab Keenam menyusun ziarah sekitar '
              'Madinah: Baqi’, syuhada Uhud, Masjid Quba’ dan telaga Aris, serta '
              'kira-kira tiga puluh tempat bersejarah dan tujuh telaga (al-Idah, '
              'Bab 6, masalah 10–13, hlm. 453–455 [456–458]).',
          teksKitabArabic:
              'يُسْتَحَبُّ اسْتِحْبَابًا مُتَأَكَّدًا أَنْ يَأْتِيَ مَسْجِدَ '
              'قُبَاءٍ، وَهُوَ فِي يَوْمِ السَّبْتِ أَوْلَى، نَاوِيًا '
              'التَّقَرُّبَ بِزِيَارَتِهِ وَالصَّلَاةَ فِيهِ',
          permasalahan: <String>[
            'Keutamaan hari Sabtu bagi Quba’ bersandar pada riwayat sahih bahawa '
                'baginda mendatanginya setiap Sabtu (dinukil dalam matan).',
            'Turutan di Baqi’ (dimulakan selepas salam di makam Rasulullah SAW '
                'dan diakhiri di kubur Safiyyah r.a.) ialah susunan anjuran '
                'an-Nawawi, bukan syarat; matan menyatakan banyak hadis sahih '
                'tentang kelebihan kubur Baqi’ dan menziarahinya.',
            'Telaga Aris di sisi Quba’: sunat minum dan berwuduk dengan airnya '
                'kerana diriwayatkan Nabi SAW meludah ke dalamnya (matan). Nama '
                'tujuh telaga (Aris, Ghars, Rumah, Buda’ah, Bussah, Bairuha’ dan '
                'al-‘Ihn) dihuraikan dalam nota kaki al-Ifsah, bukan matan.',
          ],
        ),
      ),

      // 7. Tanah Haram Madinah (masalah 19–20, 23–24)
      LearningSection(
        title: 'Tanah Haram Madinah dan hukum-hukumnya',
        points: <String>[
          'Haram memburu dan memotong pokok di Tanah Haram Madinah, sama ada bagi yang berihram atau tidak.',
          'Jangan bawa keluar tanah atau batu Tanah Haram Madinah, termasuk bekas atau barang yang dibuat daripada tanahnya.',
          'Sempadannya antara Bukit ‘Air dan Thaur, dan antara dua kawasan berbatu hitam (labatan) Madinah.',
          'Hadis "sesiapa menziarahiku dan menziarahi bapaku Ibrahim dalam satu tahun, aku jamin syurga baginya" ialah hadis palsu.',
          'Nazar pergi ke Masjid Nabawi atau Masjidil Aqsa: menurut pendapat asah, hanya sunat ditunaikan dan tidak wajib.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic: 'الْمَدِينَةُ حَرَمٌ مَا بَيْنَ عَيْرٍ إِلَى ثَوْرٍ',
              terjemahan:
                  'Madinah ialah Tanah Haram, antara (Bukit) ‘Air hingga Thaur.',
              sumber:
                  'Riwayat al-Bukhari (no. 6755) dan Muslim (al-Hajj, no. 1370) '
                  'daripada Ali bin Abi Talib r.a. — dinukil dalam al-Idah, Bab 6, '
                  'masalah 20',
            ),
          ],
          teksKitab:
              'Masalah ke-19 dan ke-20 Bab Keenam menyamakan Tanah Haram Madinah '
              'dengan Tanah Haram Makkah dari segi larangan membawa keluar tanah '
              'serta pengharaman buruan dan pokok, dan menghuraikan sempadannya '
              '(al-Idah, Bab 6, hlm. 457–459 [460–462]). Masalah ke-23 menolak '
              'hadis palsu tentang ziarah Nabi Ibrahim, dan masalah ke-24 '
              'membincangkan nazar ke Masjid Nabawi dan Masjidil Aqsa (hlm. '
              '464–465 [467–468]).',
          teksKitabArabic:
              'يَحْرُمُ صَيْدُ حَرَمِ الْمَدِينَةِ وَأَشْجَارِهِ عَلَى '
              'الْحَلَالِ وَالْمُحْرِمِ كَمَا سَبَقَ فِي حَرَمِ مَكَّةَ ... '
              'وَهَذَا بَاطِلٌ، لَيْسَ هُوَ عَنْ رَسُولِ اللَّهِ ﷺ، وَلَا '
              'يُعْرَفُ فِي كِتَابٍ، بَلْ وَضَعَهُ الْفَجَرَةُ',
          permasalahan: <String>[
            'Bukit Thaur: Abu ‘Ubaid berkata penduduk Madinah tidak mengenali '
                'bukit bernama Thaur di Madinah — Thaur di Makkah — lalu '
                'berpendapat asal hadis ialah "‘Air hingga Uhud", dan al-Hazimi '
                'menyokongnya (matan). Hasyiah (dalam nota kaki) menolak dakwaan '
                'itu: Thaur ialah bukit kecil di belakang Uhud, maka Uhud termasuk '
                'Tanah Haram Madinah.',
            'Ganti rugi merosakkan buruan atau pokok Tanah Haram Madinah dibahas '
                'dalam Bab Ketujuh: qaul jadid — tiada dhaman (asah di sisi '
                'ashab); qaul qadim — ada dhaman (dipilih an-Nawawi), iaitu '
                'mengambil harta (salab) pemburu atau penebang (sebagaimana '
                'dinukil nota kaki al-Ifsah).',
            'Nazar ke Masjid Nabawi atau Masjidil Aqsa: dua qaul Syafi’i; asah — '
                'sunat, tidak wajib. Jika dikatakan wajib, dia wajib melakukan '
                'ibadah di sana: solat atau iktikaf menurut pendapat asah '
                '(masalah 24). Berbeza dengan nazar ke Tanah Haram Makkah yang '
                'mewajibkan Haji atau Umrah (Bab 5).',
            'Ziarah makam Nabi Ibrahim di al-Khalil dan Baitulmaqdis tidak '
                'ditolak — ia qurbah tersendiri; yang batil ialah menganggapnya '
                'sebahagian kesempurnaan Haji, seperti ungkapan orang awam '
                '"aku menyucikan (meng-quds-kan) hajiku".',
          ],
        ),
      ),

      // 8. Meninggalkan Madinah (masalah 21)
      LearningSection(
        title: 'Meninggalkan Madinah',
        points: <String>[
          'Sebelum bermusafir pulang, sunat solat dua rakaat sebagai tanda perpisahan dengan masjid dan berdoa dengan apa yang disukai.',
          'Kemudian datang ke makam, ulangi salam dan doa seperti ketika mula menziarah.',
          'Mohon agar ini bukan kunjungan terakhir ke Tanah Haram Rasulullah SAW dan dimudahkan kembali ke dua Tanah Haram.',
          'Keluar seperti biasa menghadap arah perjalanan; jangan berjalan mengundur.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Masalah ke-21 Bab Keenam menetapkan adab meninggalkan Madinah: '
              'solat dua rakaat perpisahan, mengulangi salam dan doa di makam, '
              'membaca doa perpisahan, kemudian beredar menghadap ke hadapan '
              'tanpa berjalan mengundur (al-Idah, Bab 6, masalah 21, hlm. 459 '
              '[462]).',
          teksKitabArabic:
              'إِذَا أَرَادَ السَّفَرَ مِنَ الْمَدِينَةِ وَالرُّجُوعَ إِلَى '
              'وَطَنِهِ أَوْ غَيْرِهِ اسْتُحِبَّ أَنْ يُوَدِّعَ الْمَسْجِدَ '
              'بِرَكْعَتَيْنِ وَيَدْعُوَ بِمَا أَحَبَّ، وَيَأْتِيَ الْقَبْرَ '
              'وَيُعِيدَ نَحْوَ السَّلَامِ وَالدُّعَاءِ الْمَذْكُورِ فِي '
              'ابْتِدَاءِ الزِّيَارَةِ',
          permasalahan: <String>[
            'Turutan: solat dua rakaat dahulu, kemudian ke makam. Hasyiah (dalam '
                'nota kaki) menyebut ini berbeza dengan pendapat yang '
                'mendahulukan salam perpisahan di makam sebelum solat.',
            'Larangan berjalan mengundur selaras dengan pendirian an-Nawawi '
                'ketika meninggalkan Masjidil Haram selepas Tawaf Wada’ (lihat '
                'Modul 14): perbuatan itu tiada asal dalam sunnah.',
            'Tiada "tawaf wada’" atau ibadah wajib ketika meninggalkan Madinah; '
                'semua adab ini sunat dan tidak dikenakan dam jika ditinggalkan.',
          ],
        ),
      ),
    ],
    duas: <ModuleDua>[
      ModuleDua(
        title: 'Salam kepada Rasulullah ﷺ',
        arabic:
            'السَّلَامُ عَلَيْكَ يَا رَسُولَ اللَّهِ، السَّلَامُ عَلَيْكَ '
            'يَا نَبِيَّ اللَّهِ',
        translation:
            'Salam sejahtera ke atasmu wahai Rasulullah, salam sejahtera '
            'ke atasmu wahai Nabi Allah.',
        source:
            'Al-Idah, Bab 6 — permulaan lafaz salam ziarah; sekurang-'
            'kurangnya: "As-salamu ’alaika ya Rasulallah"',
      ),
      ModuleDua(
        title: 'Salam yang Lebih Lengkap (Diringkaskan)',
        arabic:
            'السَّلَامُ عَلَيْكَ يَا خِيرَةَ اللَّهِ، السَّلَامُ عَلَيْكَ يَا '
            'حَبِيبَ اللَّهِ، السَّلَامُ عَلَيْكَ يَا نَبِيَّ الرَّحْمَةِ، '
            'السَّلَامُ عَلَيْكَ وَعَلَىٰ آلِكَ وَأَهْلِ بَيْتِكَ وَأَزْوَاجِكَ '
            'وَذُرِّيَّتِكَ وَأَصْحَابِكَ أَجْمَعِينَ، جَزَاكَ اللَّهُ يَا رَسُولَ '
            'اللَّهِ عَنَّا أَفْضَلَ مَا جَزَىٰ نَبِيًّا وَرَسُولًا عَنْ أُمَّتِهِ، '
            'أَشْهَدُ أَنَّكَ قَدْ بَلَّغْتَ الرِّسَالَةَ، وَأَدَّيْتَ الْأَمَانَةَ، '
            'وَنَصَحْتَ الْأُمَّةَ، وَجَاهَدْتَ فِي اللَّهِ حَقَّ جِهَادِهِ',
        translation:
            'Salam sejahtera ke atasmu wahai pilihan Allah; salam sejahtera ke '
            'atasmu wahai kekasih Allah; salam sejahtera ke atasmu wahai Nabi '
            'pembawa rahmat; salam sejahtera ke atasmu, keluargamu, ahli baitmu, '
            'isteri-isterimu, zuriatmu dan seluruh sahabatmu. Semoga Allah '
            'membalasmu, wahai Rasulullah, bagi pihak kami dengan sebaik-baik '
            'balasan yang dikurniakan kepada seorang nabi dan rasul bagi pihak '
            'umatnya. Aku bersaksi bahawa engkau telah menyampaikan risalah, '
            'menunaikan amanah, menasihati umat dan berjihad pada jalan Allah '
            'dengan sebenar-benar jihad.',
        source:
            'Al-Idah, Bab 6 (masalah ke-7) — petikan daripada lafaz salam yang '
            'panjang (diringkaskan), diucapkan dengan suara sederhana menghadap '
            'makam; lafaz susunan ulama',
      ),
      ModuleDua(
        title: 'Salam di Perkuburan Baqi’',
        arabic:
            'السَّلَامُ عَلَيْكُمْ دَارَ قَوْمٍ مُؤْمِنِينَ، وَإِنَّا إِنْ شَاءَ '
            'اللَّهُ بِكُمْ لَاحِقُونَ، اللَّهُمَّ اغْفِرْ لِأَهْلِ بَقِيعِ '
            'الْغَرْقَدِ، اللَّهُمَّ اغْفِرْ لَنَا وَلَهُمْ',
        translation:
            'Salam sejahtera ke atas kamu, wahai penghuni negeri kaum mukminin, '
            'dan sesungguhnya kami, insya-Allah, akan menyusuli kamu. Ya Allah, '
            'ampunkanlah penghuni Baqi’ al-Gharqad. Ya Allah, ampunkanlah kami '
            'dan mereka.',
        source:
            'Al-Idah, Bab 6 (masalah ke-10) — diucapkan ketika sampai di Baqi’ '
            'selepas menziarahi makam Rasulullah SAW',
      ),
      ModuleDua(
        title: 'Doa Ketika Meninggalkan Madinah',
        arabic:
            'اللَّهُمَّ لَا تَجْعَلْ هَـٰذَا آخِرَ الْعَهْدِ بِحَرَمِ رَسُولِكَ، '
            'وَيَسِّرْ لِي الْعَوْدَ إِلَى الْحَرَمَيْنِ سَبِيلًا سَهْلَةً، '
            'وَارْزُقْنِي الْعَفْوَ وَالْعَافِيَةَ فِي الدُّنْيَا وَالْآخِرَةِ، '
            'وَرُدَّنَا سَالِمِينَ غَانِمِينَ',
        translation:
            'Ya Allah, janganlah Engkau jadikan ini kunjungan terakhirku ke Tanah '
            'Haram Rasul-Mu; permudahkanlah jalan bagiku untuk kembali ke dua Tanah '
            'Haram, kurniakanlah aku keampunan dan kesejahteraan di dunia dan '
            'akhirat, dan kembalikanlah kami dalam keadaan selamat serta beroleh '
            'kebaikan.',
        source:
            'Al-Idah, Bab 6 (masalah ke-21) — dibaca ketika hendak meninggalkan '
            'Madinah, selepas solat dua rakaat dan mengulangi salam di makam; doa '
            'anjuran ulama',
      ),
    ],
    academicInsight:
        'Bab Keenam al-Idah memperlihatkan dua sisi yang saling mengimbangi '
        'dalam pemikiran Imam an-Nawawi. Pertama, penghormatan yang tinggi '
        'kepada Rasulullah SAW: ziarah makam baginda disifatkan antara qurbah '
        'terpenting, disertai adab terperinci — mandi, pakaian bersih, suara '
        'yang direndahkan, dan lafaz salam yang tersusun. Kedua, ketegasan '
        'menjaga batas syarak: tidak harus bertawaf di makam, makruh '
        'mengusap dan menciumnya, dan amalan orang awam yang tiada asal '
        'ditolak dengan jelas. Prinsip an-Nawawi ringkas: keberkatan terletak '
        'pada apa yang menepati syarak, bukan pada apa yang kelihatan lebih '
        'bersemangat. Beliau juga memisahkan ziarah Madinah daripada manasik — '
        'ia ibadah tersendiri yang amat dianjurkan, bukan syarat kesempurnaan '
        'Haji — serta menolak hadis palsu yang mengaitkan Haji dengan ziarah '
        'tempat lain.',
    reflectionQuestions: <String>[
      'Bagaimanakah prinsip an-Nawawi bahawa "keberkatan terletak pada apa '
          'yang menepati syarak" membantu jemaah mengimbangi kecintaan kepada '
          'Rasulullah SAW dengan adab di makam baginda?',
      'Mengapakah an-Nawawi berpendapat gandaan seribu solat di Masjid Nabawi '
          'khusus bagi kawasan masjid zaman Nabi SAW, tetapi tetap mendahulukan '
          'saf pertama ketika solat berjemaah?',
      'Apakah kesan praktikal pendirian bahawa ziarah Madinah ialah ibadah '
          'tersendiri dan bukan sebahagian manasik Haji?',
    ],
  ),
];
