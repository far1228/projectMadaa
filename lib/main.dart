import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Controller untuk Logout
class LogoutController extends GetxController {
  void logout() {
    // Logic untuk proses logout
    Get.back(); // Tutup dialog dan kembali ke halaman sebelumnya
  }

  void cancel() {
    Get.back(); // Tutup dialog tanpa logout
  }
}

// Widget Dialog Logout
class LogoutDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LogoutController controller = Get.put(LogoutController());
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Are you sure you want to log out?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.orange.shade100,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: controller.cancel,
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade700,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: controller.logout,
                  child: const Text('Yes, logout'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// View untuk halaman Profile/Logout
class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade700,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profil Header
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150', // Ganti dengan link foto profil
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Mark',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Menu List
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person, color: Colors.amber),
                        title: const Text(
                          'My Profile',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {}, // Tambahkan fungsi
                      ),
                      ListTile(
                        leading: const Icon(Icons.location_on, color: Colors.amber),
                        title: const Text(
                          'Address',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {}, // Tambahkan fungsi
                      ),
                      ListTile(
                        leading: const Icon(Icons.payment, color: Colors.amber),
                        title: const Text(
                          'Payment',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Get.to(() => PaymentMethodsView());
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.phone, color: Colors.amber),
                        title: const Text(
                          'Contact',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {}, // Tambahkan fungsi
                      ),
                      ListTile(
                        leading: const Icon(Icons.logout, color: Colors.white),
                        title: const Text(
                          'Log out',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => LogoutDialogWidget(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// View untuk halaman Payment Methods
class PaymentMethodsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade100,
        title: const Text(
          'Payment Methods',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.money, color: Colors.orange.shade700),
            title: const Text('Cash'),
            trailing: Radio(
              value: true,
              groupValue: true,
              onChanged: (bool? value) {},
              activeColor: Colors.orange.shade700,
            ),
          ),
          ListTile(
            leading: Icon(Icons.qr_code, color: Colors.orange.shade700),
            title: const Text('QR Code'),
            trailing: Radio(
              value: false,
              groupValue: true,
              onChanged: (bool? value) {},
              activeColor: Colors.orange.shade700,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileView(),
    );
  }
}