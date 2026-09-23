import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'app_theme.dart';

/// Manasik Explorer (projek three.js berasingan) yang dihoskan di Render —
/// lihat HajiPintar-Manasik-Explorer/render.yaml.
const String kManasikExplorerUrl =
    'https://hajipintar-manasik-explorer.onrender.com';

class HajjJourneyViewer extends StatefulWidget {
  const HajjJourneyViewer({super.key});

  @override
  State<HajjJourneyViewer> createState() => _HajjJourneyViewerState();
}

class _HajjJourneyViewerState extends State<HajjJourneyViewer> {
  late final WebViewController controller;

  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    controller = WebViewController();

    // The web implementation is a plain iframe: JS is always on and it
    // exposes no navigation callbacks, so only loadRequest is supported.
    if (kIsWeb) {
      isLoading = false;
      controller.loadRequest(Uri.parse(kManasikExplorerUrl));
      return;
    }

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFF263D3C))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) {
            setState(() {
              isLoading = true;
              hasError = false;
            });
          },
          onPageFinished: (_) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            if (error.isForMainFrame == false) {
              return;
            }
            setState(() {
              isLoading = false;
              hasError = true;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(kManasikExplorerUrl));
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  Future<void> reload() async {
    if (kIsWeb) {
      await controller.loadRequest(Uri.parse(kManasikExplorerUrl));
      return;
    }
    await controller.reload();
  }

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;

    return Scaffold(
      backgroundColor: const Color(0xFF263D3C),
      body: Stack(
        children: <Widget>[
          Positioned.fill(child: WebViewWidget(controller: controller)),
          if (isLoading) Positioned.fill(child: _buildLoading(palette)),
          if (hasError && !isLoading)
            Positioned.fill(child: _buildError(palette)),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: _BackPill(onTap: () => Navigator.of(context).pop()),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading(HajjColors palette) {
    return ColoredBox(
      color: const Color(0xFF263D3C),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircularProgressIndicator(color: palette.gold),
            const SizedBox(height: 16),
            const Text(
              'Memuatkan Simulasi Haji 3D…',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 6),
            const Text(
              'Muatan pertama mungkin mengambil masa hingga seminit.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white38, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildError(HajjColors palette) {
    return ColoredBox(
      color: const Color(0xFF263D3C),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(Icons.wifi_off_rounded, color: Colors.white54, size: 40),
              const SizedBox(height: 12),
              const Text(
                'Tidak dapat memuatkan Simulasi Haji 3D.\n'
                'Sila semak sambungan internet anda dan cuba lagi.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, height: 1.5),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                style: FilledButton.styleFrom(backgroundColor: palette.gold),
                onPressed: reload,
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Cuba Lagi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BackPill extends StatelessWidget {
  const _BackPill({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xCC1F3332),
      shape: const StadiumBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.arrow_back_rounded, color: Colors.white, size: 16),
              SizedBox(width: 6),
              Text(
                'Kembali',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
