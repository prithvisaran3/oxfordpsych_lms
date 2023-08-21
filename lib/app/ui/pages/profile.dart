import 'package:deviraj_lms/app/controller/profile.dart';
import 'package:deviraj_lms/app/ui/widgets/profile/smalldetails_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    ProfileController.to.profileName.text = "Prithvi Saran";
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: commonAppBar(title: "Profile", isSubscribeIcon: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.black,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey,
                      )
                    ],
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    "${ProfileController.to.profileName.text.split(" ").first[0]}${ProfileController.to.profileName.text.split(" ").last[0]} ",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              Text(
                "${ProfileController.to.profileName.text}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(
                "(3 days left)",
                style: TextStyle(color: AppColors.primary),
              ),

              // Row(
              //   children: [
              //     SmallDetailsBox(title: "Total", content: "5"),
              //     SmallDetailsBox(title: "Completed", content: "25"),
              //     SmallDetailsBox(title: "Completed", content: "25"),
              //   ],
              // )
              // const SizedBox(
              //   height: 25,
              // ),

              // Container(
              //   margin: const EdgeInsets.symmetric(horizontal: 10),
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: AppColors.white,
              //     boxShadow: [
              //       BoxShadow(
              //         color: AppColors.grey.withOpacity(.5),
              //         blurRadius: 20.0,
              //       ),
              //     ],
              //   ),
              //   child: Column(
              //     children: [
              //       Container(
              //         height: 80,
              //         width: 80,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(20),
              //             image: const DecorationImage(
              //                 image: AssetImage('assets/images/profile.jpg'),
              //                 fit: BoxFit.cover)),
              //       ),
              //       const SizedBox(
              //         height: 10,
              //       ),
              //       Text(
              //         'Jaydeep Hirani',
              //         style: headText(),
              //       ),
              //       const Text(
              //         '(+91) 9820 202 202',
              //         style: TextStyle(fontSize: 16, color: Colors.grey),
              //       ),
              //       const SizedBox(
              //         height: 20,
              //       ),
              //       menus(Icons.insert_drive_file_outlined, 'Payment History'),
              //       menus(Icons.notifications_outlined, 'Notifications'),
              //       menus(Icons.help_outline, 'Help & Support'),
              //       menus(Icons.settings_outlined, 'Settings'),
              //       menus(Icons.logout_outlined, 'Logout'),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
