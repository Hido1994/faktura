import 'package:faktura/common/widget/custom_screen.dart';
import 'package:faktura/timeentry/time_entry_filter_screen.dart';
import 'package:faktura/timeentry/time_entry_form_screen.dart';
import 'package:faktura/timeentry/time_entry_list_item.dart';
import 'package:faktura/timeentry/time_entry_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class TimeEntryScreen extends StatelessWidget {
  const TimeEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: "Stundentafel",
      form: const TimeEntryFormScreen(),
      filter: const TimeEntryFilterScreen(),
      body: Consumer<TimeEntryModel>(
        builder: (context, model, child) {
          return PagedListView<int, TimeEntry>.separated(
            padding: const EdgeInsets.only(top: 20),
            separatorBuilder: (context, index) => const Divider(),
            state: model.pagingState,
            fetchNextPage:
                Provider.of<TimeEntryModel>(context, listen: false).getNextPage,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) {
                return TimeEntryListItem(entry: item);
              },
            ),
          );
        },
      ),
    );
  }
}
