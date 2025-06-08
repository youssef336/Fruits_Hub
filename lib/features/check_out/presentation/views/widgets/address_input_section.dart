import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/widgets/custom_text_feild.dart';
import 'package:fruits_hub_app/features/check_out/domains/entities/order_entity.dart';
import 'package:provider/provider.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({
    super.key,
    required this.formKey,
    required this.autoValidateMode,
  });
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> autoValidateMode;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: autoValidateMode,
        builder:
            (context, value, child) => Form(
              key: formKey,
              autovalidateMode: value,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  CustomTextFormFeild(
                    onSaved: (value) {
                      context.read<OrderEntity>().shipingAddressEntity!.name =
                          value!;
                    },
                    hintText: "الاسم كامل",
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormFeild(
                    onSaved: (value) {
                      context.read<OrderEntity>().shipingAddressEntity!.email =
                          value!;
                    },
                    hintText: "البريد الإلكتروني",
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormFeild(
                    onSaved: (value) {
                      context
                          .read<OrderEntity>()
                          .shipingAddressEntity!
                          .address = value!;
                    },
                    hintText: "العنوان",
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormFeild(
                    onSaved: (value) {
                      context.read<OrderEntity>().shipingAddressEntity!.city =
                          value!;
                    },
                    hintText: "المدينه",
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormFeild(
                    onSaved: (value) {
                      context.read<OrderEntity>().shipingAddressEntity!.floor =
                          value!;
                    },
                    hintText: "رقم الطابق , رقم الشقه ..",
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormFeild(
                    onSaved: (value) {
                      context.read<OrderEntity>().shipingAddressEntity!.phone =
                          value!;
                    },
                    hintText: "رقم الهاتف",
                    textInputType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
      ),
    );
  }
}
