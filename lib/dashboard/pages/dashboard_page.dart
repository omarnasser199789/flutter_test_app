import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/util/assets_manager.dart';
import '../widgets/dashboard_app_Bar.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/dashboard_progress_indicator.dart';
import '../widgets/timeline_view.dart';

/// A professional dashboard page matching the provided design
/// Features: Progress indicator, filter tabs, timeline view, and side menu
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _filterTabController;

  // Theme constants
  static const Color _primaryColor = Color(0xFF4E46B4);
  static const Color _secondaryColor = Color(0xFF10B981);
  static const Color _warningColor = Color(0xFFF59E0B);
  static const Color _cardColor = Colors.white;
  static const Color _textPrimary = Color(0xFF111827);
  static const Color _textSecondary = Color(0xFF6B7280);


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _filterTabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _filterTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      drawer: _buildSideMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DashboardAppBar(),
            const Divider(),
            const DashboardHeader(),
            const SizedBox(height: 14,),
            _buildTabBar(),
            DashboardProgressIndicator(),
            const SizedBox(height: 14,),
            _buildAddNewButton(),
            _buildFilterTabs(),
            const SizedBox(height: 16,),
            const SafeArea(top: false, child:  TimelineView()),
          ],
        ),
      ),
    );
  }


  /// Build custom tab bar
  Widget _buildTabBar() {
    return Container(
      color: _cardColor,
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(child: _buildTabButton('Leads Detail', 0)),
            Expanded(child: _buildTabButton('Leads Timeline', 1)),
          ],
        ),
      ),
    );
  }
  Widget _buildFilterTabs() {
    return Container(
      color: _cardColor,
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(child: _buildFilterTabButton('All', 0, null)),
            Expanded(child: _buildFilterTabButton('Tasks', 1, _secondaryColor)),
            Expanded(child: _buildFilterTabButton('Logs', 2, _warningColor)),
            Expanded(child: _buildFilterTabButton('Events', 3,const Color.fromRGBO(52, 72, 240, 1))),
          ],
        ),
      ),
    );
  }

  /// Build individual tab button
  Widget _buildTabButton(String title, int index) {
    final isSelected = _tabController.index == index;
    return GestureDetector(
      onTap: () {
        _tabController.animateTo(index);
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          boxShadow: isSelected ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ] : null,
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: _textPrimary,fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,),
        ),
      ),
    );
  }

  Widget _buildFilterTabButton(String title, int index, Color? color) {
    final isSelected = _filterTabController.index == index;
    return GestureDetector(
      onTap: () {
        _filterTabController.animateTo(index);
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          boxShadow: isSelected ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ] : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(color!=null)
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
                const SizedBox(width: 8,)
              ],
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style:  Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }


  /// Build Add New button
  Widget _buildAddNewButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        color: _cardColor,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Align(
          alignment: Alignment.centerLeft,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(ImgAssets.arrow_down),
            iconAlignment: IconAlignment.end,
            label: const Text('Add New'),
            style: ElevatedButton.styleFrom(
              backgroundColor: _primaryColor,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ),
      ),
    );
  }


  /// Build professional side menu drawer
  Widget _buildSideMenu() {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          _buildDrawerHeader(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildMenuSection('MAIN', [
                  _buildMenuItem(Icons.dashboard_rounded, 'Dashboard', true),
                  _buildMenuItem(Icons.people_rounded, 'Leads', false),
                  _buildMenuItem(Icons.analytics_rounded, 'Analytics', false),
                  _buildMenuItem(Icons.campaign_rounded, 'Campaigns', false),
                ]),
                _buildMenuSection('MANAGEMENT', [
                  _buildMenuItem(Icons.settings_rounded, 'Settings', false),
                  _buildMenuItem(Icons.group_rounded, 'Team', false),
                  _buildMenuItem(Icons.integration_instructions_rounded, 'Integrations', false),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build drawer header
  Widget _buildDrawerHeader() {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [_primaryColor, Color(0xFF7C3AED)],
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child: Text(
                'MA',
                style: TextStyle(
                  color: _primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Mark Anderson',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Sales Manager',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build menu section
  Widget _buildMenuSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: _textSecondary,
              letterSpacing: 0.5,
            ),
          ),
        ),
        ...items,
      ],
    );
  }

  /// Build menu item
  Widget _buildMenuItem(IconData icon, String title, bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: isActive ? _primaryColor.withOpacity(0.1) : null,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Icon(
          icon,
          color: isActive ? _primaryColor : _textSecondary,
          size: 22,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isActive ? _primaryColor : _textPrimary,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            fontSize: 15,
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}