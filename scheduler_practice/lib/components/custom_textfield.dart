import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scheduler_practice/const/colors.dart';

class CustomTextField extends StatelessWidget {
  final bool isTextField;
  final String label;
  final String initialValue;
  final FormFieldSetter<String> onSaved;

  const CustomTextField({
    required this.isTextField,
    required this.initialValue,
    required this.label,
    required this.onSaved,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: PRIMARY_COLOR),
        ),
        if (isTextField)
          Expanded(
            child: renderTextField(),
          ),
        if (!isTextField) renderTextField()
      ],
    );
  }

  Widget renderTextField() {
    return TextFormField(
      onSaved: onSaved,
      initialValue: initialValue,
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[200],
        suffixText: isTextField ? null : '시',
      ),
      validator: (String? val) {
        if (val == null || val.isEmpty) {
          return '값을 입력해주세요';
        }

        if (isTextField) {
          if (val.length > 500) {
            return '500자 이하의 글자를 입력해주세요.';
          }
        } else {
          int time = int.parse(val);

          if (time < 0) {
            return '0 이상의 숫자를 입력해 주세요';
          }

          if (time > 24) {
            return '24 이하의 숫자를 입력해 주세요';
          }
        }

        return null;
      },
      maxLines: isTextField ? null : 1,
      expands: isTextField,
      maxLength: 500,
      cursorColor: PRIMARY_COLOR,
      inputFormatters:
          isTextField ? [] : [FilteringTextInputFormatter.digitsOnly],
      keyboardType: isTextField ? TextInputType.multiline : TextInputType.number,
    );
  }
}
