import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MainHomePage(),
    );
  }
}

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main App'),
        backgroundColor: Colors.brown[700], // Warna marun/cokelat tua sesuai gambar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 1. Notes App
              _buildAppMenuItem(
                title: 'Notes App',
                storage: 'Storage: shared_preference',
                onPressed: () {
                  // Navigasi ke Notes App
                },
              ),
              const SizedBox(height: 32),

              // 2. Contact App
              _buildAppMenuItem(
                title: 'Contact App',
                storage: 'Storage: hive',
                onPressed: () {
                  // Navigasi ke Contact App (Hive)
                },
              ),
              const SizedBox(height: 32),

              // 3. SQLite Contact App
              _buildAppMenuItem(
                title: 'SQLite Contact App',
                storage: 'Storage: SQLite (Sqflite)',
                onPressed: () {
                  // Navigasi ke SQLite App
                },
              ),
              const SizedBox(height: 32),

              // 4. Sembast Contact App
              _buildAppMenuItem(
                title: 'Sembast Contact App',
                storage: 'Storage: Sembast Web',
                onPressed: () {
                  // Navigasi ke Sembast App
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper untuk merapikan item menu agar seragam
  Widget _buildAppMenuItem({
    required String title,
    required String storage,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          storage,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown[750], // Warna tombol merah marun
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          ),
          onPressed: onPressed,
          child: const Text(
            'Buka Aplikasi',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ],
    );
  }
}