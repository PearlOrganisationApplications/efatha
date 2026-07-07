import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xff2E1A72), // Purple color
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Wrap(
        spacing: 80,
        runSpacing: 30,
        alignment: WrapAlignment.spaceBetween,
        children: [
          // ================= Left =================
          SizedBox(
            width: 260,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Efatha TV",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  "Help Efatha Media to provide powerful Christian programming to believers around the world.",
                  style: TextStyle(
                    color: Colors.white70,
                    height: 1.6,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  children: const [
                    SocialCircle(Icons.facebook, Colors.blue),
                    SizedBox(width: 8),
                    SocialCircle(Icons.camera_alt, Colors.purple),
                    SizedBox(width: 8),
                    SocialCircle(Icons.play_arrow, Colors.red),
                    SizedBox(width: 8),
                    SocialCircle(Icons.close, Colors.black),
                    SizedBox(width: 8),
                    SocialCircle(Icons.chat, Colors.green),
                    SizedBox(width: 8),
                    SocialCircle(Icons.telegram, Colors.lightBlue),
                    SizedBox(width: 8),
                    SocialCircle(Icons.music_note, Colors.green),
                  ],
                ),
              ],
            ),
          ),

          _footerSection("Useful Links", [
            "Privacy Policy",
            "Terms & Conditions",
            "Latest News",
          ]),

          _footerSection("Join US", [
            "Giving",
            "Programs",
            "Prayer Request",
            "Broadcasting",
          ]),

          SizedBox(
            width: 260,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Contact US",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 18),

                Text("EFATHA TV", style: TextStyle(color: Colors.white70)),

                SizedBox(height: 8),

                Text(
                  "P.O. BOX 9392,\nDar es Salaam, Tanzania",
                  style: TextStyle(color: Colors.white70, height: 1.6),
                ),

                SizedBox(height: 10),

                Text(
                  "Mobile: +255 787 432710, +255 756866217",
                  style: TextStyle(color: Colors.white70),
                ),

                SizedBox(height: 8),

                Text(
                  "Email: info@efathatv.com",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _footerSection(String title, List<String> items) {
    return SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 18),

          ...items.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                e,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialCircle extends StatelessWidget {
  final IconData icon;
  final Color color;

  const SocialCircle(this.icon, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 14,
      backgroundColor: color,
      child: Icon(icon, color: Colors.white, size: 14),
    );
  }
}
