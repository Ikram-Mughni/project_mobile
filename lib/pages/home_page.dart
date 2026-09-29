import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Selamat Datang, ${dummyUser.fullName}',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.63,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: hotelList.length,
        itemBuilder: (context, index) {
          HotelModel item = hotelList[index];
          return _buildHotelCard(context, item);
        },
      ),
    );
  }

  // Helper function untuk merender item Card Grid (Modularisasi UI)
  Widget _buildHotelCard(BuildContext context, HotelModel item) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // Navigasi ke DetailPage (Passing Data)
          // Menggunakan .then() untuk merender ulang UI HomePage saat kembali dari DetailPage
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(item: item),
            ),
          ).then((_) {
            setState(() {});
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================================================================
            // PENGGUNAAN WIDGET STACK PADA HEADER GAMBAR CARD
            // ================================================================
            Stack(
              children: [
                Image.network(
                  item.imageUrl,
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 130,
                      color: Colors.grey[300],
                      child: const Icon(Icons.hotel, size: 50, color: Colors.grey),
                    );
                  },
                ),
                // Stack Badge 1: Tanda Popular/VIP (Positioned Top Right)
                if (item.isPopular)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.amber[800],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'POPULAR 🌟',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),

                // Stack Badge 2: Ikon Favorit/Love (Positioned Top Left)
                if (item.isFavorite)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.85),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 18,
                      ),
                    ),
                  ),

                // Stack Badge 3: Label Harga (Positioned Bottom Left)
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.65),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Rp ${item.pricePerNight}/malam',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Bagian Body Informasi Properti Hotel
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 12, color: Colors.grey),
                      const SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          item.location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 14, color: Colors.amber),
                      const SizedBox(width: 2),
                      Text(
                        '${item.rating}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          item.category,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // ============================================================
                  // ATURAN CONDITIONAL STYLING BERDASARKAN availableRooms
                  // ============================================================
                  _buildRoomAvailabilityBadge(item.availableRooms),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function untuk Conditional Styling status sisa kamar
  Widget _buildRoomAvailabilityBadge(int availableRooms) {
    Color badgeColor;
    String badgeText;

    if (availableRooms == 0) {
      badgeColor = Colors.red;
      badgeText = 'Kamar Penuh / Sold Out';
    } else if (availableRooms <= 2) {
      badgeColor = Colors.orange[800]!;
      badgeText = 'Sisa $availableRooms Kamar!';
    } else {
      badgeColor = Colors.green[700]!;
      badgeText = 'Tersedia ($availableRooms Kamar)';
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        badgeText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}