import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // GlobalKey untuk menangani validasi Form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // TextEditingController untuk mengontrol input username dan password
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Method untuk memproses autentikasi form login
  void _handleLogin() {
    // 1. Jalankan fungsi validasi seluruh field di Form
    if (_formKey.currentState!.validate()) {
      String usernameInput = _usernameController.text;
      String passwordInput = _passwordController.text;

      // 2. Autentikasi statis mencocokkan kredensial di dummyUser ('admin' & 'admin')
      if (usernameInput == dummyUser.username &&
          passwordInput == dummyUser.password) {
        // Navigasi ke HomePage menggunakan pushReplacement
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        // Tampilkan SnackBar error jika username/password tidak cocok
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login Gagal: Username atau Password salah!'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'StayVibes Login',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      // SingleChildScrollView mencegah overflow saat keyboard HP muncul
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.hotel_class_rounded,
                  size: 90,
                  color: Colors.blue,
                ),
                const SizedBox(height: 12),
                const Text(
                  'StayVibes Resort',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Silakan login untuk merencanakan liburanmu',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 28),
                _buildUsernameFormField(),
                const SizedBox(height: 16),
                _buildPasswordFormField(),
                const SizedBox(height: 24),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper function untuk merender TextFormField Username
  Widget _buildUsernameFormField() {
    return TextFormField(
      controller: _usernameController,
      decoration: const InputDecoration(
        labelText: 'Username',
        hintText: 'Masukkan username admin',
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Username tidak boleh kosong!';
        }
        return null;
      },
    );
  }

  // Helper function untuk merender TextFormField Password
  Widget _buildPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Masukkan password admin',
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password tidak boleh kosong!';
        }
        if (value.length < 4) {
          return 'Password minimal 4 karakter!';
        }
        return null;
      },
    );
  }

  // Helper function untuk merender Tombol Submit Login
  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _handleLogin,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Text(
        'Login Sekarang',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}