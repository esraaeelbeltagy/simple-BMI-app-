// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ItemWidget extends StatelessWidget {
  final Widget? child;
  final void Function()? onTap;
  final bool? isSelected  ;
  const ItemWidget({
    Key? key,
    required this.child,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.lightPrimary,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.lightPrimary,
            borderRadius: BorderRadius.circular(12),
            border: isSelected! ? Border.all(color: AppColor.pink) : Border.all(color: AppColor.lightPrimary),
          ),
          child: child,
        ),
      ),
    );
  }
}
