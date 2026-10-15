import 'package:flutter/material.dart';

import '../islamic_icons.dart';
import '../learning_module_screen.dart';
import '../shared_widgets.dart';

// ---------------------------------------------------------------------------
// MODUL 16 & 17 — dipetik daripada al-Idah fi Manasik al-Hajj wa al-’Umrah
// karangan Imam an-Nawawi (Shamela, book_id 96232), Bab Ketujuh dan Bab
// Kelapan. Rujukan halaman ditulis "hlm. <page_id Shamela> [<halaman cetak>]".
// Bahan nota kaki (al-Ifsah oleh ’Abd al-Fattah Rawah, termasuk nukilan
// hasyiah Ibn Hajar al-Haytami) dilabel dengan jelas dan tidak dinisbahkan
// kepada an-Nawawi.
// ---------------------------------------------------------------------------

const List<LearningModuleData> idahModulesBab7Bab8 = <LearningModuleData>[
  // =========================================================================
  // MODUL 16 — Ihsar, Fawat & Perincian Fidyah (Bab Ketujuh)
  // =========================================================================
  LearningModuleData(
    number: '16',
    title: 'Ihsar, Fawat & Perincian Fidyah',
    subtitle:
        'Perincian dam setiap kesalahan, terlepas Wukuf dan terhalang daripada menyempurnakan ibadah.',
    icon: HajjIconType.dam,
    accent: Color(0xFF7A6CB1),
    sections: <LearningSection>[
      LearningSection(
        title: 'Meninggalkan perkara yang diperintah',
        points: <String>[
          'Al-Idah membahagikan perkara yang ditinggalkan kepada tiga: yang diizinkan (Tamattu’ dan Qiran), wajib Haji yang tidak diizinkan untuk ditinggalkan, dan rukun yang tidak boleh diganti dengan dam.',
          'Dam Tamattu’, Qiran dan meninggalkan wajib (ihram dari miqat, melontar, bermalam di Muzdalifah dan Mina, Tawaf Wada’) ialah seekor kambing; jika tidak mampu, puasa 3 hari semasa Haji dan 7 hari setelah pulang ke kampung.',
          'Puasa 3 hari tidak boleh dimulakan sebelum berihram Haji, dan tidak boleh pada Hari Nahar atau hari-hari Tasyriq. Sunat menyelesaikannya sebelum Hari Arafah, jadi jemaah yang akan berpuasa digalakkan berihram Haji sebelum 6 Zulhijjah.',
          'Jika puasa 3 hari tidak sempat dibuat semasa Haji, ia wajib diqada; setelah pulang, pisahkan puasa 3 dan 7 itu dengan tempoh 4 hari ditambah tempoh biasa perjalanan pulang.',
          'Tawaf Ifadah, Sa’i dan bercukur tidak boleh diganti dengan dam. Ia tidak luput selagi jemaah masih hidup dan wajib disempurnakan sendiri (lihat Modul 02).',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'فَمَنْ لَمْ يَجِدْ فَصِيَامُ ثَلَاثَةِ أَيَّامٍ فِي الْحَجِّ '
                  'وَسَبْعَةٍ إِذَا رَجَعْتُمْ تِلْكَ عَشَرَةٌ كَامِلَةٌ',
              terjemahan:
                  '...sesiapa yang tidak mendapatkan (binatang hadyu), '
                  'hendaklah berpuasa tiga hari semasa Haji dan tujuh hari '
                  'apabila kamu pulang; itulah sepuluh hari yang sempurna.',
              sumber: 'Al-Baqarah (2):196',
            ),
          ],
          teksKitab:
              'Al-Idah, Bab Ketujuh, hlm. 466–470 [469–473]: an-Nawawi '
              'memulakan bab dengan kaedah bahawa sesiapa yang tidak '
              'meninggalkan perkara yang diperintah dan tidak melakukan '
              'perkara yang diharamkan, tiada apa-apa ke atasnya. Bagi '
              'wajib yang ditinggalkan, beliau mentarjihkan bahawa jemaah '
              'yang tidak mampu menyembelih berpuasa seperti jemaah '
              'Tamattu’. Ada juga pendapat lain (qil) bahawa nilai kambing '
              'itu dibelikan makanan untuk disedekahkan, dan jika tidak '
              'mampu, dia berpuasa sehari bagi setiap cupak (mud).',
          teksKitabArabic:
              'فَمَنْ تَرَكَ وَاجِبًا مِنْ هَذِهِ لَزِمَهُ دَمُ شَاةٍ '
              'فَصَاعِدًا، فَإِنْ عَجَزَ فَالْأَصَحُّ أَنَّهُ كَالْمُتَمَتِّعِ '
              'فَيَصُومُ ثَلَاثَةَ أَيَّامٍ فِي الْحَجِّ وَسَبْعَةً إِذَا رَجَعَ '
              'إِلَى أَهْلِهِ',
          permasalahan: <String>[
            'Waktu wajib dam Tamattu’ bermula apabila jemaah berihram Haji. '
                'Ia tidak terikat dengan hari tertentu kerana sama seperti '
                'dam jubran yang lain, tetapi afdal disembelih pada Hari '
                'Nahar. Menurut pendapat asah, ia sah disembelih selepas '
                'selesai Umrah sebelum berihram Haji, tetapi tidak sah '
                'sebelum bertahallul daripada Umrah (hlm. 467–468 [470–471]).',
            'Puasa 7 hari wajib apabila jemaah pulang ke kampungnya. '
                'Menurut pendapat asah, puasa itu tidak sah jika dibuat '
                'dalam perjalanan. Nota kaki al-Ifsah menukil bahawa mazhab '
                'Maliki, Hanafi dan satu riwayat Hanbali membenarkannya '
                'lebih awal (hlm. 469 [472]).',
            'Jemaah yang sudah mula berpuasa, kemudian mendapat binatang '
                'hadyu, tidak wajib beralih kepada sembelihan. Dia boleh '
                'meneruskan puasa, walaupun sunat beralih kepada hadyu '
                '(hlm. 470 [473]).',
            'Nota kaki al-Ifsah menjelaskan bahawa "puasa 3 hari semasa '
                'Haji" bagi orang yang meninggalkan wajib hanya dapat '
                'dibuat bagi kes meninggalkan ihram dari miqat. Kesalahan '
                'lain seperti tidak melontar atau tidak bermalam berlaku '
                'pada akhir Haji, jadi ruang untuk berpuasa semasa Haji '
                'tidak ada lagi. Nota kaki yang sama menyenaraikan dam '
                'kerana tidak menghimpunkan malam dan siang di Arafah '
                'sebagai dam sunat, bukan wajib (hlm. 467, 470 [470, 473]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Fawat: terlepas Wukuf di Arafah',
        points: <String>[
          'Satu-satunya perkara yang menyebabkan Haji luput (fawat) ialah terlepas Wukuf di Arafah dalam waktunya.',
          'Jemaah yang terlepas Wukuf wajib bertahallul dengan amalan Umrah, iaitu Tawaf, Sa’i dan bercukur. Amalan ini tidak dikira sebagai Umrah.',
          'Dia wajib membayar dam seperti dam Tamattu’ dan wajib mengqada Haji itu, sama ada Haji wajib atau sunat.',
          'Menurut pendapat asah, qada wajib dibuat segera pada tahun berikutnya dan tidak boleh ditangguhkan tanpa uzur.',
          'Hukumnya sama sama ada terlepas kerana uzur (tertidur, terlupa, sesat jalan) atau tidak. Yang berbeza hanyalah dosa: orang yang beruzur tidak berdosa.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Al-Idah, Bab Ketujuh (ad-Darb ats-Tsani), hlm. 470–473 '
              '[473–476]: an-Nawawi menetapkan bahawa dam fawat sama '
              'hukumnya dengan dam Tamattu’. Dalam fara’ masa dan tempat '
              'dam (hlm. 487 [490]) pula, beliau menyatakan dam fawat '
              'wajib ditangguhkan hingga tahun qada, dan waktunya '
              'bermula apabila jemaah berihram untuk Haji qada itu.',
          teksKitabArabic:
              'فَمَنْ فَاتَهُ الْوُقُوفُ لَزِمَهُ دَمٌ كَدَمِ التَّمَتُّعِ '
              'فِي أَحْكَامِهِ السَّابِقَةِ، وَيَلْزَمُهُ أَنْ يَتَحَلَّلَ '
              'بِعَمَلِ عُمْرَةٍ',
          permasalahan: <String>[
            'Menurut nota kaki al-Ifsah, Sa’i dalam "Umrah fawat" ini '
                'tidak perlu diulang jika jemaah sudah bersa’i selepas '
                'Tawaf Qudum. Tahallulnya ada dua peringkat, dan dia tidak '
                'lagi wajib bermalam di Mina atau melontar (hlm. 471–472 '
                '[474–475]).',
            'Dalil yang dinukil nota kaki al-Ifsah ialah athar Umar r.a. '
                'kepada Abu Ayyub al-Ansari r.a. yang kehilangan '
                'tunggangannya lalu tiba pada Hari Nahar: "Buatlah seperti '
                'yang dibuat oleh orang berUmrah, kemudian engkau telah '
                'halal. Apabila engkau sempat Haji tahun hadapan, '
                'tunaikanlah Haji dan sembelihlah hadyu yang mudah." '
                'Athar ini diriwayatkan oleh Malik, asy-Syafi’i dan '
                'al-Baihaqi menurut nukilan tersebut; takhrijnya tidak '
                'disemak secara bebas di sini.',
            'Jemaah Qiran yang terlepas Wukuf turut terlepas Umrahnya. '
                'Menurut nukilan al-Ifsah daripada al-Majmu’, ulama '
                'Syafi’i mewajibkan tiga dam ke atasnya, iaitu dam fawat, '
                'dam Qiran dan dam qada (rujuk juga Modul U1). Umrah '
                'sendiri tidak tergambar luput kerana sepanjang tahun ialah '
                'waktunya.',
            'Menurut nota kaki al-Ifsah, jika fawat itu berpunca daripada '
                'ihsar (contohnya terpaksa melalui jalan lain yang lebih '
                'jauh), jemaah yang Hajinya sunat tidak wajib qada kerana '
                'dia telah berusaha sedaya mampu (hlm. 472 [475]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Fidyah melanggar larangan & jimak',
        points: <String>[
          'Mencukur rambut, memotong kuku, memakai pakaian terlarang, memakai wangian, meminyakkan rambut kepala atau janggut, dan bersentuhan dengan syahwat tanpa jimak dikenakan fidyah takhyir.',
          'Fidyah takhyir bermaksud jemaah bebas memilih: sembelih seekor kambing, beri makan 6 orang miskin (setengah sa’ setiap seorang), atau puasa 3 hari.',
          'Jimak yang merosakkan Haji pula dikenakan seekor unta (badanah). Jika tidak dapat, seekor lembu; jika tidak dapat, 7 ekor kambing.',
          'Jika semua itu tidak dapat, harga unta dinilai dalam bentuk makanan untuk disedekahkan. Jika tidak mampu juga, puasa sehari bagi setiap cupak (mud). Susunan ini wajib diikut (tertib).',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'فَمَنْ كَانَ مِنْكُمْ مَرِيضًا أَوْ بِهِ أَذًى مِنْ رَأْسِهِ '
                  'فَفِدْيَةٌ مِنْ صِيَامٍ أَوْ صَدَقَةٍ أَوْ نُسُكٍ',
              terjemahan:
                  '...sesiapa antara kamu yang sakit atau ada gangguan di '
                  'kepalanya (lalu bercukur), maka wajiblah fidyah, iaitu '
                  'berpuasa, bersedekah atau menyembelih. Nota kaki '
                  'al-Ifsah menjadikan ayat ini dalil takhyir, lalu '
                  'mengqiyaskan larangan bersifat tarafuh yang lain kepada '
                  'bercukur.',
              sumber: 'Al-Baqarah (2):196',
            ),
          ],
          teksKitab:
              'Al-Idah, Fasal "Wa amma irtikab al-mahzur", hlm. 473–474 '
              '[476–477]: an-Nawawi menghimpunkan tujuh perbuatan yang '
              'dikenakan fidyah takhyir, kemudian menjelaskan susunan '
              'tertib bagi kaffarah jimak. Nota kaki al-Ifsah menamakan '
              'kedua-duanya mengikut kaedah hasyiah Ibn Hajar: yang '
              'pertama "takhyir-taqdir", manakala jimak dan ihsar ialah '
              '"tertib-ta’dil".',
          teksKitabArabic:
              'فَمَنْ حَلَقَ الشَّعْرَ أَوْ قَلَّمَ الْأَظْفَارَ أَوْ لَبِسَ '
              'أَوْ تَطَيَّبَ أَوْ دَهَنَ الرَّأْسَ أَوِ اللِّحْيَةَ أَوْ بَاشَرَ '
              'فِيمَا دُونَ الْفَرْجِ بِشَهْوَةٍ لَزِمَهُ أَنْ يَذْبَحَ شَاةً '
              'أَوْ يُطْعِمَ سِتَّةَ مَسَاكِينَ كُلَّ مِسْكِينٍ نِصْفَ صَاعٍ '
              'أَوْ يَصُومَ ثَلَاثَةَ أَيَّامٍ',
          permasalahan: <String>[
            'Menurut nota kaki al-Ifsah, fidyah penuh dikenakan kerana '
                'menghilangkan tiga helai rambut atau tiga kuku atau lebih '
                'pada satu masa dan tempat. Bagi sehelai rambut atau satu '
                'kuku, kadarnya secupak (mud) makanan; bagi dua, dua cupak. '
                'Sebahagian ulama Syafi’i memperincikannya mengikut '
                'pilihan jemaah: puasa sehari, atau satu sa’ makanan.',
            'Nota kaki al-Ifsah juga menukil: jimak antara dua tahallul, '
                'atau jimak kali kedua selepas jimak yang merosakkan, tidak '
                'dikenakan unta. Ia dikenakan fidyah takhyir, iaitu seekor '
                'kambing (atau 1/7 unta atau lembu), atau 3 sa’ makanan '
                'kepada 6 orang miskin, atau puasa 3 hari.',
            'Kadar bercukur dalam mazhab lain berbeza, menurut nukilan '
                'nota kaki al-Ifsah. Abu Hanifah mensyaratkan suku kepala '
                'untuk dam, Malik mengambil kira kadar yang menghilangkan '
                'gangguan, dan Ahmad mempunyai dua riwayat (tiga atau empat '
                'helai). Pegangan al-Idah ialah tiga helai.',
          ],
        ),
      ),
      LearningSection(
        title: 'Jaza’ memburu binatang buruan',
        points: <String>[
          'Membunuh binatang buruan darat ketika berihram, atau di Tanah Haram walaupun tidak berihram, wajib dibayar ganti (jaza’).',
          'Binatang yang ada bandingannya (mithl) diganti dengan binatang ternak yang hampir sama rupanya, contohnya burung unta dengan unta dan keldai liar atau lembu liar dengan lembu.',
          'Binatang yang tiada bandingannya, burung yang lebih kecil daripada merpati, belalang dan telur binatang buruan diganti dengan nilainya.',
          'Jemaah boleh memilih untuk menyembelih binatang bandingan, membeli makanan senilai bandingan itu untuk disedekahkan, atau berpuasa sehari bagi setiap cupak makanan (takhyir-ta’dil).',
          'Kadarnya ditetapkan oleh dua orang yang adil dan arif. Jika para sahabat sudah menetapkan bandingannya, ketetapan itu diikut.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'وَمَنْ قَتَلَهُ مِنْكُمْ مُتَعَمِّدًا فَجَزَاءٌ مِثْلُ مَا '
                  'قَتَلَ مِنَ النَّعَمِ يَحْكُمُ بِهِ ذَوَا عَدْلٍ مِنْكُمْ '
                  'هَدْيًا بَالِغَ الْكَعْبَةِ أَوْ كَفَّارَةٌ طَعَامُ مَسَاكِينَ '
                  'أَوْ عَدْلُ ذَلِكَ صِيَامًا',
              terjemahan:
                  '...sesiapa antara kamu yang membunuhnya dengan sengaja, '
                  'maka balasannya ialah binatang ternak yang sebanding '
                  'dengan yang dibunuhnya, ditetapkan oleh dua orang yang '
                  'adil antara kamu, sebagai hadyu yang sampai ke Kaabah; '
                  'atau kaffarah memberi makan orang miskin; atau puasa yang '
                  'senilai dengannya.',
              sumber: 'Al-Ma’idah (5):95',
            ),
          ],
          teksKitab:
              'Al-Idah, Fasal "Wa amma irtikab al-mahzur", hlm. 475–478 '
              '[478–481]: an-Nawawi menyenaraikan bandingan yang telah '
              'ditetapkan dan kaedah takhyir. Bandingan bagi binatang '
              'ternak dinilai pada harga di Makkah pada hari ganti itu '
              'dikeluarkan. Binatang yang tiada bandingan pula dinilai di '
              'tempat ia dibunuh.',
          teksKitabArabic:
              'فَيَجِبُ فِي النَّعَامَةِ بَدَنَةٌ، وَفِي حِمَارِ الْوَحْشِ '
              'وَبَقَرِهِ بَقَرَةٌ، وَفِي الضَّبُعِ كَبْشٌ، وَفِي الْغَزَالِ '
              'عَنْزٌ، وَفِي الْأَرْنَبِ عَنَاقٌ، وَفِي الضَّبِّ جَدْيٌ، وَفِي '
              'الْيَرْبُوعِ جَفْرَةٌ',
          permasalahan: <String>[
            'Binatang kecil diganti dengan yang kecil dan yang besar dengan '
                'yang besar. Begitu juga yang sakit dengan yang sakit dan '
                'yang cacat dengan cacat yang sama jenis. Menebus dengan '
                'binatang yang lebih baik adalah afdal, dan menurut '
                'pendapat asah, menebus jantan dengan betina juga sah '
                '(hlm. 477 [480]).',
            'Pembunuh binatang itu boleh menjadi salah seorang daripada '
                'dua hakim jika dia membunuhnya kerana tersilap atau '
                'terdesak (asah). Jika dia membunuhnya dengan sengaja tanpa '
                'hak, dia tidak boleh menjadi hakim kerana dia telah fasiq '
                '(hlm. 476 [479]).',
            'Merpati dan setiap burung yang minum dengan menghirup '
                '(’abba) diganti dengan seekor kambing berdasarkan ketetapan '
                'sahabat. Bagi burung yang sebesar atau lebih besar daripada '
                'merpati, an-Nawawi mensahihkan dalam al-Idah bahawa '
                'hukumnya sama dengan merpati. Namun nota kaki al-Ifsah '
                'mencatat bahawa dalam al-Majmu’ beliau, seperti ar-Rafi’i, '
                'mentarjihkan ganti dengan nilai, dan menurut hasyiah '
                'itulah pendapat yang mu’tamad (hlm. 476–477 [479–480]).',
            'Menurut khilaf yang dinukil nota kaki al-Ifsah daripada '
                'al-Majmu’, apabila beberapa orang berihram bersama-sama '
                'membunuh seekor binatang buruan, mereka dikenakan satu '
                'jaza’ sahaja di sisi Syafi’i dan Ahmad. Malik dan Abu '
                'Hanifah pula mewajibkan satu jaza’ penuh ke atas setiap '
                'seorang.',
          ],
        ),
      ),
      LearningSection(
        title: 'Pokok Tanah Haram, Madinah, Wajj & Naqi’',
        points: <String>[
          'Memburu dan menebang pokok di Tanah Haram Makkah diharamkan ke atas semua orang, sama ada sedang berihram atau tidak.',
          'Pokok besar yang dicabut diganti dengan seekor lembu, dan pokok kecil dengan seekor kambing. Pokok yang terlalu kecil diganti dengan nilainya.',
          'Daun boleh diambil tetapi pokok tidak boleh dipukul untuk menggugurkan daunnya. Rumput basah haram dipotong, kecuali untuk makanan ternakan, ubat dan pokok izkhir.',
          'Haram juga memburu dan menebang pokok di Tanah Haram Madinah. Menurut qaul jadid, perbuatan itu tidak dikenakan dam.',
          'Memburu di Wajj (sebuah lembah di Taif) juga haram tetapi tiada ganti. Naqi’ pula bukan Tanah Haram, tetapi pokok dan rumputnya tidak boleh dimusnahkan.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'إِنَّ اللَّهَ تَعَالَى حَرَّمَ مَكَّةَ، لَا يُخْتَلَى '
                  'خَلَاهَا، وَلَا يُعْضَدُ شَجَرُهَا، وَلَا يُنَفَّرُ '
                  'صَيْدُهَا',
              terjemahan:
                  'Sesungguhnya Allah Taala telah mengharamkan Makkah: '
                  'rumputnya tidak boleh dicabut, pokoknya tidak boleh '
                  'ditebang dan binatang buruannya tidak boleh dihalau. '
                  '(Dalam riwayat yang sama, al-Abbas r.a. memohon '
                  'pengecualian bagi izkhir, lalu Baginda bersabda: "Kecuali '
                  'izkhir.")',
              sumber:
                  'Riwayat al-Bukhari (1349) dan Muslim (1353) daripada '
                  'Ibnu Abbas r.a.; lafaz di sini mengikut nukilan nota kaki '
                  'al-Ifsah (hlm. 480 [483])',
            ),
          ],
          teksKitab:
              'Al-Idah, hlm. 480–485 [483–488] dan Fasal Haram Madinah '
              'serta Wajj, hlm. 490–492 [493–495]. Bagi Haram Madinah, '
              'an-Nawawi menyebut dua qaul asy-Syafi’i. Qaul jadid '
              'menyatakan tiada dam, dan pendapat ini asah di sisi ashab. '
              'Qaul qadim mewajibkan dam, dan an-Nawawi menyatakan qaul '
              'qadim ini sebagai pendapat yang mukhtar (pilihan). '
              'Berdasarkan qaul qadim, bentuk dendanya menurut pendapat '
              'asah ialah merampas salab (pakaian dan barang) pemburu atau '
              'penebang pokok itu.',
          teksKitabArabic:
              'فَمَنْ قَلَعَ شَجَرَةً كَبِيرَةً ضَمِنَهَا بِبَقَرَةٍ، وَإِنْ '
              'كَانَتْ صَغِيرَةً ضَمِنَهَا بِشَاةٍ',
          permasalahan: <String>[
            'Rumput yang dicabut wajib diganti dengan nilainya, tetapi '
                'ganti itu gugur jika rumput itu tumbuh semula. Rumput '
                'kering boleh dipotong, tetapi jika dicabut hingga ke '
                'akarnya, ia tetap perlu diganti kerana rumput itu akan '
                'tumbuh semula jika tidak dicabut (hlm. 484 [487]).',
            'Membiarkan ternakan meragut rumput Tanah Haram dibenarkan. '
                'Mengambil rumput untuk makanan ternakan juga dibenarkan '
                '(asah), tetapi tidak boleh untuk dijual. Izkhir boleh '
                'diambil kerana hajat berdasarkan hadis sahih, dan '
                'tumbuhan untuk ubat juga boleh dipotong (asah) (hlm. '
                '484–485 [487–488]).',
            'Menurut nota kaki al-Ifsah, salab pemburu di Madinah '
                'menjadi milik orang yang merampasnya (asah), dan pakaian '
                'yang menutup aurat ditinggalkan untuknya seperti yang '
                'disahihkan dalam al-Majmu’. Dalilnya ialah perbuatan Sa’d '
                'bin Abi Waqqas r.a. yang diriwayatkan oleh Muslim, '
                'menurut nukilan tersebut.',
            'Nota kaki al-Ifsah menyatakan hadis pengharaman Wajj '
                'diriwayatkan oleh al-Baihaqi dan dinilai daif oleh Ahmad. '
                'Kerana itu al-’Abdari menukil bahawa jumhur ulama tidak '
                'mengharamkannya. Pengharaman Wajj tanpa ganti adalah '
                'pandangan khusus mazhab Syafi’i (hlm. 491 [494]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Masa, tempat & penerima dam',
        points: <String>[
          'Apabila disebut "dam" tanpa perincian, maksudnya seekor kambing yang cukup syarat korban. Lembu atau unta boleh menggantikannya, kecuali bagi jaza’ binatang buruan.',
          'Dam boleh disembelih bila-bila masa, bukan hanya pada Hari Nahar, kecuali dam fawat yang ditangguhkan ke tahun qada.',
          'Dam wajib disembelih di Tanah Haram dan dagingnya diagihkan kepada fakir miskin yang berada di Tanah Haram. Mina afdal bagi jemaah Haji dan Marwah bagi jemaah Umrah.',
          'Makanan gantian dam juga wajib diagihkan di Tanah Haram, tetapi puasa boleh dibuat di mana-mana sahaja, termasuk di kampung sendiri.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Al-Idah, fara’ masa dan tempat dam, hlm. 485–490 '
              '[488–493]: an-Nawawi menegaskan bahawa syarat Tanah Haram '
              'terpakai kepada dam Tamattu’, dam Qiran dan semua dam lain, '
              'sama ada sebabnya berlaku di dalam atau di luar Tanah Haram, '
              'dan sama ada sebabnya dibenarkan (seperti bercukur kerana '
              'gangguan) atau diharamkan. Pengecualiannya ialah jemaah yang '
              'terhalang (muhsar), yang menyembelih di tempat dia '
              'terhalang.',
          teksKitabArabic:
              'وَأَمَّا مَكَانُهُ فَيَخْتَصُّ بِالْحَرَمِ، فَيَجِبُ ذَبْحُهُ '
              'بِالْحَرَمِ وَتَفْرِقَةُ لَحْمِهِ عَلَى الْمَسَاكِينِ '
              'الْمَوْجُودِينَ فِي الْحَرَمِ',
          permasalahan: <String>[
            'Jika disembelih di pinggir Tanah Halal kemudian dagingnya '
                'dibawa masuk ke Tanah Haram sebelum berubah, ia tidak sah '
                'menurut pendapat asah (hlm. 488 [491]).',
            'Penduduk tetap Tanah Haram lebih afdal diberi daripada orang '
                'luar yang datang, tetapi menurut nota kaki al-Ifsah, jika '
                'orang luar lebih memerlukan, merekalah yang lebih utama '
                '(hlm. 488 [491]).',
            'Menurut nota kaki al-Ifsah, niat wajib ketika menyembelih '
                'atau ketika menyerahkannya kepada wakil. Binatang hidup '
                'tidak boleh diserahkan begitu sahaja kepada fakir. Jika '
                'dam itu berpunca daripada maksiat yang disengajakan '
                '(contohnya sengaja melepasi miqat tanpa ihram), ia wajib '
                'ditunaikan segera.',
            'Seekor unta boleh disembelih dengan niat 1/7 daripadanya '
                'untuk seekor kambing yang wajib, dan bakinya boleh dimakan. '
                'Seekor unta atau lembu juga sah bagi tujuh ekor kambing '
                'yang wajib (hlm. 486–487 [489–490]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Beberapa kesalahan: bergabung atau berganda?',
        points: <String>[
          'Larangan ihram terbahagi dua: istihlak (memusnahkan, seperti bercukur) dan istimta’ (bersenang-senang, seperti wangian dan pakaian).',
          'Jika jenisnya berbeza, contohnya bercukur dan memakai pakaian, fidyahnya berganda. Membunuh beberapa ekor binatang buruan juga berganda mengikut bilangannya.',
          'Memakai pakaian yang sudah berwangian hanya dikenakan satu fidyah (asah) kerana ia satu perbuatan.',
          'Jika jenisnya sama dan dilakukan berturut-turut di tempat yang sama, hanya satu fidyah. Jika berlainan tempat atau ada jarak masa, fidyahnya berganda.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Al-Idah, Fasal "Fima idza fa’ala al-muhrim mahzurain aw '
              'aktsar hal yatadakhal?", hlm. 492–493 [495–496]: '
              'an-Nawawi mengakui bahawa bab ini luas, lalu meringkaskannya '
              'berdasarkan dua faktor, iaitu jenis larangan dan kesatuan '
              'masa serta tempat.',
          teksKitabArabic:
              'الْمَحْظُورُ قِسْمَانِ: اسْتِهْلَاكٌ كَالْحَلْقِ، وَاسْتِمْتَاعٌ '
              'كَالطِّيبِ، فَإِنِ اخْتَلَفَ النَّوْعُ كَالْحَلْقِ وَاللُّبْسِ '
              'تَعَدَّدَتِ الْفِدْيَةُ',
          permasalahan: <String>[
            'Mencukur rambut kepala dan rambut badan secara berterusan '
                'hanya dikenakan satu fidyah menurut pendapat sahih '
                '(pendapat lain: dua). Jika kepala dicukur di dua tempat, '
                'atau di satu tempat tetapi pada dua masa yang berasingan, '
                'fidyahnya dua (hlm. 493 [496]).',
            'Menurut pendapat asah, fidyah tetap berganda jika ada '
                'jarak tempat atau masa, sama ada kaffarah bagi kesalahan '
                'pertama sudah dibayar atau belum. Ada satu qaul bahawa '
                'satu fidyah memadai jika belum ada kaffarah di antara '
                'kedua-dua kesalahan itu (hlm. 493 [496]).',
            'Nota kaki al-Ifsah mengecualikan beberapa kes. Pakaian kedua '
                'yang tidak menambah apa-apa (seperti baju di atas baju) '
                'tidak berganda. Sebaliknya, jimak yang diulang tetap '
                'berganda.',
            'Mazhab lain berbeza menurut nukilan al-Ifsah. Abu Hanifah '
                'mengambil kira kesatuan majlis. Malik pula menggabungkan '
                'fidyah jika perbuatan dilakukan serentak, diniatkan '
                'sekaligus, atau dilakukan kerana menyangka ia harus '
                '(hlm. 494–495 [497–498]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Ihsar: terhalang daripada menyempurnakan ibadah',
        points: <String>[
          'Jika musuh menyekat semua jalan, jemaah yang berihram Haji atau Umrah boleh bertahallul, sama ada waktunya masih panjang atau sudah suntuk.',
          'Jika waktu masih panjang, lebih baik bersabar kerana sekatan itu mungkin terangkat. Jika waktu sudah suntuk, lebih baik segera bertahallul.',
          'Cara tahallul ihsar: sembelih seekor kambing di tempat terhalang, berniat tahallul ketika menyembelih, kemudian bercukur.',
          'Sakit tidak mengharuskan tahallul kecuali jika jemaah telah mensyaratkannya ketika berniat ihram (isytirat).',
          'Jika ada jalan lain yang mampu dilalui, jemaah wajib mengikutinya dan tidak boleh bertahallul.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'وَأَتِمُّوا الْحَجَّ وَالْعُمْرَةَ لِلَّهِ فَإِنْ أُحْصِرْتُمْ '
                  'فَمَا اسْتَيْسَرَ مِنَ الْهَدْيِ',
              terjemahan:
                  'Dan sempurnakanlah Haji dan Umrah kerana Allah. Jika kamu '
                  'terhalang, maka (sembelihlah) hadyu yang mudah didapati.',
              sumber: 'Al-Baqarah (2):196',
            ),
            DalilItem(
              arabic:
                  'حُجِّي وَاشْتَرِطِي، وَقُولِي: اللَّهُمَّ مَحِلِّي حَيْثُ '
                  'حَبَسْتَنِي',
              terjemahan:
                  'Tunaikanlah Haji dan buatlah syarat, dan katakanlah: '
                  '"Ya Allah, tempat tahallulku ialah di mana Engkau '
                  'menahanku." (Sabda Nabi SAW kepada Duba’ah binti '
                  'az-Zubair r.a. yang sedang sakit.)',
              sumber:
                  'Riwayat al-Bukhari (5089) dan Muslim (1207) daripada '
                  'Aisyah r.a.; dinukil nota kaki al-Ifsah (hlm. 500 [503])',
            ),
          ],
          teksKitab:
              'Al-Idah, Fasal fi al-Ihsar, hlm. 495–501 [498–504]: '
              'an-Nawawi menegaskan bahawa tahallul ihsar hanya berlaku '
              'apabila tiga perkara berhimpun, iaitu sembelihan, niat dan '
              'bercukur. Jika kambing tidak didapati, gantinya ialah makanan '
              'senilai kambing itu; jika tidak mampu, puasa sehari bagi '
              'setiap cupak.',
          teksKitabArabic:
              'وَاعْلَمْ أَنَّ التَّحَلُّلَ يَحْصُلُ بِثَلَاثَةِ أَشْيَاءَ: '
              'ذَبْحٍ وَنِيَّةِ التَّحَلُّلِ بِذَبْحِهَا وَالْحَلْقِ',
          permasalahan: <String>[
            'Jika penyekat meminta wang, jemaah tidak wajib membayarnya '
                'dan boleh bertahallul. Membayar kepada penyekat kafir '
                'dimakruhkan kerana mengandungi kehinaan bagi Islam; '
                'menurut nota kaki al-Ifsah, tidak makruh jika penyekat itu '
                'Muslim. Berperang juga tidak wajib, dan jika berperang '
                'dengan memakai baju besi, fidyah dikenakan (hlm. 496–497 '
                '[499–500]).',
            'Menurut matan, bagi jemaah yang memilih gantian makanan, '
                'tahallul bergantung pada makanan itu, dan bagi yang '
                'berpuasa, tahallul juga bergantung pada puasa itu (asah). '
                'Hasyiah Ibn Hajar yang dinukil al-Ifsah pula menyatakan '
                'pendapat yang mu’tamad, mengikut al-Majmu’, bahawa '
                'tahallul tidak perlu menunggu puasa selesai. Jemaah boleh '
                'terus bertahallul dengan niat dan bercukur (hlm. 497 '
                '[500]).',
            'Jika ihsar itu khusus kepada seseorang, hukumnya bergantung '
                'pada uzurnya. Orang yang ditahan kerana hutang yang mampu '
                'dibayarnya tidak boleh bertahallul. Orang yang dipenjara '
                'secara zalim boleh bertahallul (hlm. 498–499 [501–502]).',
            'Qada selepas ihsar: Haji sunat tidak perlu diqada. Haji '
                'fardu yang belum tetap (tahun pertama berkemampuan) tidak '
                'wajib lagi melainkan jika kemampuan wujud semula. Haji '
                'yang sudah tetap, qada dan nazar kekal sebagai tanggungan. '
                'Tidak ada beza sama ada ihsar berlaku sebelum atau selepas '
                'Wukuf (hlm. 500–501 [503–504]).',
            'Isytirat sah untuk sakit, sesat jalan, kehilangan belanja '
                'atau tersilap kiraan. Menurut hasyiah Ibn Hajar yang '
                'dinukil al-Ifsah, haid termasuk dalam uzur ini. Jika '
                'disyaratkan "apabila aku sakit, aku menjadi halal", jemaah '
                'itu menjadi halal dengan sendirinya sebaik sakit (asah, '
                'nas asy-Syafi’i) (hlm. 498 [501]).',
          ],
        ),
      ),
    ],
    duas: <ModuleDua>[
      ModuleDua(
        title: 'Lafaz Syarat Ihram (Isytirat)',
        arabic: 'اللَّهُمَّ مَحِلِّي حَيْثُ حَبَسْتَنِي',
        translation:
            'Ya Allah, tempat tahallulku ialah di mana Engkau menahanku.',
        source:
            'Riwayat al-Bukhari (5089) dan Muslim (1207) daripada Aisyah '
            'r.a. dalam kisah Duba’ah binti az-Zubair; dinukil nota kaki '
            'al-Ifsah. Disebut ketika berniat ihram oleh jemaah yang bimbang '
            'sakit atau terhalang (al-Idah, Fasal al-Ihsar)',
      ),
      ModuleDua(
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
      ),
      ModuleDua(
        title: 'Doa Taubat dan Istighfar',
        arabic:
            'اللَّهُمَّ إِنِّي ظَلَمْتُ نَفْسِي ظُلْمًا كَثِيرًا، وَإِنَّهُ لَا '
            'يَغْفِرُ الذُّنُوبَ إِلَّا أَنْتَ، فَاغْفِرْ لِي مَغْفِرَةً مِنْ '
            'عِنْدِكَ، وَارْحَمْنِي، إِنَّكَ أَنْتَ الْغَفُورُ الرَّحِيمُ',
        translation:
            'Ya Allah, sesungguhnya aku telah banyak menzalimi diriku, dan tiada '
            'yang mengampunkan dosa melainkan Engkau; maka ampunilah aku dengan '
            'keampunan daripada sisi-Mu dan rahmatilah aku, sesungguhnya '
            'Engkaulah Yang Maha Pengampun lagi Maha Penyayang.',
        source:
            'Al-Idah (Fasal Wukuf) — antara doa pilihan an-Nawawi; asalnya hadis '
            'Abu Bakar r.a. riwayat al-Bukhari dan Muslim. Sesuai dibaca segera '
            'apabila tersilap melanggar larangan ihram',
      ),
    ],
    academicInsight:
        'Bab Ketujuh al-Idah memperlihatkan disiplin fiqh yang tersusun: '
        'setiap kecuaian dalam ibadah dikelaskan menurut sebabnya, iaitu '
        'meninggalkan perkara yang diperintah atau melakukan perkara yang '
        'dilarang. Kaffarahnya pula mengikut empat corak yang dirumuskan '
        'hasyiah Ibn Hajar, iaitu tertib atau takhyir, digabungkan dengan '
        'taqdir atau ta’dil. Di sebalik perincian teknikal ini terdapat '
        'dua prinsip besar. Pertama, rukun tidak boleh dibeli dengan dam. '
        'Tawaf Ifadah, Sa’i dan bercukur mesti ditunaikan sendiri, '
        'manakala terlepas Wukuf membatalkan Haji tahun itu. Kedua, syarak '
        'meraikan kesusahan manusia. Jemaah yang terhalang diberi jalan '
        'keluar melalui tahallul ihsar, orang miskin diberi gantian puasa, '
        'dan isytirat dibenarkan bagi orang yang bimbang sakit. Kesedaran '
        'bahawa an-Nawawi sendiri kadangkala berbeza tarjih antara al-Idah '
        'dan al-Majmu’, seperti dalam isu burung yang lebih besar daripada '
        'merpati, mengajar penuntut untuk merujuk pendapat mu’tamad '
        'mazhab, bukan sekadar satu teks.',
    reflectionQuestions: <String>[
      'Mengapakah rukun seperti Tawaf Ifadah dan Sa’i tidak boleh '
          'digantikan dengan dam, sedangkan wajib Haji boleh?',
      'Dalam konteks moden, apakah bentuk "ihsar" yang mungkin dihadapi '
          'jemaah (contohnya sekatan perjalanan atau masalah permit), dan '
          'bagaimanakah isytirat ketika berniat ihram boleh membantu?',
      'Apakah hikmah syarak membezakan dosa antara orang yang terlepas '
          'Wukuf kerana uzur dengan orang yang cuai, sedangkan kewajipan dam '
          'dan qada tetap sama bagi kedua-duanya?',
    ],
  ),

  // =========================================================================
  // MODUL 17 — Haji Kanak-kanak, Wanita & Adab Pulang (Bab Kelapan)
  // =========================================================================
  LearningModuleData(
    number: '17',
    title: 'Haji Kanak-kanak, Wanita & Adab Pulang',
    subtitle:
        'Ihram anak melalui wali, hukum khusus wanita, adab pulang dan kepimpinan rombongan.',
    icon: HajjIconType.preparation,
    accent: Color(0xFF2F8F79),
    sections: <LearningSection>[
      LearningSection(
        title: 'Ihram kanak-kanak melalui wali',
        points: <String>[
          'Haji tidak wajib ke atas kanak-kanak, tetapi sah jika dilakukan. Ia dikira Haji sunat, dan Haji fardu masih wajib selepas baligh (lihat Modul 01).',
          'Kanak-kanak yang mumayyiz berihram sendiri dengan izin walinya. Menurut pendapat asah, ihramnya tanpa izin wali tidak sah.',
          'Bagi kanak-kanak yang belum mumayyiz, wali berniat ihram bagi pihaknya. Wali itu boleh sedang berihram atau tidak, dan boleh sudah berHaji atau belum.',
          'Wali yang dimaksudkan ialah bapa, kemudian datuk jika bapa tiada, atau wasi dan penjaga yang dilantik. Menurut pendapat asah, abang, bapa saudara dan ibu tidak boleh berihram bagi pihak kanak-kanak itu kecuali jika dilantik secara sah.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'رَفَعَتِ امْرَأَةٌ صَبِيًّا فَقَالَتْ: يَا رَسُولَ اللَّهِ، '
                  'أَلِهَذَا حَجٌّ؟ قَالَ: نَعَمْ، وَلَكِ أَجْرٌ',
              terjemahan:
                  'Seorang wanita mengangkat seorang kanak-kanak lalu '
                  'bertanya: "Wahai Rasulullah, adakah anak ini mendapat '
                  'Haji?" Baginda menjawab: "Ya, dan bagimu pahala."',
              sumber: 'Riwayat Muslim (1336) daripada Ibnu Abbas r.a.',
            ),
          ],
          teksKitab:
              'Al-Idah, Bab Kelapan "Fi hajj as-sabiy wa al-’abd wa '
              'al-mar’ah", hlm. 502–503 [505–506]: an-Nawawi menyatakan '
              'bahawa kanak-kanak yang belum mumayyiz menjadi muhrim '
              'melalui niat walinya. Menurut pendapat asah, kehadiran '
              'kanak-kanak itu di hadapan wali tidak disyaratkan.',
          teksKitabArabic:
              'فَإِنْ لَمْ يَكُنْ مُمَيِّزًا أَحْرَمَ عَنْهُ وَلِيُّهُ، '
              'سَوَاءٌ كَانَ الْوَلِيُّ حَلَالًا أَوْ مُحْرِمًا',
          permasalahan: <String>[
            'Menurut nota kaki al-Ifsah, cara wali berihram bagi pihak '
                'kanak-kanak ialah berniat menjadikan anak itu berihram, '
                'lalu anak itu menjadi muhrim dengan niat tersebut. Jika '
                'wali berniat di miqat sedangkan anak berada di negeri lain, '
                'ihram itu sah tetapi makruh kerana anak itu mungkin '
                'melanggar larangan tanpa mengetahuinya.',
            'Hadis "dan bagimu pahala" diriwayatkan tentang seorang ibu. '
                'Nota kaki al-Ifsah (daripada hasyiah) menjelaskan bahawa '
                'hadis itu tidak menyebut ibu tersebut yang berniat ihram. '
                'Mungkin juga dia seorang wasi, dan pahalanya ialah pahala '
                'membawa dan membiayai anak itu.',
            'Orang gila (majnun) sama hukumnya dengan kanak-kanak yang '
                'belum mumayyiz, iaitu walinya berniat bagi pihaknya. Orang '
                'yang pengsan (mughma ’alaih) pula tidak boleh diihramkan '
                'oleh orang lain kerana dia diharap sedar semula tidak lama '
                'lagi, sama seperti orang sakit (hlm. 503 [506]).',
            'Menurut khilaf yang dinukil nota kaki al-Ifsah daripada '
                'al-Majmu’, Abu Hanifah (dalam pendapat masyhurnya) tidak '
                'mengesahkan Haji kanak-kanak. Jumhur, iaitu Syafi’i, '
                'Maliki dan Hanbali, mengesahkannya.',
          ],
        ),
      ),
      LearningSection(
        title: 'Amalan & perbelanjaan Haji anak',
        points: <String>[
          'Kanak-kanak melakukan sendiri apa yang dia mampu, dan wali melakukan bagi pihaknya apa yang dia tidak mampu.',
          'Jika anak mampu bertawaf, ajarkan dia; jika tidak, dia didukung semasa tawaf. Sa’i juga begitu.',
          'Bagi anak yang belum mumayyiz, wali solat dua rakaat tawaf bagi pihaknya. Anak yang mumayyiz solat sendiri.',
          'Anak wajib dibawa ke Arafah. Dia juga dibawa ke Muzdalifah, ke tempat-tempat wukuf yang lain dan bermalam di Mina.',
          'Batu lontaran diberikan kepada anak untuk dilontar sendiri. Jika dia tidak mampu, orang yang sudah selesai melontar untuk dirinya sendiri melontarkan bagi pihaknya.',
          'Perbelanjaan tambahan kerana membawa anak bermusafir ditanggung daripada harta wali (asah), bukan harta anak itu.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'حَجَّ بِي أَبِي مَعَ رَسُولِ اللَّهِ وَأَنَا ابْنُ سَبْعِ '
                  'سِنِينَ',
              terjemahan:
                  'Bapaku membawaku menunaikan Haji bersama Rasulullah SAW '
                  'ketika aku berumur tujuh tahun.',
              sumber:
                  'Riwayat al-Bukhari (1858) daripada as-Sa’ib bin Yazid '
                  'r.a.',
            ),
          ],
          teksKitab:
              'Al-Idah, Fasal "Mata sara as-sabiy muhriman" dan Fasal '
              '"Az-za’id min nafaqat as-sabiy", hlm. 503–504 [506–507]: '
              'an-Nawawi menyenaraikan amalan anak satu demi satu, '
              'kemudian menetapkan bahawa kos tambahan ditanggung wali.',
          teksKitabArabic:
              'مَتَى صَارَ الصَّبِيُّ مُحْرِمًا فَعَلَ مَا قَدَرَ عَلَيْهِ '
              'بِنَفْسِهِ، وَفَعَلَ بِهِ الْوَلِيُّ مَا عَجَزَ عَنْهُ',
          permasalahan: <String>[
            'Menurut nota kaki al-Ifsah, ketika tawaf, kedua-dua orang yang '
                'mendukung dan anak yang didukung mesti suci. Jika anak '
                'yang belum mumayyiz menaiki kenderaan, wali atau wakilnya '
                'mesti memandu atau menuntun kenderaan itu sepanjang '
                'tawaf.',
            'Sunat meletakkan batu ke tangan anak dahulu, kemudian '
                'mengambilnya semula untuk dilontar bagi pihaknya (hlm. '
                '504 [507]).',
            'Ada satu pendapat bahawa anak yang mumayyiz pun disolatkan '
                'oleh walinya bagi dua rakaat tawaf, tetapi pendapat yang '
                'didahulukan ialah anak itu solat sendiri.',
            'Kos tambahan ditanggung wali kerana walilah yang membawa anak '
                'itu ke dalam perbelanjaan tersebut. Perkara ini wajar '
                'dirancang oleh ibu bapa yang membawa anak kecil ketika '
                'Umrah.',
          ],
        ),
      ),
      LearningSection(
        title: 'Larangan ihram, jimak & orang gila',
        points: <String>[
          'Kanak-kanak yang berihram mesti dihalang daripada larangan ihram.',
          'Jika dia memakai wangian atau pakaian terlarang kerana terlupa, tiada fidyah. Jika dia sengaja, fidyah wajib (asah).',
          'Bercukur, memotong kuku dan membunuh binatang buruan tetap dikenakan fidyah walaupun terlupa.',
          'Fidyah itu diambil daripada harta wali jika anak berihram dengan izinnya (asah).',
          'Orang gila sama hukumnya dengan kanak-kanak yang belum mumayyiz dalam semua perkara ini.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Al-Idah, Fasal "Yumna’ as-sabiy al-muhrim", Fasal "Idza '
              'jama’a as-sabiy" dan Fasal "Hukm al-majnun", hlm. 504–505 '
              '[507–508]: jika kanak-kanak bersetubuh dengan sengaja, '
              'Hajinya rosak (asah) dan wajib diqada (asah). Qada itu sah '
              'dilakukan semasa dia masih kanak-kanak (asah).',
          teksKitabArabic:
              'يُمْنَعُ الصَّبِيُّ الْمُحْرِمُ مِنْ مَحْظُورَاتِ الْإِحْرَامِ',
          permasalahan: <String>[
            'Nota kaki al-Ifsah menegaskan bahawa semua ini khusus bagi '
                'anak yang mumayyiz. Jika anak yang belum mumayyiz '
                'melakukan larangan, tiada fidyah ke atasnya atau ke atas '
                'walinya, kerana perbuatan sengaja hanya dikira daripada '
                'orang yang ada tamyiz.',
            'Menurut nota kaki al-Ifsah, jika wali atau orang lain yang '
                'memakaikan wangian atau pakaian kepada anak itu, fidyah '
                'menjadi tanggungan orang tersebut, walaupun dilakukan '
                'untuk keperluan anak itu.',
            'Jika anak itu memulakan Haji qada lalu baligh sebelum Wukuf, '
                'Haji itu terkira sebagai Haji Islam (fardu), dan qada masih '
                'tertanggung ke atasnya. Kaffarah jimaknya pula tertakluk '
                'kepada khilaf yang sama, sama ada daripada harta wali atau '
                'harta anak (hlm. 505 [508]).',
            'Kanak-kanak perempuan yang disetubuhi: hukumnya sama. Rosak '
                'atau tidak Hajinya bergantung pada sama ada perbuatan itu '
                'sengaja, terlupa atau dipaksa. Menurut nota kaki al-Ifsah, '
                'kaffarahnya ditanggung oleh lelaki yang menyetubuhinya.',
          ],
        ),
      ),
      LearningSection(
        title: 'Baligh di tengah Haji & hukum hamba',
        points: <String>[
          'Jika anak baligh ketika Wukuf, atau selepas Wukuf lalu kembali dan berwukuf semula dalam waktunya, Hajinya terkira sebagai Haji fardu.',
          'Jika dia baligh selepas waktu Wukuf tamat, atau setelah meninggalkan Arafah dan tidak kembali, Haji itu tidak menggantikan Haji fardu.',
          'Bagi Umrah, Tawaf menyamai Wukuf: jika baligh sebelum Tawaf (atau ketika Tawaf), Umrah itu terkira sebagai Umrah fardu.',
          'Hamba yang dimerdekakan di tengah ibadah sama hukumnya dengan anak yang baligh. Hukum hamba yang lain disebut ringkas dalam al-Idah sebagai sebahagian daripada fiqh zaman perhambaan.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Al-Idah, Fasal "Idza balagha as-sabiy fi atsna’ al-hajj" dan '
              'Fasal "Ihram al-’abd sahih", hlm. 506–508 [509–511]. '
              'Ihram hamba sah sama ada dengan izin tuannya atau tanpa izin. '
              'Jika tuannya telah mengizinkan, tuan itu tidak boleh menyuruh '
              'hamba bertahallul. Jika tidak diizinkan, tuan boleh '
              'menyuruhnya bertahallul, walaupun yang lebih utama ialah '
              'membenarkan hamba itu menyempurnakan ibadahnya. Dam hamba '
              'tidak ditanggung tuannya; kewajipan hamba ialah berpuasa.',
          teksKitabArabic:
              'وَإِنْ بَلَغَ فِي حَالِ الْوُقُوفِ أَوْ بَعْدَهُ فَعَادَ '
              'وَوَقَفَ فِي الْوَقْتِ أَجْزَأَهُ عَنْ حَجَّةِ الْإِسْلَامِ',
          permasalahan: <String>[
            'Anak yang baligh lalu Hajinya terkira sebagai Haji fardu wajib '
                'mengulang Sa’i jika dia sudah bersa’i selepas Tawaf Qudum '
                'sebelum baligh. Menurut pendapat sahih, tiada dam ke '
                'atasnya (hlm. 506 [509]).',
            'Nota kaki al-Ifsah (daripada hasyiah) menambah: jika anak itu '
                'baligh selepas kedua-dua tahallul lalu kembali ke Arafah '
                'sebelum fajar, Hajinya tetap terkira sebagai Haji fardu, '
                'tetapi dia wajib mengulang Tawaf, Sa’i, bercukur dan '
                'melontar Jamrah Aqabah.',
            'Menurut nukilan al-Ifsah daripada al-Majmu’, Abu Hanifah dan '
                'Malik tidak menganggap Haji itu terkira sebagai Haji fardu '
                'walaupun anak itu baligh sebelum Wukuf. Pendapat Syafi’i '
                'ialah terkira.',
            'Konteks: perbahasan hamba mencerminkan struktur masyarakat '
                'zaman silam. Namun prinsipnya kekal relevan, iaitu ibadah '
                'sunat tidak boleh menjejaskan hak orang lain yang wajib '
                'ditunaikan. Contohnya, hamba wanita yang bersuami '
                'memerlukan izin suami dan tuannya, dan al-Idah merujuk '
                'semula kepada hak ibu bapa, suami dan pemiutang dalam Bab '
                'Pertama (hlm. 508 [511]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Wanita: syarat musafir & pakaian ihram',
        points: <String>[
          'Haji tidak wajib ke atas wanita sehingga keselamatannya terjamin bersama suami, mahram atau sekumpulan wanita yang thiqah.',
          'Suami boleh menghalang isterinya daripada Haji sunat. Menurut pendapat azhar, suami juga boleh menghalang Haji fardu, kerana hak suami perlu ditunaikan segera sedangkan Haji boleh ditangguhkan.',
          'Wanita yang haid atau nifas tetap disunatkan mandi ihram. Semua amalan Haji sah daripadanya kecuali Tawaf dan dua rakaat Tawaf.',
          'Wanita menutup kepala dan seluruh badan dengan pakaian biasa, termasuk pakaian berjahit, seluar dan khuf, tetapi tidak boleh menutup muka atau memakai sarung tangan.',
          'Wanita tidak menguatkan suara ketika bertalbiah; cukup sekadar didengar oleh dirinya sendiri.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Hukum khusus wanita tidak dihimpunkan dalam satu bab. Nota '
              'kaki al-Ifsah pada permulaan Bab Kelapan mencatat bahawa '
              'an-Nawawi hanya menyebut keperluan izin suami di situ, '
              'manakala hukum-hukum lain telah dibahaskan lebih awal. '
              'Himpunan ini diambil daripada: Bab Pertama, hlm. 48 [51] '
              'dan 94–95 [97–98]; Fasal Adab Ihram, hlm. 122 [125] dan '
              '126 [129]; serta Fasal Muharramat al-Ihram, hlm. 141 [144] '
              'dan 148–151 [151–154].',
          teksKitabArabic:
              'وَلَهَا أَنْ تَسْدِلَ عَلَى وَجْهِهَا ثَوْبًا مُتَجَافِيًا '
              'عَنْهُ بِخَشَبَةٍ وَنَحْوِهَا',
          permasalahan: <String>[
            'Menurut an-Nawawi, wanita boleh melabuhkan kain ke muka '
                'secara terjarak (contohnya dengan bantuan kayu), sama ada '
                'kerana hajat atau tidak. Jika kain itu terkena muka tanpa '
                'sengaja lalu segera diangkat, tiada fidyah. Jika disengajakan '
                'atau dibiarkan, fidyah wajib. Dia juga menutup sedikit '
                'bahagian muka yang bersambung dengan kepala supaya kepala '
                'tertutup sempurna (hlm. 148–149 [151–152]).',
            'Nota kaki al-Ifsah menukil bahawa mazhab Hanbali '
                'membenarkan kain dilabuhkan walaupun menyentuh muka, '
                'berdasarkan hadis Aisyah r.a. (yang tidak diambil oleh '
                'asy-Syafi’i kerana sanadnya daif). Penulis al-Ifsah turut '
                'menukil saranan gurunya supaya wanita Syafi’i hari ini '
                'bertaqlid kepada pandangan itu kerana kesesakan bercampur '
                'dengan lelaki. Saranan ini datang daripada nota kaki, bukan '
                'daripada an-Nawawi.',
            'Sarung tangan haram bagi wanita (asah) dan dikenakan fidyah. '
                'Namun membalut tangan dengan kain, sama ada berinai atau '
                'tidak, tidak dikenakan fidyah menurut pendapat sahih. Jika '
                'wanita perlu menutup muka, dia dibenarkan berbuat demikian '
                'tetapi wajib membayar fidyah (hlm. 150–151 [153–154]).',
            'Sunat bagi wanita memakai inai pada kedua-dua tangan hingga '
                'pergelangan dan menyapu sedikit inai ke muka sebelum '
                'ihram, sama ada dia bersuami atau tidak, muda atau tua. '
                'Corak (naqsy) pula dimakruhkan (hlm. 126 [129]).',
            'Jika isteri berihram tanpa izin dan suami menyuruhnya '
                'bertahallul, caranya ialah isteri menyembelih seekor '
                'kambing dengan niat tahallul dan menggunting sekurang-'
                'kurangnya tiga helai rambut. Wanita dalam iddah pula tidak '
                'boleh keluar sehingga iddahnya tamat (hlm. 48 [51]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Wanita: Tawaf, Sa’i, Wukuf hingga Tawaf Wada’',
        points: <String>[
          'Wanita tidak beridtiba’ dan tidak berlari-lari anak (ramal) ketika Tawaf.',
          'Wanita sunat bertawaf di pinggir kawasan tawaf dan pada waktu malam kerana lebih terlindung. Jika kawasan tawaf lengang, dia boleh mendekati Kaabah seperti lelaki.',
          'Ketika Sa’i, wanita tidak berlari di antara lampu hijau tetapi berjalan seperti biasa (asah). Ketika Wukuf, lebih afdal dia duduk dan berada di pinggir kawasan wukuf, bukan di tempat sesak, kerana lebih terlindung.',
          'Ketika melontar, wanita tidak mengangkat tangan tinggi. Dia tidak bercukur tetapi bergunting, dan sunat kadarnya seruas jari (anmulah) daripada semua bahagian kepala.',
          'Wanita yang haid atau nifas tidak wajib Tawaf Wada’ dan tidak dikenakan dam. Jika dia suci sebelum meninggalkan bangunan Makkah, Tawaf Wada’ menjadi wajib ke atasnya.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'افْعَلِي مَا يَفْعَلُ الْحَاجُّ، غَيْرَ أَنْ لَا تَطُوفِي '
                  'بِالْبَيْتِ حَتَّى تَطْهُرِي',
              terjemahan:
                  'Lakukanlah apa yang dilakukan oleh orang yang berHaji, '
                  'kecuali jangan bertawaf di Baitullah sehingga engkau suci.',
              sumber:
                  'Riwayat al-Bukhari (294) dan Muslim (1211) daripada '
                  'Aisyah r.a.',
            ),
            DalilItem(
              arabic:
                  'أُمِرَ النَّاسُ أَنْ يَكُونَ آخِرُ عَهْدِهِمْ بِالْبَيْتِ، '
                  'إِلَّا أَنَّهُ خُفِّفَ عَنِ الْمَرْأَةِ الْحَائِضِ',
              terjemahan:
                  'Orang ramai diperintahkan supaya akhir urusan mereka '
                  'ialah di Baitullah, kecuali diberi keringanan kepada '
                  'wanita yang haid.',
              sumber:
                  'Riwayat al-Bukhari (1755) dan Muslim (1328) daripada '
                  'Ibnu Abbas r.a.',
            ),
          ],
          teksKitab:
              'Diambil daripada: Fasal Kaifiyat at-Tawaf, hlm. 230–233 '
              '[233–236]; Sa’i, hlm. 257 [260]; Wukuf, hlm. 280 [283]; '
              'Melontar, hlm. 310 [313]; Bercukur, hlm. 345 [348]; dan Bab '
              'Kelima (Tawaf Wada’), hlm. 403–404 [406–407]. Dalam setiap '
              'isu, an-Nawawi mengaitkan hukum khusus wanita dengan '
              'prinsip yang sama, iaitu lebih terlindung (astar) dan '
              'menjauhi fitnah.',
          teksKitabArabic:
              'وَأَمَّا الْمَرْأَةُ فَيُسْتَحَبُّ لَهَا أَنْ لَا تَدْنُوَ '
              'مِنْهُ، بَلْ تَكُونُ فِي حَاشِيَةِ الْمَطَافِ',
          permasalahan: <String>[
            'Wanita yang haid dan tidak wajib Tawaf Wada’ disunatkan '
                'berdiri di pintu Masjidil Haram dan berdoa. Jika dia suci '
                'selepas meninggalkan bangunan Makkah, dia tidak wajib '
                'kembali (hlm. 403–404 [406–407]).',
            'Ketika berihram, wanita haid disunatkan menunggu di miqat '
                'sehingga suci lalu mandi dan berihram jika keadaan '
                'mengizinkan, kerana itu lebih afdal (hlm. 122 [125]). Bagi '
                'jemaah zaman ini yang terikat jadual penerbangan, isu Tawaf '
                'Ifadah ketika haid perlu dirujuk kepada pembimbing kerana '
                'Tawaf itu rukun yang tidak boleh diganti dengan dam.',
            'Menurut nota kaki al-Ifsah, wanita yang bercukur tetap sah '
                'tahallulnya tetapi dikira berlaku tidak baik (musi’ah) '
                'kerana menyerupai lelaki. Al-Mawardi (seperti dinukil '
                'al-Ifsah) menyarankan supaya wanita tidak memotong jalinan '
                'rambutnya, sebaliknya mengangkat jalinan itu dan mengambil '
                'rambut di bawahnya.',
            'An-Nawawi mengecam kesesakan di Hajar Aswad sehingga lelaki '
                'berasak dengan wanita yang mukanya terdedah, dan wanita '
                'memanjat belakang lelaki. Beliau menganggap perbuatan ini '
                'kesilapan orang jahil yang tertipu antara satu sama lain '
                '(hlm. 392–393 [395–396]).',
          ],
        ),
      ),
      LearningSection(
        title: 'Adab pulang dari Haji',
        points: <String>[
          'Kebanyakan adab ketika berangkat terpakai juga ketika pulang, ditambah beberapa adab khusus.',
          'Bertakbir tiga kali di setiap tempat tinggi, kemudian membaca zikir pulang (lihat doa di bawah).',
          'Sunat menghantar orang untuk memberitahu keluarga lebih awal, dan tidak pulang mengejut pada waktu malam. Masuklah pada waktu pagi atau, jika tidak dapat, pada lewat petang.',
          'Mulakan dengan solat dua rakaat di masjid, kemudian dua rakaat di rumah, lalu berdoa dan bersyukur kepada Allah.',
          'Tanda Haji diterima ialah keadaan diri lebih baik selepas pulang, dan kebaikan itu terus bertambah.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'اللَّهُمَّ اغْفِرْ لِلْحَاجِّ وَلِمَنِ اسْتَغْفَرَ لَهُ الْحَاجُّ',
              terjemahan:
                  'Ya Allah, ampunilah orang yang menunaikan Haji dan '
                  'orang yang dimohonkan keampunan oleh orang yang '
                  'menunaikan Haji.',
              sumber:
                  'Daripada Abu Hurairah r.a.; an-Nawawi dalam al-Idah '
                  'menukil penilaian al-Hakim bahawa ia sahih atas syarat '
                  'Muslim. Takhrijnya tidak disemak secara bebas di sini',
            ),
          ],
          teksKitab:
              'Al-Idah, Fasal fi Adab Ruju’ihi min Safar Hajjihi, hlm. '
              '510–513 [513–516]: an-Nawawi menyenaraikan lapan adab, '
              'dan menutupnya dengan adab kelapan iaitu perubahan diri '
              'selepas pulang sebagai tanda Haji diterima.',
          teksKitabArabic:
              'يَنْبَغِي أَنْ يَكُونَ بَعْدَ رُجُوعِهِ خَيْرًا مِمَّا كَانَ، '
              'فَهَذَا مِنْ عَلَامَاتِ قَبُولِ الْحَجِّ',
          permasalahan: <String>[
            'Nota kaki al-Ifsah menjelaskan bahawa sunat menghantar berita '
                'awal ini nampaknya khusus bagi orang yang mempunyai isteri. '
                'Datang pada siang hari pula sunat bagi semua, kecuali jika '
                'menangguhkan ketibaan itu menyusahkan.',
            'Solat dua rakaat di masjid ketika tiba berdasarkan hadis '
                'muttafaq ’alaih bahawa Nabi SAW, apabila pulang dari '
                'musafir, memulakan dengan masjid lalu solat dua rakaat '
                'padanya. Hadis ini dinukil nota kaki al-Ifsah tanpa '
                'menyebut perawinya, dan takhrijnya tidak disemak di sini.',
            'Orang yang menyambut jemaah sunat mengucapkan "Semoga Allah '
                'menerima Hajimu, mengampunkan dosamu dan menggantikan '
                'perbelanjaanmu" (lihat doa di bawah). Ucapan ini '
                'menjadikan sambutan kepulangan Haji suatu ibadah, bukan '
                'sekadar adat kenduri.',
          ],
        ),
      ),
      LearningSection(
        title: 'Kepimpinan rombongan Haji (wilayah ’ala al-hujjaj)',
        points: <String>[
          'An-Nawawi meringkaskan bab al-Mawardi dalam al-Ahkam as-Sultaniyyah tentang dua jenis kepimpinan: memimpin perjalanan, dan memimpin pelaksanaan manasik.',
          'Pemimpin perjalanan mestilah dipatuhi, berpandangan baik dan berani. Antara tugasnya ialah menghimpun dan menyusun jemaah, bergerak mengikut kadar jemaah yang paling lemah, memilih jalan yang paling jelas, menjaga keselamatan dan mendamaikan pertikaian.',
          'Dia mesti memastikan masa mencukupi supaya Haji tidak terlepas. Selepas Haji, dia memberi tempoh untuk urusan jemaah dan membawa mereka menziarahi Madinah, suatu amalan sunat dan bukan rukun Haji.',
          'Pemimpin manasik seumpama imam solat. Dia mesti mengetahui manasik, dan tempoh kepimpinannya ialah dari Zuhur 7 Zulhijjah hingga hari ketiga Tasyriq.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Al-Idah, fasal ringkasan bab al-Wilayah ’ala al-Hujjaj '
              'daripada al-Mawardi, hlm. 513–517 [516–520]. Kandungan fasal '
              'ini adalah nukilan an-Nawawi daripada al-Mawardi, bukan '
              'ijtihad asal an-Nawawi. Antara tugas pemimpin manasik ialah '
              'memaklumkan waktu ihram dan pergerakan ke masya’ir, menyusun '
              'manasik mengikut tertib syarak, dan mengimami solat yang '
              'disertai empat khutbah Haji.',
          teksKitabArabic:
              'وَلَيْسَ لَهُ أَنْ يَحْمِلَ النَّاسَ عَلَى مَذْهَبِهِ',
          permasalahan: <String>[
            'Pemimpin Haji tidak boleh mengingkari amalan jemaah yang harus '
                'dilakukan (seperti khilaf mazhab), kecuali jika dibimbangi '
                'orang ramai akan mengikutinya. Dia juga tidak boleh '
                'memaksa jemaah mengikut mazhabnya (hlm. 517 [520]).',
            'Pemimpin tidak boleh memaksa sesiapa membayar wang '
                'perlindungan (khifarah) kerana bayaran itu tidak wajib. '
                'Pemimpin pula tidak boleh melakukan nafar awal kerana dia '
                'diikuti; dia hanya bertolak pada nafar thani setelah semua '
                'manasik selesai.',
            'Jika manasik dipimpin oleh orang yang tidak berihram, '
                'hukumnya makruh tetapi Haji tetap sah. Mendahului atau '
                'terkebelakang daripada amir juga makruh tetapi tidak '
                'haram (hlm. 517 [520]).',
            'Nota kaki al-Ifsah menegaskan bahawa ketaatan kepada '
                'pemimpin rombongan hanyalah dalam perkara yang bukan '
                'maksiat. Dalam konteks hari ini, prinsip ini terpakai '
                'kepada ketua rombongan dan petugas Haji: patuh demi '
                'keselamatan dan kelancaran ibadah, tetapi bukan dalam '
                'perkara yang menyalahi syarak.',
          ],
        ),
      ),
    ],
    duas: <ModuleDua>[
      ModuleDua(
        title: 'Zikir Ketika Pulang dari Haji atau Umrah',
        arabic:
            'لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ '
            'وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ، آئِبُونَ '
            'تَائِبُونَ عَابِدُونَ سَاجِدُونَ، لِرَبِّنَا حَامِدُونَ، صَدَقَ اللَّهُ '
            'وَعْدَهُ، وَنَصَرَ عَبْدَهُ، وَهَزَمَ الْأَحْزَابَ وَحْدَهُ',
        translation:
            'Tiada Tuhan melainkan Allah Yang Esa, tiada sekutu bagi-Nya; '
            'bagi-Nya kerajaan dan segala puji, dan Dia Maha Berkuasa atas '
            'segala sesuatu. Kami kembali, bertaubat, beribadah, sujud dan memuji '
            'Tuhan kami. Allah telah menepati janji-Nya, menolong hamba-Nya dan '
            'mengalahkan golongan al-Ahzab dengan sendiri-Nya.',
        source:
            'Riwayat al-Bukhari dan Muslim daripada Ibnu Umar r.a.; al-Idah '
            '(Fasal Adab Pulang) — dibaca selepas tiga kali takbir di setiap '
            'tempat tinggi',
      ),
      ModuleDua(
        title: 'Doa Ketika Melihat Kampung Halaman',
        arabic:
            'اللَّهُمَّ إِنِّي أَسْأَلُكَ خَيْرَهَا وَخَيْرَ أَهْلِهَا وَخَيْرَ '
            'مَا فِيهَا، اللَّهُمَّ اجْعَلْ لَنَا بِهَا قَرَارًا وَرِزْقًا '
            'حَسَنًا، اللَّهُمَّ ارْزُقْنَا جَنَاهَا، وَأَعِذْنَا مِنْ '
            'وَبَالِهَا، وَحَبِّبْنَا إِلَى أَهْلِهَا، وَحَبِّبْ صَالِحِي '
            'أَهْلِهَا إِلَيْنَا',
        translation:
            'Ya Allah, aku memohon kepada-Mu kebaikan negeri ini, kebaikan '
            'penduduknya dan kebaikan apa yang ada di dalamnya. Ya Allah, '
            'jadikanlah bagi kami ketenangan dan rezeki yang baik di sini. Ya '
            'Allah, kurniakanlah kami hasilnya, lindungilah kami daripada '
            'keburukannya, jadikanlah kami disayangi penduduknya, dan '
            'jadikanlah penduduknya yang soleh disayangi oleh kami.',
        source:
            'Al-Idah (Fasal Adab Pulang), hlm. 511 [514] — dibaca apabila '
            'kampung halaman kelihatan; an-Nawawi menyatakan ia diriwayatkan '
            'dalam hadis dan dihuraikan dalam al-Adhkar. Takhrijnya tidak '
            'disemak di sini',
      ),
      ModuleDua(
        title: 'Ucapan Menyambut Jemaah Haji',
        arabic:
            'قَبِلَ اللَّهُ حَجَّكَ، وَغَفَرَ ذَنْبَكَ، وَأَخْلَفَ نَفَقَتَكَ',
        translation:
            'Semoga Allah menerima Hajimu, mengampunkan dosamu dan '
            'menggantikan perbelanjaanmu.',
        source:
            'Al-Idah (Fasal Adab Pulang), hlm. 512 [515] — an-Nawawi '
            'menyatakan ia diriwayatkan daripada Ibnu Umar r.a. daripada '
            'Nabi SAW; takhrijnya tidak disemak di sini',
      ),
      ModuleDua(
        title: 'Doa Ketika Masuk ke Rumah Sekembali',
        arabic: 'تَوْبًا تَوْبًا، لِرَبِّنَا أَوْبًا، لَا يُغَادِرُ حَوْبًا',
        translation:
            'Kami memohon taubat yang sempurna; kepada Tuhan kami kami kembali, '
            'taubat yang tidak meninggalkan sebarang dosa.',
        source:
            'Al-Idah (Fasal Adab Pulang) — an-Nawawi menukilnya daripada '
            'al-Adhkar, daripada Ibnu Abbas r.a.; takhrijnya tidak disemak di '
            'sini',
      ),
    ],
    academicInsight:
        'Bab Kelapan al-Idah menunjukkan keluasan rahmat syariat. Ibadah '
        'Haji tidak dihadkan kepada mukallaf yang sempurna sahaja. '
        'Kanak-kanak, orang gila dan hamba diberi ruang menyertainya '
        'melalui wali atau izin, dengan perincian tentang siapa yang '
        'berniat, siapa yang menanggung kos, dan bila Haji itu terkira '
        'sebagai Haji fardu. Bagi wanita pula, hukum-hukum yang tersebar '
        'dalam al-Idah, seperti pakaian ihram, tawaf di pinggir dan '
        'keringanan Tawaf Wada’ ketika haid, bertitik tolak daripada satu '
        'prinsip, iaitu lebih terlindung dan memelihara maruah. Fasal adab '
        'pulang pula mengingatkan bahawa ukuran Haji mabrur dilihat '
        'selepas pulang, iaitu pada perubahan diri yang berterusan. Ringkasan '
        'al-Mawardi tentang kepimpinan rombongan menutup bab ini dengan '
        'dimensi institusi: ibadah kolektif memerlukan pemimpin yang '
        'berilmu dan menjaga keselamatan jemaah, tetapi tidak memaksa '
        'mazhabnya.',
    reflectionQuestions: <String>[
      'Bagaimanakah ibu bapa yang membawa anak kecil menunaikan Umrah boleh '
          'merancang niat, pengawasan larangan ihram dan kos tambahan '
          'berdasarkan panduan al-Idah?',
      'Prinsip "lebih terlindung" (astar) mendasari banyak hukum wanita '
          'dalam manasik. Bagaimanakah prinsip ini boleh diamalkan dalam '
          'suasana kesesakan Masjidil Haram hari ini?',
      'Apakah perubahan konkrit yang boleh menjadi tanda Haji mabrur '
          'selepas seseorang pulang ke kampung halaman?',
    ],
  ),
];
