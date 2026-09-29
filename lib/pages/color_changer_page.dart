import 'package:flutter/material.dart';

/// StatefulWidget untuk mengelola halaman perubahan warna.
/// Sesuai aturan Modul 1-4, state management dasar StatefulWidget & setState() digunakan di sini.
class ColorChangerPage extends StatefulWidget {
  const ColorChangerPage({super.key});

  @override
  State<ColorChangerPage> createState() => _ColorChangerPageState();
}

class _ColorChangerPageState extends State<ColorChangerPage> {
  // Variable state untuk menyimpan warna aktif pada Container (default: Abu-abu)
  Color _currentColor = Colors.grey;

  // Variabel penampung nama warna untuk teks indikator
  String _colorName = 'Abu-abu (Default)';

  /// Method untuk mengubah warna dan memperbarui UI
  void _updateColor(Color newColor, String colorName) {
    // LOGIKA setState():
    // Fungsi setState() memicu Flutter untuk menjalankan ulang method build().
    // Semua variabel state di dalam setState() yang nilainya diperbarui
    // akan secara otomatis memperbarui tampilan UI terkait pada layar.
    setState(() {
      _currentColor = newColor;
      _colorName = colorName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fitur Ubah Warna',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. Container Besar sebagai Area Tampilan Warna
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: _currentColor,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  _colorName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,
                        color: Colors.black45,
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // 2. Tiga buah Tombol Pengubah Warna
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Memanggil Helper Function _buildColorButton untuk tiap warna
                _buildColorButton('Merah', Colors.red),
                _buildColorButton('Hijau', Colors.green),
                _buildColorButton('Biru', Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// HELPER FUNCTION / METHOD UNTUK RENDER TOMBOL BERULANG (Modularisasi UI)
  ///
  /// Mematuhi aturan: DILARANG membuat class StatelessWidget baru untuk tombol ini.
  /// Cukup gunakan fungsi private _buildColorButton yang me-return Widget.
  Widget _buildColorButton(String label, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 3,
      ),
      onPressed: () {
        // Memanggil logika pembaruan state ketika tombol ditekan
        _updateColor(color, label);
      },
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
