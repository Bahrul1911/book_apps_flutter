
import 'package:book_apps/models/view_type.dart';

class MenuItem{

  static const List<ViewType> items = [listView, gridView];
  static const listView = ViewType(title: "List");
  static const gridView = ViewType(title: "Grid");
}
