import 'package:flutter/material.dart';

import '../islamic_icons.dart';
import '../learning_module_screen.dart';
import '../shared_widgets.dart' show ModuleDua;

// ---------------------------------------------------------------------------
// MODUL LANJUTAN AL-IDAH — BAB 1 (ADAB SAFAR) DAN BAB 2 (IHRAM)
//
// Sumber utama: al-Idah fi Manasik al-Hajj wa al-‘Umrah karangan Imam
// an-Nawawi (Shamela, book_id 96232). Rujukan halaman ditulis sebagai
// "hlm. <page_id Shamela> [<halaman cetakan>]".
//
// "Al-Idah" atau "an-Nawawi" = matan an-Nawawi sendiri. "Nota kaki al-Ifsah"
// = syarah ‘Abd al-Fattah Rawah; "hasyiah Ibn Hajar" = hasyiah Ibn Hajar
// al-Haytami yang dinukil dalam nota kaki itu. Kedua-duanya BUKAN kata-kata
// an-Nawawi.
//
// Doa yang sudah wujud dalam aplikasi disalin huruf demi huruf (teks Arab
// dan sumber) supaya lafaznya seragam di seluruh aplikasi.
// ---------------------------------------------------------------------------

const List<LearningModuleData> idahModulesBab1Bab2 = <LearningModuleData>[
  // =========================================================================
  // MODUL 06 — ADAB & FIQH MUSAFIR (al-Idah, Bab 1)
  // =========================================================================
  LearningModuleData(
    number: '06',
    title: 'Adab & Fiqh Musafir',
    subtitle: 'Persiapan, adab perjalanan dan rukhsah solat serta bersuci.',
    icon: HajjIconType.preparation,
    accent: Color(0xFF3887B6),
    sections: <LearningSection>[
      // ---------------------------------------------------------------
      LearningSection(
        title: 'Persiapan sebelum berangkat',
        points: <String>[
          'Minta pandangan orang yang dipercayai agama, ilmu dan pengalamannya, kemudian solat istikharah — istikharah ini tentang masa dan urusan perjalanan, bukan tentang baik atau tidaknya Haji.',
          'Bertaubat daripada semua dosa, selesaikan hutang yang mampu dibayar, pulangkan barang amanah dan minta halal daripada orang yang pernah berurusan dengan kita.',
          'Tulis wasiat, lantik wakil untuk melunaskan baki hutang, dan tinggalkan nafkah yang cukup untuk keluarga sehingga pulang.',
          'Dapatkan reda ibu bapa; isteri pula mendapatkan izin suami. Belanja Haji mestilah daripada harta yang halal.',
          'Pelajari tatacara Haji dan bawa sebuah kitab manasik yang jelas; pilih rakan perjalanan yang soleh, lebih baik lagi yang berilmu.',
          'Sunat bertolak pada hari Khamis (jika tidak, hari Isnin) dan pada awal pagi.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'يَا أَيُّهَا الَّذِينَ آمَنُوا أَنْفِقُوا مِنْ طَيِّبَاتِ '
                  'مَا كَسَبْتُمْ وَمِمَّا أَخْرَجْنَا لَكُمْ مِنَ الْأَرْضِ '
                  'وَلَا تَيَمَّمُوا الْخَبِيثَ مِنْهُ تُنْفِقُونَ',
              terjemahan:
                  'Wahai orang yang beriman, belanjakanlah sebahagian '
                  'daripada hasil usaha kamu yang baik-baik dan sebahagian '
                  'daripada apa yang Kami keluarkan dari bumi untuk kamu, '
                  'dan janganlah kamu sengaja memilih yang buruk untuk '
                  'dibelanjakan — ayat yang dipetik an-Nawawi tentang '
                  'bekalan Haji.',
              sumber:
                  'Al-Baqarah (2):267; dipetik dalam al-Idah, Bab 1, '
                  'Masalah ke-6, hlm. 49 [52]',
            ),
            DalilItem(
              arabic: 'الدِّينُ النَّصِيحَةُ',
              terjemahan:
                  'Agama itu nasihat — asas kewajipan orang yang dimintai '
                  'pandangan supaya menasihati dengan jujur.',
              sumber:
                  'Riwayat Muslim (no. 55) daripada Tamim ad-Dari r.a.; '
                  'disebut dalam al-Idah, Bab 1, Masalah ke-1, hlm. 42 [45] '
                  '(takhrij daripada nota kaki al-Ifsah)',
            ),
          ],
          teksKitab:
              'Bab Pertama al-Idah (adab safar) dibuka dengan siri masalah '
              'tentang persiapan: masalah ke-1 hingga ke-13, hlm. 42–56 '
              '[45–59]. Imam an-Nawawi menegaskan bahawa istikharah tidak '
              'kembali kepada Haji itu sendiri kerana Haji ialah kebaikan '
              'yang tidak diragui; ia hanya tentang waktunya. Beliau juga '
              'menyatakan bahawa Haji dengan harta syubhah atau harta '
              'rampasan sah pada zahir hukum, tetapi bukan Haji mabrur dan '
              'jauh daripada diterima (hlm. 48–49 [51–52]).',
          teksKitabArabic:
              'وَهَذِهِ الِاسْتِخَارَةُ لَا تَعُودُ إِلَى نَفْسِ الْحَجِّ، '
              'فَإِنَّهُ خَيْرٌ لَا شَكَّ فِيهِ، وَإِنَّمَا تَعُودُ إِلَى '
              'وَقْتِهِ',
          permasalahan: <String>[
            'Hutang (hlm. 46–47 [49–50]): jika hutang sudah tiba tempoh '
                'dan dia mampu membayar, pemiutang berhak menghalangnya '
                'keluar; jika dia susah, pemiutang tiada hak menuntut dan '
                'dia boleh bermusafir; jika hutang bertangguh, dia boleh '
                'bermusafir tanpa reda pemiutang, tetapi sunat melantik '
                'wakil untuk membayarnya apabila tiba tempoh.',
            'Ibu bapa (hlm. 47 [50]): jika ibu atau bapa melarang Haji '
                'fardu, larangan itu tidak dipedulikan; jika melarang Haji '
                'sunat, anak tidak boleh berihram, dan jika dia berihram '
                'juga, ibu bapa boleh menyuruhnya bertahallul (pendapat '
                'asah).',
            'Isteri (hlm. 48 [51]): suami boleh melarang isteri daripada '
                'Haji sunat, dan juga Haji fardu menurut pendapat azhar, '
                'kerana hak suami bersifat segera sedangkan Haji wajib '
                'secara bertangguh. Tahallul isteri dilakukan dengan '
                'menyembelih seekor kambing berniat tahallul dan '
                'memendekkan sekurang-kurangnya tiga helai rambut.',
            'Harta haram (hlm. 48–49 [51–52]): menurut asy-Syafi’i, '
                'Malik, Abu Hanifah dan jumhur, Haji dengan harta haram sah '
                'pada zahirnya tetapi tidak mabrur; Imam Ahmad berpendapat '
                'ia tidak memadai.',
            'Rakan dan badal (hlm. 54–56 [57–59]): an-Nawawi menolak '
                'pendapat yang mengutamakan orang asing sebagai rakan '
                'perjalanan — saudara atau sahabat yang dipercayai lebih '
                'baik. Mengerjakan Haji untuk orang lain dengan upah '
                'dibolehkan, malah disebut "antara sebaik-baik pencarian", '
                'walaupun meninggalkan yang lebih afdal.',
          ],
        ),
      ),
      // ---------------------------------------------------------------
      LearningSection(
        title: 'Adab sepanjang perjalanan',
        points: <String>[
          'Solat sunat dua rakaat sebelum keluar rumah (al-Kafirun dan al-Ikhlas), kemudian baca Ayat al-Kursi dan surah Quraisy; bersalaman dan saling mendoakan dengan keluarga (doanya dalam Modul 01).',
          'Jaga akhlak: elakkan bertengkar, berasak-asak di laluan dan tempat air, mengumpat dan melaknat; berlembut dengan petugas dan orang yang meminta.',
          'Jangan bermusafir seorang diri; jika bertiga atau lebih, lantik ketua yang paling baik pendapatnya dan taatilah dia.',
          'Bertakbir apabila mendaki tempat tinggi dan bertasbih apabila menurun, tanpa meninggikan suara secara berlebihan.',
          'Perbanyakkan doa kerana doa musafir mustajab; kekalkan wuduk dan jaga solat pada waktunya.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic: 'إِذَا كَانُوا ثَلَاثَةً فَلْيُؤَمِّرُوا أَحَدَهُمْ',
              terjemahan:
                  'Apabila mereka bertiga (dalam perjalanan), hendaklah '
                  'mereka melantik salah seorang sebagai ketua.',
              sumber:
                  'Riwayat Abu Dawud daripada Abu Hurairah r.a. — '
                  'an-Nawawi menyatakan sanadnya hasan (al-Idah, Bab 1, '
                  'Masalah ke-20, hlm. 64 [67]); lafaz seperti dinukil '
                  'al-Idah',
            ),
            DalilItem(
              arabic:
                  'ثَلَاثُ دَعَوَاتٍ مُسْتَجَابَاتٌ لَا شَكَّ فِيهِنَّ: '
                  'دَعْوَةُ الْمَظْلُومِ، وَدَعْوَةُ الْمُسَافِرِ، وَدَعْوَةُ '
                  'الْوَالِدِ عَلَى وَلَدِهِ',
              terjemahan:
                  'Tiga doa yang mustajab, tiada keraguan padanya: doa orang '
                  'yang dizalimi, doa musafir dan doa bapa terhadap anaknya.',
              sumber:
                  'Riwayat at-Tirmidhi (no. 1905) dan Ibn Majah (no. 3862) '
                  'daripada Abu Hurairah r.a.; al-Idah (Masalah ke-28, '
                  'hlm. 69 [72]) turut menisbahkannya kepada Abu Dawud '
                  'tanpa lafaz "terhadap anaknya"',
            ),
          ],
          teksKitab:
              'Masalah ke-14 hingga ke-29 Bab Pertama (hlm. 57–70 '
              '[60–73]) menghuraikan adab dari pintu rumah hingga '
              'sepanjang jalan. Dalam masalah ke-19, an-Nawawi '
              'mengingatkan supaya jemaah menjauhi kenyang berlebihan, '
              'perhiasan, bermewah-mewah dan bermacam-macam juadah, '
              'kerana orang yang berhaji itu sifatnya kusut dan berdebu.',
          teksKitabArabic:
              'أَنْ يَتَجَنَّبَ الشَّبَعَ الْمُفْرِطَ وَالزِّينَةَ '
              'وَالتَّرَفُّهَ وَالتَّبَسُّطَ فِي أَلْوَانِ الْأَطْعِمَةِ، '
              'فَإِنَّ الْحَاجَّ أَشْعَثُ أَغْبَرُ',
          permasalahan: <String>[
            'Berkenderaan lebih afdal daripada berjalan kaki dalam Haji '
                'menurut mazhab yang sahih, kerana Nabi SAW berhaji dengan '
                'berkenderaan; menggunakan kenderaan yang lebih selesa '
                'kerana uzur badan dibenarkan, tetapi bukan kerana megah '
                'pangkat dan kedudukan (Masalah ke-9, hlm. 51–52 [54–55]).',
            'Bermusafir seorang diri dimakruhkan berdasarkan hadis "Seorang '
                'penunggang itu syaitan, dua penunggang dua syaitan, dan '
                'tiga orang itu rombongan" (riwayat Abu Dawud no. 2607 dan '
                'at-Tirmidhi no. 1674). Ketua dipilih daripada yang paling '
                'afdal dan paling baik pendapatnya (Masalah ke-20).',
            'Orang yang meminta tidak boleh diherdik atau dicela kerana '
                'keluar tanpa bekalan; bantulah dengan apa yang mudah, '
                'atau tolak dengan baik dan doakan dia (Masalah ke-19).',
            'Makruh membawa loceng (jaras) atau anjing dalam rombongan '
                'kerana malaikat tidak menyertainya (riwayat Muslim, '
                'disebut an-Nawawi). Jika ia dilakukan orang lain dan tidak '
                'mampu dihalang, Ibn as-Salah menganjurkan doa berlepas '
                'diri daripada perbuatan itu (Masalah ke-21).',
            'Makruh berhenti atau berkhemah di tengah laluan pada waktu '
                'malam kerana ia tempat binatang berbisa (Masalah ke-24); '
                'doa ketika singgah dan ketika malam menjelang terdapat '
                'dalam bahagian doa modul ini.',
          ],
        ),
      ),
      // ---------------------------------------------------------------
      LearningSection(
        title: 'Qasar, jamak, jemaah dan sunat rawatib',
        points: <String>[
          'Musafir dalam perjalanan jauh yang harus boleh mengqasarkan Zohor, Asar dan Isyak menjadi dua rakaat, dan menjamakkan Zohor dengan Asar serta Maghrib dengan Isyak.',
          'Menurut al-Idah, yang lebih afdal ialah mengqasar tetapi tidak menjamak, untuk keluar daripada khilaf ulama — kecuali di Arafah dan Muzdalifah.',
          'Niat qasar wajib ada ketika takbiratulihram.',
          'Jika sedang berhenti pada waktu solat pertama, jamak taqdim lebih afdal; jika sedang dalam perjalanan, jamak takhir lebih afdal.',
          'Solat berjemaah dan sunat rawatib tetap disunatkan dalam perjalanan.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'وَإِذَا ضَرَبْتُمْ فِي الْأَرْضِ فَلَيْسَ عَلَيْكُمْ '
                  'جُنَاحٌ أَنْ تَقْصُرُوا مِنَ الصَّلَاةِ',
              terjemahan:
                  'Dan apabila kamu bermusafir di muka bumi, maka tiada '
                  'dosa ke atas kamu mengqasarkan solat.',
              sumber: 'An-Nisa’ (4):101',
            ),
          ],
          teksKitab:
              'Masalah ke-29 Bab Pertama, diikuti tiga fasal ringkas tentang '
              'azan, jemaah dan sunat rawatib (hlm. 70–72 [73–75]). '
              'An-Nawawi memberi musafir pilihan: mengqasar dan menjamak, '
              'meninggalkan kedua-duanya, atau melakukan salah satu sahaja; '
              'namun yang afdal ialah mengqasar tanpa menjamak kerana Abu '
              'Hanifah dan lain-lain berpendapat qasar itu wajib dan jamak '
              'haram kecuali di Arafah dan Muzdalifah.',
          teksKitabArabic:
              'وَلَهُ أَنْ يَقْصُرَ وَيَجْمَعَ، وَلَهُ تَرْكُ الْجَمْعِ '
              'وَالْقَصْرِ، وَلَهُ فِعْلُ أَحَدِهِمَا وَتَرْكُ الْآخَرِ، '
              'لَكِنَّ الْأَفْضَلَ أَنْ تَقْصُرَ وَأَنْ لَا يَجْمَعَ '
              'لِلْخُرُوجِ مِنْ خِلَافِ الْعُلَمَاءِ فِي ذَلِكَ',
          permasalahan: <String>[
            'Syarat jamak taqdim ada tiga: dimulakan dengan solat pertama, '
                'berniat jamak sebelum selesai solat pertama (afdal ketika '
                'takbiratulihram), dan tidak dipisahkan dengan solat sunat '
                'atau selainnya. Jarak dua tiga patah perkataan, atau '
                'bertayammum semula tanpa melengahkan, tidak menjejaskannya.',
            'Jamak takhir mewajibkan niat menangguhkan solat pertama '
                'semasa masih ada waktu yang cukup untuknya. Jika tidak '
                'berniat sehingga waktunya keluar, dia berdosa dan solat itu '
                'menjadi qada; tertib dan berturutan dalam jamak takhir '
                'hanya sunat (asah).',
            'Solat yang terlepas dalam musafir lalu diqada dalam musafir: '
                'lebih utama disempurnakan, tetapi harus diqasar (asah).',
            'Azan: jika dijamak pada waktu pertama, azan untuk solat '
                'pertama dan iqamah untuk setiap satu; begitu juga jamak '
                'takhir menurut pendapat asah. Susunan rawatib ketika jamak '
                'Zohor-Asar: sunat qabliyah Zohor, Zohor, Asar, sunat '
                'ba’diyah Zohor, kemudian sunat Asar.',
            'Nota kaki al-Ifsah menyenaraikan sembilan syarat qasar, '
                'antaranya: perjalanan jauh lagi harus, ada destinasi yang '
                'diketahui, telah melepasi sempadan kawasan, dan tidak '
                'berimamkan orang yang solat sempurna (tamam) walaupun '
                'sebahagian solat — penting diingat ketika berjemaah di '
                'Masjidil Haram.',
          ],
        ),
      ),
      // ---------------------------------------------------------------
      LearningSection(
        title: 'Menyapu khuf',
        points: <String>[
          'Musafir sejauh dua marhalah atau lebih boleh menyapu khuf selama tiga hari tiga malam, dikira bermula dari hadas selepas memakainya.',
          'Khuf mesti dipakai dalam keadaan suci sempurna dan menutup kaki hingga buku lali dari bawah dan dari keempat-empat sisi.',
          'Sapuan tidak memadai untuk mandi wajib: jika berjunub atau haid, khuf wajib ditanggalkan.',
          'Cara terbaik: sapu bahagian atas dan bawah secara bergaris; menyapu sedikit di bahagian atas sudah memadai.',
          'Rukhsah ini berguna sebelum berihram dan selepas tahallul; lelaki yang sedang berihram tidak boleh memakai khuf (lihat Modul 03).',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'جَعَلَ رَسُولُ اللَّهِ ﷺ ثَلَاثَةَ أَيَّامٍ '
                  'وَلَيَالِيَهُنَّ لِلْمُسَافِرِ',
              terjemahan:
                  'Rasulullah SAW menetapkan (tempoh menyapu khuf) tiga hari '
                  'tiga malam bagi musafir.',
              sumber:
                  'Riwayat Muslim (no. 276) daripada Ali r.a. (dengan '
                  'sambungan "sehari semalam bagi orang yang bermukim")',
            ),
          ],
          teksKitab:
              'Fasal menyapu khuf dalam Bab Pertama, hlm. 73–75 [76–78]. '
              'Di hujung fasal, Imam an-Nawawi menjelaskan sebab beliau '
              'memasukkan bab bersuci ini ke dalam kitab manasik: musafir '
              'memerlukannya untuk menjimatkan air bersuci dan meringankan '
              'urusannya.',
          teksKitabArabic:
              'وَإِنَّمَا ذَكَرْتُ هَذَا الْفَصْلَ فِي مَسْحِ الْخُفِّ '
              'لِأَنَّهُ مِمَّا يَحْتَاجُ إِلَيْهِ الْمُسَافِرُ لِتَوْفِيرِ '
              'مَاءِ الطَّهَارَةِ وَتَخْفِيفِ أَمْرِهَا',
          permasalahan: <String>[
            'Tempoh bermula dari saat berhadas selepas memakai khuf, bukan '
                'dari saat memakainya. Satu sapuan boleh digunakan untuk '
                'seberapa banyak solat fardu dan sunat selagi tempoh belum '
                'tamat.',
            'Menyapu bahagian bawah atau tepi sahaja tidak memadai (asah). '
                'Sapuan dengan tangan, kayu atau kain semuanya sah; '
                'menitiskan air atau membasuh khuf juga memadai (asah), '
                'tetapi membasuh dimakruhkan.',
            'Jika tempoh tamat atau sebahagian kaki terdedah: orang yang '
                'masih dalam wuduk sapuan sebaiknya mengambil wuduk baharu; '
                'membasuh kaki sahaja memadai menurut pendapat asah.',
            'Jika berjunub dalam tempoh, membasuh kaki di dalam khuf '
                'mengangkat junub dan solatnya sah, tetapi dia tidak boleh '
                'menyapu lagi sehingga memakai semula khuf dalam keadaan '
                'suci.',
          ],
        ),
      ),
      // ---------------------------------------------------------------
      LearningSection(
        title: 'Solat sunat atas kenderaan dan arah kiblat',
        points: <String>[
          'Dalam perjalanan, jauh atau dekat, solat sunat boleh dilakukan di atas kenderaan atau sambil berjalan kaki, menghadap arah destinasi.',
          'Pejalan kaki menghadap kiblat ketika takbiratulihram, rukuk dan sujud, serta rukuk dan sujud di atas tanah.',
          'Penunggang yang mudah memusingkan kenderaan menghadap kiblat ketika takbiratulihram sahaja; rukuk dan sujud dengan isyarat, sujud lebih rendah daripada rukuk.',
          'Solat fardu tidak sah dalam keadaan berjalan atau di atas kenderaan yang bergerak, kecuali kerana darurat — dan ketika itu wajib diulang.',
          'Untuk menentukan kiblat: ikut khabar orang adil yang mengetahui; jika tiada, berijtihad; jika tidak mampu, ikut orang yang arif.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'كَانَ يُسَبِّحُ عَلَى ظَهْرِ رَاحِلَتِهِ حَيْثُ كَانَ '
                  'وَجْهُهُ، وَيُومِئُ بِرَأْسِهِ',
              terjemahan:
                  'Baginda SAW solat sunat di atas belakang tunggangannya ke '
                  'mana sahaja arah ia menghadap, dan berisyarat dengan '
                  'kepalanya.',
              sumber:
                  'Riwayat al-Bukhari (no. 1105) dan Muslim (no. 700) '
                  'daripada Ibnu Umar r.a.',
            ),
          ],
          teksKitab:
              'Fasal solat sunat ketika musafir, hlm. 75–80 [78–83]. '
              'Selepas menghuraikan kelonggaran bagi solat sunat, an-Nawawi '
              'menegaskan perbezaannya dengan solat fardu: fardu tidak boleh '
              'menghadap selain kiblat dalam apa jua keadaan, dan tidak '
              'boleh dilakukan sambil berjalan walaupun menghadap kiblat.',
          teksKitabArabic:
              'أَمَّا الْفَرَائِضُ فَلَا تَجُوزُ إِلَى غَيْرِ الْقِبْلَةِ '
              'بِحَالٍ، وَلَا يَجُوزُ أَنْ يُصَلِّيَهَا مَاشِيًا وَإِنْ '
              'كَانَ مُسْتَقْبِلًا',
          permasalahan: <String>[
            'Fardu di atas tunggangan yang berhenti, dalam haudaj dengan '
                'semua rukun sempurna dan menghadap kiblat: sah menurut '
                'mazhab sahih, manakala Imam al-Haramain berpendapat tidak '
                'sah. Jika tunggangan bergerak: tidak sah menurut nas '
                'asy-Syafi’i dan jumhur. Fardu di atas usungan yang dipikul '
                'orang: sah menurut pendapat asah.',
            'Jika takut tertinggal rombongan atau bimbang keselamatan diri '
                'dan harta, dia solat fardu di atas kenderaan dan wajib '
                'mengulanginya. Nota kaki al-Ifsah mencatat an-Nawawi dalam '
                'al-Majmu’ memilih, dari sudut dalil, bahawa solat yang '
                'dilakukan dalam waktu dengan kecacatan tidak perlu diqada.',
            'Solat sunat penunggang: bahagian pelana yang bersentuhan '
                'dengan badan dan pakaiannya mesti suci. Memacu kenderaan '
                'atau berlari tanpa keperluan membatalkan solat (asah).',
            'Menyimpang dari arah destinasi: jika ke arah kiblat, tidak '
                'mengapa; jika sengaja ke arah lain, batal; jika terlupa '
                'lalu segera kembali, tidak batal.',
            'Kiblat: jika yakin tersilap selepas solat, wajib ulang (asah); '
                'jika sekadar sangkaan tersilap, tidak perlu ulang. Orang '
                'yang mampu mempelajari tanda kiblat tetapi memilih '
                'bertaqlid wajib mengqada kerana cuai.',
          ],
        ),
      ),
      // ---------------------------------------------------------------
      LearningSection(
        title: 'Tayammum dan keutamaan air minum',
        points: <String>[
          'Cari air terlebih dahulu; jika tiada, bertayammum.',
          'Air yang diperlukan untuk minum — diri sendiri, rakan atau haiwan yang dihormati, sekarang atau sebelum bertemu air lain — tidak boleh digunakan untuk wuduk; wajib bertayammum.',
          'Jika air dijual pada harga biasa dan wang mencukupi selepas keperluan pergi balik, wajib membelinya; jika lebih mahal, tidak wajib.',
          'Tayammum dengan tanah suci yang berdebu: sapu muka dan kedua tangan hingga siku dengan dua tepukan, selepas masuk waktu; satu tayammum untuk satu solat fardu.',
          'Sunat membawa sedikit tanah dalam kain untuk bertayammum di tempat yang tiada tanah.',
          'Jika sakit atau luka dan takut mudarat dengan air, bertayammum dan tidak perlu mengulang solat.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'فَلَمْ تَجِدُوا مَاءً فَتَيَمَّمُوا صَعِيدًا طَيِّبًا '
                  'فَامْسَحُوا بِوُجُوهِكُمْ وَأَيْدِيكُمْ',
              terjemahan:
                  '...lalu kamu tidak mendapat air, maka bertayammumlah '
                  'dengan tanah yang suci; sapulah muka dan tangan kamu.',
              sumber: 'An-Nisa’ (4):43',
            ),
          ],
          teksKitab:
              'Lapan fasal pendek tentang tayammum, hlm. 81–86 [84–89]. '
              'Imam an-Nawawi memberi amaran keras: ramai jemaah tersilap '
              'apabila berwuduk dengan air sedangkan mereka tahu orang lain '
              'memerlukannya untuk minum — wuduk itu haram tanpa syak, dan '
              'sesiapa menyangka ia satu kelebihan adalah sangat tersilap. '
              'Hukum mandi junub dan haid sama seperti wuduk.',
          teksKitabArabic:
              'وَهَذِهِ الْمَسْأَلَةُ مِمَّا يَنْبَغِي حِفْظُهَا '
              'وَإِشَاعَتُهَا، فَإِنَّ كَثِيرِينَ مِنَ الْحُجَّاجِ '
              'وَغَيْرِهِمْ يُخْطِئُونَ فِيهَا، وَيَتَوَضَّأُ أَحَدُهُمْ مَعَ '
              'عِلْمِهِ بِحَاجَةِ النَّاسِ إِلَى الشُّرْبِ، وَهَذَا '
              'الْوُضُوءُ حَرَامٌ لَا شَكَّ فِيهِ',
          permasalahan: <String>[
            'Nyawa didahulukan: pemilik air yang memerlukannya untuk '
                'kehausan diri sendiri lebih berhak; tetapi jika dia tidak '
                'memerlukannya sedangkan ada orang yang terdesak kehausan, '
                'orang itu berhak mengambilnya walaupun secara paksa. '
                'Sebaliknya, air untuk wuduk tidak wajib diberikan dan tidak '
                'boleh dirampas, kerana tayammum ada sebagai ganti.',
            'Air yang tidak mencukupi wajib digunakan dahulu, kemudian '
                'bertayammum bagi bahagian yang berbaki (asah). Wajib '
                'meminta air daripada orang yang diketahui memilikinya, dan '
                'wajib menerima jika diberi.',
            'Pasir semata-mata tidak sah untuk tayammum; tanah bercampur '
                'pasir sah. Nota kaki al-Ifsah mencatat Malik dan Abu '
                'Hanifah mengharuskan tayammum dengan semua jenis permukaan '
                'bumi, termasuk batu.',
            'Tayammum untuk fardu dan sunat rawatib tidak sah sebelum masuk '
                'waktu (asah). Dengan satu tayammum, boleh solat sunat '
                'sebanyak mana pun sebelum atau selepas fardu.',
            'Tiada air dan tiada tanah: solat fardu sahaja mengikut '
                'keadaan, kemudian wajib diulang. Jika air ditemui selepas '
                'solat dengan tayammum, atau semasa solat, solatnya sah dan '
                'tidak perlu diulang.',
          ],
        ),
      ),
      // ---------------------------------------------------------------
      LearningSection(
        title: 'Kematian dalam rombongan dan berbuat makruf',
        points: <String>[
          'Jika ahli rombongan meninggal dunia, wajib ke atas yang mengetahuinya memandikan, mengkafankan, menyembahyangkan dan mengebumikannya; semuanya berdosa jika diabaikan sedangkan mampu.',
          'Jika tiada air, jenazah ditayammumkan dahulu dan dikafankan, kemudian barulah mereka bertayammum dan menyembahyangkannya.',
          'Jenazah lelaki yang sedang berihram tidak dikafankan dengan kain berjahit, kepalanya tidak ditutup dan tidak diwangikan; muka jenazah wanita berihram tidak ditutup.',
          'Kafan minimum menutup seluruh badan; yang sempurna tiga helai bagi lelaki dan lima bagi wanita. Kubur sekurang-kurangnya menghalang binatang buas dan bau.',
          'Sepanjang jalan, rebutlah peluang berbuat makruf: beri minum yang dahaga dan tumpangkan yang terkandas.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'وَلَا تُخَمِّرُوا رَأْسَهُ، فَإِنَّهُ يُبْعَثُ يَوْمَ '
                  'الْقِيَامَةِ مُلَبِّيًا',
              terjemahan:
                  'Dan jangan kamu tutup kepalanya, kerana dia akan '
                  'dibangkitkan pada hari kiamat dalam keadaan bertalbiyah — '
                  'sabda Nabi SAW tentang lelaki berihram yang meninggal '
                  'kerana jatuh dari untanya.',
              sumber:
                  'Riwayat al-Bukhari (no. 1265) dan Muslim (no. 1206) '
                  'daripada Ibnu Abbas r.a.',
            ),
          ],
          teksKitab:
              'Fasal hukum orang yang meninggal dalam rombongan Haji, hlm. '
              '87–88 [90–91]. An-Nawawi menyebut beliau telah menghimpun '
              'tentang bab ini hampir satu jilid daripada kitab-kitab fiqh, '
              'lalu meringkaskan perkara yang wajib diketahui jemaah. Fasal '
              'berikutnya (hlm. 88–89 [91–92]) mewasiatkan supaya jemaah '
              'bersungguh-sungguh berbuat makruf di sepanjang jalan.',
          teksKitabArabic:
              'فَإِنْ كَانَ الْمَيِّتُ رَجُلًا مُحْرِمًا لَمْ يُكَفَّنْ فِي '
              'الْمَخِيطِ، وَلَا يُغَطَّى رَأْسُهُ، وَلَا يُقَرَّبُ الطِّيبَ',
          permasalahan: <String>[
            'Tayammum jemaah untuk solat jenazah tidak sah sebelum jenazah '
                'itu sendiri dimandikan atau ditayammumkan, kerana waktu '
                'solat jenazah belum masuk sebelum itu.',
            'Kafan sutera haram bagi lelaki; harus tetapi makruh bagi '
                'wanita. Tentang kadar minimum kafan, mazhab sahih ialah '
                'menutup seluruh badan, dan ada pendapat memadai menutup '
                'aurat; nota kaki al-Ifsah menghimpunkan kedua-duanya: '
                'menutup aurat ialah hak Allah, menutup seluruh badan ialah '
                'hak si mati.',
            'Fardu solat jenazah gugur dengan solat seorang (mazhab '
                'mukhtar), tetapi tidak gugur dengan solat wanita atau '
                'kanak-kanak jika ada lelaki. Nota kaki al-Ifsah mencatat '
                'pendapat muktamad an-Nawawi dalam kitab lain: gugur dengan '
                'solat kanak-kanak mumayyiz. Jika sebahagian perkara di atas '
                'tidak dapat dilakukan, buat apa yang mampu.',
            'Empat sebab sedekah di jalan Makkah lebih utama: keperluan '
                'lebih mendesak; tiada tempat lain untuk mendapatkan '
                'bantuan; melawan sifat kedekut kerana takut kekurangan; dan '
                'ia membantu tetamu Baitullah.',
          ],
        ),
      ),
      // ---------------------------------------------------------------
      LearningSection(
        title: 'Kewajipan Haji: tarakhi, badal dan susunannya',
        points: <String>[
          'Haji wajib sekali seumur hidup, kecuali jika dinazarkan.',
          'Dalam mazhab Syafi’i, kewajipan Haji bersifat tarakhi: boleh ditangguh, tetapi haram menangguh jika bimbang menjadi uzur; jika mati sebelum menunaikannya, dia mati dalam keadaan berdosa (asah).',
          'Orang yang uzur kekal (ma’dhub) wajib mewakilkan orang lain jika ada harta; orang yang meninggal setelah mampu tetapi belum berhaji, dihajikan daripada harta pusakanya.',
          'Haji fardu didahulukan: jika seseorang berniat Haji sunat atau nazar sebelum menunaikan Haji fardu, ia terkira Haji fardu.',
          'Orang yang belum menunaikan Haji fardu tidak boleh berhaji bagi pihak orang lain.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'إِنَّ فَرِيضَةَ اللَّهِ أَدْرَكَتْ أَبِي شَيْخًا كَبِيرًا '
                  'لَا يَثْبُتُ عَلَى الرَّاحِلَةِ، أَفَأَحُجُّ عَنْهُ؟ '
                  'قَالَ: نَعَمْ',
              terjemahan:
                  'Sesungguhnya kewajipan (Haji) daripada Allah menimpa '
                  'bapaku ketika dia sudah sangat tua dan tidak mampu duduk '
                  'tetap di atas tunggangan; bolehkah aku berhaji untuknya? '
                  'Baginda menjawab: Ya — asas badal Haji bagi yang uzur.',
              sumber:
                  'Riwayat al-Bukhari (no. 1513) dan Muslim (no. 1334) '
                  'daripada Ibnu Abbas r.a. (kisah wanita Khath’am)',
            ),
          ],
          teksKitab:
              'Fasal ringkas tentang kewajipan Haji, hlm. 89–103 [92–106]. '
              'Syarat wajib asas sudah dibincangkan dalam Modul 01; '
              'bahagian ini menumpukan perkara tambahan. Imam an-Nawawi '
              'menetapkan bahawa apabila syarat wajib dipenuhi, Haji wajib '
              'secara bertangguh (tarakhi) dalam mazhab Syafi’i, manakala '
              'Malik, Abu Hanifah, Ahmad dan al-Muzani berpendapat ia wajib '
              'segera (fauri).',
          teksKitabArabic:
              'إِذَا وُجِدَتْ شَرَائِطُ وُجُوبِ الْحَجِّ وَجَبَ عَلَى '
              'التَّرَاخِي، فَلَهُ تَأْخِيرُهُ مَا لَمْ يَخْشَ الْعَضْبَ، '
              'فَإِنْ خَشِيَهُ حَرُمَ عَلَيْهِ التَّأْخِيرُ عَلَى الْأَصَحِّ',
          permasalahan: <String>[
            'Empat kategori manusia (hlm. 91–92 [94–95]): (1) sah Haji '
                'secara mutlak — syaratnya Islam sahaja, maka wali boleh '
                'berihram bagi pihak kanak-kanak yang belum mumayyiz; (2) '
                'sah melaksanakan sendiri — Islam dan mumayyiz; (3) terkira '
                'Haji fardu — Islam, berakal, merdeka dan baligh, maka orang '
                'fakir yang bersusah payah berhaji terkira Haji fardunya; '
                '(4) wajib Haji — lima syarat termasuk istita’ah.',
            'Kesan mati berdosa kerana menangguh (hlm. 102 [105]): dosanya '
                'dikira bermula dari tahun terakhir dia mampu (asah); '
                'antara kesannya, kesaksian yang diberikannya tetapi belum '
                'diputuskan hakim tidak lagi boleh digunakan. Nota kaki '
                'al-Ifsah: sunat menyegerakan Haji untuk keluar daripada '
                'khilaf.',
            'Istinabah ma’dhub (hlm. 98–100 [101–103]): wajib jika ada '
                'harta untuk mengupah orang pada kadar upah biasa, atau ada '
                'anak (atau orang lain menurut asah) yang taat, dipercayai, '
                'sudah berhaji dan tidak uzur. Wang yang ditawarkan anak '
                'tidak wajib diterima (asah). Jika ma’dhub sembuh selepas '
                'dihajikan, Haji itu tidak memadai dan dia wajib berhaji '
                'sendiri (asah).',
            'Susunan (hlm. 102–103 [105–106]): Haji Islam, kemudian qada, '
                'kemudian nazar. Jika berihram dengan selainnya, ia jatuh '
                'kepada Haji Islam, bukan apa yang diniatkan. Jika ma’dhub '
                'mengupah dua orang untuk Haji Islam dan nazar pada tahun '
                'yang sama, ia memadai (asah).',
            'Nota kaki al-Ifsah: Imam Malik tidak menerima istinabah bagi '
                'orang yang masih hidup — menurutnya, orang yang uzur tidak '
                'diwajibkan Haji melainkan jika mampu sendiri.',
          ],
        ),
      ),
    ],
    duas: <ModuleDua>[
      ModuleDua(
        title: 'Doa Ketika Singgah di Sesuatu Tempat',
        arabic:
            'أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ',
        translation:
            'Aku berlindung dengan kalimah-kalimah Allah yang sempurna '
            'daripada kejahatan makhluk yang diciptakan-Nya.',
        source:
            'Riwayat Muslim (no. 2708) daripada Khaulah binti Hakim r.a.: tiada '
            'sesuatu pun memudaratkannya sehingga dia berangkat; dinukil dalam '
            'al-Idah, Bab 1',
      ),
      ModuleDua(
        title: 'Doa Ketika Malam Menjelang dalam Perjalanan',
        arabic:
            'يَا أَرْضُ، رَبِّي وَرَبُّكِ اللَّهُ، أَعُوذُ بِاللَّهِ مِنْ '
            'شَرِّكِ وَشَرِّ مَا فِيكِ، وَشَرِّ مَا خُلِقَ فِيكِ، وَشَرِّ '
            'مَا يَدِبُّ عَلَيْكِ، أَعُوذُ بِاللَّهِ مِنْ أَسَدٍ وَأَسْوَدَ، '
            'وَالْحَيَّةِ وَالْعَقْرَبِ، وَمِنْ سَاكِنِ الْبَلَدِ، وَمِنْ '
            'وَالِدٍ وَمَا وَلَدَ',
        translation:
            'Wahai bumi, Tuhanku dan Tuhanmu ialah Allah. Aku berlindung '
            'kepada Allah daripada kejahatanmu, kejahatan apa yang ada '
            'padamu, kejahatan apa yang diciptakan padamu dan kejahatan apa '
            'yang melata di atasmu. Aku berlindung kepada Allah daripada '
            'singa dan makhluk yang menakutkan, ular dan kala jengking, '
            'penghuni negeri (jin), serta daripada bapa dan apa yang '
            'dilahirkannya.',
        source:
            'Riwayat Abu Dawud (no. 2603) dan Ahmad daripada Ibnu Umar r.a.; '
            'al-Idah, Bab 1, Masalah ke-25, hlm. 66–67 [69–70]. An-Nawawi '
            'menjelaskan "aswad" bermaksud sosok/makhluk, dan menukil '
            'al-Khattabi: "penghuni negeri" ialah jin, manakala "bapa dan '
            'apa yang dilahirkannya" mungkin bermaksud Iblis dan syaitan',
      ),
      ModuleDua(
        title: 'Doa Ketika Bimbang terhadap Sesuatu Kaum',
        arabic:
            'اللَّهُمَّ إِنَّا نَجْعَلُكَ فِي نُحُورِهِمْ، وَنَعُوذُ بِكَ '
            'مِنْ شُرُورِهِمْ',
        translation:
            'Ya Allah, sesungguhnya kami menjadikan Engkau (pelindung) di '
            'hadapan mereka, dan kami berlindung kepada-Mu daripada '
            'kejahatan mereka.',
        source:
            'Riwayat Abu Dawud dan an-Nasa’i daripada Abu Musa al-Asy’ari '
            'r.a. — an-Nawawi menyatakan sanadnya sahih (al-Idah, Bab 1, '
            'Masalah ke-26, hlm. 67 [70]); nombor hadis tidak disemak di sini',
      ),
      ModuleDua(
        title: 'Doa Ketika Ditimpa Kesusahan (Doa al-Karb)',
        arabic:
            'لَا إِلَهَ إِلَّا اللَّهُ الْعَظِيمُ الْحَلِيمُ، لَا إِلَهَ '
            'إِلَّا اللَّهُ رَبُّ الْعَرْشِ الْعَظِيمِ، لَا إِلَهَ إِلَّا '
            'اللَّهُ رَبُّ السَّمَوَاتِ وَرَبُّ الْأَرْضِ وَرَبُّ الْعَرْشِ '
            'الْكَرِيمِ',
        translation:
            'Tiada tuhan melainkan Allah Yang Maha Agung lagi Maha '
            'Penyantun. Tiada tuhan melainkan Allah, Tuhan Arasy yang agung. '
            'Tiada tuhan melainkan Allah, Tuhan langit, Tuhan bumi dan Tuhan '
            'Arasy yang mulia.',
        source:
            'Riwayat al-Bukhari dan Muslim daripada Ibnu Abbas r.a. (lafaz '
            'seperti dinukil al-Idah); al-Idah, Bab 1, Masalah ke-26, hlm. 67 '
            '[70] — sunat diperbanyak ketika dalam ketakutan dan di setiap '
            'keadaan sukar',
      ),
    ],
    academicInsight:
        'Imam an-Nawawi tidak memulakan al-Idah dengan miqat, tetapi dengan '
        'pintu rumah. Susunan ini menunjukkan bahawa ibadah Haji bermula '
        'sejak persiapan: membersihkan hak manusia, memastikan harta halal '
        'dan menjaga akhlak sepanjang jalan. Bab ini juga menghimpunkan fiqh '
        'rukhsah musafir — qasar, jamak, menyapu khuf, solat sunat di atas '
        'kenderaan dan tayammum — dengan prinsip yang jelas. Kelonggaran '
        'diambil secara berhati-hati: an-Nawawi mengutamakan qasar tanpa '
        'jamak untuk keluar daripada khilaf. Kemaslahatan nyawa pula '
        'didahulukan atas fadilat: wuduk dengan air yang diperlukan orang '
        'lain untuk minum adalah haram, bukan kelebihan. Fasal penutupnya '
        'mengimbangi kelonggaran tarakhi dalam mazhab Syafi’i dengan '
        'amaran bahawa orang yang mampu tetapi mati sebelum berhaji, mati '
        'dalam keadaan berdosa.',
    reflectionQuestions: <String>[
      'Mengapakah an-Nawawi mengutamakan qasar tanpa jamak bagi musafir, '
          'sedangkan kedua-duanya rukhsah yang sah dalam mazhab Syafi’i?',
      'Bagaimanakah hukum mengharamkan wuduk dengan air yang diperlukan '
          'orang lain untuk minum mencerminkan susunan keutamaan maqasid '
          'syariah?',
      'Jika Haji wajib secara tarakhi, mengapakah orang yang menangguhkannya '
          'lalu meninggal dunia tetap dikira berdosa?',
    ],
  ),

  // =========================================================================
  // MODUL 07 — MIQAT & TATACARA IHRAM (al-Idah, Bab 2)
  // =========================================================================
  LearningModuleData(
    number: '07',
    title: 'Miqat & Tatacara Ihram',
    subtitle: 'Miqat, adab ihram, niat, jenis ihram dan hukum talbiyah.',
    icon: HajjIconType.ihram,
    accent: Color(0xFF7A6CB1),
    sections: <LearningSection>[
      // ---------------------------------------------------------------
      LearningSection(
        title: 'Miqat zamani (had masa)',
        points: <String>[
          'Ihram Haji hanya sah dalam bulan Syawal, Zulkaedah dan sepuluh malam pertama Zulhijjah, berakhir dengan terbit fajar Hari Raya Korban.',
          'Jika berniat Haji di luar tempoh ini, ia tidak menjadi Haji tetapi terjadi Umrah yang memadai sebagai Umrah fardu (pendapat asah).',
          'Ihram mutlak (tanpa menentukan Haji atau Umrah) sebelum bulan-bulan Haji terjadi Umrah.',
          'Umrah pula boleh dilakukan sepanjang tahun (lihat Modul U1).',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'الْحَجُّ أَشْهُرٌ مَعْلُومَاتٌ فَمَنْ فَرَضَ فِيهِنَّ '
                  'الْحَجَّ فَلَا رَفَثَ وَلَا فُسُوقَ وَلَا جِدَالَ فِي '
                  'الْحَجِّ',
              terjemahan:
                  '(Musim) Haji itu beberapa bulan yang dimaklumi. Maka '
                  'sesiapa yang mewajibkan dirinya mengerjakan Haji dalam '
                  'bulan-bulan itu, tidak boleh berkata kotor, berbuat fasik '
                  'dan berbantah-bantahan semasa Haji.',
              sumber: 'Al-Baqarah (2):197',
            ),
          ],
          teksKitab:
              'Fasal miqat Haji, Bab Kedua al-Idah, hlm. 110–111 [113–114]. '
              'Imam an-Nawawi memulakan bab ihram dengan menyatakan bahawa '
              'Haji mempunyai dua miqat, zamani dan makani, lalu menetapkan '
              'had masa ihram Haji.',
          teksKitabArabic:
              'أَمَّا الزَّمَانِيُّ فَهُوَ شَوَّالٌ وَذُو الْقِعْدَةِ وَعَشْرُ '
              'لَيَالٍ مِنْ ذِي الْحِجَّةِ، آخِرُهَا طُلُوعُ الْفَجْرِ يَوْمَ '
              'الْعِيدِ',
          permasalahan: <String>[
            'Empat pendapat tentang ihram Haji di luar bulannya: (1) asah — '
                'terjadi Umrah yang memadai sebagai Umrah Islam; (2) terjadi '
                'Umrah tetapi tidak memadai sebagai Umrah Islam; (3) tidak '
                'menjadi Umrah, tetapi dia bertahallul dengan amalan Umrah; '
                '(4) ihram Haji pada malam Hari Raya tidak sah, kerana '
                'hukumnya seperti di luar bulan Haji.',
            'Nota kaki al-Ifsah: wukuf selepas terbit fajar Hari Raya tidak '
                'memadai untuk Haji, berdasarkan hadis ‘Urwah bin Mudarris '
                'r.a. — sesiapa yang wukuf di Arafah pada malam atau siang '
                'sebelumnya, sempurnalah Hajinya.',
            'Nota kaki al-Ifsah: orang yang berihram mutlak di dalam '
                'bulan-bulan Haji wajib menentukan (ta’yin) ihramnya sebelum '
                'memulakan apa-apa amalan.',
          ],
        ),
      ),
      // ---------------------------------------------------------------
      LearningSection(
        title: 'Miqat makani (had tempat)',
        points: <String>[
          'Sesiapa yang berada di Makkah, penduduk atau pendatang, miqat Hajinya ialah Makkah sendiri; afdal berihram dari pintu rumah, dan sunat pada hari Tarwiyah (8 Zulhijjah).',
          'Lima miqat bagi yang datang dari luar: Zulhulaifah (Madinah), Juhfah (Syam, Mesir dan Maghribi), Qarnul Manazil (Najd Hijaz dan Najd Yaman), Yalamlam (Tihamah Yaman) dan Zatu Irqin (Iraq dan Khurasan).',
          'Miqat itu untuk penduduknya dan sesiapa yang melaluinya — contohnya orang Syam yang melalui Zulhulaifah berihram di Zulhulaifah.',
          'Kawasan yang selari (muhazah) dengan miqat sama hukumnya. Prinsip inilah asas jemaah pesawat berniat di udara apabila selari dengan miqat — ikut taklimat pembimbing.',
          'Harus berihram sebelum miqat, tetapi yang afdal (sahih) ialah berihram di miqat, mengikut Rasulullah SAW.',
          'Penduduk antara miqat dan Makkah berihram dari kampung atau tempat tinggal mereka.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'وَقَّتَ رَسُولُ اللَّهِ ﷺ لِأَهْلِ الْمَدِينَةِ ذَا '
                  'الْحُلَيْفَةِ، وَلِأَهْلِ الشَّامِ الْجُحْفَةَ، وَلِأَهْلِ '
                  'نَجْدٍ قَرْنًا، وَلِأَهْلِ الْيَمَنِ يَلَمْلَمَ',
              terjemahan:
                  'Rasulullah SAW menetapkan miqat bagi penduduk Madinah di '
                  'Zulhulaifah, bagi penduduk Syam di Juhfah, bagi penduduk '
                  'Najd di Qarn dan bagi penduduk Yaman di Yalamlam.',
              sumber:
                  'Riwayat al-Bukhari (no. 1524) dan Muslim (no. 1181) '
                  'daripada Ibnu Abbas r.a. (miqat Zatu Irqin bagi ahli Iraq '
                  'pula diriwayatkan oleh Abu Dawud dan an-Nasa’i daripada '
                  'Aisyah r.a., menurut nota kaki al-Ifsah)',
            ),
          ],
          teksKitab:
              'Fasal miqat Haji, hlm. 111–118 [114–121]. Imam an-Nawawi '
              'membahagikan manusia kepada dua: orang yang berada di Makkah '
              'dan orang afaqi. Beliau kemudian menegaskan bahawa tempat '
              'miqat itu sendiri tidak disyaratkan; kawasan yang selari '
              'dengannya mengambil hukum yang sama, dan orang yang menempuh '
              'laut atau jalan tanpa miqat berihram apabila selari dengan '
              'miqat yang paling hampir dengannya.',
          teksKitabArabic:
              'وَأَعْيَانُ هَذِهِ الْمَوَاقِيتِ لَا تُشْتَرَطُ، بَلْ مَا '
              'يُحَاذِيهَا فِي مَعْنَاهَا... وَمَنْ سَلَكَ الْبَحْرَ أَوْ '
              'طَرِيقًا لَيْسَ فِيهِ شَيْءٌ مِنَ الْمَوَاقِيتِ الْخَمْسَةِ '
              'أَحْرَمَ إِذَا حَاذَى أَقْرَبَ الْمَوَاقِيتِ إِلَيْهِ',
          permasalahan: <String>[
            'Miqat Haji bagi orang di Makkah: pendapat sahih ialah Makkah '
                'itu sendiri (ada pendapat seluruh Tanah Haram). Tempat '
                'afdal: dua qaul asy-Syafi’i — yang sahih dari pintu rumah, '
                'satu lagi dari masjid berhampiran Kaabah. Orang di Makkah '
                'yang berniat Qiran juga berihram dari Makkah (sahih), bukan '
                'dari Tanah Halal.',
            'Afdal berihram dari hujung miqat yang paling jauh dari '
                'Makkah; dari hujung yang dekat pun sah. Bagi ahli Iraq dan '
                'timur, afdal berihram dari al-‘Aqiq, sebuah lembah sebelum '
                'Zatu Irqin.',
            'Jika tidak selari dengan mana-mana miqat, berihram pada jarak '
                'dua marhalah dari Makkah; jika keliru, berijtihad dan '
                'berhati-hati dengan berihram lebih awal.',
            'Nota kaki al-Ifsah: Juhfah telah lama musnah dan diganti '
                'dengan Rabigh yang terletak sedikit sebelumnya; di Qarn '
                '(Wadi as-Sail), ihram mesti dibuat di lembah itu sendiri, '
                'bukan di kedai-kedai kopi selepasnya.',
            'Nota kaki al-Ifsah: orang yang datang dari Yaman melalui laut '
                'tidak boleh menangguhkan ihram hingga Jeddah kerana Jeddah '
                'lebih hampir ke Makkah daripada Yalamlam; ia berbeza dengan '
                'orang yang datang dari Suakin (Afrika) yang tidak selari '
                'dengan miqat, maka Jeddah menjadi miqatnya.',
          ],
        ),
      ),
      // ---------------------------------------------------------------
      LearningSection(
        title: 'Melepasi miqat tanpa ihram',
        points: <String>[
          'Sesiapa yang sampai di miqat dengan niat Haji atau Umrah wajib berihram di situ.',
          'Jika dia melepasinya tanpa ihram, dia berdosa dan wajib kembali ke miqat untuk berihram.',
          'Jika ada uzur — jalan berbahaya, takut tertinggal rombongan atau waktu sempit — dia berihram di tempatnya, meneruskan ibadah dan wajib membayar dam.',
          'Jika dia kembali ke miqat sebelum melakukan apa-apa nusuk (seperti Tawaf), dam gugur; jika selepasnya, dam kekal.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Cabang (far’) dalam fasal miqat, hlm. 118–120 [121–123]. '
              'Imam an-Nawawi menegaskan bahawa kewajipan dam tidak berbeza '
              'antara orang yang sengaja, jahil atau terlupa; yang berbeza '
              'hanyalah dosa — orang yang terlupa dan jahil tidak berdosa, '
              'manakala orang yang sengaja berdosa.',
          teksKitabArabic:
              'وَسَوَاءٌ فِي لُزُومِ الدَّمِ مَنْ جَاوَزَ عَامِدًا أَوْ '
              'جَاهِلًا أَوْ نَاسِيًا... وَإِنَّمَا يَفْتَرِقُونَ فِي '
              'الْإِثْمِ، فَلَا إِثْمَ عَلَى النَّاسِي وَالْجَاهِلِ، '
              'وَيَأْثَمُ الْعَامِدُ',
          permasalahan: <String>[
            'Kembali ke miqat selepas berihram tetapi sebelum memulakan '
                'Tawaf atau apa-apa nusuk juga menggugurkan dam. Nota kaki '
                'al-Ifsah: kembali ke miqat lain yang sama jaraknya juga '
                'memadai, tetapi kembali ke tempat yang lebih dekat tidak '
                'memadai.',
            'Nota kaki al-Ifsah menukil lima syarat wajib berihram di '
                'miqat: bertujuan ke Makkah atau Tanah Haram, berniat nusuk '
                '(walaupun bukan dalam perjalanan itu), melepasi miqat ke '
                'arah Tanah Haram, tidak berniat kembali ke miqat atau '
                'jarak yang sama sebelum memulakan nusuk, dan merdeka. Maka '
                'orang yang melintas miqat ke arah lain (ke kanan atau ke '
                'kiri) tidak wajib berihram.',
            'Nota kaki al-Ifsah: orang yang memasuki Makkah bukan untuk '
                'nusuk (contohnya berniaga) disunatkan berihram dan makruh '
                'meninggalkannya, bagi keluar daripada khilaf Ibnu Abbas '
                'dan Abu Hanifah yang mewajibkannya.',
            'Khilaf mazhab (nota kaki al-Ifsah daripada al-Majmu’): '
                'menurut Syafi’i, dam gugur jika kembali sebelum memulakan '
                'nusuk; menurut Malik dan Ahmad, dam tidak gugur walaupun '
                'kembali; menurut Abu Hanifah, ia gugur jika dia kembali '
                'sambil bertalbiyah.',
          ],
        ),
      ),
      // ---------------------------------------------------------------
      LearningSection(
        title: 'Adab sebelum berihram',
        points: <String>[
          'Mandi sunat ihram, termasuk bagi wanita haid, nifas dan kanak-kanak; jika tidak mampu menggunakan air, bertayammum.',
          'Sempurnakan kebersihan: cukur bulu ari, cabut bulu ketiak, gunting misai, potong kuku dan basuh rambut.',
          'Lelaki menanggalkan pakaian yang dilarang, lalu memakai kain ihram (izar dan rida’) — afdal putih, baharu atau bersih — serta sepasang capal.',
          'Sapu wangian pada badan sebelum berniat (afdal pada badan, bukan pada pakaian); kesannya yang kekal selepas ihram tidak mengapa.',
          'Solat sunat ihram dua rakaat (al-Kafirun dan al-Ikhlas); jika berihram pada waktu solat fardu, fardu itu sudah memadai.',
          'Waktu afdal berniat ialah ketika mula bergerak meninggalkan miqat, sambil menghadap kiblat — bukan sejurus selepas solat sambil duduk.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'كُنْتُ أُطَيِّبُ رَسُولَ اللَّهِ ﷺ لِإِحْرَامِهِ قَبْلَ '
                  'أَنْ يُحْرِمَ، وَلِحِلِّهِ قَبْلَ أَنْ يَطُوفَ بِالْبَيْتِ',
              terjemahan:
                  'Aku memakaikan wangian kepada Rasulullah SAW untuk '
                  'ihramnya sebelum Baginda berihram, dan untuk tahallulnya '
                  'sebelum Baginda bertawaf di Baitullah.',
              sumber:
                  'Riwayat al-Bukhari (no. 1539) dan Muslim (no. 1189) '
                  'daripada Aisyah r.a.',
            ),
            DalilItem(
              arabic:
                  'لَمْ أَرَ رَسُولَ اللَّهِ ﷺ يُهِلُّ حَتَّى تَنْبَعِثَ بِهِ '
                  'رَاحِلَتُهُ',
              terjemahan:
                  'Aku tidak melihat Rasulullah SAW bertalbiyah (memulakan '
                  'ihram) sehinggalah tunggangannya bangun bergerak '
                  'membawanya.',
              sumber:
                  'Riwayat al-Bukhari (no. 166) dan Muslim (no. 1187) '
                  'daripada Ibnu Umar r.a.',
            ),
          ],
          teksKitab:
              'Fasal adab al-ihram (enam masalah), hlm. 121–128 [124–131]. '
              'Tentang waktu berniat, Imam an-Nawawi menyebut dua qaul '
              'asy-Syafi’i: berihram sejurus selepas solat sambil duduk, '
              'atau berihram apabila mula bergerak. Beliau mensahihkan yang '
              'kedua kerana hadisnya disepakati sahih, manakala hadis bagi '
              'pendapat pertama ada kelemahan.',
          teksKitabArabic:
              'وَالْأَوْلَى أَنْ يَقْتَصِرَ عَلَى تَطْيِيبِ بَدَنِهِ دُونَ '
              'ثِيَابِهِ... وَالثَّانِي: أَنْ يُحْرِمَ إِذَا ابْتَدَأَ '
              'السَّيْرَ رَاكِبًا كَانَ أَوْ مَاشِيًا، وَهَذَا هُوَ '
              'الصَّحِيحُ',
          permasalahan: <String>[
            'Sepuluh mandi sunat bagi jemaah Haji: untuk ihram, masuk '
                'Makkah, wukuf di Arafah, wukuf di Muzdalifah selepas Subuh '
                'hari Nahar, Tawaf Ifadah, bercukur, tiga kali untuk '
                'melontar pada hari-hari Tasyriq, dan Tawaf Wada’. '
                'Meninggalkan mandi ihram makruh tetapi ihram tetap sah. '
                'Wanita haid yang mampu menunggu di miqat sehingga suci lalu '
                'mandi, itu lebih afdal.',
            'Wangian yang berpindah tempat kerana peluh selepas ihram tidak '
                'dikenakan fidyah (asah). Tetapi jika dia sengaja '
                'memindahkannya, atau menanggalkan pakaian berwangian lalu '
                'memakainya semula, wajib fidyah (asah).',
            'Wanita sunat menginai kedua-dua tangan hingga pergelangan dan '
                'menyapu sedikit inai pada muka sebelum ihram; makruh '
                'berinai selepas ihram, dan makruh melukis corak atau '
                'menginai hujung jari sahaja.',
            'Solat sunat ihram tidak dilakukan pada waktu yang dimakruhkan '
                'solat (asah); sunat menangguhkan ihram sehingga waktu itu '
                'berlalu. Melakukannya berasingan daripada solat fardu lebih '
                'afdal.',
            'Tajarrud (menanggalkan pakaian berjahit) disebut dalam matan '
                'sebagai adab; nota kaki al-Ifsah mencatat an-Nawawi dalam '
                'al-Majmu’ menyatakan ia wajib (lihat juga Modul 03).',
          ],
        ),
      ),
      // ---------------------------------------------------------------
      LearningSection(
        title: 'Niat ihram dan lafaznya',
        points: <String>[
          'Ihram ialah niat di dalam hati untuk memasuki ibadah Haji, Umrah atau kedua-duanya.',
          'Lafaz niat dan talbiyah tidak wajib, tetapi afdal dilafazkan sambil menghadirkan niat di hati, lalu disusuli talbiyah.',
          'Jika berhaji untuk orang lain (badal), sebut nama orang itu dalam lafaz niat dan talbiyah.',
          'Talbiyah pertama sunat menyebut nusuk (contohnya "Labbaik Allahumma bi ‘umrah") secara perlahan; talbiyah seterusnya dengan suara kuat dan tanpa menyebut nusuk (asah).',
          'Yang menentukan ialah niat di hati: jika berniat Haji tetapi lidah tersebut Umrah, yang dikira ialah Haji.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic: 'إِنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ',
              terjemahan: 'Sesungguhnya setiap amalan bergantung pada niat.',
              sumber:
                  'Riwayat al-Bukhari dan Muslim daripada Umar al-Khattab '
                  'r.a.; an-Nawawi menyebutnya hadis yang disepakati sahih '
                  '(al-Idah, Bab 1, Masalah ke-12)',
            ),
          ],
          teksKitab:
              'Fasal sifat al-ihram, hlm. 129–131 [132–134]. Imam an-Nawawi '
              'menyatakan yang wajib hanyalah niat di hati; tetapi kerana '
              'sebahagian ulama, termasuk sebahagian ashab asy-Syafi’i, '
              'berpendapat ihram tidak sah tanpa talbiyah, langkah berhati-'
              'hati ialah berniat di hati sambil melafazkannya dan '
              'bertalbiyah.',
          teksKitabArabic:
              'وَالْوَاجِبُ أَنْ يَنْوِيَ هَذَا بِقَلْبِهِ، وَلَا يَجِبُ '
              'التَّلَفُّظُ بِهِ وَلَا التَّلْبِيَةُ، وَلَكِنِ الْأَفْضَلُ '
              'أَنْ يَتَلَفَّظَ بِهِ بِلِسَانِهِ وَأَنْ يُلَبِّيَ',
          permasalahan: <String>[
            'Khilaf: menurut nota kaki al-Ifsah, Abu Hanifah berpendapat '
                'ihram tidak terjadi kecuali dengan niat bersama talbiyah '
                '(atau menghantar hadyu), dan Abu ‘Abdillah az-Zubairi '
                'daripada ashab Syafi’i juga mensyaratkan talbiyah. Inilah '
                'sebab an-Nawawi menganjurkan lafaz dan talbiyah demi '
                'berhati-hati.',
            'Jika berniat Haji tetapi bertalbiyah dengan Umrah, atau '
                'sebaliknya, atau berniat kedua-duanya tetapi bertalbiyah '
                'dengan satu sahaja, yang dikira ialah apa yang diniatkan.',
            'Jika berniat dua Haji atau dua Umrah sekali gus, hanya satu '
                'yang terjadi dan yang satu lagi tidak menjadi kewajipan.',
            'Menurut asy-Syeikh Abu Muhammad al-Juwaini, talbiyah pertama '
                'yang menyebut nusuk dibaca perlahan sekadar didengari '
                'sendiri. Tentang menyebut nusuk dalam talbiyah seterusnya, '
                'kedua-dua cara ada dalam hadis; yang asah tidak '
                'menyebutnya.',
          ],
        ),
      ),
      // ---------------------------------------------------------------
      LearningSection(
        title: 'Empat cara berihram dan dam Tamattu’/Qiran',
        points: <String>[
          'Ada empat cara berihram: Ifrad, Tamattu’, Qiran dan ihram mutlak (ithlaq). Susunan keutamaannya telah diterangkan dalam Modul 01.',
          'Ihram mutlak: berniat ihram tanpa menentukan Haji atau Umrah. Dalam bulan Haji, ia ditentukan kemudian dengan niat di hati sebelum memulakan apa-apa amalan.',
          'Orang yang berihram Umrah boleh memasukkan Haji ke dalamnya sebelum memulakan Tawaf, lalu menjadi Qiran; sebaliknya (memasukkan Umrah ke dalam Haji) tidak sah.',
          'Harus berniat "seperti ihram si fulan", dan ihramnya mengikut ihram orang itu.',
          'Dam Tamattu’ dan Qiran: seekor kambing yang memenuhi syarat korban, atau 1/7 unta atau lembu; jika tiada, puasa tiga hari semasa Haji dan tujuh hari setelah pulang.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'فَمَنْ تَمَتَّعَ بِالْعُمْرَةِ إِلَى الْحَجِّ فَمَا '
                  'اسْتَيْسَرَ مِنَ الْهَدْيِ فَمَنْ لَمْ يَجِدْ فَصِيَامُ '
                  'ثَلَاثَةِ أَيَّامٍ فِي الْحَجِّ وَسَبْعَةٍ إِذَا رَجَعْتُمْ '
                  'تِلْكَ عَشَرَةٌ كَامِلَةٌ ذَلِكَ لِمَنْ لَمْ يَكُنْ أَهْلُهُ '
                  'حَاضِرِي الْمَسْجِدِ الْحَرَامِ',
              terjemahan:
                  '...maka sesiapa yang mengerjakan Umrah dan bersenang-'
                  'senang (Tamattu’) sehingga tiba masa Haji, wajiblah dia '
                  'menyembelih hadyu yang mudah didapati. Sesiapa yang tidak '
                  'mendapatinya, hendaklah berpuasa tiga hari semasa Haji '
                  'dan tujuh hari apabila kamu pulang — itulah sepuluh hari '
                  'yang sempurna. Hukum ini bagi orang yang keluarganya '
                  'bukan penduduk sekitar Masjidil Haram.',
              sumber: 'Al-Baqarah (2):196',
            ),
          ],
          teksKitab:
              'Cabang-cabang dalam fasal sifat al-ihram, hlm. 131–138 '
              '[134–141]. Selepas menyatakan susunan afdal (Ifrad, Tamattu’, '
              'kemudian Qiran) dan bahawa menentukan ihram lebih afdal '
              'daripada ihram mutlak, Imam an-Nawawi memberi peringatan: '
              'Qiran lebih afdal daripada Ifrad yang tidak diiringi Umrah '
              'pada tahun yang sama, kerana menangguhkan Umrah melepasi '
              'tahun Haji itu makruh.',
          teksKitabArabic:
              'وَاعْلَمْ أَنَّ الْقِرَانَ أَفْضَلُ مِنْ إِفْرَادِ الْحَجِّ '
              'مِنْ غَيْرِ أَنْ يَعْتَمِرَ بَعْدَهُ فِي سَنَتِهِ، فَإِنَّ '
              'تَأْخِيرَ الْعُمْرَةِ عَنْ سَنَةِ الْحَجِّ مَكْرُوهٌ',
          permasalahan: <String>[
            'Empat syarat dam Tamattu’: (1) tidak kembali ke miqat negerinya '
                'untuk berihram Haji; (2) ihram Umrahnya dalam bulan-bulan '
                'Haji; (3) dia berhaji pada tahun yang sama; (4) dia bukan '
                'penduduk sekitar Masjidil Haram — iaitu penduduk Tanah '
                'Haram dan sesiapa yang tinggal kurang dua marhalah '
                'daripadanya. Jika satu syarat tiada, tiada dam, tetapi dia '
                'tetap dinamakan mutamatti’ (asah).',
            'Dua syarat dam Qiran: tidak kembali ke miqat selepas memasuki '
                'Makkah (ada pendapat: sebelum hari Arafah), dan bukan '
                'penduduk sekitar Masjidil Haram.',
            'Dalam Qiran, amalan Umrah terangkum dalam amalan Haji: satu '
                'Tawaf, satu Sa’i dan satu bercukur memadai untuk '
                'kedua-duanya, tanpa tambahan daripada amalan Ifrad.',
            'Ihram mutlak: amalan yang dilakukan sebelum menentukan niat '
                'tidak terkira. Ihram mutlak sebelum bulan Haji terjadi '
                'Umrah.',
            'Ihram "seperti ihram Zaid": jika Zaid berihram Haji, Umrah atau '
                'Qiran, ihramnya sama; jika Zaid berihram mutlak, ihramnya '
                'juga mutlak dan dia bebas menentukannya; jika ternyata Zaid '
                'tidak berihram atau ihramnya rosak, terjadi ihram mutlak '
                '(asah).',
          ],
        ),
      ),
      // ---------------------------------------------------------------
      LearningSection(
        title: 'Hukum dan adab talbiyah',
        points: <String>[
          'Afdal mencukupkan dengan lafaz talbiyah Rasulullah SAW; menambah lafaz lain tidak makruh (asah).',
          'Selepas talbiyah, berselawat dengan suara lebih perlahan, memohon reda Allah dan syurga, berlindung daripada neraka, kemudian berdoa sesuka hati.',
          'Perbanyakkan talbiyah dalam setiap keadaan — berdiri, duduk, berkenderaan, ketika naik dan turun, bertemu rombongan, selepas solat, waktu sahur, malam dan siang.',
          'Lelaki menguatkan suara tanpa memudaratkan diri; wanita memperlahankan suara sekadar didengari sendiri.',
          'Ulang tiga kali berturut-turut tanpa diselangi percakapan; jawab salam dengan lafaz, tetapi makruh memberi salam kepada orang yang sedang bertalbiyah.',
          'Waktu talbiyah bermula dari saat berihram hingga mula bertahallul; orang yang tidak fasih bahasa Arab bertalbiyah dalam bahasanya.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'أَتَانِي جِبْرِيلُ فَأَمَرَنِي أَنْ آمُرَ أَصْحَابِي أَنْ '
                  'يَرْفَعُوا أَصْوَاتَهُمْ بِالْإِهْلَالِ وَالتَّلْبِيَةِ',
              terjemahan:
                  'Jibril datang kepadaku lalu memerintahkan aku supaya '
                  'menyuruh para sahabatku meninggikan suara mereka ketika '
                  'berihlal dan bertalbiyah.',
              sumber:
                  'Riwayat at-Tirmidhi (no. 829; katanya hasan sahih), Abu '
                  'Dawud (no. 1814), an-Nasa’i dan Ibn Majah daripada '
                  'as-Sa’ib bin Khallad r.a.; dinukil dalam nota kaki '
                  'al-Ifsah',
            ),
          ],
          teksKitab:
              'Fasal at-talbiyah, hlm. 139–142 [142–145]. Imam an-Nawawi '
              'menghuraikan lafaz, adab, tempat dan had waktu talbiyah, dan '
              'menutup fasal ini dengan kelonggaran bagi orang yang tidak '
              'fasih bahasa Arab.',
          teksKitabArabic:
              'وَمَنْ لَا يُحْسِنُ التَّلْبِيَةَ بِالْعَرَبِيَّةِ يُلَبِّي '
              'بِلِسَانِهِ، وَيَدْخُلُ وَقْتُ التَّلْبِيَةِ مِنْ حِينِ '
              'يُحْرِمُ، وَيَبْقَى إِلَى أَنْ يَشْرَعَ فِي التَّحَلُّلِ',
          permasalahan: <String>[
            'Hamzah "inna al-hamda" afdal dibaca dengan kasrah; bacaan '
                'fathah juga harus.',
            'Talbiyah di masjid: asah sunat dan dikuatkan suara, sama '
                'seperti di luar masjid; ada pendapat tidak dikuatkan, dan '
                'ada pendapat hanya dikuatkan di tiga masjid (Masjidil '
                'Haram, Masjid al-Khaif dan Masjid Ibrahim di Arafah). Nota '
                'kaki al-Ifsah: haram meninggikan suara jika banyak '
                'mengganggu orang yang solat, membaca al-Quran atau tidur.',
            'Tidak bertalbiyah ketika Tawaf Qudum dan Sa’i (asah) kerana '
                'kedua-duanya ada zikir khusus; ketika Tawaf Ifadah tidak '
                'bertalbiyah tanpa khilaf kerana waktunya sudah tamat. Nota '
                'kaki al-Ifsah: talbiyah berakhir dengan lontaran batu '
                'pertama di Jamrah Aqabah.',
            'Wanita yang meninggikan suara bertalbiyah: makruh tetapi tidak '
                'haram.',
            'Hukum talbiyah (nota kaki al-Ifsah): sunat di sisi Syafi’i dan '
                'Hanbali; syarat sah ihram di sisi Hanafi; wajib dan '
                'ditampung dengan dam jika ditinggalkan di sisi Maliki.',
          ],
        ),
      ),
      // ---------------------------------------------------------------
      LearningSection(
        title: 'Perkara yang tidak dilarang semasa ihram',
        points: <String>[
          'Selain tujuh larangan ihram (Modul 03), perkara lain tidak haram bagi orang yang berihram.',
          'Harus membasuh kepala dengan pencuci tanpa wangian, tetapi lebih baik tidak kerana ia termasuk bermewah; berhati-hati supaya tiada rambut tercabut.',
          'Harus mandi, bercelak tanpa wangian, berbekam dan berbedah kecil (fasd) selagi tidak memotong rambut.',
          'Harus menggaru kepala dengan lembut, tetapi lebih baik tidak; jika rambut tercabut kerana garuan, wajib fidyah.',
          'Harus membuang dan membunuh kutu di badan dan pakaian, bersyair yang tidak berdosa dan melihat cermin.',
          'Haji dan Umrah tidak rosak dengan mana-mana larangan ihram kecuali jimak.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic: 'احْتَجَمَ النَّبِيُّ ﷺ وَهُوَ مُحْرِمٌ',
              terjemahan: 'Nabi SAW berbekam ketika Baginda sedang berihram.',
              sumber:
                  'Riwayat al-Bukhari (no. 1938) dan Muslim (no. 1202) '
                  'daripada Ibnu Abbas r.a.',
            ),
          ],
          teksKitab:
              'Dua fasal penutup bahagian larangan ihram, hlm. 185–188 '
              '[188–191]. Fasal pertama menegaskan bahawa fidyah tidak '
              'menghalalkan pelanggaran (lihat Modul 03). Fasal kedua '
              'menyenaraikan perkara yang kekal harus bagi orang berihram, '
              'lalu ditutup dengan kaedah bahawa hanya jimak merosakkan Haji '
              'dan Umrah.',
          teksKitabArabic:
              'وَمَا سِوَى هَذِهِ الْمُحَرَّمَاتِ السَّبْعَةِ لَا تَحْرُمُ '
              'عَلَى الْمُحْرِمِ... لَا يَفْسُدُ الْحَجُّ وَلَا الْعُمْرَةُ '
              'بِشَيْءٍ مِنْ مُحَرَّمَاتِ الْإِحْرَامِ إِلَّا بِالْجِمَاعِ '
              'وَحْدَهُ',
          permasalahan: <String>[
            'Asy-Syafi’i berkata: jika orang berihram membasuh kepala dengan '
                'sidr atau khatmi, "aku suka dia membayar fidyah", tetapi '
                'fidyah tidak wajib. Ketika mandi junub, beliau menganjurkan '
                'membasuh dengan hujung jari dan menyelati rambut perlahan-'
                'lahan tanpa menggaru dengan kuku. Nota kaki al-Ifsah: Abu '
                'Hanifah dan Malik mewajibkan fidyah jika kepala dibasuh '
                'dengan khatmi.',
            'Jika rambut gugur selepas menggaru tetapi ragu sama ada ia '
                'memang sudah tertanggal atau tercabut kerana garuan, tiada '
                'fidyah (asah).',
            'Bercelak dengan ithmid (tanpa wangian) makruh kecuali kerana '
                'keperluan; mandi di bilik mandi awam harus (ada pendapat '
                'makruh).',
            'Makruh menyikat atau mencari kutu di kepala dan janggut; jika '
                'kutu dikeluarkan lalu dibunuh, bersedekahlah walau '
                'sesuap — jumhur ashab berpendapat sedekah ini sunat, '
                'sebahagian lagi wajib.',
            'Melihat cermin tidak makruh bagi lelaki dan wanita yang '
                'berihram; ada satu qaul yang memakruhkannya.',
          ],
        ),
      ),
    ],
    duas: <ModuleDua>[
      ModuleDua(
        title: 'Lafaz Niat Ihram Haji',
        arabic: 'نَوَيْتُ الْحَجَّ وَأَحْرَمْتُ بِهِ لِلَّهِ تَعَالَى',
        translation:
            'Aku berniat Haji dan aku berihram dengannya kerana Allah Taala.',
        source:
            'Al-Idah (Fasal Sifat Ihram) — dilafazkan sambil menghadirkan niat '
            'di dalam hati, lalu disusuli talbiyah; lafaz anjuran fuqaha, bukan '
            'hadis',
      ),
      ModuleDua(
        title: 'Lafaz Niat Haji bagi Pihak Orang Lain (Badal)',
        arabic:
            'نَوَيْتُ الْحَجَّ عَنْ فُلَانٍ وَأَحْرَمْتُ بِهِ لِلَّهِ '
            'تَعَالَى عَنْهُ، لَبَّيْكَ عَنْ فُلَانٍ',
        translation:
            'Aku berniat Haji bagi pihak si fulan dan aku berihram dengannya '
            'kerana Allah Taala bagi pihaknya; aku sahut seruan-Mu bagi pihak '
            'si fulan.',
        source:
            'Al-Idah, Fasal Sifat al-Ihram, hlm. 130 [133] — anjuran ulama '
            'dalam al-Idah, bukan hadis marfu’; "fulan" diganti dengan nama '
            'orang yang dihajikan, kemudian diteruskan dengan talbiyah '
            'lengkap',
      ),
      ModuleDua(
        title: 'Talbiyah Pertama Umrah',
        arabic: 'لَبَّيْكَ اللَّهُمَّ بِعُمْرَةٍ',
        translation: 'Aku menyahut seruan-Mu ya Allah, dengan Umrah.',
        source:
            'Al-Idah (Fasal Sifat Ihram) — dinukil daripada asy-Syeikh Abu '
            'Muhammad al-Juwaini: sunat menyebut nusuk dalam talbiyah pertama '
            'ketika berihram dan membacanya perlahan',
      ),
      ModuleDua(
        title: 'Talbiyah',
        arabic:
            'لَبَّيْكَ اللَّهُمَّ لَبَّيْكَ، لَبَّيْكَ لَا شَرِيكَ لَكَ لَبَّيْكَ، '
            'إِنَّ الْحَمْدَ وَالنِّعْمَةَ لَكَ وَالْمُلْكَ، لَا شَرِيكَ لَكَ',
        translation:
            'Aku sahut panggilan-Mu ya Allah, aku sahut panggilan-Mu. Aku sahut '
            'panggilan-Mu, tiada sekutu bagi-Mu, aku sahut panggilan-Mu. '
            'Sesungguhnya segala puji, nikmat dan kerajaan adalah milik-Mu, '
            'tiada sekutu bagi-Mu.',
        source:
            'Riwayat al-Bukhari dan Muslim daripada Ibnu Umar r.a.; al-Idah '
            '(Fasal at-Talbiyah): selepasnya sunat berselawat, memohon reda '
            'Allah dan syurga serta berlindung daripada neraka',
      ),
    ],
    academicInsight:
        'Bab ihram dalam al-Idah memperlihatkan keseimbangan antara '
        'ketegasan dan kemudahan. Miqat ialah sempadan penghormatan: '
        'melepasinya tanpa ihram mewajibkan dam, sama ada sengaja, jahil '
        'atau terlupa, walaupun dosanya hanya ke atas yang sengaja. Namun '
        'prinsip muhazah — kawasan yang selari dengan miqat mengambil '
        'hukumnya — menjadikan hukum ini praktikal bagi setiap laluan, '
        'termasuk perjalanan udara hari ini. Hakikat ihram pula ialah niat '
        'di hati; lafaz dan talbiyah dianjurkan sebagai langkah berhati-hati '
        'kerana ada ulama yang mensyaratkannya. Perincian Ifrad, Tamattu’, '
        'Qiran dan ihram mutlak menunjukkan keluasan pilihan dalam syariat, '
        'dengan dam sebagai tampungan dalam keadaan tertentu. Fasal '
        'penutupnya mengehadkan larangan kepada tujuh jenis sahaja, '
        'manakala selebihnya kekal harus.',
    reflectionQuestions: <String>[
      'Mengapakah kewajipan dam kerana melepasi miqat tidak membezakan '
          'antara orang yang sengaja dan yang terlupa, sedangkan dosa '
          'membezakannya?',
      'Bagaimanakah prinsip muhazah dalam al-Idah boleh dijadikan asas '
          'bagi jemaah yang menaiki pesawat terus ke Jeddah?',
      'Apakah hikmah an-Nawawi menganjurkan lafaz niat dan talbiyah, '
          'sedangkan yang wajib hanyalah niat di hati?',
    ],
  ),
];
