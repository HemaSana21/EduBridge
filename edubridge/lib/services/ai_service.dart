// import 'dart:convert';
// import 'package:google_generative_ai/google_generative_ai.dart';

// class AIService {
//   // Your successfully retrieved Google AI Studio API Key:
//   static const String _apiKey = "AIzaSyCNZCht1eNslOJrXhJcPxdN_kKGGWKV8w0"; 

//   /// 1. Registration Flow Need Score Analyzer
//   static Future<Map<String, dynamic>> analyzeStudentNeed({
//     required double monthlyIncome,
//     required String supportType,
//     required String studentStory,
//   }) async {
//     try {
//       final model = GenerativeModel(
//         model: 'gemini-1.5-flash',
//         apiKey: _apiKey,
//       );

//       final prompt = '''
//       You are an expert social work coordinator assessing a student profile for scholarship eligibility.
//       Analyze the following student data:
//       - Monthly Family Income: ₹$monthlyIncome
//       - Support Required: $supportType
//       - Background Story: "$studentStory"

//       Based on this data, generate:
//       1. A "needScore" between 0 and 100 (where 100 is absolute maximum critical need).
//       2. A brief 1-sentence "justification" explaining why this score was given.

//       Return the response STRICTLY as a raw JSON object with the following keys:
//       {
//         "needScore": 85,
//         "justification": "Explanation here"
//       }
//       Do not include markdown blocks or any extra text outside of the raw JSON bracket.
//       ''';

//       final response = await model.generateContent([Content.text(prompt)]);
      
//       if (response.text != null) {
//         final cleanText = response.text!
//             .replaceAll('```json', '')
//             .replaceAll('```', '')
//             .trim();
//         return jsonDecode(cleanText) as Map<String, dynamic>;
//       }
//       throw Exception("Empty response");
//     } catch (e) {
//       print("AI Service Error: $e");
//       return _getMockAIScore(monthlyIncome, supportType, studentStory);
//     }
//   }

//   /// 2. Progress Tracker Analyzer (Recalculates Need using attendance/performance)
//   static Future<Map<String, dynamic>> analyzeProgressNeed({
//     required String studentName,
//     required double attendance,
//     required double performance,
//     required String currentSupportType,
//     required double monthlyIncome,
//   }) async {
//     try {
//       final model = GenerativeModel(
//         model: 'gemini-1.5-flash',
//         apiKey: _apiKey,
//       );

//       final prompt = '''
//       You are an AI Social Impact Evaluator analyzing updated educational metrics for "$studentName":
//       - Current Attendance: ${attendance.toInt()}%
//       - Academic Performance: ${performance.toInt()}%
//       - Support Program: $currentSupportType
//       - Household Income: ₹${monthlyIncome.toInt()}

//       Calculate a dynamic "needScore" between 0 and 100 representing intervention priority (100 = urgent).
//       - Drops in attendance (<75%) increase priority drastically.
//       - Provide a 1-sentence "justification" outlining risk factors and recommended action.

//       Return the response STRICTLY as a raw JSON object:
//       {
//         "needScore": 75,
//         "justification": "Explanation here"
//       }
//       Do not include markdown or backticks (```) in output.
//       ''';

//       final response = await model.generateContent([Content.text(prompt)]);
      
//       if (response.text != null) {
//         final cleanText = response.text!
//             .replaceAll('```json', '')
//             .replaceAll('```', '')
//             .trim();
//         return jsonDecode(cleanText) as Map<String, dynamic>;
//       }
//       throw Exception("Empty response");
//     } catch (e) {
//       print("AI Progress Error: $e");
//       return _getMockAIScore(monthlyIncome, currentSupportType, "Fallback engine evaluation.");
//     }
//   }

//   // Safe fallback offline engine
//   static Map<String, dynamic> _getMockAIScore(double income, String support, String story) {
//     double score = 50.0;
//     if (income <= 5000) score += 30;
//     if (support.contains("Scholarship")) score += 10;
//     return {
//       "needScore": score.clamp(0.0, 100.0).toInt(),
//       "justification": "Analyzed locally. High prioritization recommended due to critical low-income thresholds."
//     };
//   }
// }






// import 'dart:convert';
// import 'package:google_generative_ai/google_generative_ai.dart';

// class AIService {
//   // Your active API key retrieved from Google AI Studio
//   static const String _apiKey = "AIzaSyCNZCht1eNslOJrXhJcPxdN_kKGGWKV8w0"; 

//   /// 1. Registration Flow Need Score Analyzer
//   static Future<Map<String, dynamic>> analyzeStudentNeed({
//     required double monthlyIncome,
//     required String supportType,
//     required String studentStory,
//   }) async {
//     try {
//       final model = GenerativeModel(
//         model: 'gemini-1.5-flash',
//         apiKey: _apiKey,
//       );

//       final prompt = '''
//       You are an expert social work coordinator assessing a student profile for scholarship eligibility.
//       Analyze the following student data:
//       - Monthly Family Income: ₹$monthlyIncome
//       - Support Required: $supportType
//       - Background Story: "$studentStory"

