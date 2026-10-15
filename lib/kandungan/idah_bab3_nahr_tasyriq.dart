import 'package:flutter/material.dart';

import '../islamic_icons.dart';
import '../learning_module_screen.dart';
import '../shared_widgets.dart';

// ---------------------------------------------------------------------------
// MODUL 12 & 13 — Bab Ketiga al-Idah fi Manasik al-Hajj wa al-‘Umrah
// (Imam an-Nawawi, Shamela book_id 96232):
//   * al-Fasl as-Sabi’  — amalan di Mina pada Hari Nahr (hlm. 306–353)
//   * al-Fasl ath-Thamin — amalan di Mina pada hari-hari Tasyriq (hlm. 354–372)
// Rujukan halaman: page_id Shamela, diikuti halaman cetak dalam [ ].
// Bahan nota kaki ialah al-Ifsah (‘Abd al-Fattah Rawah) — termasuk nukilan
// "al-Hasyiah" (Ibn Hajar al-Haytami) — dan dilabel begitu, bukan matan
// an-Nawawi.
// ---------------------------------------------------------------------------

// Salinan tepat (huruf demi huruf) doa sedia ada dalam
// learning_module_screen.dart / hajj_guide_screen.dart supaya lafaz dan
// sumbernya seragam di seluruh aplikasi.
const ModuleDua _duaTakbirJamrah = ModuleDua(
  title: 'Takbir Ketika Melontar Jamrah',
  arabic:
      'اللَّهُ أَكْبَرُ، اللَّهُ أَكْبَرُ، اللَّهُ أَكْبَرُ كَبِيرًا، '
      'وَالْحَمْدُ لِلَّهِ كَثِيرًا، وَسُبْحَانَ اللَّهِ بُكْرَةً وَأَصِيلًا، '
      'لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ '
      'وَلَهُ الْحَمْدُ، يُحْيِي وَيُمِيتُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ',
  translation:
      'Allah Maha Besar, Allah Maha Besar, Allah Maha Besar dengan '
      'sebesar-besarnya; segala puji bagi Allah dengan sebanyak-banyaknya; '
      'Maha Suci Allah pagi dan petang. Tiada Tuhan melainkan Allah Yang '
      'Esa, tiada sekutu bagi-Nya; bagi-Nya kerajaan dan segala puji; Dia '
      'menghidupkan dan mematikan, dan Dia Maha Berkuasa atas segala '
      'sesuatu.',
  source:
      'Al-Idah (Fasal Amalan di Mina) — sunnahnya bertakbir bersama '
      'setiap batu sebagai ganti talbiyah (hadis Jabir r.a. riwayat '
      'Muslim); lafaz lanjut ini anjuran sebahagian ashab (ringkasan)',
);

const ModuleDua _duaSelepasJamrah = ModuleDua(
  title: 'Doa Selepas Jamrah Ula dan Wusta',
  arabic:
      'اللَّهُمَّ إِلَيْكَ رَغِبْتُ، وَمِنْكَ رَهِبْتُ، وَمِنْ عَذَابِكَ '
      'أَشْفَقْتُ، فَاقْبَلْ نُسُكِي، وَأَصْلِحْهُ وَأَتْمِمْهُ، وَاجْعَلْهُ '
      'حَجًّا مَبْرُورًا وَذَنْبًا مَغْفُورًا',
  translation:
      'Ya Allah, kepada-Mu aku berharap, daripada-Mu aku gerun, dan '
      'daripada azab-Mu aku takut; maka terimalah ibadahku, perbaikilah '
      'dan sempurnakanlah ia, serta jadikanlah ia Haji yang mabrur dan '
      'dosa yang diampunkan.',
  source:
      'Nota kaki al-Ifsah (Abdul Fattah Rawah), bukan teks an-Nawawi '
      '(ringkasan). Al-Idah hanya menyebut berdiri lama menghadap kiblat '
      'selepas Jamrah Ula dan Wusta untuk bertahmid, bertakbir, bertahlil, '
      'bertasbih dan berdoa',
);

const ModuleDua _duaSembelihan = ModuleDua(
  title: 'Doa Ketika Menyembelih Hadyu atau Dam',
  arabic:
      'بِسْمِ اللَّهِ وَاللَّهُ أَكْبَرُ، وَصَلَّى اللَّهُ عَلَىٰ '
      'رَسُولِهِ مُحَمَّدٍ وَعَلَىٰ آلِهِ وَصَحْبِهِ وَسَلَّمَ، '
      'اللَّهُمَّ مِنْكَ وَإِلَيْكَ فَتَقَبَّلْ مِنِّي',
  translation:
      'Dengan nama Allah, dan Allah Maha Besar. Semoga Allah melimpahkan '
      'selawat dan salam ke atas Rasul-Nya Muhammad, keluarga dan sahabat '
      'baginda. Ya Allah, (sembelihan ini) daripada-Mu dan untuk-Mu, maka '
      'terimalah daripadaku.',
  source:
      'Al-Idah (Fasal Amalan di Mina Hari Nahar) — sunat ketika '
      'menyembelih hadyu, termasuk hadyu wajib (dam); jika menyembelih bagi '
      'pihak orang lain, sebut "taqabbal min fulan"',
);

const ModuleDua _duaBercukur = ModuleDua(
  title: 'Doa Ketika Bercukur',
  arabic:
      'اللَّهُمَّ هَـٰذِهِ نَاصِيَتِي فَتَقَبَّلْ مِنِّي وَاغْفِرْ ذُنُوبِي',
  translation:
      'Ya Allah, inilah ubun-ubunku, maka terimalah (amalan) daripadaku dan '
      'ampunkanlah dosa-dosaku.',
  source:
      'Nota kaki al-Ifsah pada al-Idah, Fasal Bercukur (diringkaskan) — doa '
      'susunan ulama. Matan al-Idah hanya menyebut adab bercukur (menghadap '
      'kiblat, mula dari sebelah kanan) tanpa lafaz doa',
);

// Doa baharu daripada matan al-Idah.
const ModuleDua _duaTakbirTasyriq = ModuleDua(
  title: 'Takbir Selepas Solat Hari Nahr dan Tasyriq',
  arabic:
      'اللَّهُ أَكْبَرُ، اللَّهُ أَكْبَرُ، اللَّهُ أَكْبَرُ كَبِيرًا، '
      'وَالْحَمْدُ لِلَّهِ كَثِيرًا، وَسُبْحَانَ اللَّهِ بُكْرَةً وَأَصِيلًا، '
      'لَا إِلَٰهَ إِلَّا اللَّهُ، وَلَا نَعْبُدُ إِلَّا إِيَّاهُ، '
      'مُخْلِصِينَ لَهُ الدِّينَ وَلَوْ كَرِهَ الْكَافِرُونَ، لَا إِلَٰهَ '
      'إِلَّا اللَّهُ وَحْدَهُ، صَدَقَ وَعْدَهُ، وَنَصَرَ عَبْدَهُ، وَهَزَمَ '
      'الْأَحْزَابَ وَحْدَهُ، لَا إِلَٰهَ إِلَّا اللَّهُ وَاللَّهُ أَكْبَرُ',
  translation:
      'Allah Maha Besar, Allah Maha Besar, Allah Maha Besar dengan '
      'sebesar-besarnya; segala puji bagi Allah dengan sebanyak-banyaknya; '
      'Maha Suci Allah pagi dan petang. Tiada Tuhan melainkan Allah, dan '
      'kami tidak menyembah selain-Nya, dengan mengikhlaskan agama bagi-Nya '
      'walaupun orang kafir membencinya. Tiada Tuhan melainkan Allah Yang '
      'Esa; Dia menepati janji-Nya, menolong hamba-Nya dan mengalahkan '
      'golongan al-Ahzab dengan sendiri-Nya. Tiada Tuhan melainkan Allah, '
      'dan Allah Maha Besar.',
  source:
      'Al-Idah, Fasal fi Umur Tusyra’ Yaum an-Nahr, hlm. 352 [355] — '
      'menurut nas asy-Syafi’i dan jumhur ashab, takbir asasnya "Allahu '
      'akbar" tiga kali dan diulang sekadar mampu; tambahan di atas '
      'dinilai "baik" oleh mereka. Anjuran ulama dalam al-Idah, bukan '
      'hadis marfu’. Sebahagian ashab juga membenarkan lafaz lazim: '
      '"Allahu akbar (3x), la ilaha illallah wallahu akbar, Allahu akbar '
      'wa lillahil-hamd"',
);

