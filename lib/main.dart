import 'package:flutter/material.dart';

void main() {
  runApp(const MiHojaDeVidaApp());
}

class MiHojaDeVidaApp extends StatelessWidget {
  const MiHojaDeVidaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hoja de Vida - Jordan Revelo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F4C81), // Azul clásico profesional
          primary: const Color(0xFF0F4C81),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF1F5F9), // Slate suave
        cardTheme: CardThemeData(
          elevation: 1.5,
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      home: const HojaDeVidaScreen(),
    );
  }
}

class HojaDeVidaScreen extends StatelessWidget {
  const HojaDeVidaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hoja de Vida Profesional',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            tooltip: 'Compartir perfil',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Perfil de Jordan Revelo copiado al portapapeles'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          children: const [
            _EncabezadoPerfil(),
            SizedBox(height: 18),
            _SeccionAcercaDe(),
            SizedBox(height: 18),
            _SeccionHabilidades(),
            SizedBox(height: 18),
            _SeccionExperiencia(),
            SizedBox(height: 18),
            _SeccionEducacion(),
            SizedBox(height: 18),
            _SeccionContacto(),
            SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}

// 1. Encabezado con Avatar y Datos Principales
class _EncabezadoPerfil extends StatelessWidget {
  const _EncabezadoPerfil();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 26.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 52,
              backgroundColor: theme.colorScheme.primaryContainer,
              child: Text(
                'JR',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Jordan Javier Revelo Cuastumal',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFE0F2FE),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Estudiante de Ing. en Computación | Desarrollador Junior',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF0369A1),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.location_on_outlined, size: 18, color: Color(0xFF64748B)),
                SizedBox(width: 4),
                Text(
                  'El Ángel, Carchi, Ecuador',
                  style: TextStyle(color: Color(0xFF64748B), fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 2. Sección Acerca de mí
class _SeccionAcercaDe extends StatelessWidget {
  const _SeccionAcercaDe();

  @override
  Widget build(BuildContext context) {
    return _ContenedorSeccion(
      titulo: 'Perfil Profesional',
      icono: Icons.person_outline,
      contenido: const Text(
        'Estudiante de Ingeniería en Computación con gran pasión por la tecnología, el desarrollo de software y la resolución creativa de problemas. '
        'Cuento con experiencia en desarrollo de aplicaciones web y plataformas digitales, integrando tecnologías frontend y backend modernas como Python, Django, Next.js, React y Flutter. '
        'Enfocado en el aprendizaje continuo, buenas prácticas de desarrollo y el trabajo colaborativo mediante Git y GitHub.',
        style: TextStyle(fontSize: 14, height: 1.6, color: Color(0xFF334155)),
      ),
    );
  }
}

// 3. Habilidades Técnicas
class _SeccionHabilidades extends StatelessWidget {
  const _SeccionHabilidades();

  @override
  Widget build(BuildContext context) {
    final habilidadesFrontend = ['React', 'Next.js', 'Flutter', 'HTML5 / CSS3'];
    final habilidadesBackend = ['Python', 'Django', 'Docker', 'PostgreSQL / SQL', 'REST APIs'];
    final herramientas = ['Git & GitHub', 'Trabajo en Equipo', 'Metodologías Ágiles'];

    return _ContenedorSeccion(
      titulo: 'Habilidades & Tecnologías',
      icono: Icons.terminal_outlined,
      contenido: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Frontend & Mobile:',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF475569)),
          ),
          const SizedBox(height: 6),
          _GrupoChips(items: habilidadesFrontend, colorFondo: const Color(0xFFEFF6FF), colorBorde: const Color(0xFFBFDBFE), colorTexto: const Color(0xFF1E40AF)),
          const SizedBox(height: 12),
          const Text(
            'Backend & Entornos:',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF475569)),
          ),
          const SizedBox(height: 6),
          _GrupoChips(items: habilidadesBackend, colorFondo: const Color(0xFFF0FDF4), colorBorde: const Color(0xFFBBF7D0), colorTexto: const Color(0xFF166534)),
          const SizedBox(height: 12),
          const Text(
            'Herramientas & Colaboración:',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF475569)),
          ),
          const SizedBox(height: 6),
          _GrupoChips(items: herramientas, colorFondo: const Color(0xFFFAF5FF), colorBorde: const Color(0xFFE9D5FF), colorTexto: const Color(0xFF6B21A8)),
        ],
      ),
    );
  }
}

