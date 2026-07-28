import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/atom-one-dark.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../engines/study_page_builder/rendered_document.dart';
import '../../../settings/presentation/preferences_provider.dart';
import '../../../settings/domain/reader_preferences.dart';

// Helper to get Google Font
TextStyle _getFont(String family, {double? fontSize, double? height, Color? color, FontWeight? fontWeight}) {
  try {
    return GoogleFonts.getFont(family, fontSize: fontSize, height: height, color: color, fontWeight: fontWeight);
  } catch (e) {
    return TextStyle(fontFamily: family, fontSize: fontSize, height: height, color: color, fontWeight: fontWeight);
  }
}

class StudyTitleWidget extends ConsumerWidget {
  final StudyTitleBlock block;
  const StudyTitleWidget({super.key, required this.block});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(readerPreferencesProvider);
    return Padding(
      padding: EdgeInsets.only(bottom: prefs.paragraphSpacing),
      child: Text(block.title, style: _getFont(prefs.fontFamily, fontSize: prefs.fontSize * prefs.headingScale * 1.5, height: 1.2, fontWeight: FontWeight.w700, color: prefs.theme.textColor))
    );
  }
}

class StudySectionWidget extends ConsumerWidget {
  final StudySectionBlock block;
  const StudySectionWidget({super.key, required this.block});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(readerPreferencesProvider);
    return Padding(
      padding: EdgeInsets.only(top: prefs.paragraphSpacing * 1.5, bottom: prefs.paragraphSpacing * 0.5),
      child: Text(block.heading, style: _getFont(prefs.fontFamily, fontSize: prefs.fontSize * prefs.headingScale, height: 1.3, fontWeight: FontWeight.w600, color: prefs.theme.textColor))
    );
  }
}

class StudyParagraphWidget extends ConsumerWidget {
  final StudyParagraphBlock block;
  const StudyParagraphWidget({super.key, required this.block});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(readerPreferencesProvider);
    return Padding(
      padding: EdgeInsets.only(bottom: prefs.paragraphSpacing),
      child: Text(block.text, style: _getFont(prefs.fontFamily, fontSize: prefs.fontSize, height: prefs.lineHeight, color: prefs.theme.textColor))
    );
  }
}

class CodeBlockWidget extends ConsumerStatefulWidget {
  final CodeBlock block;
  const CodeBlockWidget({super.key, required this.block});
  @override
  ConsumerState<CodeBlockWidget> createState() => _CodeBlockWidgetState();
}

class _CodeBlockWidgetState extends ConsumerState<CodeBlockWidget> {
  bool _isWrapped = false;
  
  @override
  Widget build(BuildContext context) {
    final prefs = ref.watch(readerPreferencesProvider);
    
    return Container(
      margin: EdgeInsets.only(bottom: prefs.paragraphSpacing, top: prefs.paragraphSpacing * 0.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color(0xFF282C34),
        border: Border.all(color: Colors.white10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.black26,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.block.language.toUpperCase(), style: const TextStyle(color: Colors.white54, fontSize: 12, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(_isWrapped ? Icons.wrap_text : Icons.notes, color: Colors.white54, size: 20),
                      tooltip: _isWrapped ? 'Disable Wrap' : 'Wrap Lines',
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => setState(() => _isWrapped = !_isWrapped),
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const Icon(Icons.copy, color: Colors.white54, size: 20),
                      tooltip: 'Copy Code',
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: widget.block.code));
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Code copied to clipboard')));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: _isWrapped ? const NeverScrollableScrollPhysics() : const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width - 32),
              child: Container(
                width: _isWrapped ? MediaQuery.of(context).size.width - 32 : null,
                padding: const EdgeInsets.all(16.0),
                child: HighlightView(
                  widget.block.code,
                  language: widget.block.language,
                  theme: atomOneDarkTheme,
                  padding: EdgeInsets.zero,
                  textStyle: GoogleFonts.jetBrainsMono(
                    fontSize: prefs.codeFontSize,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageBlockWidget extends ConsumerWidget {
  final ImageBlock block;
  const ImageBlockWidget({super.key, required this.block});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(readerPreferencesProvider);
    Widget imageWidget;
    if (block.url.startsWith('http')) {
      imageWidget = Image.network(block.url, semanticLabel: block.altText, fit: BoxFit.contain);
    } else {
      imageWidget = Image.file(File(block.url), semanticLabel: block.altText, fit: BoxFit.contain);
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: prefs.paragraphSpacing),
      child: ClipRRect(borderRadius: BorderRadius.circular(8), child: imageWidget),
    );
  }
}

class QuoteBlockWidget extends ConsumerWidget {
  final QuoteBlock block;
  const QuoteBlockWidget({super.key, required this.block});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(readerPreferencesProvider);
    return Container(
      margin: EdgeInsets.symmetric(vertical: prefs.paragraphSpacing),
      padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
      decoration: BoxDecoration(border: Border(left: BorderSide(color: Theme.of(context).colorScheme.primary, width: 4.0))),
      child: Text(block.text, style: _getFont(prefs.fontFamily, fontSize: prefs.fontSize, height: prefs.lineHeight, color: prefs.theme.textColor.withOpacity(0.7), fontWeight: FontWeight.w400).copyWith(fontStyle: FontStyle.italic)),
    );
  }
}

class ListBlockWidget extends ConsumerWidget {
  final ListBlock block;
  const ListBlockWidget({super.key, required this.block});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(readerPreferencesProvider);
    return Padding(
      padding: EdgeInsets.only(bottom: prefs.paragraphSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(block.items.length, (index) {
          final prefix = block.isOrdered ? '${index + 1}. ' : '• ';
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(prefix, style: _getFont(prefs.fontFamily, fontSize: prefs.fontSize, height: prefs.lineHeight, color: prefs.theme.textColor, fontWeight: FontWeight.bold)),
                Expanded(child: Text(block.items[index].text, style: _getFont(prefs.fontFamily, fontSize: prefs.fontSize, height: prefs.lineHeight, color: prefs.theme.textColor))),
              ]
            )
          );
        }),
      ),
    );
  }
}

