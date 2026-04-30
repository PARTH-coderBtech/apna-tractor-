import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class BudgetFilterScreen extends StatefulWidget {
  const BudgetFilterScreen({super.key});

  @override
  State<BudgetFilterScreen> createState() => _BudgetFilterScreenState();
}

class _BudgetFilterScreenState extends State<BudgetFilterScreen> {
  // Slider values: Start at 2 and End at 200
  RangeValues _currentRangeValues = const RangeValues(2, 200);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Budgets",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Your budget (In Rupees)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black54),
            ),
            const SizedBox(height: 30),

            // Display current selected values
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildValueBox(_currentRangeValues.start.round().toString(), "Lakh"),
                _buildValueBox(_currentRangeValues.end.round().toString(), "Lakh"),
              ],
            ),

            const SizedBox(height: 100),

            // Range Slider
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.black,
                inactiveTrackColor: Colors.black12,
                thumbColor: Colors.black,
                overlayColor: Colors.black.withOpacity(0.1),
                rangeThumbShape: const RoundRangeSliderThumbShape(enabledThumbRadius: 10),
              ),
              child: RangeSlider(
                values: _currentRangeValues,
                min: 2,
                max: 200,
                divisions: 198,
                labels: RangeLabels(
                  "${_currentRangeValues.start.round()} Lakh",
                  "${_currentRangeValues.end.round()} Lakh",
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              ),
            ),

            // Label text below slider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("2 Lakh", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("200 Lakh", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            const Spacer(),

            // Apply Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryTeal,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  // Yahan filter logic aayega
                  print("Selected Range: ${_currentRangeValues.start} to ${_currentRangeValues.end}");
                  Navigator.pop(context);
                },
                child: const Text(
                  "Apply",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // UI helper for the boxes at the top
  Widget _buildValueBox(String value, String label) {
    return Container(
      width: 140,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontSize: 18, color: Colors.black54)),
        ],
      ),
    );
  }
}