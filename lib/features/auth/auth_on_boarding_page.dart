import 'package:flutter/material.dart';
import '../../services/app_prefs.dart';
import 'login_page.dart';
import 'register_page.dart';

class AuthOnboardingPage extends StatefulWidget {
  const AuthOnboardingPage({super.key});

  @override
  State<AuthOnboardingPage> createState() => _AuthOnboardingPageState();
}

class _AuthOnboardingPageState extends State<AuthOnboardingPage> {
  final controller = PageController();
  int index = 0;

  final pages = [
    _OnboardItem(
      title: "Explore Dufan",
      desc: "Temukan berbagai wahana & event seru di satu tempat",
      icon: Icons.attractions,
    ),
    _OnboardItem(
      title: "Fast Ticket",
      desc: "Beli tiket tanpa antri, langsung masuk",
      icon: Icons.confirmation_number,
    ),
    _OnboardItem(
      title: "Live Map",
      desc: "Cari wahana & event langsung di peta interaktif",
      icon: Icons.map,
    ),
  ];

  void finishOnboarding() async {
    await AppPrefs.setNotFirstTime();

    if (!context.mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLast = index == pages.length - 1;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF111827), Color(0xFF1F2937), Color(0xFFF9FAFB)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (i) => setState(() => index = i),
                  itemCount: pages.length,
                  itemBuilder: (context, i) {
                    final item = pages[i];

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(26),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              item.icon,
                              size: 70,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            item.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              item.desc,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // DOT INDICATOR
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(pages.length, (i) {
                  final active = i == index;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: active ? 18 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: active ? Colors.white : Colors.white30,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 25),

              // BUTTONS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    if (isLast)
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF111827),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: finishOnboarding,
                          child: const Text(
                            "Mulai",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    else ...[
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF111827),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) => const LoginPage(),
                                transitionsBuilder: (_, anim, __, child) {
                                  return SlideTransition(
                                    position: Tween(
                                      begin: const Offset(1, 0),
                                      end: Offset.zero,
                                    ).animate(anim),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: const Text("Masuk"),
                        ),
                      ),

                      const SizedBox(height: 12),

                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    const RegisterPage(),
                                transitionsBuilder: (_, anim, __, child) {
                                  return SlideTransition(
                                    position: Tween(
                                      begin: const Offset(1, 0),
                                      end: Offset.zero,
                                    ).animate(anim),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: const Text("Daftar"),
                        ),
                      ),
                    ],

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardItem {
  final String title;
  final String desc;
  final IconData icon;

  _OnboardItem({required this.title, required this.desc, required this.icon});
}
