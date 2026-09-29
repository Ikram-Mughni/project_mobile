// ============================================================================
// MODEL & DUMMY DATA - APLIKASI RENTAL MOBIL IMPIAN ("DriveRent")
// ============================================================================
// File ini berfungsi sebagai pusat penyediaan data statis (Dummy Data) dan 
// definisi struktur data (Class Model) untuk simulasi Kuis Praktikum Mobile.
// ============================================================================

/// [UserModel]
/// Model data untuk menampung informasi kredensial login pengguna.
/// Digunakan pada proses autentikasi statis di LoginPage.
class UserModel {
  final String username; // Username untuk verifikasi login
  final String password; // Password untuk verifikasi login
  final String fullName; // Nama lengkap user yang akan dipassing ke HomePage / ProfilePage

  UserModel({
    required this.username,
    required this.password,
    required this.fullName,
  });
}

/// [dummyUser]
/// Kredensial Pengguna Statis (Single Source of Truth untuk Login)
/// Gunakan username 'pengemudi' dan password 'sewamobil123' untuk masuk ke aplikasi.
UserModel dummyUser = UserModel(
  username: "admin",
  password: "admin",
  fullName: "Budi Pengendara",
);

/// [CarModel]
/// Model data utama yang merepresentasikan objek armada mobil rental.
/// Memiliki beragam tipe data (int, String, double, bool) untuk memenuhi standar Kuis Modul 1-4.
class CarModel {
  final int id;                   // [int] Identifier unik untuk tiap item mobil
  final String brand;            // [String] Merk pabrikan mobil (misal: Toyota, Honda, Hyundai)
  final String modelName;        // [String] Nama seri / tipe mobil (misal: Civic RS, Fortuner VRZ)
  final String type;             // [String] Kategori jenis bodi (misal: Sedan, SUV, Electric, MPV)
  final int rentalPricePerDay;   // [int] Biaya sewa mobil per hari dalam Rupiah (IDR)
  final double rating;           // [double] Rating ulasan kepuasan pelanggan (Skala 1.0 - 5.0)
  final String transmission;     // [String] Tipe transmisi kendaraan (Otomatis / Manual)
  final int capacity;            // [int] Kapasitas maksimum jumlah penumpang (Orang)
  final String description;      // [String] Deskripsi rinci fitur, spesifikasi, dan keunggulan mobil
  final String imageUrl;         // [String] URL tautan gambar mobil dari Unsplash / CDN
  final bool isAvailable;        // [bool] Status ketersediaan mobil untuk disewa (Tersedia / Dipesan)
  bool isFavorite;               // [bool] Status favorit/like mobil (Dapat diubah via setState)

  CarModel({
    required this.id,
    required this.brand,
    required this.modelName,
    required this.type,
    required this.rentalPricePerDay,
    required this.rating,
    required this.transmission,
    required this.capacity,
    required this.description,
    required this.imageUrl,
    required this.isAvailable,
    this.isFavorite = false,
  });
}

/// [carList]
/// Daftar koleksi produk armada mobil rental yang akan ditayangkan di HomePage (ListView / GridView).
/// Berisi 5 pasang objek mobil dengan atribut bervariasi.
List<CarModel> carList = [
  CarModel(
    id: 1,
    brand: "Honda",
    modelName: "Civic RS Turbo",
    type: "Sedan Premium",
    rentalPricePerDay: 1200000,
    rating: 4.9,
    transmission: "Otomatis CVT",
    capacity: 5,
    description:
        "Honda Civic RS menawarkan desain sporty yang memikat dengan mesin 1.5L VTEC Turbo bertenaga tinggi. Dilengkapi dengan teknologi Honda SENSING, interior kulit mewah, dan paddle shift untuk pengalaman mengemudi yang sangat responsif.",
    imageUrl:
        "https://images.unsplash.com/photo-1606152421802-db97b9c7a11b?w=600",
    isAvailable: true,
  ),
  CarModel(
    id: 2,
    brand: "Hyundai",
    modelName: "Ioniq 5 Signature",
    type: "Electric Vehicle (EV)",
    rentalPricePerDay: 1500000,
    rating: 4.8,
    transmission: "Otomatis Single Speed",
    capacity: 5,
    description:
        "Mobil listrik futuristik dengan kemampuan pengisian daya super cepat Ultra-Fast Charging. Menawarkan ruang kabin yang sangat luas, panoramic sunroof, serta fitur Vehicle-to-Load (V2L) untuk mensuplai daya listrik ke perangkat outdoor.",
    imageUrl:
        "https://images.unsplash.com/photo-1549399542-7e3f8b79c341?w=600",
    isAvailable: true,
  ),
  CarModel(
    id: 3,
    brand: "Toyota",
    modelName: "Fortuner VRZ GR Sport",
    type: "SUV Gagah",
    rentalPricePerDay: 1350000,
    rating: 4.7,
    transmission: "Otomatis 6-Speed",
    capacity: 7,
    description:
        "SUV 7-seater tangguh yang siap menerjang segala medan. Dibekali mesin diesel 2.8L berkekuatan besar, sistem penggerak roda yang stabil, serta interior bernuansa GR Sport yang elegan dan siap menemani perjalanan jarak jauh bersama keluarga.",
    imageUrl:
        "https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?w=600",
    isAvailable: false,
  ),
  CarModel(
    id: 4,
    brand: "BMW",
    modelName: "330i M Sport",
    type: "Luxury Sedan",
    rentalPricePerDay: 2500000,
    rating: 5.0,
    transmission: "Otomatis Steptronic",
    capacity: 5,
    description:
        "Sedan mewah khas Jerman yang menggabungkan performa mesin TwinPower Turbo dengan handling yang presisi. Fitur komplit meliputi Harman Kardon Surround Sound System, Live Cockpit Professional, dan balutan kulit Vernasca yang sangat eksklusif.",
    imageUrl:
        "https://images.unsplash.com/photo-1555215695-3004980ad54e?w=600",
    isAvailable: true,
  ),
  CarModel(
    id: 5,
    brand: "Mitsubishi",
    modelName: "Xpander Ultimate",
    type: "MPV Keluarga",
    rentalPricePerDay: 600000,
    rating: 4.6,
    transmission: "Otomatis CVT",
    capacity: 7,
    description:
        "Mobil keluarga paling populer dengan suspensi halus dan kabin yang sangat senyap. Dilengkapi ground clearance tinggi, banyak tempat penyimpanan, port charger di setiap baris, serta efisiensi bahan bakar yang luar biasa hemat.",
    imageUrl:
        "https://images.unsplash.com/photo-1552519507-da3b142c6e3d?w=600",
    isAvailable: true,
  ),
];
