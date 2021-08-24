import 'package:abstract_editor/src/models/element_type.dart';
import 'package:abstract_editor/src/models/element_view.dart';
import 'package:flutter/material.dart';

///
/// Static definition for a dynamic editor.
/// The general structure of the Image Editor never changes.
///
class ImageEditor {
  final int width;
  final int height;
  final Color backgroundColor;
  final VoidCallback onUndo;
  final VoidCallback onSave;
  final List<ElementType> elementTypes;
  final List<ElementView> elementViews;

  const ImageEditor({
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.elementTypes,
    required this.elementViews,
    required this.onSave,
    required this.onUndo,
  });
}
