import 'package:flutter/material.dart';

/// A widget that displays a vertical timeline with customizable events.
class TimelineView extends StatefulWidget {
  const TimelineView({super.key});

  @override
  State<TimelineView> createState() => _TimelineViewState();
}

class _TimelineViewState extends State<TimelineView> {
  // Define theme colors for reuse
  static const Color _primaryColor = Color(0xFF4E46B4);     // For timeline lines and checkboxes
  static const Color _secondaryColor = Color(0xFF10B981);   // For success markers
  static const Color _warningColor = Color(0xFFF59E0B);     // For warning markers

  @override
  Widget build(BuildContext context) {
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
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _buildTimelineItem(
              date: 'Oct 22',
              title: 'Task title name',
              description: 'This is a place to add any comment and note\nIt is a place to add any comment and note',
              color: _secondaryColor,
              hasCheckbox: true,
            ),
            _buildTimelineItem(
              date: 'Nov 3',
              title: 'Logs title name',
              description: 'This is a place to add any comment and note\nIt is a place to add any comment and note',
              color: _warningColor,
              hasSelected: true,
            ),
            _buildTimelineItem(
              date: 'Nov 3',
              title: 'Logs title name',
              description: 'This is a place to add any comment and note\nIt is a place to add any comment and note',
              color: _warningColor,
            ),
            _buildTimelineItem(
              date: 'Nov 3',
              title: 'Logs title name',
              description: 'This is a place to add any comment and note\nIt is a place to add any comment and note',
              color: _warningColor,
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a single timeline item row.
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
        // Left column showing the date
        SizedBox(
          width: 60,
          child: Text(
            date,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),

        // Timeline line
        Column(
          children: [
            Container(
              width: 3,
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              color: hasSelected
                  ? _primaryColor
                  : _primaryColor.withOpacity(0.3), // Dim line if not selected
            ),
          ],
        ),

        const SizedBox(width: 20),

        // Right section with content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title with colored circle
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
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Description
              Text(
                description,
                maxLines: 3,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: const Color.fromRGBO(90, 89, 98, 1),
                ),
              ),

              // Optional checkbox action
              if (hasCheckbox) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: _primaryColor,
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