//       Based on this data, generate:
//       1. A "needScore" between 0 and 100 (where 100 is absolute maximum critical need).
//       2. A brief 1-sentence "justification" explaining why this score was given.

//       Return the response STRICTLY as a raw JSON object with the following keys:
//       {
//         "needScore": 85,
//         "justification": "Explanation here"
//       }
//       Do not include markdown blocks or any extra text outside of the raw JSON bracket.
//       ''';

//       final response = await model.generateContent([Content.text(prompt)]);
      
//       if (response.text != null) {
//         final cleanText = response.text!
//             .replaceAll('```json', '')
//             .replaceAll('```', '')
//             .trim();
//         return jsonDecode(cleanText) as Map<String, dynamic>;
//       }
//       throw Exception("Empty response");
//     } catch (e) {
//       print("AI Service Error: $e");
//       return _getMockAIScore(monthlyIncome, supportType, studentStory);
//     }
//   }

//   /// 2. Progress Tracker Analyzer (Recalculates Need using attendance/performance)
//   static Future<Map<String, dynamic>> analyzeProgressNeed({
//     required String studentName,
//     required double attendance,
//     required double performance,
//     required String currentSupportType,
//     required double monthlyIncome,
//   }) async {
//     try {
//       final model = GenerativeModel(
//         model: 'gemini-1.5-flash',
//         apiKey: _apiKey,
//       );

//       final prompt = '''
//       You are an AI Social Impact Evaluator analyzing updated educational metrics for "$studentName":
//       - Current Attendance: ${attendance.toInt()}%
//       - Academic Performance: ${performance.toInt()}%
//       - Support Program: $currentSupportType
//       - Household Income: ₹${monthlyIncome.toInt()}

//       Calculate a dynamic "needScore" between 0 and 100 representing intervention priority (100 = urgent).
//       - Drops in attendance (<75%) increase priority drastically.
//       - Provide a 1-sentence "justification" outlining risk factors and recommended action.

//       Return the response STRICTLY as a raw JSON object:
//       {
//         "needScore": 75,
//         "justification": "Explanation here"
//       }
//       Do not include markdown or backticks (```) in output.
//       ''';

//       final response = await model.generateContent([Content.text(prompt)]);
      
//       if (response.text != null) {
//         final cleanText = response.text!
//             .replaceAll('```json', '')
//             .replaceAll('```', '')
//             .trim();
//         return jsonDecode(cleanText) as Map<String, dynamic>;
//       }
//       throw Exception("Empty response");
//     } catch (e) {
//       print("AI Progress Error: $e");
//       return _getMockAIScore(monthlyIncome, currentSupportType, "Fallback evaluation.");
//     }
//   }

//   // Safe fallback offline engine
//   static Map<String, dynamic> _getMockAIScore(double income, String support, String story) {
//     double score = 50.0;
//     if (income <= 5000) score += 30;
//     if (support.contains("Scholarship")) score += 10;
//     return {
//       "needScore": score.clamp(0.0, 100.0).toInt(),
//       "justification": "Analyzed locally. High prioritization recommended due to critical low-income thresholds."
//     };
//   }
// }







// import 'dart:convert';
// import 'package:google_generative_ai/google_generative_ai.dart';

// class AIService {
//   // Hardcoded API Key
//   static const String _apiKey = "AIzaSyCNZCht1eNslOJrXhJcPxdN_kKGGWKV8w0"; 

//   /// 1. Registration Flow Need Score Analyzer
//   static Future<Map<String, dynamic>> analyzeStudentNeed({
//     required double monthlyIncome,
//     required String supportType,
//     required String studentStory,
//   }) async {
//     try {
//       final model = GenerativeModel(
//         model: 'gemini-1.5-flash',
//         apiKey: _apiKey,
//       );

//       final prompt = '''
//       You are an expert social work coordinator assessing a student profile for scholarship eligibility.
//       Analyze the following student data:
//       - Monthly Family Income: ₹$monthlyIncome
//       - Support Required: $supportType
//       - Background Story: "$studentStory"

//       Based on this data, generate:
//       1. A "needScore" between 0 and 100 (where 100 is absolute maximum critical need).
//       2. A brief 1-sentence "justification" explaining why this score was given.

//       Return the response STRICTLY as a raw JSON object with the following keys:
//       {
//         "needScore": 85,
//         "justification": "Explanation here"
//       }
//       Do not include markdown blocks, backticks, or any extra text outside of the raw JSON bracket.
//       ''';

//       final response = await model.generateContent([Content.text(prompt)]);
      
//       if (response.text != null) {
//         final cleanText = _cleanJsonResponse(response.text!);
//         return jsonDecode(cleanText) as Map<String, dynamic>;
//       }
//       throw Exception("Empty response");
//     } catch (e) {
//       print("AI Service Error: $e");
//       return _getMockAIScore(monthlyIncome, supportType, studentStory);
//     }
//   }

//   /// 2. Progress Tracker Analyzer
//   static Future<Map<String, dynamic>> analyzeProgressNeed({
//     required String studentName,
//     required double attendance,
//     required double performance,
//     required String currentSupportType,
//     required double monthlyIncome,
//   }) async {
//     try {
//       final model = GenerativeModel(
//         model: 'gemini-1.5-flash',
//         apiKey: _apiKey,
//       );

