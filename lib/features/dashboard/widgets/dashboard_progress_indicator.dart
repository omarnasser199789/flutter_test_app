import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../dashboard_colors.dart';

/// Dashboard progress indicator showing lead status progression
///
/// Features:
/// - Visual timeline with step indicators (completed, current, upcoming)
/// - Step labels below each indicator
/// - Linear progress bar at the bottom
/// - Responsive design that adapts to screen width
class DashboardProgressIndicator extends StatelessWidget {
  const DashboardProgressIndicator({super.key});

  // Progress configuration
  static const double _progressValue = 0.2; // 20% completion (0.0 to 1.0)
  static const int _currentStepIndex = 2; // Current step (0-based index)

  // Layout constants
  static const double _horizontalPadding = 30.0;
  static const double _timelineHeight = 90.0;
  static const double _indicatorSize = 20.0;
  static const double _currentStepDotSize = 5.0;
  static const double _checkIconSize = 10.0;
  static const double _connectorBorderWidth = 1.0;
  static const double _progressBarHeight = 3.0;
  static const double _contentPadding = 8.0;
  static const double _progressBarStartSpacing = 8.0;

  // Step configuration - represents the lead management workflow
  static const List<String> _stepLabels = [
    'New',
    'Contacted',
    'Nurturing',
    'Unqualified',
    'Qualified',
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
      child: Column(
        children: [
          // Horizontal timeline showing step progression
          _buildTimelineSection(screenSize),

          // Linear progress bar showing overall completion
          _buildProgressBarSection(),
        ],
      ),
    );
  }

  /// Builds the main timeline section with step indicators and labels
  Widget _buildTimelineSection(Size screenSize) {
    return SizedBox(
      height: _timelineHeight,
      width: screenSize.width,
      child: Timeline.tileBuilder(
        scrollDirection: Axis.horizontal,
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemCount: _stepLabels.length,
          indicatorBuilder: (context, index) => _buildStepIndicator(index, screenSize),
          connectorBuilder: (context, index, _) => _buildStepConnector(index),
          contentsBuilder: (context, index) => _buildStepLabel(context, index),
        ),
      ),
    );
  }

  /// Builds the linear progress bar section
  Widget _buildProgressBarSection() {
    return Row(
      children: [
        const SizedBox(width: _progressBarStartSpacing),
        Expanded(
          child: LinearProgressIndicator(
            value: _progressValue,
            backgroundColor: DashboardColors.primary.withOpacity(0.3),
            color: DashboardColors.primary,
            minHeight: _progressBarHeight,
          ),
        ),
      ],
    );
  }

  /// Builds step indicator based on completion status
  ///
  /// Returns different indicators for:
  /// - Completed steps: Filled circle with checkmark
  /// - Current step: Outlined circle with filled center dot
  /// - Upcoming steps: Empty outlined circle
  Widget _buildStepIndicator(int index, Size screenSize) {
    if (index < _currentStepIndex) {
      return _buildCompletedIndicator();
    } else if (index == _currentStepIndex) {
      return _buildCurrentStepIndicator(screenSize);
    } else {
      return _buildUpcomingIndicator();
    }
  }

  /// Builds indicator for completed steps (filled with checkmark)
  Widget _buildCompletedIndicator() {
    return const DotIndicator(
      size: _indicatorSize,
      color: DashboardColors.primary,
      child: Icon(
        Icons.check,
        color: Colors.white,
        size: _checkIconSize,
      ),
    );
  }

  /// Builds indicator for current step (outlined with center dot)
  Widget _buildCurrentStepIndicator(Size screenSize) {
    return OutlinedDotIndicator(
      borderWidth: _connectorBorderWidth,
      size: _indicatorSize,
      color: DashboardColors.primary,
      child: Center(
        child: Container(
          width: _currentStepDotSize,
          height: _currentStepDotSize,
          decoration: BoxDecoration(
            color: DashboardColors.primary,
            borderRadius: BorderRadius.circular(screenSize.width), // Creates perfect circle
          ),
        ),
      ),
    );
  }

  /// Builds indicator for upcoming steps (empty outline)
  Widget _buildUpcomingIndicator() {
    return const OutlinedDotIndicator(
      size: _indicatorSize,
      borderWidth: _connectorBorderWidth,
      color: DashboardColors.upcomingColor,
    );
  }

  /// Builds connector line between step indicators
  ///
  /// Uses primary color for completed connections,
  /// grey for upcoming connections
  Widget _buildStepConnector(int index) {
    final bool isCompleted = index < _currentStepIndex;

    return SolidLineConnector(
      color: isCompleted ? DashboardColors.primary : DashboardColors.upcomingColor,
    );
  }

  /// Builds step label text below each indicator
  Widget _buildStepLabel(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(_contentPadding),
      child: Text(
        _stepLabels[index],
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(color:
        index==2 ?DashboardColors.primary:const Color.fromRGBO(90, 89, 98, 1)),

      ),
    );
  }
}