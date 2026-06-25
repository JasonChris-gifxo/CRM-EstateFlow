import 'package:flutter/material.dart';

void main() {
  runApp(const EstateFlowApp());
}

class EstateFlowApp extends StatelessWidget {
  const EstateFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EstateFlow',
      theme: ThemeData(
        primaryColor: const Color(0xFF006591),
        scaffoldBackgroundColor: const Color(0xFFF7F9FB),
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  // ✅ UPDATED: Brighter cyan to match the screenshot
  static const Color buttonPrimary = Color(0xFF00BCD4);
  static const Color inputBorder = Color(0xFFE2E8F0);
  static const Color backgroundColor = Color(0xFFF7F9FB);
  static const Color textPrimary = Color(0xFF191C1E);
  static const Color textSecondary = Color(0xFF45464D);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const DashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ✅ UPDATED: Icon color matches buttonPrimary
                  const Icon(
                    Icons.real_estate_agent,
                    size: 48,
                    color: buttonPrimary,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'EstateFlow',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Sign in to manage your pipeline',
                    style: TextStyle(
                      fontSize: 18,
                      color: textSecondary,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Login Form Card
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE0E3E5)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Email field
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Email Address',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: textPrimary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'agent@estateflow.com',
                            prefixIcon: const Icon(Icons.mail_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: inputBorder),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: buttonPrimary),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Password field
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: textPrimary,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(fontSize: 12, color: buttonPrimary),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: '••••••••',
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: inputBorder),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: buttonPrimary),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Remember me
                        Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Checkbox(
                                value: _rememberMe,
                                activeColor: buttonPrimary,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value ?? false;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Remember me',
                              style: TextStyle(fontSize: 14, color: textSecondary),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // ✅ Sign In button - now uses updated buttonPrimary color
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _handleSignIn,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: buttonPrimary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(fontSize: 14, color: textSecondary),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: buttonPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ SHARED AppBar title widget - used in all screens
Widget _buildAppBarTitle() {
  return Row(
    mainAxisSize: MainAxisSize.min, // ← centers properly with centerTitle: true
    children: const [
      Icon(
        Icons.real_estate_agent,
        size: 26,
        color: Color.fromARGB(255, 0, 101,145), // ✅ matches new buttonPrimary
      ),
      SizedBox(width: 8),
      Text(
        'EstateFlow',
        style: TextStyle(
          color: Color(0xFF006591),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    ],
  );
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final int _selectedNavIndex = 0;

  static const Color primary = Color(0xFF006591);
  static const Color primaryContainer = Color(0xFF0EA5E9);
  static const Color tertiary = Color(0xFF505F76);
  static const Color errorColor = Color(0xFFBA1A1A);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF191C1E);
  static const Color onSurfaceVariant = Color(0xFF3E4850);
  static const Color outlineVariant = Color(0xFFBEC8D2);
  static const Color background = Color(0xFFF7F9FB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.search, color: onSurfaceVariant),
          onPressed: () {},
        ),
        // ✅ UPDATED: Uses shared widget, no more Image.asset
        title: _buildAppBarTitle(),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: onSurfaceVariant),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Good morning, Alex.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: onSurface,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Here is what's happening with your pipeline today.",
                style: TextStyle(fontSize: 14, color: onSurfaceVariant),
              ),
              const SizedBox(height: 24),

              _buildSummaryCard(
                label: 'TOTAL LEADS',
                value: '1,284',
                icon: Icons.groups,
                iconColor: primaryContainer,
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.trending_up, size: 16, color: primary),
                      SizedBox(width: 4),
                      Text('12%', style: TextStyle(color: primary, fontSize: 12)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _buildSummaryCard(
                label: 'ACTIVE DEALS',
                value: '42',
                icon: Icons.handshake,
                iconColor: tertiary,
                trailing: const Text(
                  'Est. \$4.2M',
                  style: TextStyle(fontSize: 14, color: onSurfaceVariant),
                ),
              ),
              const SizedBox(height: 12),
              _buildSummaryCard(
                label: 'TASKS DUE TODAY',
                value: '8',
                icon: Icons.assignment_late,
                iconColor: errorColor,
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: errorColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '3 High Priority',
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: outlineVariant.withValues(alpha: 0.2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Revenue Forecast',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('View Report', style: TextStyle(color: primary)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 180,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _buildBar('Jan', 0.4, primary.withValues(alpha: 0.2)),
                          _buildBar('Feb', 0.6, primary.withValues(alpha: 0.4)),
                          _buildBar('Mar', 0.9, primary, bold: true),
                          _buildBar('Apr', 0.5, outlineVariant.withValues(alpha: 0.3)),
                          _buildBar('May', 0.7, outlineVariant.withValues(alpha: 0.3)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: outlineVariant.withValues(alpha: 0.2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recent Activity',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    _buildActivityItem(
                      icon: Icons.call,
                      iconColor: primary,
                      iconBg: primaryContainer.withValues(alpha: 0.15),
                      text: 'Sarah Jenkins logged a call regarding 124 Maple St.',
                      time: '10 mins ago',
                    ),
                    const Divider(height: 24),
                    _buildActivityItem(
                      icon: Icons.mail,
                      iconColor: tertiary,
                      iconBg: tertiary.withValues(alpha: 0.15),
                      text: 'Proposal sent to David Chen for Downtown Condo.',
                      time: '45 mins ago',
                    ),
                    const Divider(height: 24),
                    _buildActivityItem(
                      icon: Icons.update,
                      iconColor: Colors.teal,
                      iconBg: Colors.teal.withValues(alpha: 0.15),
                      text: 'Lead stage updated to NEGOTIATION for Riverfront Villa.',
                      time: '2 hours ago',
                    ),
                    const Divider(height: 24),
                    _buildActivityItem(
                      icon: Icons.person_add,
                      iconColor: onSurfaceVariant,
                      iconBg: outlineVariant.withValues(alpha: 0.2),
                      text: 'New lead assigned: Emma Thompson.',
                      time: '3 hours ago',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedNavIndex,
        onTap: (index) {
          if (index == _selectedNavIndex) return;
          navigateToTab(context, index);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primary,
        unselectedItemColor: onSurfaceVariant,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Leads'),
          BottomNavigationBarItem(icon: Icon(Icons.format_list_numbered), label: 'Pipeline'),
          BottomNavigationBarItem(icon: Icon(Icons.support_agent), label: 'Tickets'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildSummaryCard({
    required String label,
    required String value,
    required IconData icon,
    required Color iconColor,
    required Widget trailing,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: outlineVariant.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: onSurfaceVariant,
                  letterSpacing: 0.5,
                ),
              ),
              Icon(icon, color: iconColor),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: onSurface),
              ),
              trailing,
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBar(String label, double heightFactor, Color color, {bool bold = false}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 140 * heightFactor,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: bold ? primary : onSurfaceVariant,
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String text,
    required String time,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
          child: Icon(icon, size: 16, color: iconColor),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text, style: const TextStyle(fontSize: 13, color: onSurface)),
              const SizedBox(height: 2),
              Text(time, style: const TextStyle(fontSize: 11, color: onSurfaceVariant)),
            ],
          ),
        ),
      ],
    );
  }
}


