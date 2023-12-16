import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../theme/colors.dart';
import '../../theme/font_size.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty(
      {Key? key,
      required this.emptyString,
      this.isShowButton = true,
      required this.image})
      : super(key: key);
  final String emptyString;
  final String image;
  final bool isShowButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 200),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/$image',
            height: 100,
            color: AppColors.primary,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(emptyString,
              textAlign: TextAlign.center,
              style: mediumText(color: AppColors.primary)),
          // const SizedBox(
          //   height: 20,
          // ),
          // const Text(
          //   'Go a head, order some items \n from the menu',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(color: AppColors.grey),
          // ),
          const SizedBox(
            height: 20,
          ),
          isShowButton == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 30),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Add Items',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'medium',
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

class Empty extends StatelessWidget {
  const Empty({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        SvgPicture.asset(
          'assets/svgs/no_data.svg',
          height: 150,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: regularText(),
        ),
      ],
    ));
  }
}