//       final prompt = '''
//       You are an AI Social Impact Evaluator analyzing updated educational metrics for "$studentName":
//       - Current Attendance: ${attendance.toInt()}%
//       - Academic Performance: ${performance.toInt()}%
//       - Support Program: $currentSupportType
//       - Household Income: ₹${monthlyIncome.toInt()}

//       Calculate a dynamic "needScore" between 0 and 100 representing intervention priority (100 = urgent).
//       - Drops in attendance (<75%) increase priority drastically.
//       - Provide a 1-sentence "justification" outlining risk factors and recommended action.

//       Return the response STRICTLY as a raw JSON object:
//       {
//         "needScore": 75,
//         "justification": "Explanation here"
//       }
//       Do not include markdown blocks, backticks, or any extra text outside of the raw JSON bracket.
//       ''';

//       final response = await model.generateContent([Content.text(prompt)]);
      
//       if (response.text != null) {
//         final cleanText = _cleanJsonResponse(response.text!);
//         return jsonDecode(cleanText) as Map<String, dynamic>;
//       }
//       throw Exception("Empty response");
//     } catch (e) {
//       print("AI Progress Error: $e");
//       return _getMockAIScore(monthlyIncome, currentSupportType, "Fallback evaluation.");
//     }
//   }

//   /// Sanitizes API responses by removing Markdown block containers (```json) if they exist.
//   static String _cleanJsonResponse(String rawResponse) {
//     String clean = rawResponse.trim();
//     if (clean.startsWith('```json')) {
//       clean = clean.substring(7);
//     } else if (clean.startsWith('```')) {
//       clean = clean.substring(3);
//     }
//     if (clean.endsWith('```')) {
//       clean = clean.substring(0, clean.length - 3);
//     }
//     return clean.trim();
//   }

//   static Map<String, dynamic> _getMockAIScore(double income, String support, String story) {
//     double score = 50.0;
//     if (income <= 5000) score += 30;
//     if (support.contains("Scholarship")) score += 10;
//     return {
//       "needScore": score.clamp(0.0, 100.0).toInt(),
//       "justification": "Analyzed locally. High prioritization recommended due to critical low-income thresholds."
//     };
//   }
// }








import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';

class AIService {
  // Hardcoded API Key
  static const String _apiKey = "AIzaSyCNZCHt1eNsl0JrXhJcPxdN_kKGGWKV8w0";

  /// 1. Registration Flow Need Score Analyzer
  static Future<Map<String, dynamic>> analyzeStudentNeed({
    required double monthlyIncome,
    required String supportType,
    required String studentStory,
  }) async {
    try {
      final model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: _apiKey,
      );

      final prompt = '''
You are an expert social work coordinator assessing a student profile for scholarship and support eligibility.
Analyze the following student data:
- Monthly Family Income: \$$monthlyIncome
- Requested Support Type: $supportType
- Student Background/Story: "$studentStory"

Provide a JSON response with:
1. "needScore": An integer from 0 (lowest priority) to 100 (critical, highest emergency).
2. "justification": A clear, 1-sentence risk factor summary explaining why this score was assigned.

Response must be valid JSON only. Do not wrap in markdown blocks like ```json.
''';

      final response = await model.generateContent([Content.text(prompt)]);
      final text = response.text;
      if (text == null) {
        throw Exception("Empty response from Gemini AI");
      }

      // Parse and return the JSON
      return jsonDecode(text.trim()) as Map<String, dynamic>;
    } catch (e) {
      return {
        "needScore": 50,
        "justification": "Error analyzing student need. Defaulting to medium risk. Details: $e"
      };
    }
  }

  /// 2. Progress Update Risk/Need Analyzer
  static Future<Map<String, dynamic>> analyzeProgressNeed({
    required double attendance,
    required double performance,
    required String currentSupportType,
    required double monthlyIncome,
  }) async {
    try {
      final model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: _apiKey,
        generationConfig: GenerationConfig(
          responseMimeType: 'application/json',
          responseSchema: Schema.object(
            properties: {
              'needScore': Schema.integer(description: 'A priority score from 0 to 100.'),
              'justification': Schema.string(description: 'A 1-sentence risk factor summary.'),
            },
            requiredProperties: ['needScore', 'justification'],
          ),
        ),
      );

      final prompt = '''
Analyze these academic progress variables to assess if the student's risk profile has escalated:
- Attendance: $attendance%
- Academic Performance/Marks: $performance%
- Current Support Received: $currentSupportType
- Household Monthly Income: \$$monthlyIncome

Calculate their current "needScore" (0-100) and provide a 1-sentence "justification".
''';

      final response = await model.generateContent([Content.text(prompt)]);
      final text = response.text;
      if (text == null) {
        throw Exception("Empty response from Gemini AI");
      }

      return jsonDecode(text.trim()) as Map<String, dynamic>;
    } catch (e) {
      return {
        "needScore": 50,
        "justification": "Error updating progress priority. Defaulting to medium risk."
      };
    }
  }
}