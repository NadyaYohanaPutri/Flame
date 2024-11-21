import 'dart:async';
import 'dart:ui';

// Import komponen game yang diperlukan
import 'package:dasar_flame/component/asteroid_spawner.dart';  // Pemicu asteroid
import 'package:dasar_flame/component/bgParallaxComponent.dart'; // Komponen latar belakang parallax
import 'package:dasar_flame/component/ship.dart'; // Kapal dalam game
import 'package:flame/events.dart'; // Untuk menangani event-event seperti drag
import 'package:flame/game.dart'; // Untuk membuat dan mengelola game dengan Flame

// Kelas utama game yang mewarisi kelas FlameGame untuk game engine dan PanDetector untuk mendeteksi gerakan drag
class MyFlameGame extends FlameGame with PanDetector {
  // Deklarasi variabel untuk komponen-komponen dalam game
  late Ship s;              // Kapal (Ship)
  late Bgparallaxcomponent bgparallax;  // Komponen latar belakang parallax
  late AsteroidSpawner asp; // Pemicu asteroid (AsteroidSpawner)

  // onLoad() dipanggil ketika game mulai, digunakan untuk menambahkan komponen ke dalam game
  @override
  FutureOr<void> onLoad() async {
    // Membuat instance komponen Bgparallaxcomponent dan menambahkannya ke dalam game
    bgparallax = Bgparallaxcomponent();
    add(bgparallax);

    // Membuat instance kapal (Ship) dan menambahkannya ke dalam game
    s = Ship();
    add(s);

    // Membuat instance AsteroidSpawner dan menambahkannya ke dalam game
    asp = AsteroidSpawner();
    add(asp);
  }

  // onPanUpdate() menangani pergerakan layar sentuh atau drag yang dilakukan oleh pemain
  @override
  void onPanUpdate(DragUpdateInfo info) {
    // Mengatur tujuan kapal berdasarkan posisi layar sentuh yang didapatkan
    s.setTujuan(info);
  }

  // Update dipanggil setiap frame, di sini kita memperbarui logika game
  @override
  void update(double dt) {
    // Mengubah kecepatan latar belakang parallax berdasarkan posisi kapal
    bgparallax.changeSpeedBasedShip(s);
    
    // Panggil update() dari FlameGame untuk memperbarui komponen lainnya
    super.update(dt);
  }

  // Mengatur warna latar belakang game
  @override
  Color backgroundColor() {
    return const Color(0xFF000045); // Latar belakang ungu gelap
  }
}
