import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/widgets/custom_text_feild.dart';
import 'package:fruits_hub_app/features/check_out/domains/entities/order_entity.dart';
import 'package:fruits_hub_app/features/notification/domain/entities/notification_entity.dart';
import 'package:provider/provider.dart';

import '../../../../../generated/l10n.dart';

class AddressInputSection extends StatelessWidget {
  AddressInputSection({
    super.key,
    required this.formKey,
    required this.autoValidateMode,
  });

  final GlobalKey<FormState> formKey;
  String? code;
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
                      context.read<OrderEntity>().shipingAddressEntity.name =
                          value!;
                    },
                    hintText: S.of(context).AddressInputSection_name,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormFeild(
                    onSaved: (value) {
                      context.read<OrderEntity>().shipingAddressEntity.email =
                          value!;
                    },
                    hintText: S.of(context).AddressInputSection_email,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormFeild(
                    onSaved: (value) {
                      context.read<OrderEntity>().shipingAddressEntity.address =
                          value!;
                    },
                    hintText: S.of(context).AddressInputSection_address,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormFeild(
                    onSaved: (value) {
                      context.read<OrderEntity>().shipingAddressEntity.city =
                          value!;
                    },
                    hintText: S.of(context).AddressInputSection_city,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormFeild(
                    onSaved: (value) {
                      context.read<OrderEntity>().shipingAddressEntity.floor =
                          value!;
                    },
                    hintText: S.of(context).AddressInputSection_floor,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormFeild(
                    onSaved: (value) {
                      context.read<OrderEntity>().shipingAddressEntity.phone =
                          value!;
                    },
                    hintText: S.of(context).AddressInputSection_phone,
                    textInputType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  MyWidget(),
                ],
              ),
            ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  MyWidget({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final order = context.read<OrderEntity>();
    final notification = order.notificationEntity;

    // 🛑 Null check to prevent crash
    if (notification == null) {
      return const Center(
        child: Text(
          'No coupon is currently available.',
          style: TextStyle(color: Colors.red),
        ),
      );
    }

    return CustomTextFormFeildforCopon(
      controller: _controller,
      notificationEntity: notification, // ✅ Safe to use now
      hintText: "Coupon code",
      suffixIcon: IconButton(
        icon: const Icon(Icons.check),
        onPressed: () {
          final code = _controller.text.trim();
          order.applyCouponCode(code);

          final discount = order.calulateShipingDiscount();
          final message =
              discount > 0
                  ? "Discount applied: $discount EGP"
                  : "Invalid or expired code";

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message)));
        },
      ),
      textInputType: TextInputType.text,
    );
  }
}
