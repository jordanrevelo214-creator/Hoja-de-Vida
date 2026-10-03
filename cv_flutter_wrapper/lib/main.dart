import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CvWrapperApp());
}

class CvWrapperApp extends StatefulWidget {
  const CvWrapperApp({super.key});

  @override
  State<CvWrapperApp> createState() => _CvWrapperAppState();
}

class _CvWrapperAppState extends State<CvWrapperApp> {
  // Estado para alternar entre tema claro y oscuro
  bool _esModoOscuro = false;

  void _alternarTema() {
    setState(() {
      _esModoOscuro = !_esModoOscuro;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV Wrapper - Jordan Revelo',
      debugShowCheckedModeBanner: false,
      themeMode: _esModoOscuro ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F4C81),
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F4C81),
          brightness: Brightness.dark,
        ),
      ),
      home: PantallaWebWrapper(
        esModoOscuro: _esModoOscuro,
        onAlternarTema: _alternarTema,
      ),
    );
  }
}

class PantallaWebWrapper extends StatefulWidget {
  final bool esModoOscuro;
  final VoidCallback onAlternarTema;

  const PantallaWebWrapper({
    super.key,
    required this.esModoOscuro,
    required this.onAlternarTema,
  });

  @override
  State<PantallaWebWrapper> createState() => _PantallaWebWrapperState();
}

class _PantallaWebWrapperState extends State<PantallaWebWrapper> {
  late final WebViewController _controller;
  int _progresoCarga = 0;
  bool _estaCargando = true;

  @override
  void initState() {
    super.initState();

    // Configuración del controlador de WebView
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              _progresoCarga = progress;
            });
          },
          onPageStarted: (String url) {
            setState(() {
              _estaCargando = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _estaCargando = false;
            });
          },
        ),
      )
      ..loadFlutterAsset('assets/web/index.html'); // Carga offline desde assets
  }

  // Función nativa para compartir perfil
  void _compartirPerfil() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.check_circle_outline, color: Colors.white),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Perfil de Jordan Revelo listo para compartir',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF0F4C81),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (await _controller.canGoBack()) {
          await _controller.goBack();
        } else {
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mi Hoja de Vida',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Contenedor Móvil (WebView)',
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
          actions: [
            // Control 1: Alternar tema Claro / Oscuro
            IconButton(
              icon: Icon(
                widget.esModoOscuro ? Icons.light_mode : Icons.dark_mode,
              ),
              tooltip: widget.esModoOscuro ? 'Modo Claro' : 'Modo Oscuro',
              onPressed: widget.onAlternarTema,
            ),
            // Control 2: Recargar la página web
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: 'Recargar página web',
              onPressed: () {
                _controller.reload();
              },
            ),
            // Control 3: Compartir perfil nativo
            IconButton(
              icon: const Icon(Icons.share_outlined),
              tooltip: 'Compartir perfil',
              onPressed: _compartirPerfil,
            ),
          ],
          bottom: _estaCargando && _progresoCarga < 100
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(3.0),
                  child: LinearProgressIndicator(
                    value: _progresoCarga / 100.0,
                    backgroundColor: Colors.transparent,
                    color: const Color(0xFF0F4C81),
                  ),
                )
              : null,
        ),
        body: SafeArea(
          child: WebViewWidget(controller: _controller),
        ),
      ),
    );
  }
}
