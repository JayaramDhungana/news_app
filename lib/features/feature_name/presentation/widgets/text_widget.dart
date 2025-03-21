import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/provider/theme_provider.dart';
import 'package:news_using_clean_architecture/features/feature_name/presentation/widgets/theme.dart';

class TextWidget extends ConsumerWidget {
  final String text;
  final Color color;
  final double size;
  final bool isBold;
  final bool isOverFlow;
  final int? maxlines;
  const TextWidget({
    super.key,
    required this.text,
    required this.color,
    required this.size,
    this.isBold = false,
    this.isOverFlow = false,
    this.maxlines,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeFromProvider = ref.watch(themeProvider).themeToChange;
    return Text(
      text,
      style: TextStyle(
        color: themeFromProvider.textTheme.titleMedium!.color,
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),

      overflow: isOverFlow ? TextOverflow.ellipsis : null,
      maxLines: maxlines,
    );
  }
}
