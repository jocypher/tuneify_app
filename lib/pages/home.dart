import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuneify_app/common/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _cardView = [
      {
        "noOfSpecialist": 25,
        "healthPersonnelType": "Mental Coaches",
        "color": AppColors.turquoiseCardColor,
      },
      {
        "noOfSpecialist": 18,
        "healthPersonnelType": "Pyschologists",
        "color": AppColors.orangeCardColor,
      },
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome, Cora R.",
                      style: GoogleFonts.elMessiri(
                        color: AppColors.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "How are you feeling today ?",
                      style: GoogleFonts.elMessiri(
                        color: AppColors.textColor.withValues(alpha: 0.6),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _shortInfo(infoName: "Sleep", infoDetails: "7h 12m"),
                  VerticalDivider(
                    color: AppColors.textColor.withValues(alpha: 0.5),
                    thickness: 1,
                    indent: 10,
                    width: 20,
                  ),
                  _shortInfo(infoName: "Heart rate", infoDetails: "74 b/h"),
                  VerticalDivider(
                    color: AppColors.textColor.withValues(alpha: 0.5),
                    thickness: 1,
                    indent: 10,
                    width: 20,
                  ),
                  _shortInfo(infoName: "Awareness", infoDetails: "20 mins"),
                ],
              ),
            ),

            const SizedBox(height: 35),
            _showHeading(headingName: "Our specialist", subInfo: "see all"),
            const SizedBox(height: 10),
            SizedBox(
              height: 130,

              child: PageView.builder(
                controller: PageController(
                  viewportFraction:
                      0.6, // Shows a portion of the adjacent pages
                  initialPage: 0,
                ),
                padEnds: false,
                itemCount: 2,
                itemBuilder: (context, index) {
                  final card = _cardView[index];
                  return _showCardDetails(
                    noOfSpecialist: card['noOfSpecialist'],
                    healthPersonnelType: card['healthPersonnelType'],
                    color: card['color'],
                  );
                },
              ),
            ),
            const SizedBox(height: 35),
            _showHeading(headingName: "Your Schedule", subInfo: "see more"),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _shortInfo({required String infoName, required String infoDetails}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          infoName,
          style: GoogleFonts.elMessiri(
            color: AppColors.textColor.withValues(alpha: 0.7),
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          infoDetails,
          style: GoogleFonts.elMessiri(
            color: AppColors.textColor,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _showCardDetails({
    required int noOfSpecialist,
    required String healthPersonnelType,
    required Color color,
  }) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      width: double.infinity,
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(color: color),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$noOfSpecialist specialists",
            style: GoogleFonts.elMessiri(
              color: AppColors.textColor.withValues(alpha: 0.6),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            healthPersonnelType,
            style: GoogleFonts.elMessiri(
              color: AppColors.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          // Stack(
          //   children: [
          //     Positioned(
          //       top: 10,
          //       bottom: 5,
          //       child: Container(
          //       width: 38,
          //       height: 38,
          //       decoration: BoxDecoration(
          //         color: AppColors.textColor,
          //         borderRadius: BorderRadius.circular(100),
          //         border: Border.all(color: Colors.white, width: 2),
          //       ),
          //     ))
             
          //   ],
          // ),
          
        ],
      ),
    );
  }

  Widget _showHeading({required String headingName, required String subInfo}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headingName,
          style: GoogleFonts.elMessiri(
            color: AppColors.textColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),

        Text(
          subInfo,
          style: GoogleFonts.elMessiri(
            color: AppColors.textColor.withValues(alpha: 0.5),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
