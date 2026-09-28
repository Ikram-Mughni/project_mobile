class UserModel {
  final String username;
  final String password;
  final String name;

  UserModel({
    required this.username,
    required this.password,
    required this.name,
  });
}

// Data dummy User untuk validasi login
UserModel dummyUser = UserModel(
  username: "user123",
  password: "pass123",
  name: "ikram",
);

class ItemModel {
  final int id;
  final String title;
  final String subtitle;
  final String description;
  final String imageUrl;
  final int price;

  ItemModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

// Data dummy List Item
List<ItemModel> itemList = [
  ItemModel(
    id: 1,
    title: "Laptop Gaming Super",
    subtitle: "Elektronik / Komputer",
    description:
        "Laptop gaming dengan performa tinggi dilengkapi dengan prosessor generasi terbaru dan kartu grafis kencang untuk kebutuhan komputasi berat.",
    imageUrl:
        "https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=500",
    price: 15000000,
  ),
  ItemModel(
    id: 2,
    title: "Smartphone Flagship",
    subtitle: "Elektronik / Gadget",
    description:
        "Smartphone canggih dengan kamera resolusi tinggi, layar AMOLED yang jernih, dan daya tahan baterai seharian penuh.",
    imageUrl:
        "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=500",
    price: 8500000,
  ),
  ItemModel(
    id: 3,
    title: "Headphone Wireless",
    subtitle: "Aksesoris / Audio",
    description:
        "Headphone nirkabel dengan fitur Noise Cancelling aktif yang menghasilkan kualitas suara jernih dan bass mendalam.",
    imageUrl:
        "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500",
    price: 1200000,
  ),
  ItemModel(
    id: 4,
    title: "Smartwatch Sport",
    subtitle: "Aksesoris / Wearable",
    description:
        "Jam tangan pintar untuk memantau aktivitas olahraga, detak jantung, pola tidur, dan notifikasi ponsel secara real-time.",
    imageUrl:
        "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500",
    price: 2500000,
  ),
];
