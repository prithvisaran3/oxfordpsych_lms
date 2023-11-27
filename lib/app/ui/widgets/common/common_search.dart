import 'package:flutter/material.dart';

import '../../../controller/course.dart';

class CommonSearch extends StatelessWidget {
  const CommonSearch(
      {Key? key,
      required this.controller,
      this.validator,
      this.enabled = true,
      this.onTap})
      : super(key: key);
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool enabled;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled == true ? null : onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
              )
            ]),
        child: TextFormField(
          style: const TextStyle(color: Colors.black),
          controller: controller,
          validator: validator,
          enabled: enabled,
          onChanged: (value) {
            if (value.length >= 3) {
              Future.delayed(const Duration(seconds: 1), () {
                CourseController.to.getCourse(search: value);
              });
            } else if (value.isEmpty) {
              CourseController.to.pageNumber = 1;
              CourseController.to
                  .getCourse(isInitial: false, curriculumId: "2");
            }
          },
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search, color: Colors.black54),
            hintStyle: TextStyle(color: Colors.grey.shade400),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          ),
        ),
      ),
    );
  }
}
