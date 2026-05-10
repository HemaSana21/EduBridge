import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // General Section States
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  bool _aiInsightsEnabled = true;

  // Account Section States (These can be updated via the "Edit Profile" dialog)
  String _profileName = "Satya";
  String _profileEmail = "satyasri0@gmail.com";
  String _profileRole = "Volunteer";

  // Privacy & Security States
  bool _biometricLock = false;
  bool _twoFactorAuth = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2563EB),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= GENERAL SECTION =================
            const Text(
              "GENERAL",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF64748B),
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildSwitchTile(
                    title: "Notifications",
                    icon: Icons.notifications_active_rounded,
                    iconBgColor: const Color(0xFFEFF6FF),
                    iconColor: const Color(0xFF2563EB),
                    value: _notificationsEnabled,
                    onChanged: (newValue) {
                      setState(() {
                        _notificationsEnabled = newValue;
                      });
                    },
                  ),
                  const Divider(height: 1, indent: 60, color: Color(0xFFF1F5F9)),
                  _buildSwitchTile(
                    title: "Dark Mode",
                    icon: Icons.dark_mode_rounded,
                    iconBgColor: const Color(0xFFEFF6FF),
                    iconColor: const Color(0xFF2563EB),
                    value: _darkModeEnabled,
                    onChanged: (newValue) {
                      setState(() {
                        _darkModeEnabled = newValue;
                      });
                    },
                  ),
                  const Divider(height: 1, indent: 60, color: Color(0xFFF1F5F9)),
                  _buildSwitchTile(
                    title: "AI Insights",
                    icon: Icons.psychology_rounded,
                    iconBgColor: const Color(0xFFEFF6FF),
                    iconColor: const Color(0xFF2563EB),
                    value: _aiInsightsEnabled,
                    onChanged: (newValue) {
                      setState(() {
                        _aiInsightsEnabled = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // ================= ACCOUNT SECTION =================
            const Text(
              "ACCOUNT",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF64748B),
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildNavigationTile(
                    title: "Edit Profile",
                    icon: Icons.person_outline_rounded,
                    iconBgColor: const Color(0xFFEFF6FF),
                    iconColor: const Color(0xFF2563EB),
                    onTap: () => _showEditProfileDialog(),
                  ),
                  const Divider(height: 1, indent: 60, color: Color(0xFFF1F5F9)),
                  _buildNavigationTile(
                    title: "Privacy & Security",
                    icon: Icons.lock_outline_rounded,
                    iconBgColor: const Color(0xFFEFF6FF),
                    iconColor: const Color(0xFF2563EB),
                    onTap: () => _showPrivacySecurityDialog(),
                  ),
                  const Divider(height: 1, indent: 60, color: Color(0xFFF1F5F9)),
                  _buildNavigationTile(
                    title: "Help & Support",
                    icon: Icons.help_outline_rounded,
                    iconBgColor: const Color(0xFFEFF6FF),
                    iconColor: const Color(0xFF2563EB),
                    onTap: () => _showHelpSupportDialog(),
                  ),
                  const Divider(height: 1, indent: 60, color: Color(0xFFF1F5F9)),
                  _buildNavigationTile(
                    title: "About EduBridge AI",
                    icon: Icons.info_outline_rounded,
                    iconBgColor: const Color(0xFFEFF6FF),
                    iconColor: const Color(0xFF2563EB),
                    onTap: () => _showAboutDialog(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= ACTION DIALOGUES =================

  /// 1. Edit Profile Popup
  void _showEditProfileDialog() {
    final nameController = TextEditingController(text: _profileName);
    final emailController = TextEditingController(text: _profileEmail);
    final roleController = TextEditingController(text: _profileRole);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text(
            "Edit Profile",
            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your name",
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: roleController,
                decoration: const InputDecoration(
                  labelText: "Role",
                  hintText: "Enter your role",
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Color(0xFF64748B))),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2563EB),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                setState(() {
                  _profileName = nameController.text;
                  _profileEmail = emailController.text;
                  _profileRole = roleController.text;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Profile updated successfully!")),
                );
              },
              child: const Text("Save", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  /// 2. Privacy & Security Popup
  void _showPrivacySecurityDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              title: const Text(
                "Privacy & Security",
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SwitchListTile(
                    title: const Text("Biometric Lock"),
                    subtitle: const Text("Use Fingerprint / Face ID"),
                    activeColor: const Color(0xFF2563EB),
                    value: _biometricLock,
                    onChanged: (val) {
                      setDialogState(() => _biometricLock = val);
                      setState(() => _biometricLock = val);
                    },
                  ),
                  SwitchListTile(
                    title: const Text("Two-Factor Auth"),
                    subtitle: const Text("Secure your account access"),
                    activeColor: const Color(0xFF2563EB),
                    value: _twoFactorAuth,
                    onChanged: (val) {
                      setDialogState(() => _twoFactorAuth = val);
                      setState(() => _twoFactorAuth = val);
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Close", style: TextStyle(color: Color(0xFF2563EB))),
                ),
              ],
            );
          },
        );
      },
    );
  }

  /// 3. Help & Support Popup
  void _showHelpSupportDialog() {
    final supportController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text(
            "Contact Support",
            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "How can we help you today? Describe your issue below:",
                style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: supportController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Type details here...",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Color(0xFF64748B))),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2563EB),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Support ticket submitted!")),
                );
              },
              child: const Text("Submit", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  /// 4. About App Info Popup
  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text(
            "About EduBridge AI",
            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.school, size: 50, color: Color(0xFF2563EB)),
              SizedBox(height: 12),
              Text(
                "EduBridge AI Platform",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 6),
              Text(
                "Version 1.0.0 (Production Build)",
                style: TextStyle(color: Color(0xFF64748B), fontSize: 13),
              ),
              SizedBox(height: 12),
              Text(
                "Designed to empower education-focused community volunteers and educators with real-time progress and drop-out prediction tracking tools.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, height: 1.4, color: Color(0xFF1E293B)),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close", style: TextStyle(color: Color(0xFF2563EB))),
            ),
          ],
        );
      },
    );
  }

  // ================= CORE WIDGET CONSTRUCTORS =================

  Widget _buildSwitchTile({
    required String title,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
              ),
            ),
          ),
          Switch(
            value: value,
            activeColor: Colors.white,
            activeTrackColor: const Color(0xFF2563EB),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: const Color(0xFFCBD5E1),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationTile({
    required String title,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E293B),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Color(0xFF94A3B8),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}