const List<LearningModuleData> idahModulesNahrTasyriq = <LearningModuleData>[
  // -------------------------------------------------------------------------
  // MODUL 12 — al-Fasl as-Sabi’
  // -------------------------------------------------------------------------
  LearningModuleData(
    number: '12',
    title: 'Amalan Hari Nahr & Tahallul',
    subtitle:
        'Lontar Aqabah, sembelih, bercukur dan Tawaf Ifadah pada 10 Zulhijjah.',
    icon: HajjIconType.mina,
    accent: Color(0xFFCE7A38),
    sections: <LearningSection>[
      LearningSection(
        title: 'Empat amalan Hari Nahr dan tertibnya',
        points: <String>[
          'Sampai di Mina pada 10 Zulhijjah, ada empat amalan: lontar Jamrah '
              'Aqabah, sembelih hadyu, bercukur/bergunting, kemudian ke '
              'Makkah untuk Tawaf Ifadah.',
          'Susunan itu sunat sahaja. Jika ada yang didahulukan atau '
              'dikemudiankan, ia tetap sah — cuma terlepas kelebihan.',
          'Waktu melontar, bercukur dan tawaf bermula selepas tengah malam '
              'malam Raya, bagi yang sudah berwukuf sebelum itu.',
          'Bercukur dan Tawaf Ifadah tiada had waktu akhir; lontaran '
              'Aqabah pula ada had waktunya.',
          'Mina terletak antara Wadi Muhassir dan Jamrah Aqabah; Wadi '
              'Muhassir dan bukit Aqabah itu sendiri bukan sebahagian '
              'daripada Mina.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic: 'افْعَلْ وَلَا حَرَجَ',
              terjemahan:
                  '"Lakukanlah, tiada salahnya" — jawapan Nabi SAW kepada '
                  'setiap yang bertanya pada Hari Nahr tentang amalan yang '
                  'didahulukan atau dikemudiankan (bercukur sebelum '
                  'menyembelih, menyembelih sebelum melontar, dan '
                  'seumpamanya).',
              sumber:
                  'Riwayat al-Bukhari (no. 83) dan Muslim (no. 1306) '
                  'daripada Abdullah bin ‘Amr r.a.',
            ),
          ],
          teksKitabArabic:
              'وَأَمَّا الْأَعْمَالُ الْمَشْرُوعَةُ يَوْمَ النَّحْرِ فَهِيَ '
              'أَرْبَعَةٌ: رَمْيُ جَمْرَةِ الْعَقَبَةِ، ثُمَّ ذَبْحُ الْهَدْيِ، '
              'ثُمَّ الْحَلْقُ، ثُمَّ الذَّهَابُ إِلَى مَكَّةَ لِطَوَافِ '
              'الْإِفَاضَةِ، وَهِيَ عَلَى هَذَا التَّرْتِيبِ مُسْتَحَبَّةٌ، '
              'فَلَوْ خَالَفَ فَقَدَّمَ بَعْضَهَا عَلَى بَعْضٍ جَازَ '
              'وَفَاتَتْهُ الْفَضِيلَةُ',
          teksKitab:
              'Dalam al-Fasl as-Sabi’ (Amalan yang disyariatkan di Mina pada '
              'Hari Nahr), Imam an-Nawawi mula-mula menentukan sempadan Mina, '
              'kemudian menyenaraikan empat amalan hari itu dan menegaskan '
              'bahawa tertibnya sunat. Waktu melontar, bercukur dan tawaf '
              'masuk dengan separuh malam Raya; lontaran kekal hingga '
              'terbenam matahari (ada pendapat hingga terbit fajar hari '
              'Tasyriq pertama), manakala bercukur dan tawaf kekal selagi '
              'hayat dikandung badan (al-Idah, hlm. 306–309 [309–312]).',
          permasalahan: <String>[
            'Nota kaki al-Ifsah menukil al-Hasyiah (Ibn Hajar): "hingga '
                'terbenam matahari" itu waktu ikhtiyar sahaja. Lontaran '
                'Aqabah ada empat waktu — masuk (separuh malam Nahr), '
                'fadilat (matahari naik hingga gelincir), ikhtiyar (hingga '
                'akhir hari Nahr), dan jawaz (hingga akhir hari Tasyriq).',
            'Syarat separuh malam itu hanya bagi yang telah berwukuf '
                'sebelumnya; jika belum, amalan itu tidak dikira (nota kaki '
                'al-Ifsah).',
            'Khilaf mazhab (nota kaki al-Ifsah): asy-Syafi’i mengira lontaran '
                'waktu malam sebagai ada’; Ahmad tidak membenarkan lontaran '
                'malam bagi yang terlewat, sebaliknya melontar keesokannya '
                'selepas gelincir; Malik mengira malam sebagai qada’ dengan '
                'hadyu.',
            'Tertib empat amalan: asy-Syafi’i tidak mewajibkan dam walaupun '
                'disengajakan; Abu Hanifah mewajibkan dam ke atas qarin dan '
                'mutamatti’ yang bercukur sebelum menyembelih; Malik '
                'mewajibkan dam jika bercukur sebelum melontar (nota kaki '
                'al-Ifsah).',
          ],
        ),
      ),
      LearningSection(
        title: 'Melontar Jamrah Aqabah: waktu dan adab',
        points: <String>[
          'Sampai di Mina, jangan singgah ke tempat lain dahulu — Jamrah '
              'Aqabah ialah "tahiyyat Mina".',
          'Waktu sunat: selepas matahari terbit dan naik kira-kira '
              'segalah.',
          'Berhentikan talbiyah pada batu pertama, lalu bertakbir bersama '
              'setiap batu.',
          'Lelaki mengangkat tangan ketika melontar; wanita tidak.',
          'Batu sebesar biji kacang kuda (hasa al-khadhf) — tidak terlalu '
              'besar, tidak terlalu kecil; dilontar biasa, bukan dijentik '
              'dengan jari.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'فَرَمَاهَا بِسَبْعِ حَصَيَاتٍ يُكَبِّرُ مَعَ كُلِّ '
                  'حَصَاةٍ مِنْهَا',
              terjemahan:
                  'Lalu baginda melontarnya dengan tujuh biji batu sambil '
                  'bertakbir bersama setiap biji — dalil takbir sebagai '
                  'ganti talbiyah ketika melontar.',
              sumber:
                  'Riwayat Muslim (no. 1218) daripada Jabir r.a. (hadis '
                  'panjang Haji Nabi SAW)',
            ),
            DalilItem(
              arabic:
                  'هَكَذَا رَمَى الَّذِي أُنْزِلَتْ عَلَيْهِ سُورَةُ '
                  'الْبَقَرَةِ',
              terjemahan:
                  '"Beginilah dilontar oleh baginda yang diturunkan '
                  'kepadanya Surah al-Baqarah" — kata Ibn Mas’ud r.a. '
                  'selepas melontar dari perut wadi dengan Kaabah di '
                  'sebelah kiri dan Mina di sebelah kanan.',
              sumber:
                  'Riwayat al-Bukhari (no. 1750) dan Muslim (no. 1296); '
                  'dinukil dalam nota kaki al-Ifsah',
            ),
          ],
          teksKitabArabic:
              'الصَّحِيحُ الْمُخْتَارُ فِي كَيْفِيَّةِ وُقُوفِهِ لِيَرْمِيَهَا '
              'أَنْ يَقِفَ تَحْتَهَا فِي بَطْنِ الْوَادِي فَيَجْعَلَ مَكَّةَ '
              'عَنْ يَسَارِهِ وَمِنًى عَنْ يَمِينِهِ وَيَسْتَقْبِلَ '
              'الْعَقَبَةَ ثُمَّ يَرْمِي',
          teksKitab:
              'Al-Idah menyusun tujuh masalah adab lontaran Aqabah: segera '
              'melontar sebelum turun ke khemah; sunat selepas matahari '
              'naik segalah; berdiri di perut wadi (Makkah di kiri, Mina di '
              'kanan) — pendapat yang dinyatakan secara jelas oleh hadis '
              'sahih; mengangkat tangan; menghentikan talbiyah pada batu '
              'pertama kerana lontaran adalah permulaan tahallul; melontar '
              'sambil berkenderaan seperti Nabi SAW; dan saiz batu sebesar '
              'hasa al-khadhf (al-Idah, hlm. 309–311 [312–314]).',
          permasalahan: <String>[
            'Jika bercukur atau tawaf didahulukan sebelum melontar, talbiyah '
                'dihentikan pada permulaan amalan itu, kerana kedua-duanya '
                'juga sebab tahallul (matan al-Idah).',
            'Lafaz takbir panjang ("Allahu akbar kabira…") ialah anjuran '
                'sebahagian ashab. Nota kaki al-Ifsah menukil an-Nawawi '
                'dalam al-Majmu’: lafaz itu gharib — hadis sahih hanya '
                'menyebut takbir bersama setiap batu, dan lafaz panjang '
                'kurang sesuai di celah-celah lontaran.',
            'Cara khadhf (meletak batu di atas ibu jari dan menjentiknya '
                'dengan jari telunjuk) disebut oleh sebahagian ashab, tetapi '
                'an-Nawawi menolaknya kerana Nabi SAW melarang khadhf '
                '(matan al-Idah).',
            'Nota kaki al-Ifsah: bukit Aqabah telah diratakan (1376H) dan '
                'kini ketiga-tiga jamrah berada di bawah jejantas bertingkat; '
                'arah berdiri hari ini mengikut susun atur yang ada.',
            'Khilaf waktu (nota kaki al-Ifsah daripada al-Majmu’): Malik, '
                'Abu Hanifah dan Ishaq tidak membenarkan lontaran sebelum '
                'terbit matahari; asy-Syafi’i dan Ahmad membenarkannya '
                'selepas separuh malam.',
          ],
        ),
      ),
      LearningSection(
        title: 'Syarat sah lontaran, batu dan wakil',
        points: <String>[
          'Wajib tujuh kali lontaran, sebiji demi sebiji. Tujuh biji yang '
              'dilontar sekali gus dikira satu sahaja.',
          'Mesti "melontar" — meletakkan batu ke dalam takungan tidak '
              'dikira — dan mesti berniat menuju takungan (marma).',
          'Batu sah jika masuk ke takungan walaupun kemudian bergolek '
              'keluar. Jika ragu ia masuk, ulangi.',
          'Mesti batu (hajar) — marmar, batu kapur mentah dan batu permata '
              'pun sah; mutiara, logam, tanah liat, gipsum atau celak tidak '
              'sah.',
          'Orang sakit atau terhalang yang tidak dijangka pulih sebelum '
              'tamat waktu melontar boleh mewakilkan orang lain; wakil mesti '
              'melontar untuk dirinya dahulu.',
        ],
        deepDive: SectionDeepDive(
          teksKitabArabic:
              'يَجِبُ أَنْ يَرْمِيَ سَبْعَ مَرَّاتٍ بِمَا يُسَمَّى حَجَرًا '
              'بِحَيْثُ يُسَمَّى رَمْيًا، فَيَرْمِي سَبْعَ حَصَيَاتٍ '
              'وَاحِدَةً وَاحِدَةً حَتَّى يَسْتَكْمِلَهُنَّ، فَلَوْ وَضَعَ '
              'الْحَجَرَ فِي الْمَرْمَى لَمْ يُعْتَدَّ بِهِ لِأَنَّهُ لَا '
              'يُسَمَّى رَمْيًا',
          teksKitab:
              'Masalah kelapan dalam al-Fasl as-Sabi’ dan cabang-cabangnya '
              'menghuraikan syarat lontaran: bilangan, perbuatan "melontar", '
              'niat menuju marma, dan jenis batu. Fasal itu kemudian '
              'menerangkan perwakilan: hanya bagi yang lemah dengan sebab '
              'yang tidak dijangka hilang sebelum tamat waktu, dan wakil '
              'tidak sah melontar untuk orang lain sebelum melontar untuk '
              'dirinya; jika dia menyalahi, lontaran itu jatuh untuk dirinya '
              '(al-Idah, hlm. 311–319 [314–322]).',
          permasalahan: <String>[
            'Batu yang terkena tanah, tandu, leher unta atau pakaian orang '
                'lalu melantun masuk dikira sah. Jika orang itu menepisnya '
                'masuk, tidak sah. Jika ia jatuh di atas leher unta lalu '
                'bergolek masuk, ada dua wajah; yang azhar tidak dikira '
                '(matan al-Idah).',
            'Batu yang sudah digunakan — oleh orang lain, atau oleh diri '
                'sendiri pada jamrah atau hari lain — sah dengan sepakat; '
                'menggunakannya semula pada jamrah dan hari yang sama pun '
                'sah menurut pendapat asah. Nota kaki al-Ifsah menukil '
                'al-Hasyiah: hukumnya tetap makruh.',
            'Nota kaki al-Ifsah (tanbih): jemaah yang melontar dari tingkat '
                'atas mesti yakin batu jatuh ke dalam takungan; jika '
                'tersangkut pada sampah atau selipar di corong, lontaran itu '
                'tidak sah.',
            'Orang pengsan yang tidak memberi izin sebelumnya tidak boleh '
                'dilontar bagi pihaknya; jika dia telah memberi izin, sah '
                'menurut pendapat asah. Jika uzurnya hilang ketika waktu '
                'masih ada, dia tidak wajib mengulang (matan al-Idah).',
            'Al-Hasyiah (Ibn Hajar, dalam nota kaki al-Ifsah): wakil mesti '
                'menghabiskan ketiga-tiga jamrah untuk dirinya dahulu, '
                'bukan sekadar jamrah pertama — berbeza dengan pendapat '
                'az-Zarkasyi. Mazhab Hanafi dan Maliki hanya menganggapnya '
                'meninggalkan yang lebih utama.',
          ],
        ),
      ),
      LearningSection(
        title: 'Hadyu dan korban: jenis, umur dan kecacatan',
        points: <String>[
          'Membawa hadyu ketika menuju Makkah ialah sunat muakkad yang '
              'kini hampir ditinggalkan; ia tidak menjadi wajib kecuali '
              'dengan nazar.',
          'Umur minimum: domba genap setahun (pendapat asah), kambing dua '
              'tahun, lembu dua tahun, unta lima tahun genap.',
          'Tidak sah haiwan yang cacat sehingga dagingnya jelas berkurang, '
              'atau yang telinganya terpotong sebahagian yang ketara.',
          'Seekor unta atau lembu boleh dikongsi tujuh orang, walaupun '
              'sebahagian mereka hanya mahukan daging.',
          'Seekor kambing lebih afdal daripada 1/7 unta; seekor kambing '
              'gemuk lebih afdal daripada dua ekor kurus yang sama nilainya.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'نَحَرْنَا مَعَ رَسُولِ اللَّهِ ﷺ الْبَدَنَةَ عَنْ '
                  'سَبْعَةٍ وَالْبَقَرَةَ عَنْ سَبْعَةٍ',
              terjemahan:
                  'Kami menyembelih bersama Rasulullah SAW seekor unta untuk '
                  'tujuh orang dan seekor lembu untuk tujuh orang.',
              sumber:
                  'Riwayat Muslim (no. 1318) daripada Jabir r.a.; lafaz '
                  'seperti dinukil nota kaki al-Ifsah',
            ),
          ],
          teksKitabArabic:
              'وَصِفَاتُ الْهَدْيِ الْمُطْلَقِ كَصِفَاتِ الْأُضْحِيَّةِ '
              'الْمُطْلَقَةِ، وَلَا يُجْزِئُ فِيهِمَا جَمِيعًا إِلَّا '
              'الْجَذَعُ مِنَ الضَّأْنِ، أَوِ الثَّنِيُّ مِنَ الْمَعْزِ أَوِ '
              'الْإِبِلِ أَوِ الْبَقَرِ',
          teksKitab:
              'Bahagian "Amalan kedua: menyembelih hadyu dan korban" dalam '
              'al-Fasl as-Sabi’ menerangkan sunnah membawa hadyu, cara '
              'taqlid (menggantung kalung) dan isy’ar (menandakan bonggol '
              'unta), syarat umur, kecacatan yang menghalang, serta '
              'perkongsian. An-Nawawi menukil asy-Syafi’i bahawa dalam '
              'korban, mutu daging lebih diutamakan daripada bilangan '
              'haiwan (al-Idah, hlm. 320–326 [323–329]).',
          permasalahan: <String>[
            'Menggantung kalung atau menandakan haiwan tidak menjadikannya '
                'hadyu wajib menurut mazhab sahih yang masyhur, sama seperti '
                'menulis "wakaf" di pintu rumah tidak menjadikannya wakaf '
                '(matan al-Idah). Mazhab Hanbali menganggapnya terikat jika '
                'disertai niat (nota kaki al-Ifsah).',
            'Hadyu atau korban nazar yang menjadi cacat selepas nazar tetap '
                'disembelih seadanya dan sah; pendapat Abu Ja’far '
                'al-Astarabadhi supaya diganti dinilai syaz dan ditolak '
                '(matan al-Idah). Anak yang dilahirkannya wajib disembelih '
                'bersama.',
            'Haiwan yang tiada tanduk sah; yang telinganya terpotong '
                'sebahagian yang ketara tidak sah (matan al-Idah). Patah '
                'tanduk juga sah selagi daging tidak terjejas; Ahmad hanya '
                'menolak jika lebih separuh telinga atau tanduk hilang (nota '
                'kaki al-Ifsah).',
            'Perkongsian unta atau lembu: asy-Syafi’i dan Ahmad '
                'membenarkannya walaupun ada peserta yang hanya mahukan '
                'daging; Abu Hanifah mensyaratkan semua berniat ibadah; '
                'Malik tidak membenarkan perkongsian (nota kaki al-Ifsah).',
          ],
        ),
      ),
      LearningSection(
        title: 'Menyembelih: waktu, cara dan agihan daging',
        points: <String>[
          'Lelaki sunat menyembelih sendiri; wanita sunat mewakilkan '
              'lelaki. Pemilik sunat hadir ketika sembelihan.',
          'Niat dibuat ketika menyerahkan haiwan kepada wakil atau ketika '
              'disembelih; hadapkan tempat sembelihan ke kiblat.',
          'Korban dan hadyu sunat bermula selepas matahari terbit pada '
              '10 Zulhijjah dan berlalu kadar solat Raya serta dua khutbah, '
              'hingga terbenam matahari hari Tasyriq terakhir.',
          'Dam wajib (tamattu’, qiran, melanggar larangan) bermula dari '
              'saat sebabnya berlaku — tidak terikat dengan Hari Nahr, '
              'tetapi afdal disembelih di Mina pada hari itu.',
          'Tiada bahagian korban/hadyu — termasuk kulit — boleh dijual '
              'atau dijadikan upah penyembelih.',
          'Seluruh Tanah Haram ialah tempat sembelihan; sunnahnya di Mina '
              'bagi Haji dan di Marwah bagi Umrah.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'فَإِذَا وَجَبَتْ جُنُوبُهَا فَكُلُوا مِنْهَا وَأَطْعِمُوا '
                  'الْقَانِعَ وَالْمُعْتَرَّ',
              terjemahan:
                  'Kemudian apabila ia telah rebah (mati), makanlah '
                  'sebahagiannya dan berilah makan kepada orang miskin yang '
                  'tidak meminta dan yang meminta.',
              sumber: 'Al-Hajj (22):36',
            ),
          ],
          teksKitabArabic:
              'وَأَمَّا الدِّمَاءُ الْوَاجِبَةُ فِي الْحَجِّ بِسَبَبِ '
              'التَّمَتُّعِ أَوِ الْقِرَانِ أَوِ اللُّبْسِ أَوْ غَيْرِ '
              'ذَلِكَ مِنْ فِعْلٍ مَحْظُورٍ أَوْ تَرْكِ مَأْمُورٍ فَوَقْتُهَا '
              'مِنْ حِينِ وُجُوبِهَا بِوُجُودِ سَبَبِهَا، وَلَا تَخْتَصُّ '
              'بِيَوْمِ النَّحْرِ وَلَا غَيْرِهِ',
          teksKitab:
              'Cabang-cabang penyembelihan dalam al-Fasl as-Sabi’ membezakan '
              'tiga jenis darah: korban dan hadyu sunat (terikat waktu Raya '
              'dan Tasyriq), hadyu nazar (wajib disembelih walaupun waktunya '
              'terlepas), dan dam wajib Haji (waktunya dari saat sebab '
              'berlaku). Disebut juga cara menyembelih — lembu dan kambing '
              'dibaringkan di sisi kiri, unta disembelih berdiri dengan kaki '
              'terikat — larangan menjual, hukum makan, dan hadyu yang rosak '
              'di jalan (al-Idah, hlm. 328–338 [331–341]).',
          permasalahan: <String>[
            'Daging hadyu atau korban nazar langsung tidak boleh dimakan '
                'oleh pemiliknya; yang sunat boleh dimakan dan dihadiahkan. '
                'Sunat makan sedikit hati atau daging sembelihan sendiri '
                'sebelum berangkat untuk Tawaf Ifadah (matan al-Idah).',
            'Korban bagi pihak orang hidup tanpa izinnya, atau bagi si mati '
                'tanpa wasiat, tidak jatuh untuknya (matan al-Idah). Nota '
                'kaki al-Ifsah: mazhab Hanbali tidak mensyaratkan wasiat, '
                'dan Abu al-Hasan al-‘Abbadi (Syafi’i) juga membenarkannya.',
            'Mewakilkan pembelian dan sembelihan korban di Makkah bagi '
                'orang di negeri lain adalah sah — fatwa Muhammad bin '
                'Sulaiman al-Kurdi yang dinukil nota kaki al-Ifsah. Fatwa '
                'ini relevan dengan amalan jemaah hari ini yang mewakilkan '
                'pembelian dan sembelihan dam.',
            'Dam tamattu’ boleh disembelih sebaik selesai Umrah (sebelum '
                'Hari Nahr) menurut Syafi’i; tiga imam yang lain hanya '
                'membenarkannya selepas solat Raya (nota kaki al-Ifsah).',
            'Hadyu wajib yang hampir mati di perjalanan mesti disembelih dan '
                'ditandakan dengan darahnya; pemilik dan rombongannya, kaya '
                'atau miskin, tidak boleh memakannya (matan al-Idah, '
                'berdasarkan hadis riwayat Muslim yang dinukil nota kaki).',
          ],
        ),
      ),
      LearningSection(
        title: 'Bercukur atau bergunting (halq/taqsir)',
        points: <String>[
          'Lelaki boleh bercukur atau bergunting; bercukur lebih afdal.',
          'Wanita hanya bergunting — sunat sepanjang satu ruas jari dari '
              'seluruh bahagian kepala.',
          'Minimum tiga helai rambut kepala; boleh dengan gunting, cabut, '
              'bakar atau apa-apa cara yang menghilangkannya.',
          'Bercukur ialah rukun: tidak boleh diganti dengan dam dan tiada '
              'had waktu akhir. Selagi belum bercukur, ihram masih berbaki.',
          'Sunat menghadap kiblat, mula dari bahagian depan sebelah kanan, '
              'kemudian kiri, dan menanam rambut yang dicukur.',
          'Orang botak sunat melalukan pisau cukur di atas kepalanya.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic: 'مُحَلِّقِينَ رُءُوسَكُمْ وَمُقَصِّرِينَ',
              terjemahan:
                  '(Kamu akan memasuki Masjidil Haram dengan aman) dalam '
                  'keadaan mencukur kepala dan menggunting rambut — dalil '
                  'kedua-dua cara sah dengan ijmak.',
              sumber: 'Al-Fath (48):27',
            ),
            DalilItem(
              arabic: 'اللَّهُمَّ ارْحَمِ الْمُحَلِّقِينَ',
              terjemahan:
                  '"Ya Allah, rahmatilah orang yang bercukur" — Nabi SAW '
                  'mengulanginya untuk yang bercukur sebelum menyebut yang '
                  'bergunting; dalil bercukur lebih afdal bagi lelaki dan '
                  'bahawa ia ibadah, bukan sekadar perkara harus.',
              sumber:
                  'Riwayat al-Bukhari (no. 1727) dan Muslim (no. 1301) '
                  'daripada Ibnu Umar r.a.',
            ),
          ],
          teksKitabArabic:
              'ثُمَّ أَقَلُّ وَاجِبِ هَذَا الْحَلْقِ ثَلَاثُ شَعَرَاتٍ '
              'حَلْقًا أَوْ تَقْصِيرًا مِنْ شَعْرِ الرَّأْسِ',
          teksKitab:
              'Bahagian "Amalan ketiga: bercukur" menyebut dua qaul '
              'asy-Syafi’i: bercukur hanya "membolehkan perkara yang dilarang" '
              '(bukan ibadah), atau — pendapat sahih — ia nusuk yang '
              'diperintahkan, rukun yang tidak sah Haji tanpanya. Ia tidak '
              'terikat tempat; jika dilakukan di tanah air pun sah, tetapi '
              'hukum ihram berterusan sehingga dia bercukur (al-Idah, '
              'hlm. 339–345 [342–348]).',
          permasalahan: <String>[
            'Rambut yang terjulur melepasi had kepala pun boleh digunting '
                'menurut pendapat asah. Tiga helai yang dipotong pada tiga '
                'waktu berasingan tetap sah, cuma terlepas kelebihan (matan '
                'al-Idah).',
            'Orang yang ada penyakit di kepala sehingga tidak dapat '
                'menyentuh rambut hendaklah menunggu sehingga mampu; '
                'kewajipan itu tidak gugur dan tiada fidyah. Orang yang '
                'memang tiada rambut, kewajipannya gugur (matan al-Idah).',
            'Sesiapa yang bernazar mencukur hendaklah mencukur seluruh '
                'kepala dengan pisau cukur. Bergunting tidak memadai bagi '
                'nazarnya (nota kaki al-Ifsah: ia tetap sah bagi nusuk, '
                'dengan dam kerana menyalahi nazar). Mentalbid (melekatkan '
                'rambut) ketika ihram tidak mewajibkan bercukur menurut '
                'pendapat sahih; dalam qaul qadim ia seperti nazar (matan '
                'al-Idah).',
            'Kadar minimum (nota kaki al-Ifsah daripada al-Majmu’): '
                'asy-Syafi’i tiga helai; Abu Hanifah suku kepala; Abu Yusuf '
                'separuh; Malik dan Ahmad kebanyakan kepala.',
            'Al-Hasyiah (dalam nota kaki al-Ifsah): orang yang berumrah '
                'menjelang Haji sehingga rambutnya tidak sempat tumbuh '
                'sebelum Hari Nahr lebih afdal bergunting sahaja dalam '
                'Umrahnya.',
          ],
        ),
      ),
      LearningSection(
        title: 'Tawaf Ifadah dan dua tahallul',
        points: <String>[
          'Tawaf Ifadah ialah rukun Haji; waktunya bermula selepas tengah '
              'malam Raya dan tiada had akhir.',
          'Afdal pada pagi 10 Zulhijjah selepas melontar, menyembelih dan '
              'bercukur; makruh dilewatkan ke hari Tasyriq, lebih makruh '
              'selepasnya, dan paling makruh pulang tanpanya.',
          'Jika belum Sa’i selepas Tawaf Qudum, wajib Sa’i selepas Tawaf '
              'Ifadah; jika sudah, makruh mengulanginya.',
          'Tahallul awal: selesai dua daripada tiga — melontar Aqabah, '
              'bercukur, Tawaf Ifadah (bersama Sa’i jika belum).',
          'Tahallul awal menghalalkan semua larangan ihram kecuali hubungan '
              'dengan isteri; tahallul thani (selesai ketiga-tiganya) '
              'menghalalkan semuanya.',
          'Menyembelih tiada kaitan dengan tahallul. Umrah hanya ada satu '
              'tahallul.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'طَيَّبْتُ رَسُولَ اللَّهِ ﷺ بِيَدَيَّ هَاتَيْنِ '
                  'لِحُرْمِهِ حِينَ أَحْرَمَ، وَلِحِلِّهِ قَبْلَ أَنْ يَطُوفَ '
                  'بِالْبَيْتِ',
              terjemahan:
                  'Aku memakaikan wangian kepada Rasulullah SAW dengan kedua '
                  'tanganku ini untuk ihramnya ketika baginda berihram, dan '
                  'untuk tahallulnya sebelum baginda bertawaf di Baitullah — '
                  'dalil wangian sudah halal selepas tahallul awal.',
              sumber:
                  'Riwayat al-Bukhari (no. 1539) dan Muslim (no. 1189) '
                  'daripada Aisyah r.a.',
            ),
          ],
          teksKitabArabic:
              'وَلَوْ طَافَ لِلْوَدَاعِ وَلَمْ يَكُنْ طَافَ لِلْإِفَاضَةِ '
              'وَقَعَ عَنْ طَوَافِ الْإِفَاضَةِ، وَلَوْ لَمْ يَطُفْ أَصْلًا '
              'لَمْ تَحِلَّ لَهُ النِّسَاءُ وَإِنْ طَالَ الزَّمَانُ وَمَضَتْ '
              'عَلَيْهِ سِنُونَ',
          teksKitab:
              'Bahagian "Amalan keempat: Tawaf Ifadah" dan "Fasal: Haji ada '
              'dua tahallul" menerangkan bahawa tahallul berkait dengan tiga '
              'amalan (lontaran Aqabah, bercukur, tawaf bersama Sa’i). Dua '
              'daripadanya menghasilkan tahallul awal; yang ketiga '
              'menghasilkan tahallul thani. Selepas itu jemaah sudah halal '
              'sepenuhnya, tetapi masih berbaki mabit di Mina, lontaran hari '
              'Tasyriq dan Tawaf Wada’ (al-Idah, hlm. 345–350 [348–353]).',
          permasalahan: <String>[
            'Selepas tahallul awal, jimak masih haram. Bersentuhan dengan '
                'syahwat juga kekal haram menurut pendapat asah (matan '
                'al-Idah); akad nikah juga, menurut al-Minhaj yang dinukil '
                'nota kaki al-Ifsah.',
            'Jika bercukur dianggap bukan nusuk, tahallul hanya berkait '
                'dengan lontaran dan tawaf (matan al-Idah). Bagi orang '
                'botak, tahallul awalnya dengan lontaran atau tawaf, dan '
                'tahallul thani dengan kedua-duanya (nota kaki al-Ifsah).',
            'Tawaf Wada’ yang dilakukan oleh orang yang belum Tawaf Ifadah '
                'jatuh sebagai Tawaf Ifadah (matan al-Idah) — penting bagi '
                'jemaah yang terlupa Tawaf Ifadah.',
            'Abu Hanifah: waktu Tawaf Ifadah bermula dari fajar Hari Nahr '
                'dan berakhir pada hari kedua Tasyriq; jika pulang sebelum '
                'bertawaf, dia wajib kembali dan membayar dam kerana lewat. '
                'Menurut '
                'asy-Syafi’i: tiada dam kerana asalnya tiada dam (nota kaki '
                'al-Ifsah).',
            'Dalam Umrah, jimak selepas Sa’i tetapi sebelum bercukur '
                'merosakkan Umrah, jika bercukur dikira nusuk (matan '
                'al-Idah).',
          ],
        ),
      ),
      LearningSection(
        title: 'Takbir, khutbah Mina dan Hari Haji Akbar',
        points: <String>[
          'Jemaah Haji sunat bertakbir selepas solat bermula Zuhur Hari '
              'Nahr hingga Subuh hari Tasyriq ketiga.',
          'Takbir diucapkan selepas solat fardu (tunai atau qada), solat '
              'sunat dan solat jenazah — sama ada musafir atau bermukim, '
              'berjemaah atau bersendirian.',
          'Sunat solat Zuhur di Mina selepas Tawaf Ifadah, mengikut '
              'perbuatan Nabi SAW.',
          'Imam berkhutbah selepas Zuhur di Mina (khutbah ketiga daripada '
              'empat) tentang mabit, lontaran dan nafar — hadirilah, '
              'mandi dan berwangi jika sudah bertahallul.',
          '"Hari Haji Akbar" ialah Hari Nahr menurut pendapat yang betul, '
              'kerana kebanyakan manasik berlaku pada hari itu.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'وَأَذَانٌ مِنَ اللَّهِ وَرَسُولِهِ إِلَى النَّاسِ '
                  'يَوْمَ الْحَجِّ الْأَكْبَرِ',
              terjemahan:
                  'Dan suatu pemakluman daripada Allah dan Rasul-Nya kepada '
                  'umat manusia pada Hari Haji Akbar.',
              sumber: 'At-Taubah (9):3',
            ),
          ],
          teksKitabArabic:
              'يُسَنُّ لِلْإِمَامِ أَنْ يَخْطُبَ هَذَا الْيَوْمَ بَعْدَ '
              'صَلَاةِ الظُّهْرِ بِمِنًى خُطْبَةً مُفْرَدَةً يُعَلِّمُ '
              'النَّاسَ بِهَا الْمَبِيتَ وَالرَّمْيَ فِي أَيَّامِ '
              'التَّشْرِيقِ وَالنَّفْرَ',
          teksKitab:
              'Dalam "Fasal tentang perkara yang disyariatkan pada Hari Nahr '
              'selain yang telah disebut", an-Nawawi menyenaraikan empat '
              'perkara: takbir selepas solat, solat Zuhur di Mina, khutbah '
              'imam, dan penentuan Hari Haji Akbar. Dinamakan "akbar" kerana '
              'orang menyebut Umrah sebagai "haji kecil" (al-Idah, '
              'hlm. 350–353 [353–356]).',
          permasalahan: <String>[
            'Bagi bukan jemaah Haji ada beberapa pendapat. Yang masyhur dalam '
                'mazhab: sama seperti jemaah Haji. Yang paling kuat menurut '
                'an-Nawawi: dari Subuh hari Arafah hingga Asar hari Tasyriq '
                'terakhir (matan al-Idah).',
            'Nota kaki al-Ifsah menukil an-Nawawi dalam al-Majmu’: khutbah '
                'selepas Zuhur disepakati ashab, tetapi "musykil" kerana '
                'hadis menyebut khutbah pada waktu Dhuha. Jawapannya: '
                'riwayat Ibn ‘Abbas menunjukkan selepas gelincir, dan '
                'sebahagian ulama menghimpunkan bahawa ada dua khutbah.',
            'Ibn Umar meriwayatkan Nabi SAW solat Zuhur di Mina, manakala '
                'Jabir meriwayatkan baginda solat di Makkah. An-Nawawi '
                '(al-Majmu’, dalam nota kaki) menghimpunkan bahawa baginda '
                'solat di Makkah, kemudian solat lagi di Mina sebagai imam '
                'kepada para sahabat.',
            'Takbir selepas solat sunat dan bagi yang solat bersendirian '
                'disunatkan dalam mazhab Syafi’i, berbeza dengan sebahagian '
                'imam lain (nota kaki al-Ifsah daripada al-Majmu’).',
          ],
        ),
      ),
    ],
    duas: <ModuleDua>[_duaTakbirJamrah, _duaSembelihan, _duaBercukur],
    academicInsight:
        'Hari Nahr ialah hari paling padat dalam Haji, dan al-Idah '
        'menyusunnya mengikut empat amalan. Tertibnya sunat, bukan wajib, '
        'berdasarkan sabda Nabi SAW "if’al wa la haraj" kepada setiap '
        'penanya. Kelonggaran ini amat bermakna dalam kesesakan Mina hari '
        'ini. Namun ada ketegasan pada perkara yang menentukan status ihram. '
        'Kerana an-Nawawi memilih bahawa bercukur itu nusuk dan rukun, '
        'bercukur menjadi salah satu daripada tiga "kunci" tahallul. '
        'Sembelihan pula tidak berkaitan dengan tahallul langsung. '
        'Kefahaman ini mengelakkan dua silap lazim: menyangka tahallul '
        'menunggu dam disembelih, atau menyangka jimak sudah halal selepas '
        'tahallul awal. Al-Idah juga membezakan tiga jenis darah: korban '
        'sunat, hadyu nazar dan dam wajib — masing-masing dengan waktu dan '
        'hukum makan yang berlainan.',
    reflectionQuestions: <String>[
      'Mengapakah menyembelih tidak dikira antara sebab tahallul, sedangkan '
          'bercukur dikira? Apakah kaitannya dengan khilaf sama ada '
          'bercukur itu nusuk atau sekadar perkara yang dibolehkan?',
      'Bagaimanakah hadis "if’al wa la haraj" membantu jemaah merancang '
          'amalan 10 Zulhijjah dalam keadaan sesak, tanpa mengabaikan '
          'perkara yang wajib?',
      'Apakah perbezaan hukum makan daging antara korban sunat, hadyu nazar '
          'dan dam wajib?',
    ],
  ),

  // -------------------------------------------------------------------------
  // MODUL 13 — al-Fasl ath-Thamin
  // -------------------------------------------------------------------------
  LearningModuleData(
    number: '13',
    title: 'Hari Tasyriq & Nafar',
    subtitle:
        'Mabit di Mina, lontaran tiga jamrah, qada’ lontaran dan bertolak.',
    icon: HajjIconType.tasyriq,
    accent: Color(0xFF3887B6),
    sections: <LearningSection>[
      LearningSection(
        title: 'Hari Tasyriq dan hukum mabit di Mina',
        points: <String>[
          'Hari Tasyriq ialah 11, 12 dan 13 Zulhijjah — "hari-hari yang '
              'tertentu bilangannya" (al-ayyam al-ma’dudat).',
          'Bermalam di Mina pada malam-malam itu wajib menurut qaul azhar; '
              'ada qaul lain yang mengatakannya sunat.',
          'Kadar wajib: berada di Mina pada kebanyakan malam (lebih separuh '
              'malam) menurut pendapat asah.',
          'Tinggal ketiga-tiga malam: satu dam. Tinggal satu malam: satu '
              'mud makanan menurut pendapat asah; dua malam: dua mud.',
          'Jika mabit Muzdalifah dan Mina ditinggalkan bersama, wajib dua '
              'dam menurut pendapat asah.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'أَنَّ الْعَبَّاسَ اسْتَأْذَنَ النَّبِيَّ ﷺ أَنْ يَبِيتَ '
                  'بِمَكَّةَ لَيَالِيَ مِنًى مِنْ أَجْلِ سِقَايَتِهِ فَأَذِنَ '
                  'لَهُ',
              terjemahan:
                  'Al-Abbas meminta izin Nabi SAW untuk bermalam di Makkah '
                  'pada malam-malam Mina kerana tugas memberi minum (siqayah), '
                  'lalu baginda mengizinkannya. Keizinan khusus ini menunjukkan '
                  'mabit itu asalnya wajib bagi yang lain.',
              sumber:
                  'Riwayat al-Bukhari (no. 1634) dan Muslim (no. 1315) '
                  'daripada Ibnu Umar r.a.',
            ),
          ],
          teksKitabArabic:
              'يَنْبَغِي أَنْ يَبِيتَ بِمِنًى فِي لَيَالِيهَا، وَهَلْ هَذَا '
              'الْمَبِيتُ وَاجِبٌ أَمْ سُنَّةٌ؟ قَوْلَانِ لِلشَّافِعِيِّ '
              'رَحِمَهُ اللَّهُ تَعَالَى، أَظْهَرُهُمَا أَنَّهُ وَاجِبٌ، '
              'وَالثَّانِي سُنَّةٌ',
          teksKitab:
              'Al-Fasl ath-Thamin (Amalan di Mina pada hari-hari Tasyriq dan '
              'malamnya) dimulakan dengan takrif: dinamakan Tasyriq kerana '
              'orang menjemur daging korban di bawah matahari. Hari-hari ini '
              'ialah "al-ayyam al-ma’dudat", manakala "al-ayyam al-ma’lumat" '
              'ialah sepuluh hari awal Zulhijjah. Masalah pertama membahaskan '
              'mabit, kadarnya dan dam kerana meninggalkannya (al-Idah, '
              'hlm. 354–356 [357–359]).',
          permasalahan: <String>[
            'Kadar mabit: pendapat asah ialah kebanyakan malam; pendapat '
                'kedua: cukup hadir di Mina ketika terbit fajar. Satu malam '
                'yang ditinggalkan: satu mud (asah); ada pendapat satu '
                'dirham, atau 1/3 dam (matan al-Idah).',
            'Nota kaki al-Ifsah: orang yang tertinggal mabit kerana lupa '
                'sama hukumnya dengan yang sengaja; jahil diqiyaskan dengan '
                'lupa.',
            'Nota kaki al-Ifsah: dam juga wajib jika seseorang mengambil '
                'nafar awal sedangkan dua malam pertama ditinggalkan, kerana '
                'dia meninggalkan "jenis" mabit Mina. Justeru syarat nafar '
                'awal ialah telah bermalam dua malam pertama, atau '
                'tertinggal kerana uzur.',
            'Khilaf mazhab (nota kaki al-Ifsah): Abu Hanifah — mabit sunat, '
                'meninggalkannya makruh tanpa dam; Malik — satu malam pun '
                'dikenakan dam; Ahmad — wajib, dengan dam bagi ketiga-tiga '
                'malam menurut pendapat sahih mazhabnya.',
          ],
        ),
      ),
      LearningSection(
        title: 'Uzur yang menggugurkan mabit',
        points: <String>[
          'Petugas siqayah (memberi minum jemaah) boleh tidak bermalam di '
              'Mina dan terus ke Makkah.',
          'Pengembala unta boleh tidak bermalam. Mereka boleh tidak '
              'melontar pada 11 Zulhijjah, tetapi wajib datang pada 12 '
              'Zulhijjah untuk melontar bagi kedua-dua hari.',
          'Uzur lain: takut harta hilang, takut atas diri, menjaga pesakit, '
              'atau sakit yang menyukarkan bermalam — tiada dam.',
          'Orang yang baru sampai di Arafah pada malam Raya lalu sibuk '
              'berwukuf, tidak dikenakan apa-apa kerana tidak sempat ke '
              'Muzdalifah.',
          'Jika pengembala masih di Mina ketika matahari terbenam, dia '
              'wajib bermalam; petugas siqayah tidak, kerana tugasnya siang '
              'dan malam.',
        ],
        deepDive: SectionDeepDive(
          teksKitabArabic:
              'هَذَا فِيمَنْ لَا عُذْرَ لَهُ، وَأَمَّا مَنْ تَرَكَ مَبِيتَ '
              'مُزْدَلِفَةَ أَوْ مِنًى لِعُذْرٍ فَلَا شَيْءَ عَلَيْهِ',
          teksKitab:
              'Al-Idah membahagikan uzur kepada empat: (1) ahli siqayah '
              'al-Abbas, termasuk siapa sahaja yang menguruskan siqayah baharu '
              'untuk jemaah; (2) pengembala unta; (3) uzur lain — risau harta, '
              'diri, pesakit yang perlu dijaga, atau sakit; (4) yang sibuk '
              'berwukuf pada malam Raya. Senarai ketiga ditutup dengan "atau '
              'seumpamanya", menunjukkan ia contoh, bukan had (al-Idah, '
              'hlm. 356–359 [359–362]).',
          permasalahan: <String>[
            'Rukhsah siqayah tidak terhad kepada keturunan al-Abbas; '
                'pengurus apa-apa siqayah baharu bagi jemaah mendapat hukum '
                'yang sama (matan al-Idah).',
            'Nota kaki al-Ifsah: "pengembala unta" meliputi penjaga apa-apa '
                'haiwan yang dihormati, sama ada pemilik, upahan atau '
                'sukarela, dengan syarat dia sukar membawa haiwan itu atau '
                'risau haiwan itu terbiar.',
            'Al-Majmu’ (dalam nota kaki al-Ifsah): rukhsah pengembala tidak '
                'meliputi meninggalkan lontaran Aqabah pada Hari Nahr atau '
                'melewatkan Tawaf Ifadah daripadanya.',
            'Al-Hasyiah (dalam nota kaki al-Ifsah): uzur yang sama juga '
                'menggugurkan mabit Muzdalifah, kerana Muzdalifah diqiyaskan '
                'dengan Mina yang menjadi tempat nas.',
          ],
        ),
      ),
      LearningSection(
        title: 'Cara melontar tiga jamrah dan berdiri berdoa',
        points: <String>[
          'Setiap hari Tasyriq, lontar 21 biji batu — tujuh pada setiap '
              'jamrah, sebiji demi sebiji, bertakbir bersama setiap batu.',
          'Mula dengan Jamrah Ula (dekat Masjid Khaif), kemudian Wusta, '
              'akhir sekali Aqabah.',
          'Selepas Ula, maju sedikit ke tepi supaya tidak terkena batu, '
              'menghadap kiblat, bertahmid, bertakbir, bertahlil, '
              'bertasbih dan berdoa dengan khusyuk — kira-kira sekadar '
              'bacaan Surah al-Baqarah.',
          'Lakukan perkara yang sama selepas Wusta. Selepas Aqabah, jangan '
              'berhenti berdoa.',
          'Yang wajib hanya lontaran; doa dan berdiri itu sunat. Sunat '
              'mandi setiap hari untuk melontar.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'كَانَ يَرْمِي الْجَمْرَةَ الدُّنْيَا بِسَبْعِ '
                  'حَصَيَاتٍ يُكَبِّرُ عَلَى إِثْرِ كُلِّ حَصَاةٍ',
              terjemahan:
                  'Ibnu Umar r.a. melontar Jamrah Dunya (Ula) dengan tujuh '
                  'biji batu sambil bertakbir selepas setiap biji. Kemudian '
                  'beliau maju, berdiri lama menghadap kiblat dan berdoa '
                  'sambil mengangkat tangan; begitu juga di Wusta; lalu '
                  'melontar Aqabah tanpa berhenti, sambil berkata: "Beginilah '
                  'aku melihat Nabi SAW melakukannya."',
              sumber:
                  'Riwayat al-Bukhari (no. 1751) daripada Ibnu Umar r.a. '
                  '(ringkasan makna)',
            ),
          ],
          teksKitabArabic:
              'ثُمَّ يَتَقَدَّمُ عَنْهَا وَيَنْحَرِفُ قَلِيلًا وَيَجْعَلُهَا '
              'فِي قَفَاهُ، وَيَقِفُ فِي مَوْضِعٍ لَا يُصِيبُهُ '
              'الْمُتَطَايِرُ مِنَ الْحَصَى الَّذِي يُرْمَى بِهِ، '
              'وَيَسْتَقْبِلُ الْقِبْلَةَ، وَيَحْمَدُ اللَّهَ تَعَالَى '
              'وَيُكَبِّرُ وَيُهَلِّلُ وَيُسَبِّحُ وَيَدْعُو مَعَ حُضُورِ '
              'الْقَلْبِ وَخُشُوعِ الْجَوَارِحِ',
          teksKitab:
              'Masalah kedua dan ketiga dalam al-Fasl ath-Thamin menghuraikan '
              'cara lontaran harian. Jamrah Ula didatangi dari bahagian '
              'bawah Mina; selepas melontar, jemaah maju sedikit dan berdoa '
              'menghadap kiblat. Di Wusta dia berdiri di perut lembah, dengan '
              'jamrah di sebelah kanannya. Di Aqabah dia melontar dari perut '
              'wadi tanpa berhenti. Yang wajib hanyalah lontaran dengan sifat '
              'yang sama seperti lontaran Aqabah pada Hari Nahr (al-Idah, '
              'hlm. 360–361 [363–364]).',
          permasalahan: <String>[
            'Tempoh berdiri "sekadar Surah al-Baqarah" berasal daripada '
                'perbuatan Ibnu Umar riwayat al-Baihaqi, seperti dinyatakan '
                'al-Majmu’ (nota kaki al-Ifsah).',
            'Nota kaki al-Ifsah: kawasan jamrah kini telah diratakan dan '
                'dinaungi jejantas bertingkat; tiada lagi pendakian ke '
                'Jamrah Ula seperti yang digambarkan dalam matan.',
            'Sunat mandi untuk melontar ialah pendapat al-Idah. Nota kaki '
                'al-Ifsah menukil sebahagian ulama yang berpendapat mandi '
                'untuk melontar tidak sabit daripada Nabi SAW; yang sabit '
                'hanya mandi ihram, masuk Makkah dan hari Arafah.',
            'Tertib Ula–Wusta–Aqabah ialah pegangan Malik, asy-Syafi’i, '
                'Ahmad dan jumhur. Abu Hanifah menganggapnya sunat — jika '
                'terbalik, sunat diulang tetapi tiada dam (nota kaki '
                'al-Ifsah).',
          ],
        ),
      ),
      LearningSection(
        title: 'Waktu, bilangan, tertib dan sasaran lontaran',
        points: <String>[
          'Lontaran hari Tasyriq hanya sah selepas gelincir matahari '
              '(zawal), hingga terbenam matahari menurut pendapat asah.',
          'Sunat melontar dahulu sebaik gelincir matahari, kemudian kembali '
              'solat Zuhur, jika masa masih cukup.',
          'Bilangan ialah syarat: tujuh biji bagi setiap jamrah. Tertib '
              'antara jamrah pula syarat sah.',
          'Jika tertinggal sebiji batu tetapi tidak tahu dari jamrah mana, '
              'anggap ia dari Jamrah Ula: lontar sebiji di Ula, kemudian '
              'ulang Wusta dan Aqabah.',
          'Sasaran ialah takungan batu (mujtama’ al-hasa) di tempat '
              'asalnya, bukan tiang dan bukan batu yang melimpah keluar.',
          'Bagi yang uzur, wakil boleh melontar mengikut syarat dalam Modul '
              '12.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'رَمَى رَسُولُ اللَّهِ ﷺ الْجَمْرَةَ يَوْمَ النَّحْرِ '
                  'ضُحًى، وَأَمَّا بَعْدُ فَإِذَا زَالَتِ الشَّمْسُ',
              terjemahan:
                  'Rasulullah SAW melontar jamrah pada Hari Nahr pada waktu '
                  'Dhuha; adapun selepas itu (hari Tasyriq), apabila '
                  'matahari telah gelincir.',
              sumber:
                  'Riwayat Muslim (no. 1299) daripada Jabir r.a.; lafaz '
                  'seperti dinukil nota kaki al-Ifsah',
            ),
            DalilItem(
              arabic: 'كُنَّا نَتَحَيَّنُ، فَإِذَا زَالَتِ الشَّمْسُ رَمَيْنَا',
              terjemahan:
                  'Kami menunggu-nunggu waktunya; apabila matahari gelincir, '
                  'kami pun melontar.',
              sumber:
                  'Riwayat al-Bukhari (no. 1746) daripada Ibnu Umar r.a.; '
                  'dipetik dalam matan al-Idah',
            ),
          ],
          teksKitabArabic:
              'لَا يَصِحُّ الرَّمْيُ فِي هَذِهِ الْأَيَّامِ إِلَّا بَعْدَ '
              'زَوَالِ الشَّمْسِ … التَّرْتِيبُ بَيْنَ الْجَمَرَاتِ شَرْطٌ، '
              'فَيَبْدَأُ بِالْجَمْرَةِ الْأُولَى ثُمَّ يَرْمِي الْوُسْطَى '
              'ثُمَّ جَمْرَةَ الْعَقَبَةِ، وَلَا يُجْزِئُهُ غَيْرُ ذَلِكَ',
          teksKitab:
              'Masalah keempat hingga kelapan dan kesepuluh dalam al-Fasl '
              'ath-Thamin menetapkan syarat lontaran hari Tasyriq: selepas '
              'zawal, bilangan, tertib, dan sasaran. Muwalat (berturut-turut) '
              'antara jamrah dan antara lontaran dalam satu jamrah adalah '
              'sunat menurut pendapat asah. An-Nawawi menukil asy-Syafi’i: '
              'jamrah ialah tempat himpunan batu di lokasinya yang dikenali '
              'sejak zaman Nabi SAW. Jika ia dialihkan dan orang melontar di '
              'tempat lain, tidak sah (al-Idah, hlm. 362–363, 366–367 '
              '[365–366, 369–370]).',
          permasalahan: <String>[
            'Al-Hasyiah (nota kaki al-Ifsah): "hingga terbenam matahari" itu '
                'waktu ikhtiyar; waktu ada’ yang sebenar berlanjutan hingga '
                'akhir hari Tasyriq menurut pendapat muktamad.',
            'Abu Hanifah membenarkan lontaran sebelum zawal pada hari nafar. '
                'Kedua-dua sahabatnya (Abu Yusuf dan Muhammad) dan tiga imam '
                'lain tidak membenarkannya. Nota kaki al-Ifsah menukil '
                'asy-Syinqiti (Adwa’ al-Bayan) yang menilainya bercanggah '
                'dengan perbuatan Nabi SAW.',
            'Muwalat: pendapat asah sunat; ada pendapat yang mengatakannya '
                'wajib (matan al-Idah).',
            'Al-Hasyiah: had takungan ialah kira-kira tiga hasta dari dasar '
                'jamrah — huraian al-Jamal at-Tabari (nota kaki al-Ifsah).',
          ],
        ),
      ),
      LearningSection(
        title: 'Lontaran tertinggal: tadaruk dan dam',
        points: <String>[
          'Lontaran yang tertinggal pada siang hari boleh diganti pada '
              'malamnya, atau pada baki hari Tasyriq — sengaja atau terlupa.',
          'Ganti itu dikira ada’ (tunai), bukan qada, menurut pendapat '
              'asah.',
          'Wajib dahulukan lontaran hari yang tertinggal, kemudian lontaran '
              'hari semasa. Lontaran Aqabah Hari Nahr yang tertinggal juga '
              'didahulukan.',
          'Selepas hari Tasyriq berakhir, semua lontaran luput dan tidak '
              'boleh diganti lagi; ia ditebus dengan dam.',
          'Tertinggal tiga biji atau lebih, atau seluruh lontaran: satu dam '
              '(asah). Sebiji: satu mud makanan; dua biji: dua mud.',
        ],
        deepDive: SectionDeepDive(
          teksKitabArabic:
              'وَاعْلَمْ بِأَنَّهُ يَفُوتُ كُلُّ الرَّمْيِ بِأَنْوَاعِهِ '
              'بِخُرُوجِ أَيَّامِ التَّشْرِيقِ مِنْ غَيْرِ رَمْيٍ، وَلَا '
              'يُؤَدَّى شَيْءٌ مِنْهُ بَعْدَهَا لَا أَدَاءً وَلَا قَضَاءً',
          teksKitab:
              'Masalah kesembilan dalam al-Fasl ath-Thamin: lontaran yang '
              'tertinggal ditadaruk pada malamnya atau pada baki hari '
              'Tasyriq, dan dikira ada’. Penentuan setiap hari bagi '
              'lontarannya hanyalah waktu ikhtiyar dan fadilat, seperti '
              'waktu ikhtiyar solat. Orang yang bertolak dari Mina tanpa '
              'melontar lalu kembali sebelum terbenam matahari pada hari '
              'kedua Tasyriq dan melontar, tidak dikenakan dam dari sudut '
              'lontaran (al-Idah, '
              'hlm. 363–366 [366–369]).',
          permasalahan: <String>[
            'Sebiji yang dikenakan mud hanyalah sebiji dari jamrah terakhir '
                'pada hari terakhir. Jika ia dari Ula atau Wusta, lontaran '
                'selepasnya turut batal kerana tertib, lalu dam dikenakan '
                '(nota kaki al-Ifsah daripada al-Hasyiah).',
            'Melontar 14 biji pada setiap jamrah sekali gus (tujuh untuk '
                'semalam, tujuh untuk hari ini) tidak sah bagi hari ini, '
                'kerana lontaran semalam belum lengkap bagi ketiga-tiga '
                'jamrah (nota kaki al-Ifsah).',
            'Orang yang mengambil nafar awal tanpa melontar lalu tidak '
                'kembali sebelum terbenam matahari: lontarannya luput dan '
                'dam wajib. Imam al-Haramain memperincikan beberapa keadaan '
                '(nota kaki al-Ifsah).',
            'Khilaf (nota kaki al-Ifsah): Malik — menangguhkan sebiji batu '
                'hingga malam pun dikenakan dam; Abu Hanifah — dam bagi '
                'lontaran sehari atau lebih separuh, dan sedekah bagi setiap '
                'biji yang kurang; Ahmad — tidak membenarkan lontaran '
                'malam.',
          ],
        ),
      ),
      LearningSection(
        title: 'Nafar awal dan nafar thani',
        points: <String>[
          'Nafar awal: bertolak pada 12 Zulhijjah selepas zawal dan selepas '
              'melontar, sebelum matahari terbenam. Lontaran hari ketiga '
              'gugur.',
          'Menunggu hingga 13 Zulhijjah (nafar thani) lebih afdal.',
          'Jangan melontar pada 12 Zulhijjah untuk 13 Zulhijjah. Baki batu '
              'boleh dibuang atau diberikan kepada orang yang belum '
              'melontar; menanamnya tiada asas.',
          'Jika matahari terbenam ketika masih di Mina, wajib bermalam dan '
              'melontar pada 13 Zulhijjah selepas zawal.',
          'Jika sudah bergerak keluar lalu matahari terbenam sebelum '
              'keluar dari Mina, atau sedang sibuk berkemas, boleh '
              'meneruskan perjalanan menurut pendapat asah.',
          'Selepas nafar, yang berbaki hanyalah Tawaf Wada’.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'وَاذْكُرُوا اللَّهَ فِي أَيَّامٍ مَعْدُودَاتٍ فَمَنْ '
                  'تَعَجَّلَ فِي يَوْمَيْنِ فَلَا إِثْمَ عَلَيْهِ وَمَنْ '
                  'تَأَخَّرَ فَلَا إِثْمَ عَلَيْهِ لِمَنِ اتَّقَى',
              terjemahan:
                  'Dan ingatlah Allah pada hari-hari yang tertentu '
                  'bilangannya. Sesiapa yang segera (bertolak) dalam dua '
                  'hari, tiada dosa baginya; dan sesiapa yang melewatkan, '
                  'tiada dosa baginya — bagi orang yang bertakwa.',
              sumber: 'Al-Baqarah (2):203',
            ),
          ],
          teksKitabArabic:
              'وَلَوْ لَمْ يَنْفِرْ حَتَّى غَرَبَتِ الشَّمْسُ وَهُوَ بَعْدُ '
              'فِي مِنًى لَزِمَهُ الْمَبِيتُ بِهَا وَالرَّمْيُ فِي الْيَوْمِ '
              'الثَّالِثِ بَعْدَ زَوَالِ الشَّمْسِ ثُمَّ يَنْفِرُ، وَلَوْ '
              'رَحَلَ فَغَرَبَتِ الشَّمْسُ قَبْلَ انْفِصَالِهِ مِنْ مِنًى '
              'فَلَهُ الِاسْتِمْرَارُ فِي السَّيْرِ',
          teksKitab:
              'Masalah ketiga belas, keenam belas dan ketujuh belas dalam '
              'al-Fasl ath-Thamin: nafar awal harus tetapi melewatkannya '
              'lebih afdal. Yang bertolak afdal solat Zuhur di al-Muhassab '
              'atau tempat lain, bukan di Mina (jika di Mina pun harus). '
              'Singgah di al-Muhassab '
              '(al-Abtah) sunat kerana mengikut Nabi SAW, tetapi bukan '
              'sebahagian manasik — sebagaimana kata Ibn ‘Abbas: "Tahsib '
              'bukan sunnah (manasik), ia hanya tempat Rasulullah SAW '
              'singgah" (al-Idah, hlm. 368–372 [371–375]).',
          permasalahan: <String>[
            'Nota kaki al-Ifsah menyenaraikan syarat nafar awal: sebelum '
                'terbenam matahari; selepas zawal hari kedua Tasyriq; selepas '
                'menyelesaikan semua lontaran; telah bermalam dua malam '
                'pertama (atau tertinggal kerana uzur); berniat nafar; niat '
                'itu bersekali dengan perbuatan bertolak; dan tidak berazam '
                'untuk kembali bermalam.',
            'Orang yang telah bertolak sebelum terbenam lalu kembali ke Mina '
                'kerana keperluan — sebelum atau selepas terbenam — tetap '
                'harus bertolak semula menurut pendapat asah (matan '
                'al-Idah).',
            'Kesesakan kenderaan: Ibn Jasir (Hanbali) dalam Mufid al-Anam '
                'menyokong pendapat al-Idah bahawa yang tersekat ketika '
                'sudah bergerak tidak wajib bermalam. Asy-Syinqiti (Adwa’ '
                'al-Bayan) pula berpendapat dia wajib bermalam dan '
                'melontar (nota kaki al-Ifsah).',
            'Abu Hanifah: orang yang masih di Mina selepas terbenam matahari '
                'boleh bertolak pada malam itu selagi fajar 13 Zulhijjah '
                'belum terbit; jumhur mewajibkan dia kekal (nota kaki '
                'al-Ifsah).',
          ],
        ),
      ),
      LearningSection(
        title: 'Masjid Khaif, khutbah akhir dan hikmah melontar',
        points: <String>[
          'Sunat melontar dengan berjalan kaki pada hari pertama dan kedua '
              'Tasyriq, dan berkenderaan pada hari ketiga kerana terus '
              'bertolak selepasnya.',
          'Perbanyakkan solat di Masjid Khaif dan jaga solat fardu '
              'berjemaah bersama imam di sana.',
          'Pada 12 Zulhijjah, imam berkhutbah selepas Zuhur (khutbah '
              'terakhir daripada empat): menerangkan nafar dan Tawaf Wada’, '
              'serta berpesan supaya istiqamah.',
          'Jadikan diri lebih baik selepas Haji dan jangan lupakan janji '
              'kebaikan yang dibuat kepada Allah.',
          'Melontar ialah ibadah ta’abbudi — dilakukan semata-mata kerana '
              'patuh kepada perintah, bukan kerana akal memahami sebabnya.',
        ],
        deepDive: SectionDeepDive(
          teksKitabArabic:
              'وَمِنَ الْعِبَادَاتِ الَّتِي لَا تُفْهَمُ مَعَانِيهَا '
              'السَّعْيُ وَالرَّمْيُ، فَكُلِّفَ الْعَبْدُ بِهَا لِيَتِمَّ '
              'انْقِيَادُهُ، فَإِنَّ هَذَا النَّوْعَ لَا حَظَّ لِلنَّفْسِ '
              'فِيهِ وَلَا أُنْسَ لِلْعَقْلِ بِهِ، فَلَا يَحْمِلُ عَلَيْهِ '
              'إِلَّا مُجَرَّدُ امْتِثَالِ الْأَمْرِ وَكَمَالُ الِانْقِيَادِ',
          teksKitab:
              'Masalah kesebelas hingga kelima belas dalam al-Fasl ath-Thamin '
              'menyentuh adab berjalan kaki ketika melontar, kelebihan Masjid '
              'Khaif (al-Azraqi meriwayatkan musalla Nabi SAW di hadapan '
              'menara), khutbah keempat pada hari kedua Tasyriq, dan hikmah '
              'melontar. Menurut an-Nawawi, setiap ibadah ada maknanya, '
              'tetapi sebahagiannya tidak difahami oleh mukalaf. Sa’i dan '
              'melontar ialah contohnya, supaya ketundukan hamba menjadi '
              'sempurna (al-Idah, hlm. 367, 370–371 [370, 373–374]).',
          permasalahan: <String>[
            'Hikmah melontar menurut al-Idah ialah ta’abbud (kepatuhan '
                'semata-mata). Kisah Nabi Ibrahim AS menolak godaan syaitan '
                'tidak disebut dalam fasal ini; jika ia dikemukakan, '
                'hendaklah dinyatakan sumbernya secara berasingan.',
            'Ibnu Umar meriwayatkan Nabi SAW melontar pada hari-hari '
                'Tasyriq dengan berjalan kaki, pergi dan balik — riwayat '
                'al-Baihaqi, dan at-Tirmidhi menilainya sahih (nota kaki '
                'al-Ifsah).',
            'Kandungan khutbah keempat menurut al-Idah bukan hanya hukum '
                'nafar, tetapi juga nasihat supaya jemaah menutup Haji '
                'dengan istiqamah. Inilah ukuran praktikal Haji mabrur.',
            'Nota kaki al-Ifsah: menara yang dimaksudkan ialah menara yang '
                'bersambung dengan kubah di tengah masjid (dibina 874H), '
                'bukan menara di pintu. Masjid Khaif telah diperbaharui dan '
                'diperluas pada zaman pemerintahan Saudi.',
          ],
        ),
      ),
    ],
    duas: <ModuleDua>[_duaTakbirJamrah, _duaSelepasJamrah, _duaTakbirTasyriq],
    academicInsight:
        'Al-Fasl ath-Thamin memperlihatkan dua lapisan hukum yang berbeza '
        'sifatnya. Lapisan pertama tegas: lontaran hanya selepas zawal, '
        'tujuh biji setiap jamrah, dan tertib Ula–Wusta–Aqabah sebagai '
        'syarat. Lapisan kedua longgar: hari-hari Tasyriq dianggap satu '
        'waktu yang berterusan, jadi lontaran yang tertinggal boleh '
        'ditadaruk sebagai ada’ sehingga Tasyriq berakhir. Mabit pula wajib '
        'tetapi gugur dengan uzur yang luas. Keseimbangan ini sangat '
        'relevan di Mina hari ini, apabila jadual lontaran ditetapkan '
        'pihak berkuasa dan kesesakan kenderaan menghalang jemaah keluar '
        'sebelum maghrib. An-Nawawi menutup bab ini dengan hikmah yang '
        'jarang disedari: melontar dan Sa’i sengaja disyariatkan tanpa '
        'makna yang dapat dicerna akal, supaya ketundukan hamba benar-benar '
        'sempurna.',
    reflectionQuestions: <String>[
      'Mengapakah lontaran yang tertinggal pada hari Tasyriq dikira ada’ dan '
          'bukan qada? Apakah kesannya terhadap tertib dan dam?',
      'Bagaimanakah syarat-syarat nafar awal dan khilaf tentang orang yang '
          'tersekat dalam kesesakan dapat membimbing keputusan jemaah pada '
          'petang 12 Zulhijjah?',
      'Apakah pengajaran daripada pandangan an-Nawawi bahawa melontar ialah '
          'ibadah yang maknanya tidak difahami akal, berbanding penjelasan '
          'berbentuk kisah yang lazim didengar?',
    ],
  ),
];
