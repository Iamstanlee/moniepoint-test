import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate_moniepoint_test/core/utils/assets.dart';
import 'package:real_estate_moniepoint_test/core/utils/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    this.padding,
    this.onChange,
    this.focusNode,
    required this.hint,
    required TextEditingController searchController,
  })  : _searchController = searchController,
        super(key: key);

  final TextEditingController _searchController;
  final String hint;
  final EdgeInsets? padding;
  final Function(String?)? onChange;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(top: 28, bottom: 32),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 8),
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36.0),
          color: const Color(0xFFF2F2FD),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            focusNode: focusNode,
            controller: _searchController,
            keyboardType: TextInputType.text,
            onChanged: onChange,
            cursorHeight: 18,
            cursorColor: kContrastColor,
            scrollPadding: EdgeInsets.zero,
            style: const TextStyle(
              color: kBlack,
              fontSize: 14,
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
              prefixIcon: SizedBox(
                width: 36,
                child: Center(
                    child: SvgPicture.asset(
                  SvgAssets.searchIcon,
                  colorFilter: const ColorFilter.mode(kBlack, BlendMode.srcIn),
                )),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
              hintStyle: const TextStyle(
                color: kIndicatorColor,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
