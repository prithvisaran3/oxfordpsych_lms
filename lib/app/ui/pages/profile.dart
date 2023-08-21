import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/font.dart';
import '../widgets/common/appbar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: commonAppBar(title: "Profile"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withOpacity(.5),
                      blurRadius: 20.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/profile.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Jaydeep Hirani',
                      style: headText(),
                    ),
                    const Text(
                      '(+91) 9820 202 202',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    menus(Icons.insert_drive_file_outlined, 'Payment History'),
                    menus(Icons.notifications_outlined, 'Notifications'),
                    menus(Icons.help_outline, 'Help & Support'),
                    menus(Icons.settings_outlined, 'Settings'),
                    menus(Icons.logout_outlined, 'Logout'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menus(icon, text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.teal,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(text)
        ],
      ),
    );
  }
}
