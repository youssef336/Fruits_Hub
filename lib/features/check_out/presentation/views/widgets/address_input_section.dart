import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/widgets/custom_text_feild.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24),
          CustomTextFormFeild(
            hintText: "الاسم كامل",
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16),
          CustomTextFormFeild(
            hintText: "البريد الإلكتروني",
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16),
          CustomTextFormFeild(
            hintText: "العنوان",
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16),
          CustomTextFormFeild(
            hintText: "المدينه",
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16),
          CustomTextFormFeild(
            hintText: "رقم الطابق , رقم الشقه ..",
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16),
          CustomTextFormFeild(
            hintText: "رقم الهاتف",
            textInputType: TextInputType.phone,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
