import 'package:flutter/material.dart';
import 'package:intersect_task/features/home/data/models/filter_item_model.dart';
import 'package:intersect_task/features/home/ui/widgets/filter_list_view_item.dart';

class FiltersListView extends StatelessWidget {
  const FiltersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        filterItems.length,
        (index) => FilterListViewItem(
          item: filterItems[index],
        ),
      ),
    );
  }
}
