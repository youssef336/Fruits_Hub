import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruits_hub_app/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub_app/core/widgets/custom_buttom.dart';
import 'package:fruits_hub_app/features/check_out/domains/entities/order_entity.dart';
import 'package:fruits_hub_app/features/check_out/presentation/views/widgets/check_out_stage.dart';
import 'package:provider/provider.dart';

import '../../../../../generated/l10n.dart';
import 'check_out_steps_page_view.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key});

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  late PageController pageController;
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );
  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      setState(() {
        currentPageindex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  int currentPageindex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CheckOutStage(
            pageController: pageController,
            currentPageindex: currentPageindex,
          ),

          Expanded(
            child: CheckOutStepsPageView(
              autoValidateMode: valueNotifier,
              formKey: _formKey,
              pageController: pageController,
            ),
          ),
          CustomButtom(
            text: getNextButtonText(currentPageindex),
            onPressed: () {
              if (currentPageindex == 0) {
                _handleShipinngSectionValidation(context);
              } else if (currentPageindex == 1) {
                _handleAddressSectionValidation();
              } else {
                _processPayment();
                // var orderEntity = context.read<OrderEntity>();
                // context.read<OrderCubit>().addOrder(order: orderEntity);
              }
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  void _handleShipinngSectionValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(
        currentPageindex + 1,
        duration: const Duration(milliseconds: 600),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      showErrorBar(context, S.of(context).CheckOutView_Shipinng_Error);
    }
  }

  String getNextButtonText(int currentPageindex) {
    switch (currentPageindex) {
      case 0:
        return S.of(context).CheckOutView_Next;
      case 1:
        return S.of(context).CheckOutView_Next;
      case 2:
        return S.of(context).CheckOutView_PayWithPayPal;
      default:
        return S.of(context).CheckOutView_Next;
    }
  }

  void _handleAddressSectionValidation() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      pageController.animateToPage(
        currentPageindex + 1,
        duration: const Duration(milliseconds: 600),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void _processPayment() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: "",
              secretKey: "",
              transactions: const [
                {
                  "amount": {
                    "total": '70',
                    "currency": "USD",
                    "details": {
                      "subtotal": '70',
                      "shipping": '0',
                      "shipping_discount": 0,
                    },
                  },
                  "description": "The payment transaction description.",
                  // "payment_options": {
                  //   "allowed_payment_method":
                  //       "INSTANT_FUNDING_SOURCE"
                  // },
                  "item_list": {
                    "items": [
                      {
                        "name": "Apple",
                        "quantity": 4,
                        "price": '5',
                        "currency": "USD",
                      },
                      {
                        "name": "Pineapple",
                        "quantity": 5,
                        "price": '10',
                        "currency": "USD",
                      },
                    ],

                    // shipping address is not required though
                    //   "shipping_address": {
                    //     "recipient_name": "tharwat",
                    //     "line1": "Alexandria",
                    //     "line2": "",
                    //     "city": "Alexandria",
                    //     "country_code": "EG",
                    //     "postal_code": "21505",
                    //     "phone": "+00000000",
                    //     "state": "Alexandria"
                    //  },
                  },
                },
              ],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                print("onSuccess: $params");
              },
              onError: (error) {
                print("onError: $error");
                Navigator.pop(context);
              },
              onCancel: () {
                print('cancelled:');
              },
            ),
      ),
    );
  }
}
