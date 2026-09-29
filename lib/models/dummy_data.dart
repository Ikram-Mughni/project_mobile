// ============================================================================
// MODEL & DUMMY DATA - APLIKASI RESERVASI HOTEL & RESORT ("StayVibes")
// ============================================================================
// File ini berfungsi sebagai pusat penyediaan data statis (Dummy Data) dan 
// definisi struktur data (Class Model) untuk Kuis Tingkat Lanjut Modul 1-4.
// ============================================================================

/// [UserModel]
/// Model data untuk menampung akun kredensial pengguna pada form autentikasi.
class UserModel {
  final String username; // [String] Username untuk validasi login pada TextFormField
  final String password; // [String] Password untuk validasi login pada TextFormField
  final String fullName; // [String] Nama lengkap pengguna yang dipassing ke halaman berikutnya

  UserModel({
    required this.username,
    required this.password,
    required this.fullName,
  });
}

/// [dummyUser]
/// Kredensial Pengguna Statis (Single Source of Truth untuk Login)
/// Gunakan username 'admin' dan password 'admin' untuk autentikasi form.
UserModel dummyUser = UserModel(
  username: "admin",
  password: "admin",
  fullName: "Siti Traveler",
);

/// [HotelModel]
/// Class model komprehensif yang menampung atribut data spesifikasi hotel/resort.
/// Menggunakan kombinasi beragam tipe data: int, String, double, bool, dan `List<String>`.
class HotelModel {
  final int id;                   // [int] Unique ID item hotel
  final String name;             // [String] Nama hotel / resort
  final String location;         // [String] Kota atau wilayah tempat hotel berada
  final String category;         // [String] Kategori properti (misal: Beach Resort, Villa, City Luxury)
  final int pricePerNight;       // [int] Biaya menginap per malam dalam Rupiah (IDR)
  final double rating;           // [double] Skor ulasan kepuasan pengunjung (Skala 1.0 - 5.0)
  final int availableRooms;      // [int] Sisa jumlah kamar kosong (Digunakan untuk Conditional Styling di GridView)
  final bool isPopular;          // [bool] Penanda status hotel populer/VIP (Digunakan untuk Stack Badge & Styling)
  final String imageUrl;         // [String] URL tautan gambar utama hotel dari internet
  final String description;      // [String] Deskripsi lengkap mengenai keunggulan & nuansa hotel
  final List<String> facilities; // [List<String>] Daftar fasilitas unggulan yang disediakan
  bool isFavorite;               // [bool] Status favorit/bookmark (Dapat di-toggle secara interaktif di DetailPage)

  HotelModel({
    required this.id,
    required this.name,
    required this.location,
    required this.category,
    required this.pricePerNight,
    required this.rating,
    required this.availableRooms,
    required this.isPopular,
    required this.imageUrl,
    required this.description,
    required this.facilities,
    this.isFavorite = false,
  });
}

/// [hotelList]
/// Koleksi daftar properti hotel dummy (minimal 4 item) untuk ditampilkan pada GridView.builder di HomePage.
List<HotelModel> hotelList = [
  HotelModel(
    id: 1,
    name: "The Kayon Jungle Resort",
    location: "Ubud, Bali",
    category: "Luxury Jungle Villa",
    pricePerNight: 3500000,
    rating: 4.9,
    availableRooms: 2, // Sisa kamar sedikit (Trigger warna peringatan)
    isPopular: true,   // Status populer (Trigger Badge Stack VIP)
    imageUrl:
        "https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=600",
    description:
        "Resort mewah yang tersembunyi di tengah rimbunnya hutan tropis Ubud. Menawarkan kolam renang bertingkat tiga yang ikonik dengan pemandangan lembah sungai yang sangat menenangkan jiwa.",
    facilities: [
      "Wanna Jungle Pool",
      "Serenity Spa",
      "Floating Breakfast",
      "Free Shuttle Ubud"
    ],
    isFavorite: true,
  ),
  HotelModel(
    id: 2,
    name: "Ayana Resort & Spa",
    location: "Jimbaran, Bali",
    category: "Beachfront Ocean Resort",
    pricePerNight: 4200000,
    rating: 4.8,
    availableRooms: 8, // Sisa kamar cukup banyak
    isPopular: true,   // Status populer (Trigger Badge Stack VIP)
    imageUrl:
        "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=600",
    description:
        "Resort bintang 5 di atas tebing teluk Jimbaran dengan pemandangan sunset terbaik di Bali. Memiliki fasilitas Rock Bar yang legendaris di atas lautan lepas.",
    facilities: [
      "Rock Bar Access",
      "Private Beach",
      "12 Swimming Pools",
      "Thalassotherapy Spa"
    ],
    isFavorite: false,
  ),
  HotelModel(
    id: 3,
    name: "Platform 9 3/4 Heritage Hotel",
    location: "Malioboro, Yogyakarta",
    category: "City Heritage Luxury",
    pricePerNight: 950000,
    rating: 4.6,
    availableRooms: 0, // Kamar Penuh (Trigger Conditional Styling Habis)
    isPopular: false,
    imageUrl:
        "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=600",
    description:
        "Hotel berarsitektur kolonial klasik yang berada di kawasan strategis jantung kota Yogyakarta. Menawarkan kenyamanan akses mudah ke Malioboro dengan suasana budaya Jawa yang hangat.",
    facilities: [
      "Heritage Resto",
      "High Tea Corner",
      "Outdoor Pool",
      "Free WiFi 5G"
    ],
    isFavorite: false,
  ),
  HotelModel(
    id: 4,
    name: "Ayarana Eco Glamping Lodge",
    location: "Kintamani, Bali",
    category: "Mountain Eco Lodge",
    pricePerNight: 1200000,
    rating: 4.7,
    availableRooms: 5,
    isPopular: false,
    imageUrl:
        "https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=600",
    description:
        "Pengalaman menginap di tenda kubah transparan mewah di pinggir Danau Batur dengan latar pemandangan Gunung Batur yang spektakuler di pagi hari.",
    facilities: [
      "Sunrise Point",
      "Bonfire Area",
      "Hot Spring Bath",
      "BBQ Grill Kit"
    ],
    isFavorite: false,
  ),
];
