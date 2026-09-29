import 'package:flutter/material.dart';
import '../models/dummy_data.dart';

class DetailPage extends StatefulWidget {
  final HotelModel item;

  const DetailPage({super.key, required this.item});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // State untuk kalkulator estimasi malam menginap
  int _jumlahMalam = 1;

  void _toggleFavorite() {
    setState(() {
      widget.item.isFavorite = !widget.item.isFavorite;
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          widget.item.isFavorite
              ? '${widget.item.name} ditambahkan ke Favorit!'
              : '${widget.item.name} dihapus dari Favorit.',
        ),
        backgroundColor: widget.item.isFavorite ? Colors.green : Colors.grey[700],
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _tambahMalam() {
    setState(() {
      _jumlahMalam++;
    });
  }

  void _kurangMalam() {
    if (_jumlahMalam > 1) {
      setState(() {
        _jumlahMalam--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalBiaya = _jumlahMalam * widget.item.pricePerNight;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      // SingleChildScrollView mencegah overflow pada layar ketika informasi panjang
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================================================================
            // PENGGUNAAN WIDGET STACK PADA HEADER DETAIL
            // ================================================================
            Stack(
              children: [
                Image.network(
                  widget.item.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 250,
                      color: Colors.grey[300],
                      child: const Icon(Icons.hotel, size: 80, color: Colors.grey),
                    );
                  },
                ),
                // Stack Melayang: Tombol Interaktif Favorite/Love (Positioned Top Right)
                Positioned(
                  top: 12,
                  right: 12,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(
                        widget.item.isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: widget.item.isFavorite ? Colors.red : Colors.grey[700],
                      ),
                      onPressed: _toggleFavorite,
                    ),
                  ),
                ),
                // Stack Melayang: Category Badge (Positioned Bottom Left)
                Positioned(
                  bottom: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue.withValues(alpha: 0.85),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      widget.item.category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Rincian Detail Informasi Properti Hotel
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.item.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 22),
                          const SizedBox(width: 4),
                          Text(
                            '${widget.item.rating} / 5.0',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.grey, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        widget.item.location,
                        style: const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Rp ${widget.item.pricePerNight} / malam',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const Divider(height: 24, thickness: 1),

                  // MENAMPILKAN SELURUH ATRIBUT DETAIL (Modularisasi UI)
                  _buildDetailRow('ID Properti', '#${widget.item.id}'),
                  _buildDetailRow('Nama Hotel', widget.item.name),
                  _buildDetailRow('Lokasi', widget.item.location),
                  _buildDetailRow('Kategori', widget.item.category),
                  _buildDetailRow('Harga / Malam', 'Rp ${widget.item.pricePerNight}'),
                  _buildDetailRow('Skor Rating', '${widget.item.rating} / 5.0'),
                  _buildDetailRow('Sisa Kamar', '${widget.item.availableRooms} Kamar Kosong'),
                  _buildDetailRow(
                    'Status VIP',
                    widget.item.isPopular ? 'Populer VIP 🌟' : 'Properti Reguler',
                  ),
                  _buildDetailRow(
                    'Status Favorit',
                    widget.item.isFavorite ? 'Disukai ❤️' : 'Belum Disukai 🤍',
                  ),

                  const Divider(height: 24, thickness: 1),
                  const Text(
                    'Fasilitas Unggulan:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Menampilkan Fasilitas List<String> dalam bentuk Chip/Wrap
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: widget.item.facilities.map((facility) {
                      return Chip(
                        avatar: const Icon(Icons.check_circle, color: Colors.blue, size: 18),
                        label: Text(facility),
                        backgroundColor: Colors.blue[50],
                      );
                    }).toList(),
                  ),

                  const Divider(height: 24, thickness: 1),
                  const Text(
                    'Deskripsi Lengkap:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.item.description,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                  const Divider(height: 32, thickness: 1),

                  // ==========================================================
                  // FITUR INTERAKTIF: KALKULATOR ESTIMASI MALAM MENGINAP
                  // ==========================================================
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Kalkulator Booking Menginap:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Durasi Menginap:',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: _kurangMalam,
                                  icon: const Icon(Icons.remove_circle_outline),
                                  color: _jumlahMalam > 1 ? Colors.blue : Colors.grey,
                                ),
                                Text(
                                  '$_jumlahMalam Malam',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: _tambahMalam,
                                  icon: const Icon(Icons.add_circle_outline),
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total Biaya:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Rp $totalBiaya',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function untuk merender baris detail (Modularisasi UI)
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          const Text(': '),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}