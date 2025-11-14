import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tuneify_app/common/colors.dart';

class ScheduleViewPage extends StatelessWidget {
  const ScheduleViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, int>> scheduleTimes = [
      {"Sun": 9},
      {"Mon": 14},
      {"Tue": 11},
      {"Wed": 16},
      {"Thu": 10},
      {"Fri": 13},
      {"Sat": 15},
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Your Schedule",
          textAlign: TextAlign.center,
          style: GoogleFonts.elMessiri(
            fontSize: 20,

            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios, size: 12),
                Column(
                  children: [
                    Text(
                      "Today",
                      style: GoogleFonts.elMessiri(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor.withValues(alpha: 0.6),
                      ),
                    ),
                    Text(
                      "${DateFormat('MMMM').format(DateTime.now())}' ${DateTime.now().day.toString()}",
                      style: GoogleFonts.elMessiri(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, size: 12),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: scheduleTimes.length,
                itemBuilder: (context, index) {
                  final day = scheduleTimes[index];
                  return _ShowScheduleInfo(
                    day: day.keys.first,
                    dayNumber: day.values.first,
                    isSelected: index == DateTime.now().weekday % 7,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ShowScheduleInfo({
    required String day,
    required int dayNumber,
    bool isSelected = false,
  }) {
    return Container(
          width: 60,
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    decoration: BoxDecoration(
      color: isSelected ? AppColors.turquoiseCardColor : Colors.transparent
    )
,
      child: Column(

        children: [
          Text(
            day,
            style: GoogleFonts.elMessiri(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textColor.withValues(alpha: 0.6),
            ),
          ),
          Text(
            dayNumber.toString(),
            style: GoogleFonts.elMessiri(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: AppColors.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
