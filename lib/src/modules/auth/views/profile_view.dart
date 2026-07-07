import 'package:cached_network_image/cached_network_image.dart';
import 'package:efatha_tv/utils/cached.iamge.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/widgets/custom_text_field.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text(
                'Profile',
                style: GoogleFonts.outfit(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(50),
                      child: AppCachedImage(
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
                        errorWidget: Icon(Icons.person),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Noruslam Abidaya',
                style: GoogleFonts.outfit(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'noruslam@gmail.com',
                style: GoogleFonts.outfit(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              AppTextField(
                label: 'Name',
                hint: '',
                fillColor: Colors.white,
                borderColor: Colors.grey.shade200,
              ),
              const SizedBox(height: 20),
              AppTextField(
                fillColor: Colors.white,
                borderColor: Colors.grey.shade200,
                label: 'Phone Number',
                hint: '+255 768 234 567',
              ),
              const SizedBox(height: 20),
              AppTextField(
                fillColor: Colors.white,
                borderColor: Colors.grey.shade200,
                label: 'Select your gender',
                hint: 'Male',
                suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              AppTextField(
                fillColor: Colors.white,
                borderColor: Colors.grey.shade200,
                label: 'What is your Status/Host',
                hint: 'Pastor',
                suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              AppTextField(
                label: 'Email',
                hint: '@gmail.com',
                fillColor: Colors.white,
                borderColor: Colors.grey.shade200,
              ),
              const SizedBox(height: 20),
              AppTextField(
                fillColor: Colors.white,
                borderColor: Colors.grey.shade200,
                label: 'Password',
                hint: '********',
                isObscured: true,
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan.shade600,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Update Profile',
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
