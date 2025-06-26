import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/res/app_colors/App_Colors.dart';
import '../custom_style/custom_size.dart';

class CustomOtpWidget extends StatelessWidget {
  final bool obscureText;

  const CustomOtpWidget({
    super.key,
    this.obscureText = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 64,
            child: TextFormField(
              obscureText: obscureText,
              obscuringCharacter: "*",
              cursorColor: const Color(0xFF010101),
              onChanged: (pin) {
                if (pin.isNotEmpty) {
                  FocusScope.of(context).nextFocus();
                }
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "*",
                hintStyle: const TextStyle(color: Color(0xFF010101)),
                border: authOutlineInputBorder,
                enabledBorder: authOutlineInputBorder,
                focusedBorder: authOutlineInputBorder.copyWith(
                  borderSide:  BorderSide(color: AppColors.primaryDeep),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: SizedBox(
            height: 64,
            child: TextFormField(
              obscureText: obscureText,
              obscuringCharacter: "*",
              cursorColor: const Color(0xFF010101),
              onChanged: (pin) {
                if (pin.isNotEmpty) {
                  FocusScope.of(context).nextFocus();
                }
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "*",
                hintStyle: const TextStyle(color: Color(0xFF010101)),
                border: authOutlineInputBorder,
                enabledBorder: authOutlineInputBorder,
                focusedBorder: authOutlineInputBorder.copyWith(
                  borderSide:  BorderSide(color: AppColors.primaryDeep),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: SizedBox(
            height: 64,
            child: TextFormField(
              obscureText: obscureText,
              obscuringCharacter: "*",
              cursorColor: const Color(0xFF010101),
              onChanged: (pin) {
                if (pin.isNotEmpty) {
                  FocusScope.of(context).nextFocus();
                }
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "*",
                hintStyle: const TextStyle(color: Color(0xFF010101)),
                border: authOutlineInputBorder,
                enabledBorder: authOutlineInputBorder,
                focusedBorder: authOutlineInputBorder.copyWith(
                  borderSide: const BorderSide(color: AppColors.primaryDeep),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: SizedBox(
            height: 64,
            child: TextFormField(
              obscureText: obscureText,
              obscuringCharacter: "*",
              cursorColor: const Color(0xFF010101),
              onChanged: (pin) {
                if (pin.isNotEmpty) {
                  FocusScope.of(context).nextFocus();
                }
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "*",
                hintStyle: const TextStyle(color: Color(0xFF010101)),
                border: authOutlineInputBorder,
                enabledBorder: authOutlineInputBorder,
                focusedBorder: authOutlineInputBorder.copyWith(
                  borderSide: const BorderSide(color: Color(0xFF4E9DA6)),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: SizedBox(
            height: 64,
            child: TextFormField(
              obscureText: obscureText,
              obscuringCharacter: "*",
              cursorColor: const Color(0xFF010101),
              onChanged: (pin) {
                if (pin.isNotEmpty) {
                  FocusScope.of(context).nextFocus();
                }
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "*",
                hintStyle: const TextStyle(color: Color(0xFF010101)),
                border: authOutlineInputBorder,
                enabledBorder: authOutlineInputBorder,
                focusedBorder: authOutlineInputBorder.copyWith(
                  borderSide: const BorderSide(color: Color(0xFF4E9DA6)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

const authOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xFF757575)),
  borderRadius: BorderRadius.all(Radius.circular(12)),
);
