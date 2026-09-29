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
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: carList.length,
        itemBuilder: (context, index) {
          CarModel item = carList[index];
          return _buildItemCard(context, item);
        },
      ),
    );
  }

  // Helper function untuk merender item card (Modularisasi UI)
  Widget _buildItemCard(BuildContext context, CarModel item) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: Image.network(
            item.imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 60,
                height: 60,
                color: Colors.grey[300],
                child: const Icon(Icons.directions_car, color: Colors.grey),
              );
            },
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                '${item.brand} ${item.modelName}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            // Tampilkan ikon Love merah jika item ini di-like di DetailPage
            if (item.isFavorite)
              const Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 20,
                ),
              ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              '${item.type} • ${item.transmission}',
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rp ${item.rentalPricePerDay} / hari',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  item.isAvailable ? 'Tersedia' : 'Dipesan',
                  style: TextStyle(
                    color: item.isAvailable ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        onTap: () {
          // Navigasi ke DetailPage dengan mengirimkan object item (Passing Data)
          // Menggunakan .then() agar saat kembali (pop) dari DetailPage, HomePage ter-rebuild
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(item: item),
            ),
          ).then((_) {
            // Rebuild UI HomePage untuk memperbarui ikon love
            setState(() {});
          });
        },
      ),
    );
  }
}