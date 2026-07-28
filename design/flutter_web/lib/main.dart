import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HajiPintar — Redesign (Flutter Web)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F1724),
        primaryColor: const Color(0xFF7C3AED),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF7C3AED),
          secondary: const Color(0xFF06B6D4),
          background: const Color(0xFF0F1724),
          surface: const Color(0xFF111827),
        ),
        textTheme: GoogleFonts.interTextTheme(
          ThemeData.dark().textTheme,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor = const Color(0xFFE6EEF8);
    final muted = const Color(0xFF9AA7B2);
    final primary = const Color(0xFF7C3AED);
    final accent = const Color(0xFF06B6D4);

    return Scaffold(
      appBar: AppBar(
        title: Text('HajiPintar', style: GoogleFonts.playfairDisplay(fontSize: 20, color: textColor)),
        actions: [
          TextButton(onPressed: () {}, child: Text('Features', style: TextStyle(color: muted))),
          TextButton(onPressed: () {}, child: Text('Tentang', style: TextStyle(color: muted))),
          const SizedBox(width: 6),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 6,
              ),
              child: const Text('Mula'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero
                  LayoutBuilder(builder: (context, constraints) {
                    final isNarrow = constraints.maxWidth < 900;
                    return Flex(
                      direction: isNarrow ? Axis.vertical : Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 24, bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Urus Haji & Umrah dengan mudah — Panduan pintar, lengkap & selamat',
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: isNarrow ? 32 : 48,
                                    color: textColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Platform yang membantu jemaah sediakan dokumen, jadual dan panduan langkah demi langkah sepanjang latihan haji.',
                                  style: TextStyle(color: muted, fontSize: 18),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: primary,
                                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        elevation: 10,
                                      ),
                                      child: const Text('Daftar Sekarang'),
                                    ),
                                    const SizedBox(width: 12),
                                    OutlinedButton(
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(color: Colors.white.withOpacity(0.06)),
                                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      ),
                                      child: const Text('Ketahui Lebih Lanjut'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Container(
                              width: 360,
                              height: 260,
                              decoration: BoxDecoration(
                                color: const Color(0xFF0F1724).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white.withOpacity(0.03)),
                                boxShadow: [
                                  BoxShadow(color: Colors.black.withOpacity(0.6), blurRadius: 24, offset: const Offset(0, 8)),
                                ],
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(Icons.flight_takeoff, size: 64, color: Colors.white70),
                                    SizedBox(height: 8),
                                    Text('Ilustrasi', style: TextStyle(color: Colors.white70)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }),

                  const SizedBox(height: 36),

                  // Features
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: List.generate(3, (i) {
                      final titles = ['Panduan Dokumen', 'Jadual & Peringatan', 'Sokongan'];
                      final subs = [
                        'Senarai semak dokumen, muat naik & peringatan.',
                        'Susunan tarikh dan pengurusan tugasan mudah.',
                        'Akses panduan & bantuan 24/7 semasa persediaan.'
                      ];

                      return SizedBox(
                        width: 360,
                        child: Card(
                          color: const Color(0xFF111827),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(titles[i], style: GoogleFonts.playfairDisplay(fontSize: 18, color: textColor)),
                                const SizedBox(height: 8),
                                Text(subs[i], style: TextStyle(color: muted)),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 48),

                  Center(
                    child: Text('© 2026 HajiPintar — Dibina dengan ♥', style: TextStyle(color: muted)),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
