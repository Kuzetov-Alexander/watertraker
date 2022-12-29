import 'package:flutter/material.dart';
import 'package:watertraker/utils/extension.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.currentPage,
    this.switcher = false,
  });

  final bool switcher;
  static const int _numberPage = 4;
  final int currentPage;

  Color _colorChange(int e) {
    if (currentPage > 1) {
      if (currentPage == e) {
        return Colors.white;
      } else {
        return const Color(0xffD9D9D9).withOpacity(0.5);
      }
    } else {
      if (currentPage == e) {
        return const Color(0xff0148FF);
      } else {
        return const Color(0xffD9D9D9);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final res = List.generate(_numberPage, (index) => index);
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: res
            .map(
              (e) => Container(
                width: 21,
                height: 7,
                decoration: ShapeDecoration(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(24.0),
                    ),
                  ),
                  color: _colorChange(e),
                ),
              ),
            )
            .insertSeparator(
              const SizedBox(width: 12),
            )
            .toList(),
      ),
    );
  }
}
