import 'package:flutter/material.dart';

class TimelineView extends StatefulWidget {
  const TimelineView({super.key});

  @override
  State<TimelineView> createState() => _TimelineViewState();
}

class _TimelineViewState extends State<TimelineView> {

  static const Color _primaryColor = Color(0xFF4E46B4);
  static const Color _secondaryColor = Color(0xFF10B981);
  static const Color _warningColor = Color(0xFFF59E0B);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30,right: 30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color.fromRGBO(220, 218, 240, 1),  // Border color
            width: 1.0,          // Border width
          ),
          borderRadius: BorderRadius.circular(12), // Optional: rounded corners
        ),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _buildTimelineItem(
              'Oct 22',
              'Task title name',
              'this is a place to add any comment and note\nis a place to add any comment and note',
              _secondaryColor,
              hasCheckbox: true,
            ),
            _buildTimelineItem(
                'Nov 3',
                'Logs title name',
                'this is a place to add any comment and note\nis a place to add any comment and note',
                _warningColor,
                hasSelected: true
            ),
            _buildTimelineItem(
              'Nov 3',
              'Logs title name',
              'this is a place to add any comment and note\nis a place to add any comment and note',
              _warningColor,
            ),
            _buildTimelineItem(
              'Nov 3',
              'Logs title name',
              'this is a place to add any comment and note\nis a place to add any comment and note',
              _warningColor,
            ),
          ],
        ),
      ),
    );


  }

  /// Build individual timeline item
  Widget _buildTimelineItem(
      String date,
      String title,
      String description,
      Color color, {
        bool hasCheckbox = false,
        bool hasSelected = false,
      }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Date column
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
              color: hasSelected?_primaryColor:_primaryColor.withOpacity(0.3),
            ),
          ],
        ),
        const SizedBox(width: 20,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 18,),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                description,
                maxLines: 3,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(color: const Color.fromRGBO(90, 89, 98, 1)),
              ),
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
