import 'package:dasar_flame/pages/my_flame_game.dart'; // Mengimpor game utama yang didefinisikan dalam MyFlameGame
import 'package:flame/game.dart'; // Mengimpor kelas FlameGame dari Flame yang digunakan untuk menjalankan game
import 'package:flutter/material.dart'; // Mengimpor Material Design widget dari Flutter

// Fungsi utama yang dijalankan saat aplikasi dimulai
void main() {
  runApp(const MainApp());
}

// Kelas MainApp adalah widget utama aplikasi yang berfungsi sebagai container untuk game
class MainApp extends StatelessWidget {
  const MainApp({super.key}); // Konstruktor untuk MainApp (tidak ada state yang perlu dikelola di sini)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GameWidget(
        game: MyFlameGame(), // Memasukkan game MyFlameGame ke dalam widget GameWidget
      ),
    );
  }
}