class LeadsScreen extends StatefulWidget {
  const LeadsScreen({super.key});

  @override
  State<LeadsScreen> createState() => _LeadsScreenState();
}

class _LeadsScreenState extends State<LeadsScreen> {
  final int _selectedNavIndex = 1;
  final TextEditingController _searchController = TextEditingController();

  static const Color primary = Color(0xFF006591);
  static const Color primaryContainer = Color(0xFF0EA5E9);
  static const Color tertiary = Color(0xFF505F76);
  static const Color tertiaryContainer = Color(0xFF8D9DB5);
  static const Color secondaryContainer = Color(0xFFDAE2FD);
  static const Color errorColor = Color(0xFFBA1A1A);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerHigh = Color(0xFFE6E8EA);
  static const Color onSurface = Color(0xFF191C1E);
  static const Color onSurfaceVariant = Color(0xFF3E4850);
  static const Color outlineVariant = Color(0xFFBEC8D2);
  static const Color outline = Color(0xFF6E7881);
  static const Color background = Color(0xFFF7F9FB);

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.search, color: onSurfaceVariant),
          onPressed: () {},
        ),
        // ✅ UPDATED
        title: _buildAppBarTitle(),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: onSurfaceVariant),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: outlineVariant.withValues(alpha: 0.5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: outline),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          hintText: 'Search leads by name, email, or property...',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: outline, fontSize: 14),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.tune, size: 20, color: onSurfaceVariant),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Active Leads',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: onSurface),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: primaryContainer.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '42 Total',
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: primary),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 96),
                children: [
                  _buildLeadCard(
                    initials: 'ES',
                    initialsColor: primary,
                    initialsBg: primary.withValues(alpha: 0.1),
                    name: 'Eleanor Shellstrop',
                    email: 'eshellstrop@example.com',
                    status: 'New',
                    statusColor: errorColor,
                    statusBg: errorContainer,
                    interest: 'Luxury Condo, Downtown',
                    footerText: 'Added 2 hours ago',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LeadDetailScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildLeadCard(
                    initials: 'CD',
                    initialsColor: onSurfaceVariant,
                    initialsBg: tertiaryContainer.withValues(alpha: 0.3),
                    name: 'Chidi Anagonye',
                    email: 'chidi.ethics@example.com',
                    status: 'Contacted',
                    statusColor: outline,
                    statusBg: surfaceContainerHigh,
                    interest: 'Suburban 3BR, Quiet Neighborhood',
                    footerText: 'Last contact: Yesterday',
                  ),
                  const SizedBox(height: 12),
                  _buildQualifiedCard(),
                  const SizedBox(height: 12),
                  _buildNegotiationCard(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedNavIndex,
        onTap: (index) {
          if (index == _selectedNavIndex) return;
          navigateToTab(context, index);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primary,
        unselectedItemColor: onSurfaceVariant,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Leads'),
          BottomNavigationBarItem(icon: Icon(Icons.format_list_numbered), label: 'Pipeline'),
          BottomNavigationBarItem(icon: Icon(Icons.support_agent), label: 'Tickets'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildCardWrapper({required Widget child, VoidCallback? onTap}) {
    final card = Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: outlineVariant.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
    if (onTap == null) return card;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: card,
    );
  }

  Widget _buildLeadCard({
    required String initials,
    required Color initialsColor,
    required Color initialsBg,
    required String name,
    required String email,
    required String status,
    required Color statusColor,
    required Color statusBg,
    required String interest,
    required String footerText,
    VoidCallback? onTap,
  }) {
    return _buildCardWrapper(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: initialsBg,
                child: Text(initials, style: TextStyle(color: initialsColor, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    Text(email, style: const TextStyle(fontSize: 13, color: onSurfaceVariant)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: statusBg, borderRadius: BorderRadius.circular(6)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(width: 6, height: 6, decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle)),
                    const SizedBox(width: 4),
                    Text(status, style: TextStyle(fontSize: 11, color: statusColor)),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            children: [
              const Icon(Icons.home, size: 18, color: onSurfaceVariant),
              const SizedBox(width: 6),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: 'Interested in: ',
                    style: const TextStyle(fontSize: 13, color: onSurfaceVariant),
                    children: [
                      TextSpan(text: interest, style: const TextStyle(fontWeight: FontWeight.w600, color: onSurface)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.schedule, size: 14, color: outline),
                  const SizedBox(width: 4),
                  Text(footerText, style: const TextStyle(fontSize: 11, color: outline)),
                ],
              ),
              TextButton(
                onPressed: onTap,
                style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
                child: const Text('View Details', style: TextStyle(color: primary, fontSize: 13)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQualifiedCard() {
    return _buildCardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: secondaryContainer.withValues(alpha: 0.5),
                child: const Text('TH', style: TextStyle(color: onSurfaceVariant, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tahani Al-Jamil', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    Text('tahani@example.com', style: TextStyle(fontSize: 13, color: onSurfaceVariant)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CircleAvatar(radius: 3, backgroundColor: primary),
                    SizedBox(width: 4),
                    Text('Qualified', style: TextStyle(fontSize: 11, color: primary)),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            children: const [
              Icon(Icons.real_estate_agent, size: 18, color: onSurfaceVariant),
              SizedBox(width: 6),
              Text.rich(
                TextSpan(
                  text: 'Interested in: ',
                  style: TextStyle(fontSize: 13, color: onSurfaceVariant),
                  children: [
                    TextSpan(text: 'Estate, Mansion, High-End', style: TextStyle(fontWeight: FontWeight.w600, color: onSurface)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: const [
              Icon(Icons.monetization_on, size: 18, color: onSurfaceVariant),
              SizedBox(width: 6),
              Text.rich(
                TextSpan(
                  text: 'Budget: ',
                  style: TextStyle(fontSize: 13, color: onSurfaceVariant),
                  children: [
                    TextSpan(text: '\$5.5M - \$7M', style: TextStyle(fontWeight: FontWeight.w600, color: onSurface)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.schedule, size: 14, color: outline),
                  SizedBox(width: 4),
                  Text('Tour scheduled: Oct 12', style: TextStyle(fontSize: 11, color: outline)),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                ),
                child: const Text('Manage Deal', style: TextStyle(fontSize: 13)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNegotiationCard() {
    return _buildCardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: tertiaryContainer.withValues(alpha: 0.5),
                child: const Text('JM', style: TextStyle(color: onSurfaceVariant, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jason Mendoza', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    Text('jason@example.com', style: TextStyle(fontSize: 13, color: onSurfaceVariant)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: tertiaryContainer.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CircleAvatar(radius: 3, backgroundColor: tertiary),
                    SizedBox(width: 4),
                    Text('Negotiation', style: TextStyle(fontSize: 11, color: tertiary)),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            children: const [
              Icon(Icons.home, size: 18, color: onSurfaceVariant),
              SizedBox(width: 6),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: 'Offer: ',
                    style: TextStyle(fontSize: 13, color: onSurfaceVariant),
                    children: [
                      TextSpan(text: '\$450k on 123 Fake St.', style: TextStyle(fontWeight: FontWeight.w600, color: onSurface)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.schedule, size: 14, color: outline),
                  SizedBox(width: 4),
                  Text('Awaiting Seller Response', style: TextStyle(fontSize: 11, color: outline)),
                ],
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Review Documents', style: TextStyle(color: primary, fontSize: 13)),
                    Icon(Icons.chevron_right, size: 16, color: primary),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class LeadDetailScreen extends StatefulWidget {
  const LeadDetailScreen({super.key});

  @override
  State<LeadDetailScreen> createState() => _LeadDetailScreenState();
}

class _LeadDetailScreenState extends State<LeadDetailScreen> {
  String _stage = 'contacted';
  final TextEditingController _noteController = TextEditingController();

  static const Color primary = Color(0xFF006591);
  static const Color primaryContainer = Color(0xFF0EA5E9);
  static const Color tertiary = Color(0xFF505F76);
  static const Color tertiaryContainer = Color(0xFF8D9DB5);
  static const Color secondaryContainer = Color(0xFFDAE2FD);
  static const Color onSecondaryContainer = Color(0xFF5C647A);
  static const Color onlineGreen = Color(0xFF10B981);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainer = Color(0xFFECEEF0);
  static const Color surfaceContainerHighest = Color(0xFFE0E3E5);
  static const Color onSurface = Color(0xFF191C1E);
  static const Color onSurfaceVariant = Color(0xFF3E4850);
  static const Color outlineVariant = Color(0xFFBEC8D2);
  static const Color outline = Color(0xFF6E7881);
  static const Color background = Color(0xFFF7F9FB);

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: onSurfaceVariant),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Lead Details',
          style: TextStyle(color: primary, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined, color: onSurfaceVariant),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: primaryContainer.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButton<String>(
                      value: _stage,
                      underline: const SizedBox(),
                      icon: const Icon(Icons.expand_more, color: primary, size: 18),
                      style: const TextStyle(color: primary, fontSize: 13, fontWeight: FontWeight.w600),
                      dropdownColor: Colors.white,
                      onChanged: (val) {
                        if (val != null) setState(() => _stage = val);
                      },
                      items: const [
                        DropdownMenuItem(value: 'prospecting', child: Text('Prospecting')),
                        DropdownMenuItem(value: 'contacted', child: Text('Contacted')),
                        DropdownMenuItem(value: 'negotiation', child: Text('Negotiation')),
                        DropdownMenuItem(value: 'closed_won', child: Text('Closed Won')),
                        DropdownMenuItem(value: 'closed_lost', child: Text('Closed Lost')),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.share, size: 18, color: onSurface),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: outlineVariant.withValues(alpha: 0.2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 48,
                          backgroundColor: surfaceContainerHighest,
                          child: ClipOval(
                            child: Image.network(
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuB2T72jUBnCIYhzOuAIJC40LFXTVlquR3O4aKKPnRlcs-2BXt15a_g1PU9FZiNoWoPxRFYTVFisGXlU0DY1mdm14BK2V5-BQLEhI6zQuObcAVRAzXBrKsSRTsjUTvdqqD9IH0wUbkUQptLjGf2xCVkTLL0i_s1PFMUgnQkCx1n49WwnwQt4vEFqo02utGg3gxjZdyCgkUpA0lfru_cw7iFoAgFRkye1e_kUTJAH4ECJQOUEDREbooXprqrJ6CY-twSygRAyzhKMcfg',
                              width: 96,
                              height: 96,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => const Icon(
                                Icons.person,
                                size: 48,
                                color: onSurfaceVariant,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              color: onlineGreen,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Eleanor Shellstrop',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: onSurface),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.location_on_outlined, size: 16, color: onSurfaceVariant),
                        SizedBox(width: 4),
                        Text(
                          'Looking in Downtown Core & West End',
                          style: TextStyle(fontSize: 13, color: onSurfaceVariant),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildTagChip('Buyer'),
                        _buildTagChip('High Budget'),
                        _buildTagChip('Urgent'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: _buildQuickAction(icon: Icons.call, label: 'Call', filled: true)),
                        const SizedBox(width: 8),
                        Expanded(child: _buildQuickAction(icon: Icons.mail_outline, label: 'Email')),
                        const SizedBox(width: 8),
                        Expanded(child: _buildQuickAction(icon: Icons.chat_bubble_outline, label: 'Text')),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: surfaceContainer,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: outlineVariant.withValues(alpha: 0.2)),
                      ),
                      child: Column(
                        children: [
                          _buildContactRow(Icons.phone_iphone, 'Mobile', '(555) 123-4567'),
                          const Divider(height: 16),
                          _buildContactRow(Icons.email_outlined, 'Personal', 'eleanor.v@example.com'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: outlineVariant.withValues(alpha: 0.2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.favorite_border, color: primary, size: 20),
                            SizedBox(width: 8),
                            Text('Properties of Interest', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('View All', style: TextStyle(color: primary, fontSize: 13)),
                              Icon(Icons.chevron_right, size: 16, color: primary),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _buildPropertyRow(title: '1420 Luxury Ave, #PH4', price: '\$1,250,000', beds: '3', baths: '2.5'),
                    const Divider(height: 20),
                    _buildPropertyRow(title: '88 Riverside Drive', price: '\$980,000', beds: '2', baths: '2'),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: outlineVariant.withValues(alpha: 0.2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.description_outlined, color: primary, size: 20),
                            SizedBox(width: 8),
                            Text('Notes', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline, color: primary),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    TextField(
                      controller: _noteController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Add a quick note...',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Save'),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildNoteItem(
                      text: 'Prefers to communicate via text during business hours. Very interested in properties with south-facing views.',
                      time: 'Today, 10:45 AM',
                      pinned: true,
                    ),
                    const Divider(height: 1),
                    _buildNoteItem(
                      text: 'Sent list of 5 properties in the West End. Waiting for feedback before scheduling showings.',
                      time: 'Oct 24, 2:15 PM',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: outlineVariant.withValues(alpha: 0.2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.history, color: primary, size: 20),
                            SizedBox(width: 8),
                            Text('Activity Log', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.filter_list, color: onSurfaceVariant),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _buildActivityItem(
                      icon: Icons.call,
                      iconColor: onSecondaryContainer,
                      iconBg: secondaryContainer.withValues(alpha: 0.6),
                      title: 'Outbound Call',
                      subtitle: 'Discussed recent listings. Left voicemail.',
                      time: 'Just now',
                    ),
                    _buildActivityItem(
                      icon: Icons.mail,
                      iconColor: onSurfaceVariant,
                      iconBg: surfaceContainerHighest,
                      title: 'Email Sent',
                      subtitle: '"Property update: West End listings"',
                      time: 'Oct 24, 9:00 AM',
                    ),
                    _buildActivityItem(
                      icon: Icons.swap_horiz,
                      iconColor: onlineGreen,
                      iconBg: onlineGreen.withValues(alpha: 0.15),
                      title: 'Stage Changed',
                      subtitle: 'Prospecting → Contacted',
                      time: 'Oct 23, 4:30 PM',
                      isLast: true,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: primary,
                          side: BorderSide(color: primary.withValues(alpha: 0.3)),
                        ),
                        child: const Text('Load More Activity'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTagChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: surfaceContainer,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: outlineVariant.withValues(alpha: 0.3)),
      ),
      child: Text(label, style: const TextStyle(fontSize: 11, color: onSurfaceVariant)),
    );
  }

  Widget _buildQuickAction({required IconData icon, required String label, bool filled = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: filled ? primary : surfaceContainerHighest,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(icon, size: 20, color: filled ? Colors.white : primary),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 11, color: filled ? Colors.white : onSurface)),
        ],
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(color: surfaceContainerLowest, shape: BoxShape.circle),
          child: Icon(icon, size: 16, color: tertiary),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 11, color: onSurfaceVariant)),
            Text(value, style: const TextStyle(fontSize: 14, color: onSurface)),
          ],
        ),
      ],
    );
  }

  Widget _buildPropertyRow({
    required String title,
    required String price,
    required String beds,
    required String baths,
  }) {
    return Row(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(color: surfaceContainer, borderRadius: BorderRadius.circular(8)),
          child: const Icon(Icons.home_outlined, color: onSurfaceVariant),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              const SizedBox(height: 2),
              Text(price, style: const TextStyle(fontSize: 12, color: onSurfaceVariant)),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.bed_outlined, size: 14, color: onSurfaceVariant),
                  const SizedBox(width: 4),
                  Text(beds, style: const TextStyle(fontSize: 12, color: onSurfaceVariant)),
                  const SizedBox(width: 12),
                  const Icon(Icons.bathtub_outlined, size: 14, color: onSurfaceVariant),
                  const SizedBox(width: 4),
                  Text(baths, style: const TextStyle(fontSize: 12, color: onSurfaceVariant)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNoteItem({required String text, required String time, bool pinned = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: const TextStyle(fontSize: 13, color: onSurface)),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(time, style: const TextStyle(fontSize: 11, color: onSurfaceVariant)),
              if (pinned)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(color: secondaryContainer, borderRadius: BorderRadius.circular(4)),
                  child: const Text(
                    'PINNED',
                    style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: onSecondaryContainer),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String subtitle,
    required String time,
    bool isLast = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
            child: Icon(icon, size: 14, color: iconColor),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: outlineVariant.withValues(alpha: 0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 2),
                  Text(subtitle, style: const TextStyle(fontSize: 12, color: onSurfaceVariant)),
                  const SizedBox(height: 6),
                  Text(time, style: const TextStyle(fontSize: 11, color: tertiary)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class PipelineScreen extends StatefulWidget {
  const PipelineScreen({super.key});

  @override
  State<PipelineScreen> createState() => _PipelineScreenState();
}

class _PipelineScreenState extends State<PipelineScreen> {
  final int _selectedNavIndex = 2;

  static const Color primary = Color(0xFF006591);
  static const Color secondary = Color(0xFF565E74);
  static const Color yellow = Color(0xFFEAB308);
  static const Color yellowText = Color(0xFFCA8A04);
  static const Color yellowBg = Color(0xFFFEF08A);
  static const Color green = Color(0xFF22C55E);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainer = Color(0xFFECEEF0);
  static const Color surfaceContainerLow = Color(0xFFF2F4F6);
  static const Color onSurfaceVariant = Color(0xFF3E4850);
  static const Color outlineVariant = Color(0xFFBEC8D2);
  static const Color outline = Color(0xFF6E7881);
  static const Color background = Color(0xFFF7F9FB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.search, color: onSurfaceVariant),
          onPressed: () {},
        ),
        // ✅ UPDATED
        title: _buildAppBarTitle(),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: onSurfaceVariant),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: outlineVariant, width: 0.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text('Active Pipeline', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(color: surfaceContainer, borderRadius: BorderRadius.circular(20)),
                        child: const Text('24 Deals', style: TextStyle(fontSize: 12)),
                      ),
                    ],
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list, size: 16, color: primary),
                    label: const Text('Filter', style: TextStyle(color: primary, fontSize: 12)),
                    style: TextButton.styleFrom(
                      backgroundColor: primary.withValues(alpha: 0.08),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                color: surfaceContainerLow.withValues(alpha: 0.5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildColumn(
                        dotColor: primary,
                        title: 'Discovery',
                        count: '8',
                        total: '\$4.2M',
                        cards: [
                          _buildDealCard(title: '742 Evergreen Terrace', subtitle: 'Springfield, OR', price: '\$850,000', daysLabel: '2 days'),
                          _buildDealCard(title: '123 Fake Street', subtitle: 'Capital City', price: '\$1,200,000', daysLabel: '5 days'),
                        ],
                      ),
                      _buildColumn(
                        dotColor: secondary,
                        title: 'Viewing',
                        count: '5',
                        total: '\$3.1M',
                        cards: [
                          _buildDealCard(title: '4 Privet Drive', subtitle: 'Little Whinging, Surrey', price: '\$550,000', daysLabel: '12 days', tag: 'Viewing Tomorrow 10AM', tagColor: secondary, tagIcon: Icons.event),
                        ],
                      ),
                      _buildColumn(
                        dotColor: yellow,
                        title: 'Offer',
                        count: '3',
                        total: '\$2.8M',
                        cards: [
                          _buildDealCard(title: '221B Baker Street', subtitle: 'London', price: '\$1,850,000', daysLabel: '24 days', tag: 'Counter-Offer Sent', tagColor: yellowText, tagBg: yellowBg.withValues(alpha: 0.4), leftBorderColor: yellow),
                        ],
                      ),
                      _buildColumn(
                        dotColor: green,
                        title: 'Closing',
                        count: '2',
                        total: '\$1.5M',
                        isLast: true,
                        cards: [
                          _buildDealCard(title: '1600 Pennsylvania Ave', subtitle: 'Washington, D.C.', price: '\$1,500,000', daysLabel: '45 days', progress: 0.85, progressLabel: 'In Escrow'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedNavIndex,
        onTap: (index) {
          if (index == _selectedNavIndex) return;
          navigateToTab(context, index);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primary,
        unselectedItemColor: onSurfaceVariant,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Leads'),
          BottomNavigationBarItem(icon: Icon(Icons.format_list_numbered), label: 'Pipeline'),
          BottomNavigationBarItem(icon: Icon(Icons.support_agent), label: 'Tickets'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildColumn({
    required Color dotColor,
    required String title,
    required String count,
    required String total,
    required List<Widget> cards,
    bool isLast = false,
  }) {
    return Container(
      width: 280,
      margin: EdgeInsets.only(right: isLast ? 0 : 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(width: 8, height: 8, decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle)),
                  const SizedBox(width: 8),
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(width: 6),
                  Text(count, style: const TextStyle(fontSize: 12, color: onSurfaceVariant)),
                ],
              ),
              Text(total, style: const TextStyle(fontSize: 12, color: onSurfaceVariant)),
            ],
          ),
          const SizedBox(height: 8),
          Column(children: cards),
        ],
      ),
    );
  }

  Widget _buildDealCard({
    required String title,
    required String subtitle,
    required String price,
    required String daysLabel,
    String? tag,
    Color? tagColor,
    Color? tagBg,
    IconData? tagIcon,
    Color? leftBorderColor,
    double? progress,
    String? progressLabel,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: outlineVariant.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 12, offset: const Offset(0, 4)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (leftBorderColor != null) Container(width: 4, color: leftBorderColor),
              Expanded(
                child: Container(
                  color: surfaceContainerLowest,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                                Text(subtitle, style: const TextStyle(fontSize: 12, color: onSurfaceVariant), maxLines: 1, overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                          const Icon(Icons.more_vert, size: 18, color: outline),
                        ],
                      ),
                      if (tag != null) ...[
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(color: tagBg ?? Colors.transparent, borderRadius: BorderRadius.circular(6)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (tagIcon != null) ...[Icon(tagIcon, size: 13, color: tagColor), const SizedBox(width: 4)],
                              Text(tag, style: TextStyle(fontSize: 11, color: tagColor)),
                            ],
                          ),
                        ),
                      ],
                      if (progress != null) ...[
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(value: progress, minHeight: 6, backgroundColor: surfaceContainer, valueColor: const AlwaysStoppedAnimation(green)),
                        ),
                        const SizedBox(height: 4),
                        Align(alignment: Alignment.centerRight, child: Text(progressLabel ?? '', style: const TextStyle(fontSize: 11, color: onSurfaceVariant))),
                      ],
                      const SizedBox(height: 8),
                      const Divider(height: 1),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(price, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: primary)),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(color: surfaceContainer, borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.schedule, size: 13, color: onSurfaceVariant),
                                const SizedBox(width: 4),
                                Text(daysLabel, style: const TextStyle(fontSize: 11, color: onSurfaceVariant)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class TicketsScreen extends StatefulWidget {
  const TicketsScreen({super.key});

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  final int _selectedNavIndex = 3;

  static const Color primary = Color(0xFF006591);
  static const Color primaryContainer = Color(0xFF0EA5E9);
  static const Color errorColor = Color(0xFFBA1A1A);
  static const Color medium = Color(0xFFF59E0B);
  static const Color mediumText = Color(0xFFD97706);
  static const Color resolvedGreen = Color(0xFF10B981);
  static const Color resolvedGreenText = Color(0xFF059669);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF2F4F6);
  static const Color surfaceContainerHigh = Color(0xFFE6E8EA);
  static const Color surfaceContainerHighest = Color(0xFFE0E3E5);
  static const Color onSurface = Color(0xFF191C1E);
  static const Color onSurfaceVariant = Color(0xFF3E4850);
  static const Color outlineVariant = Color(0xFFBEC8D2);
  static const Color outline = Color(0xFF6E7881);
  static const Color background = Color(0xFFF7F9FB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.search, color: onSurfaceVariant),
          onPressed: () {},
        ),
        // ✅ UPDATED
        title: _buildAppBarTitle(),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: onSurfaceVariant),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Support Tickets', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: onSurface)),
              const SizedBox(height: 4),
              const Text('Manage client requests and internal operational tasks.', style: TextStyle(fontSize: 14, color: onSurfaceVariant)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_list, size: 18, color: onSurface),
                      label: const Text('Filter', style: TextStyle(color: onSurface)),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: outlineVariant),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text('New Ticket'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: outlineVariant.withValues(alpha: 0.5)),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search tickets...',
                    prefixIcon: Icon(Icons.search, color: outline),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 36,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildFilterChip('All Active', selected: true),
                    _buildFilterChip('High Priority'),
                    _buildFilterChip('Unassigned'),
                    _buildFilterChip('Resolved'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildTicketCard(id: '#TK-8492', priority: 'High', priorityColor: errorColor, status: 'Open', title: 'Contract Addendum Urgent Review', description: 'Client at 1420 Maple Drive needs immediate review of the inspection contingency clause before 5PM today.', assignee: 'Sarah Jenkins', time: '2h ago', leftBarColor: errorColor),
              const SizedBox(height: 12),
              _buildTicketCard(id: '#TK-8491', priority: 'Medium', priorityColor: mediumText, status: 'Open', title: 'Schedule Photographer - 88th St', description: 'Need to coordinate with VistaPhotos for the new listing. Seller prefers Thursday morning.', assignee: 'Marcus Reed', time: '5h ago', leftBarColor: medium),
              const SizedBox(height: 12),
              _buildTicketCard(id: '#TK-8488', priority: 'Low', priorityColor: primary, status: 'Open', title: 'Update Marketing Materials', description: 'Refresh the standard buyer presentation deck with Q3 market statistics.', assignee: 'Unassigned', time: '1d ago', leftBarColor: primary.withValues(alpha: 0.4), unassigned: true),
              const SizedBox(height: 12),
              _buildTicketCard(id: '#TK-8485', priority: 'Medium', priorityColor: outline, status: 'Resolved', statusColor: resolvedGreenText, statusBg: resolvedGreen.withValues(alpha: 0.1), title: 'Escrow Deposit Confirmation', description: 'Verify receipt of the \$25k earnest money deposit for the Smith transaction.', assignee: 'David Chen', time: 'Closed', leftBarColor: outlineVariant, resolved: true),
              const SizedBox(height: 12),
              _buildTicketCard(id: '#TK-8495', priority: 'High', priorityColor: errorColor, status: 'Open', title: 'Client Portal Login Issue', description: 'VIP Client (Johnson) cannot access document vault to sign disclosures.', assignee: 'Unassigned', time: '10m ago', leftBarColor: errorColor, unassigned: true),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedNavIndex,
        onTap: (index) {
          if (index == _selectedNavIndex) return;
          navigateToTab(context, index);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primary,
        unselectedItemColor: onSurfaceVariant,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Leads'),
          BottomNavigationBarItem(icon: Icon(Icons.format_list_numbered), label: 'Pipeline'),
          BottomNavigationBarItem(icon: Icon(Icons.support_agent), label: 'Tickets'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, {bool selected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(label, style: TextStyle(fontSize: 12, color: onSurfaceVariant, fontWeight: selected ? FontWeight.w600 : FontWeight.normal)),
        backgroundColor: selected ? primaryContainer.withValues(alpha: 0.2) : surfaceContainerLowest,
        side: BorderSide(color: selected ? primaryContainer.withValues(alpha: 0.2) : outlineVariant.withValues(alpha: 0.5)),
        padding: const EdgeInsets.symmetric(horizontal: 4),
      ),
    );
  }

  Widget _buildTicketCard({
    required String id,
    required String priority,
    required Color priorityColor,
    required String status,
    Color? statusColor,
    Color? statusBg,
    required String title,
    required String description,
    required String assignee,
    required String time,
    required Color leftBarColor,
    bool unassigned = false,
    bool resolved = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: resolved ? surfaceContainerLow : surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: outlineVariant.withValues(alpha: resolved ? 0.1 : 0.2)),
        boxShadow: resolved ? [] : [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: Opacity(
        opacity: resolved ? 0.75 : 1.0,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(width: 4, decoration: BoxDecoration(color: leftBarColor)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(id, style: const TextStyle(fontSize: 12, color: onSurfaceVariant)),
                          Row(
                            children: [
                              _buildBadge(priority, priorityColor, priorityColor.withValues(alpha: 0.1)),
                              const SizedBox(width: 6),
                              _buildBadge(status, statusColor ?? onSurfaceVariant, statusBg ?? surfaceContainerHighest),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: resolved ? onSurfaceVariant : onSurface, decoration: resolved ? TextDecoration.lineThrough : null)),
                      const SizedBox(height: 4),
                      Text(description, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 13, color: resolved ? outline : onSurfaceVariant)),
                      const SizedBox(height: 10),
                      const Divider(height: 1),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 11,
                                backgroundColor: surfaceContainerHigh,
                                child: unassigned
                                    ? const Icon(Icons.person_add, size: 13, color: outline)
                                    : Text(assignee.split(' ').map((w) => w[0]).take(2).join(), style: const TextStyle(fontSize: 10, color: onSurfaceVariant)),
                              ),
                              const SizedBox(width: 6),
                              Text(assignee, style: TextStyle(fontSize: 12, color: outline, fontStyle: unassigned ? FontStyle.italic : FontStyle.normal)),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(resolved ? Icons.check_circle : Icons.schedule, size: 13, color: outline),
                              const SizedBox(width: 4),
                              Text(time, style: const TextStyle(fontSize: 12, color: outline)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBadge(String text, Color color, Color bg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Text(text.toUpperCase(), style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: color, letterSpacing: 0.5)),
    );
  }
}


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final int _selectedNavIndex = 4;
  bool _emailAlerts = true;
  bool _pushNotifications = false;

  static const Color primary = Color(0xFF006591);
  static const Color primaryContainer = Color(0xFF0EA5E9);
  static const Color errorColor = Color(0xFFBA1A1A);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerHigh = Color(0xFFE6E8EA);
  static const Color surfaceContainerLow = Color(0xFFF2F4F6);
  static const Color onSurface = Color(0xFF191C1E);
  static const Color onSurfaceVariant = Color(0xFF3E4850);
  static const Color outlineVariant = Color(0xFFBEC8D2);
  static const Color outline = Color(0xFF6E7881);
  static const Color background = Color(0xFFF7F9FB);

  void _handleSignOut() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.search, color: onSurfaceVariant),
          onPressed: () {},
        ),
        // ✅ UPDATED
        title: _buildAppBarTitle(),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: onSurfaceVariant),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: surfaceContainerHigh,
                    child: ClipOval(
                      child: Image.network(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuCzSoqgBT11HnGv7JSYt7g4K3cSoBB6K3xW8gMtJSm1NxwN9ccT8o3rx76QEOgniv90f0D_OCmPlKr_3WB7LCTmDI-BCpS6XX8lD98JSqx7b_hMjwvYzBHe1W2v4nwsQRs5cJXdJW94xGMr6-6-lPQMShU1HMkh7UbGxHRkPqEmBlolbQWRg58foNbYcKb-MUTxcaUOTiPTV1u4Ot8Suew1nLSEDe9XkHcGLP19eYSO1NG8FkFC_Or-HUEFQPOf-dFNlvgxZMA2Qfo',
                        width: 96,
                        height: 96,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, size: 48, color: onSurfaceVariant),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: primaryContainer.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(Icons.edit, size: 16, color: primary),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text('Alex Vance', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: onSurface)),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(color: surfaceContainerHigh, borderRadius: BorderRadius.circular(20)),
                child: const Text('Senior Agent', style: TextStyle(fontSize: 14, color: onSurfaceVariant)),
              ),
              const SizedBox(height: 24),

              _buildSettingsGroup(
                title: 'ACCOUNT',
                children: [
                  _buildNavRow(icon: Icons.person_outline, label: 'Personal Information'),
                  _buildNavRow(icon: Icons.lock_outline, label: 'Security & Password'),
                  _buildNavRow(icon: Icons.payments_outlined, label: 'Billing Details', isLast: true),
                ],
              ),
              const SizedBox(height: 16),

              _buildSettingsGroup(
                title: 'NOTIFICATIONS',
                children: [
                  _buildSwitchRow(icon: Icons.mail_outline, label: 'Email Alerts', subtitle: 'Lead updates and reports', value: _emailAlerts, onChanged: (val) => setState(() => _emailAlerts = val)),
                  _buildSwitchRow(icon: Icons.smartphone_outlined, label: 'Push Notifications', subtitle: 'Instant alerts on mobile', value: _pushNotifications, onChanged: (val) => setState(() => _pushNotifications = val), isLast: true),
                ],
              ),
              const SizedBox(height: 16),

              _buildSettingsGroup(
                title: 'PREFERENCES',
                children: [
                  _buildNavRow(icon: Icons.language, label: 'Language & Region', trailingText: 'English (US)'),
                  _buildNavRow(icon: Icons.dark_mode_outlined, label: 'Appearance', trailingText: 'System', isLast: true),
                ],
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: _handleSignOut,
                  icon: const Icon(Icons.logout, color: errorColor),
                  label: const Text('Sign Out', style: TextStyle(color: errorColor, fontWeight: FontWeight.w600)),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: errorColor),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedNavIndex,
        onTap: (index) {
          if (index == _selectedNavIndex) return;
          navigateToTab(context, index);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primary,
        unselectedItemColor: onSurfaceVariant,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Leads'),
          BottomNavigationBarItem(icon: Icon(Icons.format_list_numbered), label: 'Pipeline'),
          BottomNavigationBarItem(icon: Icon(Icons.support_agent), label: 'Tickets'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildSettingsGroup({required String title, required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: surfaceContainerLow.withValues(alpha: 0.5),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              border: const Border(bottom: BorderSide(color: surfaceContainerHigh)),
            ),
            child: Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: onSurfaceVariant, letterSpacing: 0.5)),
          ),
          ...children,
        ],
      ),
    );
  }

  Widget _buildNavRow({required IconData icon, required String label, String? trailingText, bool isLast = false}) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(border: isLast ? null : const Border(bottom: BorderSide(color: surfaceContainerHigh))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [Icon(icon, color: outline, size: 22), const SizedBox(width: 12), Text(label, style: const TextStyle(fontSize: 14, color: onSurface))]),
            Row(children: [
              if (trailingText != null) ...[Text(trailingText, style: const TextStyle(fontSize: 14, color: onSurfaceVariant)), const SizedBox(width: 4)],
              const Icon(Icons.chevron_right, color: outlineVariant),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchRow({required IconData icon, required String label, required String subtitle, required bool value, required ValueChanged<bool> onChanged, bool isLast = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(border: isLast ? null : const Border(bottom: BorderSide(color: surfaceContainerHigh))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Icon(icon, color: outline, size: 22),
            const SizedBox(width: 12),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(label, style: const TextStyle(fontSize: 14, color: onSurface)),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: onSurfaceVariant)),
            ]),
          ]),
          Switch(value: value, onChanged: onChanged, activeThumbColor: primary),
        ],
      ),
    );
  }
}


void navigateToTab(BuildContext context, int index) {
  Widget target;
  switch (index) {
    case 0:
      target = const DashboardScreen();
      break;
    case 1:
      target = const LeadsScreen();
      break;
    case 2:
      target = const PipelineScreen();
      break;
    case 3:
      target = const TicketsScreen();
      break;
    case 4:
      target = const ProfileScreen();
      break;
    default:
      target = const DashboardScreen();
  }

  Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      pageBuilder: (context, animation, secondaryAnimation) => target,
    ),
  );
}