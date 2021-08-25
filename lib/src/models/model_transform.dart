import 'dart:math';

import 'package:flutter/material.dart';

class Transform with ChangeNotifier {
  Transform([
    this._localOffset = const Offset(0, 0),
    this._size = const Size(128.0, 128.0),
    this._angle = 0.0,
  ]);

  ///
  /// Private backing
  ///

  Offset _localOffset = Offset.zero;

  double _angle;

  Size _size;

  ///
  /// Getters
  ///

  Offset get localOffset => _localOffset;

  double get angle => _angle;

  double get width => _size.width;

  double get height => _size.height;

  double get top => localOffset.dy;

  double get left => localOffset.dx;

  //Rect get renderRectangle => getGlobalPaintBounds();

  Size get size => _size;

  ///
  /// Setters
  ///

  set angle(double a) {
    _angle = a;
    notifyListeners();
  }

  set width(double v) {
    _size = Size(v, height);
    notifyListeners();
  }

  set height(double v) {
    _size = Size(width, v);
    notifyListeners();
  }

  set localOffset(Offset offset) {
    _localOffset = offset;
    notifyListeners();
  }

  ///
  /// Methods
  ///

  void addOffset(
      Offset offset, {
        double minX = 0.0,
        double minY = 0.0,
        double maxX = double.infinity,
        double maxY = double.infinity,
      }) {
    _localOffset = _localOffset.translate(
      offset.dx * cos(angle) + (-sin(angle)) * offset.dy,
      offset.dx * sin(angle) + offset.dy * cos(angle),
    );
    _localOffset = Offset(
      _localOffset.dx.clamp(minX, maxX),
      _localOffset.dy.clamp(minY, maxY),
    );
    notifyListeners();
  }

  void rotateTowards(Offset globalPointerLocation, GlobalKey globalKey) {
    final paintBounds = getGlobalPaintBounds(globalKey);
    if (paintBounds != null) {
      final center = paintBounds.center;
      final direction = (globalPointerLocation - center).direction;
      angle = direction;
    }
  }

  void addOffsetToSize(
      Offset enlargement, {
        double minWidth = 0.0,
        double minHeight = 0.0,
        double maxWidth = double.infinity,
        maxHeight = double.infinity,
      }) {
    _size = Size(
      (_size.width + enlargement.dx).clamp(minWidth, maxWidth),
      (_size.height + enlargement.dy).clamp(minHeight, maxHeight) as double,
    );
    notifyListeners();
  }

  Rect getRect() =>
      Rect.fromLTWH(localOffset.dx, localOffset.dy, width, height);

  @override
  String toString() {
    return "{Size:($_size),Offset:$localOffset}";
  }
}

Rect? getGlobalPaintBounds(GlobalKey key) {
  try {
    final renderObject = key.currentContext?.findRenderObject();
    if (renderObject!=null && renderObject.attached) {
      var translation = renderObject.getTransformTo(null).getTranslation();
      return renderObject.paintBounds.shift(
        Offset(translation.x, translation.y),
      );
    }
    return null;
  } catch (e) {
    return null;
  }
}