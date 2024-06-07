import 'package:flutter/material.dart';

class InfoDropDown extends StatefulWidget {
  const InfoDropDown(
      {Key? key,
      this.dropdownvalue,
      this.isExpanded = true,
      this.iconColor,
      this.hintText,
      this.height,
      this.borderColor,
      this.hintColor,
      this.trailingWidget,
      this.hintFontSize = 12,
      this.items,
      required this.onChanged})
      : super(key: key);
  final String? dropdownvalue, hintText;
  final List<DropdownMenuItem<String>>? items;
  final bool? isExpanded;
  final Widget? trailingWidget;
  final Color? iconColor, borderColor, hintColor;
  final void Function(String?)? onChanged;
  final double? height, hintFontSize;
  @override
  State<InfoDropDown> createState() => _InfoDropDownState();
}

class _InfoDropDownState extends State<InfoDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 45,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: widget.borderColor ?? Colors.grey,
        ),
      ),
      child: DropdownButton(
          value: widget.dropdownvalue,
          icon: widget.trailingWidget ?? const Icon(Icons.arrow_drop_down),
          hint: Text(
            widget.hintText ?? "Select",
            style: TextStyle(
                color: widget.hintColor ?? Colors.grey,
                fontSize: widget.hintFontSize),
          ),
          iconEnabledColor: widget.iconColor ?? Colors.purple,
          isExpanded: widget.isExpanded ?? true,
          underline: const SizedBox(),
          style: const TextStyle(color: Colors.black),
          items: widget.items ??
              const [
                DropdownMenuItem(
                  value: "Mr.",
                  child: Text("Mr."),
                ),
                DropdownMenuItem(
                  value: "Mrs.",
                  child: Text(
                    "Mrs.",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                DropdownMenuItem(
                  value: "Ms.",
                  child: Text("Ms."),
                )
              ],
          onChanged: widget.onChanged ?? (value) {}),
    );
  }
}
