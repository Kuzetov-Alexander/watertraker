// import 'package:flutter/material.dart';

// extension WidgetInsertSeparator on Iterable<Widget> {
//   /// Addition widget-separator in list widgets, where:
//   ///
//   /// [widget] - separator
//   ///
//   /// [includeToStart] - additionally adds [widget] to the start of the list
//   ///
//   /// [includeToEnd] - additionally adds [widget] to the end of the list
//   ///
//   /// Example:
//   ///
//   /// 
//   /// <Widget>[
//   ///     const SizedBox(),
//   ///     const SizedBox(),
//   ///  ].insertSeparator(const SizedBox(height: 15))
//   /// 

//   Iterable<Widget> insertSeparator(
//     Widget widget, {
//     bool includeToStart = false,
//     bool includeToEnd = false,
//   }) sync* {
//     for (var i = 0; i < length; i++) {
//       final current = elementAt(i);
//       if (i != 0 || includeToStart) {
//         yield widget;
//       }
//       yield current;
//     }

//     if (includeToEnd && length > 0) {
//       yield widget;
//     }
//   }
// }