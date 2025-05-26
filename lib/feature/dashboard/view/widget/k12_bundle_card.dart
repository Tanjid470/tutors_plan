import 'package:flutter/material.dart';
import 'package:tutors_plan/const/color_utils.dart';

class ScholarPassBundle extends StatelessWidget {
  const ScholarPassBundle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ScholarPASS K12 Bundle',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple)),
              Text(
                'One comprehensive course covering all subjects for any K–12 grade, designed to provide complete educational support.',
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  _feature(Icons.check_circle_outline,
                      'All Subjects of any 3rd–12th Grade'),
                  _feature(Icons.group_outlined,
                      'Unlimited 1:1 or group tutoring'),
                  _feature(Icons.flash_on_outlined, 'Unlimited self-learning'),
                  _feature(Icons.emoji_events_outlined,
                      'ScholarsPASS covers \$1,000'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _priceCard('REGULAR PRICE', '\$1,500', ColorUtils.baseOrangeColorLight,textColor:Colors.deepOrangeAccent),
                  _priceCard('SCHOLARSPASS', '\$1,000',
                      Colors.deepPurple.shade50, textColor: Colors.deepPurple),
                  _priceCard('STUDENT PAYS', '\$500',
                      Colors.greenAccent.withOpacity(0.2),
                      textColor: Colors.green[800]),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text('Enroll Now',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.deepPurple),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text('Check Eligibility',
                          style: TextStyle(color: Colors.deepPurple)),
                    ),
                  ),
                ],
              )
            ],
          ),
          // Stack(
          //   children: [
          //     ClipRRect(
          //       borderRadius: BorderRadius.circular(20),
          //       child: Image.asset(
          //         'assets/images/tutorsPlan_logo.png',
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //     Positioned(
          //       bottom: 16,
          //       right: 16,
          //       child: Container(
          //         padding:
          //         EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          //         decoration: BoxDecoration(
          //           color: Colors.deepPurple,
          //           borderRadius: BorderRadius.circular(20),
          //         ),
          //         child: Row(
          //           children: [
          //             Icon(Icons.star, color: Colors.white, size: 16),
          //             SizedBox(width: 6),
          //             Text('Most Popular Choice',
          //                 style: TextStyle(color: Colors.white)),
          //           ],
          //         ),
          //       ),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget _feature(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.deepPurple),
        const SizedBox(width: 6),
        Text(text, style: TextStyle(color: Colors.grey[800])),
      ],
    );
  }

  Widget _priceCard(String label, String price, Color bgColor,
      {Color? textColor}) {
    return Expanded(
      child: Container(
        height: 90,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label,
                style: TextStyle(fontSize: 12, color: textColor ?? Colors.black)),
            const SizedBox(height: 4),
            Text(price,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor ?? Colors.black)),
          ],
        ),
      ),
    );
  }
}
