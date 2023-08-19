import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/common/appbar.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: commonAppBar(
            centerTitle: false, title: "Categories", isBackIcon: true),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 15,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return category(Icons.design_services, 'Designing');
                        })
                  ],
                ),
              ),
              searchbar(),
            ],
          ),
        ));
  }

  Widget category(icon, text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.teal,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                text,
                style: const TextStyle(fontFamily: 'medium', fontSize: 16),
              ),
            ),
          ),
          const Icon(
            Icons.arrow_forward,
            color: Colors.black87,
            size: 20,
          )
        ],
      ),
    );
  }

  searchbar() {
    return SizedBox(
      height: 50,
      child: TextFormField(
        style: const TextStyle(color: AppColors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search here...',
          prefixIcon: const Icon(Icons.search, color: AppColors.black),
          hintStyle: const TextStyle(color: AppColors.grey),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: AppColors.grey,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: AppColors.grey,
              )),
          fillColor: AppColors.white,
        ),
      ),
    );
  }
}
