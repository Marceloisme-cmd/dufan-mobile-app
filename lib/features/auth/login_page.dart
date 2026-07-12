import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../main_navigation/main_navigation_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailC = TextEditingController();
  final passC = TextEditingController();

  bool loading = false;

  void handleLogin() async {
    setState(() => loading = true);

    final success = await AuthService.login(
      email: emailC.text,
      password: passC.text,
    );

    setState(() => loading = false);

    if (success) {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainNavigationPage()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Login gagal")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

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
                        // ICON
                        Container(
                          width: 85,
                          height: 85,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEF4444),
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
                            Icons.lock_outline,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 18),

                        const Text(
                          "Selamat Datang",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF111827),
                          ),
                        ),

                        const SizedBox(height: 6),

                        const Text(
                          "Masuk Untuk Jelajahi Dunia Fantasi",
                          style: TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 14,
                          ),
                        ),

                        const SizedBox(height: 30),

                        // CARD
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 18,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              // EMAIL
                              TextField(
                                controller: emailC,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  prefixIcon: const Icon(Icons.email_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 14),

                              // PASSWORD
                              TextField(
                                controller: passC,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Kata Sandi",
                                  prefixIcon: const Icon(Icons.lock_outline),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              // BUTTON
                              SizedBox(
                                width: double.infinity,
                                height: 52,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFEF4444),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    elevation: 2,
                                  ),
                                  onPressed: loading ? null : handleLogin,
                                  child: loading
                                      ? const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 2,
                                          ),
                                        )
                                      : const Text(
                                          "Masuk",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                ),
                              ),

                              const SizedBox(height: 10),

                              // REGISTER LINK
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const RegisterPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Belum punya akun? Daftar disini",
                                  style: TextStyle(color: Color(0xFF6B7280)),
                                ),
                              ),
                            ],
                          ),
                        ),
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
