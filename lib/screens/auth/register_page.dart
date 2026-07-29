import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final noHpController = TextEditingController();

  String? jenisKelamin;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    noHpController.dispose();
    super.dispose();
  }

  void register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Daftar Berhasil")),
      );

      context.go("/login");
    }
  }

  InputDecoration inputDecoration(
      String label,
      IconData icon,
      ) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Form(
            key: _formKey,

            child: Column(
              children: [

                const SizedBox(height: 20),

                const CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.person_add,
                    color: Colors.white,
                    size: 45,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  "Buat Akun",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Text(
                  "Silakan isi data diri Anda",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 30),

                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(20),

                    child: Column(
                      children: [

                        TextFormField(
                          controller: nameController,
                          decoration: inputDecoration(
                            "Nama",
                            Icons.person,
                          ),
                          validator: (value) =>
                              value!.isEmpty ? "Nama wajib diisi" : null,
                        ),

                        const SizedBox(height: 15),

                        TextFormField(
                          controller: emailController,
                          decoration: inputDecoration(
                            "Email",
                            Icons.email,
                          ),
                          validator: (value) =>
                              value!.isEmpty ? "Email wajib diisi" : null,
                        ),

                        const SizedBox(height: 15),

                        DropdownButtonFormField<String>(
                          decoration: inputDecoration(
                            "Jenis Kelamin",
                            Icons.people,
                          ),
                          value: jenisKelamin,
                          items: const [
                            DropdownMenuItem(
                              value: "Laki-laki",
                              child: Text("Laki-laki"),
                            ),
                            DropdownMenuItem(
                              value: "Perempuan",
                              child: Text("Perempuan"),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              jenisKelamin = value;
                            });
                          },
                          validator: (value) =>
                              value == null ? "Pilih jenis kelamin" : null,
                        ),

                        const SizedBox(height: 15),

                        TextFormField(
                          controller: noHpController,
                          keyboardType: TextInputType.phone,
                          decoration: inputDecoration(
                            "Phone",
                            Icons.phone,
                          ),
                          validator: (value) =>
                              value!.isEmpty ? "No Hp wajib diisi" : null,
                        ),

                         const SizedBox(height: 15),

                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: inputDecoration(
                            "Password",
                            Icons.lock,
                          ),
                          validator: (value) =>
                              value!.isEmpty ? "Password wajib diisi" : null,
                        ),

                        const SizedBox(height: 15),

                        TextFormField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          decoration: inputDecoration(
                            "Konfirmasi Password",
                            Icons.lock_outline,
                          ),
                          validator: (value) {
                            if (value != passwordController.text) {
                              return "Password tidak sama";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 25),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: register,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text(
                              "Daftar",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        TextButton(
                          onPressed: () {
                            context.go("/login");
                          },
                          child: const Text(
                            "Sudah punya akun? Login",
                          ),
                        ),
                      ],
                    ),
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