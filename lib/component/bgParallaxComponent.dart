import 'dart:async';
import 'package:dasar_flame/component/ship.dart';  // Mengimpor kelas Ship untuk referensi objek kapal
import 'package:flame/components.dart';  // Mengimpor komponen Flame untuk memudahkan pengelolaan game
import 'package:flame/parallax.dart';  // Mengimpor komponen Parallax untuk efek latar belakang parallax
import 'package:flutter/painting.dart';  // Mengimpor ImageRepeat untuk pengulangan gambar

// Kelas Bgparallaxcomponent yang mengelola latar belakang parallax
class Bgparallaxcomponent extends ParallaxComponent with HasGameRef {
  // Daftar gambar latar belakang yang akan digunakan untuk efek parallax
  final _parallelImage = [
    ParallaxImageData("parallax/bkgd_0.png"),  // Gambar pertama
    ParallaxImageData("parallax/bkgd_1.png"),  // Gambar kedua
    ParallaxImageData("parallax/bkgd_2.png"),  // Gambar ketiga
    ParallaxImageData("parallax/bkgd_3.png"),  // Gambar keempat
    ParallaxImageData("parallax/bkgd_4.png"),  // Gambar kelima
    ParallaxImageData("parallax/bkgd_5.png"),  // Gambar keenam
    ParallaxImageData("parallax/bkgd_6.png"),  // Gambar ketujuh
  ];

  // Metode ini dipanggil ketika komponen dimuat ke dalam game
  @override
  FutureOr<void> onLoad() async {
    // Memuat gambar-gambar latar belakang untuk parallax dengan kecepatan dasar tertentu
    parallax = await game.loadParallax(
      _parallelImage, // Gambar yang akan digunakan
      baseVelocity: Vector2(0, -10), // Kecepatan dasar gerakan latar belakang (mengarah ke atas)
      velocityMultiplierDelta: Vector2(1, 1), // Pengganda kecepatan untuk setiap lapisan parallax
      repeat: ImageRepeat.repeat, // Mengatur gambar untuk diulang (repeat) secara horizontal dan vertikal
    );
  }

  // Fungsi untuk mengubah kecepatan parallax berdasarkan posisi kapal
  void changeSpeedBasedShip(Ship player) {
    // Jika parallax sudah dimuat, ubah kecepatan dasarnya berdasarkan arah kapal
    if (parallax != null) {
      parallax!.baseVelocity = player.arah * 10;  // Mengalikan arah kapal dengan faktor kecepatan untuk efek parallax
    }
  }
}
