import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameC = TextEditingController();
  final emailC = TextEditingController();
  final passC = TextEditingController();

  bool loading = false;

  void handleRegister() async {
    setState(() => loading = true);

    await AuthService.register(
      name: usernameC.text,
      email: emailC.text,
      password: passC.text,
    );

    setState(() => loading = false);

    if (!mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Daftar berhasil")));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 20),

                // ICON
                Container(
                  padding: const EdgeInsets.all(18),
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
                    Icons.person_add_alt_1,
                    size: 42,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 18),

                const Text(
                  "Buat Akun",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF111827),
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  "Daftar untuk mulai Petualangan",
                  style: TextStyle(color: Color(0xFF6B7280), fontSize: 14),
                ),

                const SizedBox(height: 30),

                // FORM CARD
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: usernameC,
                        decoration: InputDecoration(
                          labelText: "Nama Pengguna",
                          prefixIcon: const Icon(Icons.person_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

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

                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFEF4444),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 2,
                          ),
                          onPressed: loading ? null : handleRegister,
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
                                  "Daftar",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sudah punya akun? Login",
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
  }
}
