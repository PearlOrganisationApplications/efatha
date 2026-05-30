import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../shared/widgets/action_card.dart';
import 'donate_view.dart';
import 'mobile_payment_view.dart';
import 'global_giving_view.dart';
import 'wire_transfer_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class GivingHubView extends StatelessWidget {
  const GivingHubView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GIVING',
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff04A3DA),

                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 70,

                    //    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: Text(
                        "DONATE",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(30),
                Expanded(
                  child: Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 70,
                    //    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xff04A3DA),

                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "MOBILE GIVING",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff04A3DA),

                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 70,

                    //    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: Text(
                        "GLOBAL GIVING",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(30),
                Expanded(
                  child: Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 70,
                    //    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xff04A3DA),

                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "WIRE TRANSFER",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
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
