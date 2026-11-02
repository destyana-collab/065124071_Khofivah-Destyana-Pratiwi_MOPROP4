import 'package:flutter/material.dart';
import 'package:notes_app/pages/contact_app/contact_home.dart';
import 'package:notes_app/pages/notes_app/notes_home.dart';
import 'package:notes_app/pages/notes_app/sqlite_contact_page.dart';
import 'package:notes_app/pages/sembast_contact_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MainHomePage(),
    );
  }
}

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Main App Dashboard',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo[800],
        elevation: 4,
      ),
      body: Container(
        color: Colors.grey[100],
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 1. Notes App
                _buildAppMenuItem(
                  title: 'Notes App',
                  storage: 'Storage: shared_preference',
                  buttonColor: Colors.amber[800]!,
                  icon: Icons.note_alt,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotesHomePage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),

                // 2. Contact App
                _buildAppMenuItem(
                  title: 'Contact App',
                  storage: 'Storage: hive',
                  buttonColor: Colors.lightBlue[700]!,
                  icon: Icons.contacts,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ContactHomePage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),

                // 3. SQLite Contact App
                _buildAppMenuItem(
                  title: 'SQLite Contact App',
                  storage: 'Storage: SQLite (Sqflite)',
                  buttonColor: Colors.blue[800]!,
                  icon: Icons.storage,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SqliteContactPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),

                // 4. Sembast Contact App
                _buildAppMenuItem(
                  title: 'Sembast Contact App',
                  storage: 'Storage: Sembast Web',
                  buttonColor: Colors.purple[700]!,
                  icon: Icons.web,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SembastContactPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppMenuItem({
    required String title,
    required String storage,
    required Color buttonColor,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 400),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: buttonColor.withOpacity(0.1),
                child: Icon(icon, color: buttonColor),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      storage,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: onPressed,
              icon: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
              label: const Text(
                'Buka Aplikasi',
                style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}