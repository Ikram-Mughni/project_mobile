class UserModel {
  final String username;
  final String password;
  final String fullName;

  UserModel({
    required this.username,
    required this.password,
    required this.fullName,
  });
}

// Kredensial Dummy untuk Validasi Login
UserModel dummyUser = UserModel(
  username: "admin",
  password: "admin",
  fullName: "Nusantara Explorer",
);

class DestinationModel {
  final int id;
  final String name;
  final String category;
  final String location;
  final int ticketPrice;
  final double rating;
  final String openHours;
  final String description;
  final String imageUrl;

  DestinationModel({
    required this.id,
    required this.name,
    required this.category,
    required this.location,
    required this.ticketPrice,
    required this.rating,
    required this.openHours,
    required this.description,
    required this.imageUrl,
  });
}

// List Data Dummy Destinasi Wisata
List<DestinationModel> destinationList = [
  DestinationModel(
    id: 1,
    name: "Candi Borobudur",
    category: "Wisata Sejarah",
    location: "Magelang, Jawa Tengah",
    ticketPrice: 50000,
    rating: 4.8,
    openHours: "06:30 - 17:00 WIB",
    description:
        "Candi Borobudur adalah candi Buddha terbesar di dunia yang dibangun pada abad ke-9. Destinasi wisata sejarah ini terkenal dengan arsitektur megalitikum yang megah dan pemandangan matahari terbit yang sangat memukau.",
    imageUrl:
        "https://images.unsplash.com/photo-1596402184320-417e7178b2cd?w=500",
  ),
  DestinationModel(
    id: 2,
    name: "Raja Ampat",
    category: "Wisata Bahari",
    location: "Papua Barat Daya",
    ticketPrice: 500000,
    rating: 4.9,
    openHours: "24 Jam",
    description:
        "Kepulauan Raja Ampat menawarkan pemandangan pulau karst gugusan Wayag dan keanekaragaman hayati bawah laut terkaya di dunia. Tempat ini merupakan surga bagi para penyelam dan pecinta alam bebas.",
    imageUrl:
        "https://images.unsplash.com/photo-1516690561799-46d8f74df9ab?w=500",
  ),
  DestinationModel(
    id: 3,
    name: "Gunung Bromo",
    category: "Wisata Alam",
    location: "Probolinggo, Jawa Timur",
    ticketPrice: 35000,
    rating: 4.7,
    openHours: "24 Jam",
    description:
        "Gunung Bromo terkenal dengan pemandangan lautan pasir yang luas, kawah aktif yang menakjubkan, serta keindahan sunrise dari Puncak Penanjakan yang sangat fenomenal di kalangan wisatawan.",
    imageUrl:
        "https://images.unsplash.com/photo-1588668214407-6ea9a6d8c272?w=500",
  ),
  DestinationModel(
    id: 4,
    name: "Taman Nasional Komodo",
    category: "Cagar Alam",
    location: "Nusa Tenggara Timur",
    ticketPrice: 150000,
    rating: 4.8,
    openHours: "07:00 - 16:00 WITA",
    description:
        "Habitat asli dari hewan purba Komodo yang merupakan kadal terbesar di bumi. Selain keanekaragaman satwa, kawasan ini juga terkenal dengan Pantai Merah Muda (Pink Beach) yang sangat langka.",
    imageUrl:
        "https://images.unsplash.com/photo-1518509562904-e7ef99cdcc86?w=500",
  ),
  DestinationModel(
    id: 5,
    name: "Danau Toba",
    category: "Wisata Alam",
    location: "Sumatera Utara",
    ticketPrice: 20000,
    rating: 4.6,
    openHours: "24 Jam",
    description:
        "Danau vulkanik terbesar di dunia yang terbentuk akibat letusan supervolcano puluhan ribu tahun lalu. Di tengah danau ini terdapat Pulau Samosir yang kaya akan budaya suku Batak yang unik.",
    imageUrl:
        "https://images.unsplash.com/photo-1544644181-1484b3fdfc62?w=500",
  ),
];
