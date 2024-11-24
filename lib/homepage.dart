import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Menyimpan index tab yang dipilih
  int _currentIndex = 0;

  // Daftar halaman yang ditampilkan untuk setiap tab
  final List<Widget> _pages = [
    HomeTab(),
    SettingsTab(),
    AccountTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BeadsByMela"),
      ),
      body: _pages[
          _currentIndex], // Menampilkan halaman berdasarkan tab yang dipilih
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Mengubah tab yang dipilih
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "Account",
          ),
        ],
      ),
    );
  }
}

// Halaman Home
class HomeTab extends StatelessWidget {
  final List<String> services = [
    "Ring Beads",
    "Bracelet Spiderman",
    "Bracelet Flowers",
    "Bracelet Mariposa",
    "Bracelet Butterfly",
    "Bracelet Fairy",
    "Ring Fairy",
    "Strap Phone Pink",
  ];

  final List<String> images = [
    "lib/images/produk1.jpg",
    "lib/images/produk2.jpg",
    "lib/images/produk3.jpg",
    "lib/images/produk4.jpg",
    "lib/images/produk5.jpg",
    "lib/images/produk6.jpg",
    "lib/images/produk7.jpg",
    "lib/images/produk8.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: services.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.6),
      ),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 3,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 2,
              ),
              Image.asset(
                images[index],
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  services[index],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Halaman Settings
class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Settings Page"));
  }
}

// Halaman Account
class AccountTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Account Page"));
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
