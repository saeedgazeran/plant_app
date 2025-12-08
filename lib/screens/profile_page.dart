import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // عکس پروفایل
              Container(
                width: 150.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Constants.primaryColor.withValues(alpha: 0.5),
                    width: 5.0,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: ExactAssetImage('assets/images/profile.jpg'),
                ),
              ),

              const SizedBox(height: 20.0),

              // نام پروفایل
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ساناز امینی',
                    style: TextStyle(
                      color: Constants.blackColor,
                      fontSize: 20.0,
                      fontFamily: 'YekanBakh',
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  SizedBox(
                    height: 20.0,
                    child: Image.asset('assets/images/verified.png'),
                  ),
                ],
              ),

              const SizedBox(height: 10.0),

              // ایمیل
              Text(
                'sanaz@gmail.com',
                style: TextStyle(
                  color: Constants.blackColor.withValues(alpha: 0.4),
                  fontSize: 15.0,
                ),
              ),

              const SizedBox(height: 30.0),

              // گزینه‌های پروفایل
              Column(
                children: const [
                  BuildOptions(title: 'پروفایل من', icon: Icons.person),
                  BuildOptions(title: 'تنظیمات', icon: Icons.settings),
                  BuildOptions(title: 'اطلاع‌رسانی‌ها', icon: Icons.notifications),
                  BuildOptions(title: 'شبکه‌های اجتماعی', icon: Icons.share_rounded),
                  BuildOptions(title: 'خروج', icon: Icons.logout),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
