import 'package:uuid/uuid.dart';

abstract class EditorElement {
  final String uid = Uuid().v4();
}