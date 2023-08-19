import 'package:flutter/material.dart';
import '../widgets/common/appbar.dart';
import '../widgets/favourtie.dart';

class Favourtie extends StatelessWidget {
  const Favourtie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(
        centerTitle: false,
        title: "Favourtie",
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.7, crossAxisSpacing: 8.0),
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const FavourtieCard();
        },
      ),
    );
  }
}