// 4. Experiencia Laboral
class _SeccionExperiencia extends StatelessWidget {
  const _SeccionExperiencia();

  @override
  Widget build(BuildContext context) {
    return _ContenedorSeccion(
      titulo: 'Experiencia Laboral',
      icono: Icons.business_center_outlined,
      contenido: Column(
        children: const [
          _ItemHistorial(
            cargo: 'Desarrollador Web Junior',
            lugar: 'Frontera Tech',
            periodo: 'Actualidad',
            descripcion: 'Diseño, construcción y despliegue de aplicaciones y sitios web interactivos. Implementación de interfaces intuitivas y conexión con servicios backend.',
          ),
        ],
      ),
    );
  }
}

// 5. Educación
class _SeccionEducacion extends StatelessWidget {
  const _SeccionEducacion();

  @override
  Widget build(BuildContext context) {
    return _ContenedorSeccion(
      titulo: 'Educación Superior',
      icono: Icons.school_outlined,
      contenido: const _ItemHistorial(
        cargo: 'Ingeniería en Computación',
        lugar: 'Universidad Politécnica Estatal del Carchi (UPEC)',
        periodo: 'En curso',
        descripcion: 'Formación profesional integral orientada a la ingeniería de software, arquitectura de sistemas, desarrollo multiplataforma y algoritmos computacionales.',
      ),
    );
  }
}

// 6. Contacto
class _SeccionContacto extends StatelessWidget {
  const _SeccionContacto();

  @override
  Widget build(BuildContext context) {
    return _ContenedorSeccion(
      titulo: 'Contacto & Enlaces',
      icono: Icons.contact_mail_outlined,
      contenido: Column(
        children: const [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: Color(0xFFEFF6FF),
              child: Icon(Icons.email_outlined, color: Color(0xFF0F4C81)),
            ),
            title: Text('Correo Institucional / Personal', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            subtitle: Text('jordan.revelo@upec.edu.ec', style: TextStyle(fontSize: 13, color: Color(0xFF64748B))),
          ),
          Divider(height: 12),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: Color(0xFFEFF6FF),
              child: Icon(Icons.code_outlined, color: Color(0xFF0F4C81)),
            ),
            title: Text('GitHub', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            subtitle: Text('github.com/JordanRevelo', style: TextStyle(fontSize: 13, color: Color(0xFF64748B))),
          ),
        ],
      ),
    );
  }
}

// Helper para grupos de Chips
class _GrupoChips extends StatelessWidget {
  final List<String> items;
  final Color colorFondo;
  final Color colorBorde;
  final Color colorTexto;

  const _GrupoChips({
    required this.items,
    required this.colorFondo,
    required this.colorBorde,
    required this.colorTexto,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: items.map((item) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
          decoration: BoxDecoration(
            color: colorFondo,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colorBorde),
          ),
          child: Text(
            item,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: colorTexto,
            ),
          ),
        );
      }).toList(),
    );
  }
}

// Contenedor reutilizable de cada sección
class _ContenedorSeccion extends StatelessWidget {
  final String titulo;
  final IconData icono;
  final Widget contenido;

  const _ContenedorSeccion({
    required this.titulo,
    required this.icono,
    required this.contenido,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icono, color: Theme.of(context).colorScheme.primary, size: 22),
                const SizedBox(width: 10),
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            contenido,
          ],
        ),
      ),
    );
  }
}

// Elemento reutilizable de historial laboral o educativo
class _ItemHistorial extends StatelessWidget {
  final String cargo;
  final String lugar;
  final String periodo;
  final String descripcion;

  const _ItemHistorial({
    required this.cargo,
    required this.lugar,
    required this.periodo,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                cargo,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF1E293B)),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                periodo,
                style: const TextStyle(fontSize: 11, color: Color(0xFF64748B), fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const SizedBox(height: 3),
        Text(
          lugar,
          style: TextStyle(
            fontSize: 13,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          descripcion,
          style: const TextStyle(fontSize: 13, color: Color(0xFF475569), height: 1.45),
        ),
      ],
    );
  }
}
