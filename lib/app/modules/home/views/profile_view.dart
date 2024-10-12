import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../widgets/menu_item_widget.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade700,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profil Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Obx(() => CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(controller.userPhoto.value),
                  )),
                  const SizedBox(width: 16),
                  Obx(() => Text(
                    controller.userName.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Menu List
            Expanded(
              child: ListView(
                children: [
                  MenuItemWidget(
                    icon: Icons.shopping_bag,
                    title: 'My Orders',
                    onTap: () {},
                  ),
                  MenuItemWidget(
                    icon: Icons.person,
                    title: 'My Profile',
                    onTap: () {},
                  ),
                  MenuItemWidget(
                    icon: Icons.location_on,
                    title: 'Address',
                    onTap: () {},
                  ),
                  MenuItemWidget(
                    icon: Icons.payment,
                    title: 'Payment',
                    onTap: () {},
                  ),
                  MenuItemWidget(
                    icon: Icons.phone,
                    title: 'Contact',
                    onTap: () {},
                  ),
                  const Divider(color: Colors.white),
                  MenuItemWidget(
                    icon: Icons.logout,
                    title: 'Log out',
                    onTap: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}