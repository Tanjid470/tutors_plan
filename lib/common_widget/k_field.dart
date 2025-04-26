import 'package:flutter/material.dart';
import 'package:tutors_plan/config/font_constants.dart';
import 'package:tutors_plan/config/responsive_scale.dart';
import 'package:tutors_plan/const/color_utils.dart';
import 'package:tutors_plan/const/input_border_style.dart';


class KField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? isRequiredField;
  final errorText;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final bool? hideHeadline;
  final String? hintText;
  final String? headLine;
  final IconData? icon;
  final Color? textColor;
  final Color? borderColor;
  final Color? fillColor;
  final Widget? suffix;
  final bool? enabled;
  final bool? datePicker;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final VoidCallback? forgotPassOntap;
  final bool? noPrefix;
  final bool? forgotPass;
  final void Function(String)? onChanged;
  final String? Function(String? value)? validator;
  final int? minLine;
  final int? maxLine;
  final double? borderRadius;
  final bool? readOnly;
  final Widget? prefix;
  final bool? showPassIcon;

  const KField({
    super.key,
    this.controller,
    this.isRequiredField,
    this.hintText,
    this.icon,
    this.textColor,
    this.borderColor,
    this.fillColor,
    this.suffix,
    this.headLine,
    this.keyboardType,
    this.obscureText,
    required this.errorText,
    this.onChanged,
    this.minLine,
    this.maxLine,
    this.borderRadius,
    this.readOnly,
    required this.onTap,
    this.prefix,
    this.validator,
    this.showPassIcon,
    this.forgotPass,
    this.forgotPassOntap,
    this.datePicker,
    this.noPrefix,
    this.contentPadding,
    this.enabled,
    this.hideHeadline,
  });

  @override
  State<KField> createState() => _KFieldState();
}

class _KFieldState extends State<KField> {
  bool viewPassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [widget.hideHeadline != null && true ? const SizedBox.shrink() : _headLine(), _inputField(), _forgotPassField()],
    );
  }

  Widget _inputField() {
    return TextFormField(
      enabled: widget.enabled,
      controller: widget.controller,
      minLines: widget.minLine ?? 1,
      maxLines: widget.maxLine ?? 1,
      obscureText: widget.showPassIcon != null ? viewPassword : widget.obscureText ?? false,
      keyboardType: widget.keyboardType,
      readOnly: widget.readOnly ?? false,
      onTap: () => widget.onTap != null ? widget.onTap!() : null,
      onChanged: (value) => widget.onChanged != null ? widget.onChanged!(value) : null,
      validator: widget.validator,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      style: TextStyle(
        color: widget.textColor ?? Colors.black,
        fontSize: TextSize.font16(context),
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: widget.contentPadding ??
            EdgeInsets.only(
              right: 10,
              top: 10,
              bottom: 10,
            ),
        prefix: widget.noPrefix != null && true ? Container(color: Colors.green, child: const Padding(padding: EdgeInsets.only(left: 15))) : null,
        prefixIcon: widget.noPrefix != null && true ? null : widget.prefix ?? _prefixIcon(),
        border: InputBorderStyle.border(widget.maxLine != null ? 60 / widget.maxLine! : 60, borderColor: widget.borderColor),
        focusedBorder: InputBorderStyle.focusedBorder(widget.maxLine != null ? 60 / widget.maxLine! : 60),
        enabledBorder: (widget.controller?.text ?? '').isNotEmpty
            ? InputBorderStyle.validBorder(widget.maxLine != null ? 60 / widget.maxLine! : 60, borderColor: widget.borderColor)
            : InputBorderStyle.border(widget.maxLine != null ? 60 / widget.maxLine! : 60),
        focusedErrorBorder: InputBorderStyle.focusedErrorBorder(widget.maxLine != null ? 60 / widget.maxLine! : 60),
        errorBorder: InputBorderStyle.errorBorder(widget.maxLine != null ? 60 / widget.maxLine! : 60),
        hintStyle: TextStyle(
          color: const Color(0xFF818092),
          fontSize: TextSize.font16(context),
          fontWeight: FontWeight.w300,
        ),
        hintText: widget.hintText ?? 'Your Username',
        errorText: widget.errorText == "" ? null : widget.errorText,
        errorStyle: TextStyle(
          color: ColorUtils.errorBorderColor,
          fontSize: TextSize.font12(context),
        ),
        disabledBorder: InputBorderStyle.disabledBorder(60),
        suffixIcon: widget.showPassIcon != null
            ? Padding(
          padding: EdgeInsets.only(right: 10),
          child: _suffixIcon(),
        )
            : widget.suffix,
        suffixIconConstraints: BoxConstraints(
          minHeight: 20,
        ),
        prefixIconConstraints: BoxConstraints(
          minHeight: 20,
        ),
        fillColor: widget.fillColor,
        filled: widget.fillColor != null,
      ),
    );
  }

  Widget _headLine() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (widget.headLine != null)
              Row(
                children: [
                  Text(
                    widget.headLine!,
                    style: TextStyle(fontSize: TextSize.font14(context), fontWeight: FontWeight.w500),
                  ),
                  if (widget.isRequiredField != null && true)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: Text('*',
                      style: TextStyle(
                          fontSize: TextSize.font14(context),
                          fontWeight: FontWeight.w500,
                          color: ColorUtils.errorBorderColor),
                    ),
                  ),
                ],
              ),
          ],
        ),
        SizedBox(height: ResponsiveScale.of(context).hp(1)),
      ],
    );
  }

  Widget _prefixIcon() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Icon(widget.icon,
          color: (widget.controller?.text ?? '').isNotEmpty
              ? ColorUtils.baseBlueColor
              : ColorUtils.grey300,
      ),
    );
  }

  Color _prefixColor() {
    return widget.errorText == '' && (widget.controller?.value.text ?? '').isNotEmpty ? ColorUtils.competeBorderColor : ColorUtils.inputBorderColor;
  }

  Widget _suffixIcon() {
    return GestureDetector(
        onTap: () {
          viewPassword = !viewPassword;
          setState(() {});
        },
        child: Icon(
          viewPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: viewPassword ? ColorUtils.inputBorderColor : ColorUtils.competeBorderColor,
          size: 20,
        ));
  }

  Widget _forgotPassField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.forgotPass != null && true)
          Row(
            children: [
              GestureDetector(
                onTap: widget.forgotPassOntap,
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5, top: 5, bottom: 5),
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: const Color(0xFF818092),
                            fontSize: TextSize.font14(context),
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
