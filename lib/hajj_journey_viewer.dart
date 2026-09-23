import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'app_theme.dart';
import 'shared_widgets.dart';

/// URL Manasik Explorer (projek three.js berasingan) yang dihoskan di
/// Render. Kemas kini nilai ini selepas deploy — lihat
/// HajiPintar-Manasik-Explorer/render.yaml untuk konfigurasi hosting.
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

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.black)
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
          onWebResourceError: (_) {
            setState(() {
              isLoading = false;
              hasError = true;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(kManasikExplorerUrl));
  }

  Future<void> reload() async {
    await controller.reload();
  }

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 320),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              palette.gradientStart,
              palette.gradientMiddle,
              palette.gradientEnd,
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            const IslamicPatternOverlay(),
            SafeArea(
              child: Column(
                children: <Widget>[
                  _buildHeader(context),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                      child: _buildViewer(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
      child: Row(
        children: <Widget>[
          HajjIconButton(
            tooltip: 'Kembali',
            icon: Icons.arrow_back_rounded,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  'SIMULASI HAJI 3D',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colors.onSurface,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Manasik Explorer',
                  style: TextStyle(color: palette.mutedText, fontSize: 12),
                ),
              ],
            ),
          ),
          HajjIconButton(
            tooltip: 'Muat semula',
            icon: Icons.refresh_rounded,
            onPressed: reload,
          ),
        ],
      ),
    );
  }

  Widget _buildViewer(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: palette.glassSurface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: palette.glassBorder),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: palette.shadow,
            blurRadius: 32,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(child: WebViewWidget(controller: controller)),
          if (isLoading)
            Positioned.fill(
              child: ColoredBox(
                color: colors.surface.withValues(alpha: 0.92),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircularProgressIndicator(color: palette.gold),
                      const SizedBox(height: 14),
                      Text(
                        'Memuatkan Simulasi Haji 3D…',
                        style: TextStyle(color: palette.mutedText),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (hasError && !isLoading)
            Positioned.fill(
              child: ColoredBox(
                color: colors.surface,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.wifi_off_rounded,
                          color: palette.mutedText,
                          size: 40,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Tidak dapat memuatkan Simulasi Haji 3D.\n'
                          'Sila semak sambungan internet anda dan cuba lagi.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: colors.onSurface,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        FilledButton.icon(
                          onPressed: reload,
                          icon: const Icon(Icons.refresh_rounded),
                          label: const Text('Cuba Lagi'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
