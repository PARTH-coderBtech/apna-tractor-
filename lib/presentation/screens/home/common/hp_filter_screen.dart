import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class HpFilterScreen extends StatefulWidget {
  const HpFilterScreen({super.key});

  @override
  State<HpFilterScreen> createState() => _HpFilterScreenState();
}

class _HpFilterScreenState extends State<HpFilterScreen> {
  // HP Range: Maan lete hain tractors 10 HP se 150 HP tak aate hain
  RangeValues _currentHpValues = const RangeValues(10, 150);

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
          "HP Range",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Horsepower Range (In HP)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black54),
            ),
            const SizedBox(height: 30),

            // HP Value Boxes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHpBox(_currentHpValues.start.round().toString(), "HP"),
                _buildHpBox(_currentHpValues.end.round().toString(), "HP"),
              ],
            ),

            const SizedBox(height: 100),

            // HP Range Slider
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.black,
                inactiveTrackColor: Colors.black12,
                thumbColor: Colors.black,
                rangeThumbShape: const RoundRangeSliderThumbShape(enabledThumbRadius: 10),
              ),
              child: RangeSlider(
                values: _currentHpValues,
                min: 10,
                max: 150,
                divisions: 14, // 10 HP ke jumps ke liye
                labels: RangeLabels(
                  "${_currentHpValues.start.round()} HP",
                  "${_currentHpValues.end.round()} HP",
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentHpValues = values;
                  });
                },
              ),
            ),

            // Labels below slider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("10 HP", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("150 HP", style: TextStyle(fontWeight: FontWeight.bold)),
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
                  // Filter logic: In values ko use karke list filter hogi
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

  Widget _buildHpBox(String value, String label) {
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