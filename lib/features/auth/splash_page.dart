import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../../services/app_prefs.dart';
import '../main_navigation/main_navigation_page.dart';
import 'auth_choice_page.dart';
import 'auth_on_boarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _scale = Tween<double>(
      begin: 0.85,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    checkLogin();
  }

  void checkLogin() async {
    await Future.delayed(const Duration(seconds: 2));

    final firstTime = await AppPrefs.isFirstTime();
    final loggedIn = await AuthService.isLoggedIn();

    if (!mounted) return;

    // 🔥 FIRST INSTALL → ONBOARDING
    if (firstTime) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AuthOnboardingPage()),
      );
      return;
    }

    // 🔥 SUDAH INSTALL SEBELUMNYA
    if (loggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainNavigationPage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AuthChoicePage()),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEF4444),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔥 Animated Icon
            ScaleTransition(
              scale: _scale,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.attractions,
                  size: 50,
                  color: Color(0xFFEF4444),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Loading Experience",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 16),

            const _DotLoader(),
          ],
        ),
      ),
    );
  }
}

// ============================
// DOT LOADER ANIMATION
// ============================

class _DotLoader extends StatefulWidget {
  const _DotLoader();

  @override
  State<_DotLoader> createState() => _DotLoaderState();
}

class _DotLoaderState extends State<_DotLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _dot(double delay) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        final t = (_controller.value + delay) % 1.0;
        final scale = (0.5 + (0.5 * (1 - (t - 0.5).abs() * 2)));

        return Transform.scale(scale: scale, child: child);
      },
      child: Container(
        width: 10,
        height: 10,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [_dot(0.0), _dot(0.2), _dot(0.4)],
    );
  }
}
