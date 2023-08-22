import 'package:flutter/material.dart';
import '../widgets/common/appbar.dart';

import '../widgets/favourtie.dart';

class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(
        centerTitle: false,
        title: "Favourite",
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.65, crossAxisSpacing: 8.0),
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const FavouriteCard();
        },
      ),
    );
  }
}
