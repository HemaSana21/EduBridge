import 'package:flutter/material.dart';
import 'upload_documents_screen.dart'; 

class FamilySupportScreen extends StatefulWidget {
  const FamilySupportScreen({super.key});

  @override
  State<FamilySupportScreen> createState() => _FamilySupportScreenState();
}

class _FamilySupportScreenState extends State<FamilySupportScreen> {
  final TextEditingController incomeController = TextEditingController();
  final TextEditingController storyController = TextEditingController();
  String? selectedSupport;

  void _validateAndNext() {
    if (incomeController.text.isEmpty || selectedSupport == null || storyController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all family details"),
          backgroundColor: Colors.redAccent,
        ),
      );
    } else {
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => const UploadDocumentsScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
          // Custom Progress Header matching Step 2 of 3 UI
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
                    _buildProgressSegment(false),
                  ],
                ),
                const SizedBox(height: 12),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Step 2 of 3",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Family & Support",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 24),

                  _buildInputLabel("MONTHLY FAMILY INCOME (₹)"),
                  _buildTextField(
                    controller: incomeController,
                    hint: "e.g., 8500",
                    keyboardType: TextInputType.number,
                  ),
                  
                  const SizedBox(height: 20),
                  
                  _buildInputLabel("SUPPORT REQUIRED"),
                  _buildDropdownField(),

                  const SizedBox(height: 20),

                  _buildInputLabel("STUDENT'S STORY"),
                  _buildTextField(
                    controller: storyController,
                    hint: "Share their background and aspirations...",
                    maxLines: 5,
                  ),
                  
                  const SizedBox(height: 40),

                  // Bottom Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: const BorderSide(color: Color(0xFFE2E8F0)),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text("Back", style: TextStyle(color: Color(0xFF64748B))),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _validateAndNext,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2563EB),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text(
                            "Next",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Color(0xFF64748B),
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF94A3B8)),
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFF1F5F9)),
        ),
      ),
    );
  }

  Widget _buildDropdownField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: const Text("Select type of support", style: TextStyle(color: Color(0xFF94A3B8))),
          value: selectedSupport,
          icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF64748B)),
          items: ["Financial", "Mentorship", "Supplies"].map((s) {
            return DropdownMenuItem(value: s, child: Text(s));
          }).toList(),
          onChanged: (val) => setState(() => selectedSupport = val),
        ),
      ),
    );
  }
}