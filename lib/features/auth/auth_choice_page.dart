import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';

class AuthChoicePage extends StatelessWidget {
  const AuthChoicePage({super.key});

  static const primary = Color(0xFFEF4444);
  static const bg = Color(0xFFF9FAFB);
  static const textPrimary = Color(0xFF111827);
  static const textSecondary = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),

                        // ICON (same style as login)
                        Container(
                          width: 85,
                          height: 85,
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.attractions,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 18),

                        const Text(
                          "Dufan Experience",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: textPrimary,
                          ),
                        ),

                        const SizedBox(height: 6),

                        const Text(
                          "Login or register to explore attractions & events",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: textSecondary, fontSize: 14),
                        ),

                        const SizedBox(height: 40),

                        // LOGIN BUTTON (same style as login page button)
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 2,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LoginPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // REGISTER BUTTON (same vibe as textButton style in login)
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: primary,
                              side: const BorderSide(color: primary),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const RegisterPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),

                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
