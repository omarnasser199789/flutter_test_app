import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../Theme/dashboard_colors.dart';
import '../../../../core/util/assets_manager.dart';
import '../bloc/bloc.dart';
import '../widgets/dashboard_app_Bar.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/dashboard_progress_indicator.dart';
import '../widgets/side_menu.dart';
import '../widgets/timeline_view.dart';

/// Dashboard screen displaying leads management interface with tabs and filters
///
/// Features:
/// - Two main tabs: Leads Detail and Leads Timeline
/// - Four filter categories: All, Tasks, Logs, Events
/// - Progress indicator and timeline view
/// - Add new item functionality
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with TickerProviderStateMixin {
  // Tab controllers
  late TabController _mainTabController;     // Controls main tabs (Leads Detail / Timeline)
  late TabController _filterTabController;   // Controls filter tabs (All / Tasks / Logs / Events)

  // Layout constants
  static const double _horizontalPadding = 30.0;
  static const double _tabContainerPadding = 4.0;
  static const double _tabBorderRadius = 10.0;
  static const double _tabButtonBorderRadius = 6.0;
  static const double _spacingSmall = 8.0;
  static const double _spacingMedium = 14.0;
  static const double _spacingLarge = 16.0;
  static const double _filterDotSize = 14.0;

  // Tab configuration
  static const int _mainTabCount = 2;
  static const int _filterTabCount = 4;

  bool loading = false;

  @override
  void initState() {
    super.initState();
    _initializeTabControllers();
  }

  @override
  void dispose() {
    _disposeTabControllers();
    super.dispose();
  }

  /// Initialize tab controllers with proper length
  void _initializeTabControllers() {
    _mainTabController = TabController(length: _mainTabCount, vsync: this);
    _filterTabController = TabController(length: _filterTabCount, vsync: this);
  }

  /// Clean up tab controllers to prevent memory leaks
  void _disposeTabControllers() {
    _mainTabController.dispose();
    _filterTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => sl<DashboardBloc>(),
        child: BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
          loading = (state is Loading) ? true : false;
          if (state is Empty) {
            BlocProvider.of<DashboardBloc>(context).add(GetDashboardDataEvent());
          }else if(state is SuccessGetDashboardData){

            print(state.entity.data.tasks);
            return Scaffold(
              backgroundColor: Theme.of(context).cardColor,
              drawer: const SideMenu(),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    // Top navigation bar
                    const DashboardAppBar(),

                    // Visual separator
                    const Divider(),

                    // User info and summary section
                    const DashboardHeader(),

                    const SizedBox(height: _spacingMedium),

                    // Main tab switcher (Leads Detail / Timeline)
                    _buildMainTabBar(),

                    // Progress visualization
                    const DashboardProgressIndicator(),

                    const SizedBox(height: _spacingMedium),

                    // Action button for adding new items
                    _buildAddNewButton(),

                    // Filter tabs (All / Tasks / Logs / Events)
                    _buildFilterTabBar(),

                    const SizedBox(height: _spacingLarge),

                    // Main content area with timeline
                    SafeArea(
                      top: false,
                      child: TimelineView(data: state.entity.data, filterTabController: _filterTabController,),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Scaffold(
            body: Center(child: CircularProgressIndicator(color: DashboardColors.primary,)),
          );
        })
    );
  }

  /// Builds the main tab bar for switching between Leads Detail and Timeline
  Widget _buildMainTabBar() {
    return _buildTabContainer(
      child: Row(
        children: [
          Expanded(
            child: _buildMainTabButton(
              title: 'Leads Detail',
              index: 0,
            ),
          ),
          Expanded(
            child: _buildMainTabButton(
              title: 'Leads Timeline',
              index: 1,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the filter tab bar with colored category indicators
  Widget _buildFilterTabBar() {
    return _buildTabContainer(
      child: Row(
        children: [
          Expanded(
            child: _buildFilterTabButton(
              title: 'All',
              index: 0,
              indicatorColor: null, // No color indicator for "All"
            ),
          ),
          Expanded(
            child: _buildFilterTabButton(
              title: 'Tasks',
              index: 1,
              indicatorColor: DashboardColors.secondary,
            ),
          ),
          Expanded(
            child: _buildFilterTabButton(
              title: 'Logs',
              index: 2,
              indicatorColor: DashboardColors.warning,
            ),
          ),
          Expanded(
            child: _buildFilterTabButton(
              title: 'Events',
              index: 3,
              indicatorColor: DashboardColors.events,
            ),
          ),
        ],
      ),
    );
  }

  /// Creates a consistent container wrapper for tab bars
  Widget _buildTabContainer({required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
      child: Container(
        padding: const EdgeInsets.all(_tabContainerPadding),
        decoration: BoxDecoration(
          color: DashboardColors.tabBackground,
          borderRadius: BorderRadius.circular(_tabBorderRadius),
        ),
        child: child,
      ),
    );
  }

  /// Builds a clickable tab button for the main tab bar
  Widget _buildMainTabButton({
    required String title,
    required int index,
  }) {
    final bool isSelected = _mainTabController.index == index;

    return GestureDetector(
      onTap: () => _handleMainTabTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: _buildTabButtonDecoration(isSelected),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: _buildTabButtonTextStyle(context, isSelected),
        ),
      ),
    );
  }

  /// Builds a clickable filter tab button with optional color indicator
  Widget _buildFilterTabButton({
    required String title,
    required int index,
    Color? indicatorColor,
  }) {
    final bool isSelected = _filterTabController.index == index;

    return GestureDetector(
      onTap: () => _handleFilterTabTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: _buildTabButtonDecoration(isSelected),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Color indicator dot (if provided)
            if (indicatorColor != null) ...[
              _buildColorIndicatorDot(indicatorColor),
              const SizedBox(width: _spacingSmall),
            ],

            // Tab title
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }

  /// Creates a circular color indicator dot for filter categories
  Widget _buildColorIndicatorDot(Color color) {
    return Container(
      width: _filterDotSize,
      height: _filterDotSize,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  /// Builds the "Add New" button with icon and proper styling
  Widget _buildAddNewButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Align(
          alignment: Alignment.centerLeft,
          child: ElevatedButton.icon(
            onPressed: _handleAddNewButtonTap,
            icon: SvgPicture.asset(ImgAssets.arrow_down),
            iconAlignment: IconAlignment.end,
            label: const Text('Add New'),
            style: _buildAddNewButtonStyle(),
          ),
        ),
      ),
    );
  }

  /// Creates consistent decoration for tab buttons
  BoxDecoration _buildTabButtonDecoration(bool isSelected) {
    return BoxDecoration(
      color: isSelected ? Colors.white : Colors.transparent,
      borderRadius: BorderRadius.circular(_tabButtonBorderRadius),
      boxShadow: isSelected ? _buildSelectedTabShadow() : null,
    );
  }

  /// Creates subtle shadow for selected tabs
  List<BoxShadow> _buildSelectedTabShadow() {
    return [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 2,
        offset: const Offset(0, 1),
      ),
    ];
  }

  /// Creates text style for tab buttons based on selection state
  TextStyle _buildTabButtonTextStyle(BuildContext context, bool isSelected) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
    );
  }

  /// Creates button style for the "Add New" button
  ButtonStyle _buildAddNewButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: DashboardColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }

  // Event handlers

  /// Handles main tab selection and updates UI
  void _handleMainTabTap(int index) {
    _mainTabController.animateTo(index);
    setState(() {}); // Trigger rebuild to update UI
  }

  /// Handles filter tab selection and updates UI
  void _handleFilterTabTap(int index) {
    _filterTabController.animateTo(index);
    setState(() {}); // Trigger rebuild to update UI
  }

  /// Handles "Add New" button tap
  /// TODO: Implement actual add new functionality
  void _handleAddNewButtonTap() {
    // TODO: Navigate to add new item screen or show dialog
    debugPrint('Add New button tapped');
  }
}