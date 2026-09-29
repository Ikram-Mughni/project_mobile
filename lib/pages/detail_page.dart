import 'package:flutter/material.dart';
import '../models/dummy_data.dart';

class DetailPage extends StatefulWidget {
  final CarModel item;

  const DetailPage({super.key, required this.item});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _durasiSewa = 1;

  // State untuk Fitur Interaktif 1: Bookmark / Favorit (Toggle State)
  void _toggleFavorite() {
    setState(() {
      widget.item.isFavorite = !widget.item.isFavorite;
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          widget.item.isFavorite
              ? '${widget.item.brand} ${widget.item.modelName} ditambahkan ke Favorit!'
              : '${widget.item.brand} ${widget.item.modelName} dihapus dari Favorit.',
        ),
        backgroundColor: widget.item.isFavorite ? Colors.green : Colors.grey[700],
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _tambahDurasi() {
    setState(() {
      _durasiSewa++;
    });
  }

  void _kurangDurasi() {
    if (_durasiSewa > 1) {
      setState(() {
        _durasiSewa--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalBiaya = _durasiSewa * widget.item.rentalPricePerDay;

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.item.brand} ${widget.item.modelName}'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          // Tombol Interaktif Favorit di AppBar
          IconButton(
            icon: Icon(
              widget.item.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: widget.item.isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 230,
                width: double.infinity,
                color: Colors.grey[100],
                child: Image.network(
                  widget.item.imageUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.directions_car, size: 80, color: Colors.grey),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${widget.item.brand} ${widget.item.modelName}',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Badge Status Ketersediaan
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: widget.item.isAvailable
                              ? Colors.green[100]
                              : Colors.red[100],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: widget.item.isAvailable ? Colors.green : Colors.red,
                          ),
                        ),
                        child: Text(
                          widget.item.isAvailable ? 'Tersedia' : 'Dipesan',
                          style: TextStyle(
                            color: widget.item.isAvailable ? Colors.green[800] : Colors.red[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.item.type,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp ${widget.item.rentalPricePerDay} / hari',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
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
                  const Divider(height: 24, thickness: 1),
                  // Menampilkan Seluruh Atribut Detail (Modularisasi UI)
                  _buildDetailRow('ID Item', '#${widget.item.id}'),
                  _buildDetailRow('Merk Mobil', widget.item.brand),
                  _buildDetailRow('Model', widget.item.modelName),
                  _buildDetailRow('Tipe Bodi', widget.item.type),
                  _buildDetailRow('Harga Sewa', 'Rp ${widget.item.rentalPricePerDay} / hari'),
                  _buildDetailRow('Rating', '${widget.item.rating} / 5.0'),
                  _buildDetailRow('Transmisi', widget.item.transmission),
                  _buildDetailRow('Kapasitas', '${widget.item.capacity} Orang'),
                  _buildDetailRow(
                    'Ketersediaan',
                    widget.item.isAvailable ? 'Tersedia Unit' : 'Sedang Dipesan',
                  ),
                  const Divider(height: 24, thickness: 1),
                  const Text(
                    'Deskripsi Spesifikasi:',
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
                  // FITUR INTERAKTIF: KALKULATOR ESTIMASI BIAYA SEWA
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
                          'Kalkulator Estimasi Sewa:',
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
                              'Durasi Sewa:',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: _kurangDurasi,
                                  icon: const Icon(Icons.remove_circle_outline),
                                  color: _durasiSewa > 1 ? Colors.blue : Colors.grey,
                                ),
                                Text(
                                  '$_durasiSewa Hari',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: _tambahDurasi,
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