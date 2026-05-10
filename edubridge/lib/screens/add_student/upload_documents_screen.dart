import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:edubridge/screens/dashboard_screen.dart'; // Ensure this matches your project structure

class UploadDocumentsScreen extends StatefulWidget {
  const UploadDocumentsScreen({super.key});

  @override
  State<UploadDocumentsScreen> createState() => _UploadDocumentsScreenState();
}

class _UploadDocumentsScreenState extends State<UploadDocumentsScreen> {
  String? studentPhoto;
  String? verificationDoc;

  // Function to pick files from the device
  Future<void> _handleFileUpload(bool isPhoto) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: isPhoto ? FileType.image : FileType.any,
    );

    if (result != null) {
      setState(() {
        if (isPhoto) {
          studentPhoto = result.files.single.name;
        } else {
          verificationDoc = result.files.single.name;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Both files are required to proceed
    bool canSubmit = studentPhoto != null && verificationDoc != null;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF2563EB),
        elevation: 0,
        title: const Text(
          "Add Student Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Professional Header Progress Stepper - Step 3 of 3
          Container(
            color: const Color(0xFF2563EB),
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
            child: Column(
              children: [
                Row(
                  children: [
                    _buildProgressSegment(true),
                    const SizedBox(width: 8),
                    _buildProgressSegment(true),
                    const SizedBox(width: 8),
                    _buildProgressSegment(true), // Step 3 Active
                  ],
                ),
                const SizedBox(height: 12),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Step 3 of 3",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),

          // Scrollable Page Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Upload Documents",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 1. Student Photo Upload Box
                  _buildUploadBox(
                    title: "Upload Student Photo",
                    subtitle: "Tap to browse or drag photo here. Max 5MB.",
                    fileName: studentPhoto,
                    onTap: () => _handleFileUpload(true),
                  ),

                  const SizedBox(height: 20),

                  // 2. Verification Documents Upload Box
                  _buildUploadBox(
                    title: "Verification Documents",
                    subtitle: "Income certificate, school ID, Aadhaar",
                    fileName: verificationDoc,
                    onTap: () => _handleFileUpload(false),
                  ),

                  const SizedBox(height: 24),

                  // 3. AI Need Score Preview Card
                  _buildNeedScoreCard(canSubmit),

                  const SizedBox(height: 32),

                  // Bottom Actions Block
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: const BorderSide(color: Color(0xFFE2E8F0)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Back",
                            style: TextStyle(color: Color(0xFF64748B), fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: canSubmit
                              ? () {
                                  // Success visual indication
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Profile Submitted Successfully!"),
                                      backgroundColor: Colors.green,
                                    ),
                                  );

                                  // Reset navigation tree and pop to home
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const DashboardScreen()),
                                    (route) => false,
                                  );
                                }
                              : null, // Disabled state if files are unselected
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2563EB),
                            disabledBackgroundColor: const Color(0xFFE2E8F0),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            "Submit Profile",
                            style: TextStyle(
                              color: canSubmit ? Colors.white : const Color(0xFF94A3B8),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
    );
  }

  Widget _buildProgressSegment(bool active) {
    return Expanded(
      child: Container(
        height: 4,
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  // Refined Interactive Upload Box Widget
  Widget _buildUploadBox({
    required String title,
    required String subtitle,
    required String? fileName,
    required VoidCallback onTap,
  }) {
    bool hasFile = fileName != null;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: hasFile ? const Color(0xFF2563EB) : const Color(0xFFE2E8F0),
            width: hasFile ? 2 : 1.5,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: hasFile ? const Color(0xFFEFF6FF) : const Color(0xFFF1F5F9),
                shape: BoxShape.circle,
              ),
              child: Icon(
                hasFile ? Icons.check_circle : Icons.cloud_upload_outlined,
                color: const Color(0xFF2563EB),
                size: 28,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              hasFile ? fileName : subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: hasFile ? const Color(0xFF2563EB) : const Color(0xFF64748B),
                fontWeight: hasFile ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
            if (hasFile) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Change File",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2563EB),
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }

  // Purple Need Score Preview Card layout
  Widget _buildNeedScoreCard(bool canShowScore) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF3E8FF).withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE9D5FF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.auto_awesome_outlined, color: Color(0xFF7C3AED), size: 18),
              SizedBox(width: 8),
              Text(
                "AI NEED SCORE PREVIEW",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7C3AED),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            canShowScore
                ? "Based on the data entered, the estimated Need Score is high."
                : "The estimated Need Score will appear here after analysis.",
            style: const TextStyle(fontSize: 14, color: Color(0xFF4B5563)),
          ),
          const SizedBox(height: 12),
          Container(
            height: 4,
            width: 48,
            decoration: BoxDecoration(
              color: canShowScore ? Colors.red : const Color(0xFFE5E7EB),
              borderRadius: BorderRadius.circular(2),
            ),
          )
        ],
      ),
    );
  }
}