class DividerBlockWidget extends ConsumerWidget {
  final DividerBlock block;
  const DividerBlockWidget({super.key, required this.block});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(readerPreferencesProvider);
    return Padding(padding: EdgeInsets.symmetric(vertical: prefs.paragraphSpacing * 1.5), child: Divider(color: prefs.theme.textColor.withOpacity(0.1)));
  }
}

class TableBlockWidget extends ConsumerWidget {
  final TableBlock block;
  const TableBlockWidget({super.key, required this.block});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(readerPreferencesProvider);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: prefs.paragraphSpacing),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Table(
          border: TableBorder.all(color: prefs.theme.textColor.withOpacity(0.2)),
          defaultColumnWidth: const IntrinsicColumnWidth(),
          children: block.rows.map((row) {
            return TableRow(
              children: row.map((cell) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(cell, style: _getFont(prefs.fontFamily, fontSize: prefs.fontSize * 0.9, height: 1.4, color: prefs.theme.textColor)),
              )).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CalloutBlockWidget extends ConsumerWidget {
  final CalloutBlock block;
  const CalloutBlockWidget({super.key, required this.block});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(readerPreferencesProvider);
    
    Color bgColor;
    IconData icon;
    Color iconColor;

    switch (block.calloutType) {
      case 'warning':
        bgColor = Colors.orange.withOpacity(0.1);
        icon = Icons.warning_amber_rounded;
        iconColor = Colors.orange;
        break;
      case 'tip':
        bgColor = Colors.green.withOpacity(0.1);
        icon = Icons.lightbulb_outline;
        iconColor = Colors.green;
        break;
      default:
        bgColor = Theme.of(context).colorScheme.primary.withOpacity(0.1);
        icon = Icons.info_outline;
        iconColor = Theme.of(context).colorScheme.primary;
    }

    return Container(
      margin: EdgeInsets.only(bottom: prefs.paragraphSpacing),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: iconColor.withOpacity(0.2)),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 12),
          Expanded(child: Text(block.text, style: _getFont(prefs.fontFamily, fontSize: prefs.fontSize, height: prefs.lineHeight, color: prefs.theme.textColor))),
        ],
      ),
    );
  }
}

class ComplexityTableWidget extends ConsumerWidget {
  final ComplexityTableBlock block;
  const ComplexityTableWidget({super.key, required this.block});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(readerPreferencesProvider);
    return Container(
      margin: EdgeInsets.only(bottom: prefs.paragraphSpacing),
      decoration: BoxDecoration(
        color: prefs.theme.surfaceColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: prefs.theme.textColor.withOpacity(0.1)),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Time Complexity', style: _getFont(prefs.fontFamily, fontSize: prefs.fontSize, fontWeight: FontWeight.bold, color: prefs.theme.textColor)), Text(block.timeComplexity, style: GoogleFonts.jetBrainsMono(fontSize: prefs.codeFontSize, color: prefs.theme.textColor))]),
          Divider(color: prefs.theme.textColor.withOpacity(0.1), height: 24),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Space Complexity', style: _getFont(prefs.fontFamily, fontSize: prefs.fontSize, fontWeight: FontWeight.bold, color: prefs.theme.textColor)), Text(block.spaceComplexity, style: GoogleFonts.jetBrainsMono(fontSize: prefs.codeFontSize, color: prefs.theme.textColor))])
        ]
      )
    );
  }
}



// Helper function to render a block, used in StudyViewerScreen and KnowledgeSearchScreen
Widget buildStudyBlockWidget(StudyBlock block) {
  if (block is StudyTitleBlock) return StudyTitleWidget(block: block);
  if (block is StudySectionBlock) return StudySectionWidget(block: block);
  if (block is StudyParagraphBlock) return StudyParagraphWidget(block: block);
  if (block is CodeBlock) return CodeBlockWidget(block: block);
  if (block is ComplexityTableBlock) return ComplexityTableWidget(block: block);

  if (block is ImageBlock) return ImageBlockWidget(block: block);
  if (block is QuoteBlock) return QuoteBlockWidget(block: block);
  if (block is ListBlock) return ListBlockWidget(block: block);
  if (block is DividerBlock) return DividerBlockWidget(block: block);
  if (block is TableBlock) return TableBlockWidget(block: block);
  if (block is CalloutBlock) return CalloutBlockWidget(block: block);
  return const SizedBox.shrink();
}
