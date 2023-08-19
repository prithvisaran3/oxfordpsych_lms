import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/font.dart';

class FavourtieCard extends StatelessWidget {
  const FavourtieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => courseDetail()));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 200,
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage('assets/images/home.jpg'),
                    fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text('BEST SELLER'),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text('4.5'),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.star,
                color: AppColors.amber,
                size: 20,
              ),
              const Icon(
                Icons.star,
                color: AppColors.amber,
                size: 20,
              ),
              const Icon(
                Icons.star,
                size: 20,
                color: AppColors.amber,
              ),
              const Icon(
                Icons.star,
                size: 20,
                color: AppColors.amber,
              ),
              const Icon(
                Icons.star_outline,
                size: 20,
                color: AppColors.amber,
              ),
            ],
          ),
          Text(
            'Generator on there internet tend',
            style: headText(),
          ),
          Row(
            children: [
              const Icon(
                Icons.person_outline,
                color: AppColors.grey,
                size: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text('Stephen Moris')
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            '\$14.50',
            style: TextStyle(
                color: AppColors.primary, fontFamily: 'medium', fontSize: 18),
          )
        ],
      ),
    );
  }
}
