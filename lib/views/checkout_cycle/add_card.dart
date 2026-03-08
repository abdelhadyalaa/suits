import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'package:suits/core/ui/app_image.dart';
import 'package:suits/core/ui/app_input.dart';
import 'package:suits/views/checkout_cycle/payment.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/card_number_formatter.dart';



class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  bool isSaved = false;

  final _formKey = GlobalKey<FormState>();

  final cardRegex = RegExp(r'^[0-9]{16}$');
  final cvvRegex = RegExp(r'^[0-9]{3,4}$');
  final nameRegex = RegExp(r'^[a-zA-Z ]+$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Add Card"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 30.h),

              Center(
                child: AppImage(
                  image:
                  "https://avatars.mds.yandex.net/i?id=9d06960b8dee97d54338cfb243ae6ca0c4ba8870-5547280-images-thumbs&n=13",
                  width: double.infinity,
                  height: 200.h,
                ),
              ),

              SizedBox(height: 30.h),

              Text(
                "Card Holder Name",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
                ),
              ),

              SizedBox(height: 6.h),

              AppInput(
                radius: 10,
                hint: "John Doe",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name is required";
                  }

                  if (!nameRegex.hasMatch(value)) {
                    return "Enter valid name";
                  }

                  return null;
                },
              ),

              SizedBox(height: 15.h),

              Text(
                "Card Number",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
                ),
              ),

              SizedBox(height: 6.h),

              AppInput(
                radius: 10,
                hint: "1234 5678 9012 3456",
                keyboardType: TextInputType.number,

                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CardNumberFormatter(),
                ],

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Card number required";
                  }

                  String cardNumber = value.replaceAll(' ', '');

                  if (!cardRegex.hasMatch(cardNumber)) {
                    return "Card must be 16 digits";
                  }

                  return null;
                },
              ),

              SizedBox(height: 15.h),

              Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Expiry Date",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                          ),
                        ),

                        SizedBox(height: 6.h),

                        AppInput(
                          radius: 10,
                          hint: "MM/YY",
                          keyboardType: TextInputType.number,

                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            ExpiryDateFormatter(),
                          ],

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required";
                            }

                            if (value.length != 5) {
                              return "Invalid date";
                            }

                            final parts = value.split('/');
                            int month = int.parse(parts[0]);

                            if (month < 1 || month > 12) {
                              return "Invalid month";
                            }

                            return null;
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 20.w),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "CVV",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                          ),
                        ),

                        SizedBox(height: 6.h),

                        AppInput(
                          radius: 10,
                          hint: "123",
                          keyboardType: TextInputType.number,

                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                          ],

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required";
                            }

                            if (!cvvRegex.hasMatch(value)) {
                              return "CVV must be 3 or 4 digits";
                            }

                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              Row(
                children: [

                  Checkbox(
                    value: isSaved,
                    activeColor: Theme.of(context).primaryColor,
                    onChanged: (value) {
                      setState(() {
                        isSaved = value!;
                      });
                    },
                  ),

                  Text(
                    "Save Card",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(18.r),
        child: AppButton(
          text: "Add Card",
          height: 50.h,
          width: double.infinity,
          borderRadius: 10,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              goTo(page: Payment());
            }
          },
        ),
      ),
    );
  }
}