import 'package:flutter/material.dart';
import '../../../../Theme/dashboard_colors.dart';
import '../../../../core/util/functions.dart';
import '../../data/model/dashboard_data.dart';

/// A widget that displays a vertical timeline with customizable events (tasks, logs, events).
class TimelineView extends StatefulWidget {
  const TimelineView({super.key, required this.data, required this.filterTabController});

  final DashboardData data; // Data source containing tasks, logs, and events
  final TabController filterTabController; // Controls selected tab for filtering

  @override
  State<TimelineView> createState() => _TimelineViewState();
}

class _TimelineViewState extends State<TimelineView> {
  @override
  Widget build(BuildContext context) {
    // Get selected tab index
    final index = widget.filterTabController.index;

    // Merge all items into a single list with unified structure
    final allItems = <Map<String, dynamic>>[
      ...widget.data.tasks.map((task) => {
        'type': 'task',
        'date': DateTime.parse(task['createdAt']),
        'title': task['title'] ?? 'Task title',
        'description': task['description'] ?? '',
        'color': DashboardColors.secondary,
        'hasCheckbox': true, // Task can be marked as done/undone
      }),
      ...widget.data.clientLogs.map((log) => {
        'type': 'log',
        'date': DateTime.parse(log.createdAt),
        'title': 'Log #${log.id}',
        'description': log.comments,
        'color': DashboardColors.warning,
        'hasSelected': true, // Visually indicate selected logs
      }),
      ...widget.data.clientEvents.map((event) => {
        'type': 'event',
        'date': DateTime.parse(event.startDate),
        'title': 'Event #${event.id}',
        'description': event.description,
        'color': DashboardColors.primary,
      }),
    ];

    // Filter data based on selected tab
    final filteredItems = allItems.where((item) {
      switch (index) {
        case 1: return item['type'] == 'task';
        case 2: return item['type'] == 'log';
        case 3: return item['type'] == 'event';
        default: return true; // Show all items
      }
    }).toList();

    // Sort the filtered items in descending order of date
    filteredItems.sort((a, b) => b['date'].compareTo(a['date']));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color.fromRGBO(220, 218, 240, 1),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        // Show message if no items found
        child: filteredItems.isEmpty
            ? Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Text(
              'No items to display.',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        )
            : ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredItems.length,
          itemBuilder: (context, index) {
            final item = filteredItems[index];
            return _buildTimelineItem(
              date: formatDate(item['date']),
              title: item['title'],
              description: item['description'],
              color: item['color'],
              hasCheckbox: item['hasCheckbox'] ?? false,
              hasSelected: item['hasSelected'] ?? false,
            );
          },
        ),
      ),
    );
  }

  /// Builds a single row item in the timeline view.
  Widget _buildTimelineItem({
    required String date,
    required String title,
    required String description,
    required Color color,
    bool hasCheckbox = false,
    bool hasSelected = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Date column on the left
        SizedBox(
          width: 60,
          child: Text(
            date,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),

        // Vertical timeline line
        Column(
          children: [
            Container(
              width: 3,
              height: 90,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              color: hasSelected
                  ? DashboardColors.primary
                  : DashboardColors.primary.withOpacity(0.3), // Faded if not selected
            ),
          ],
        ),

        const SizedBox(width: 20),

        // Main content column
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title row with colored circle
              Row(
                children: [
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Description text
              Text(
                description,
                maxLines: 3,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: const Color.fromRGBO(90, 89, 98, 1),
                ),
              ),

              // Optional checkbox for task-related actions
              if (hasCheckbox) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: DashboardColors.primary,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Mark as undone',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
