import 'package:flutter/material.dart';
import 'dart:math';
import '../../../../core/constants/colors.dart';

class EmiCalculatorPage extends StatefulWidget {
  const EmiCalculatorPage({super.key});

  @override
  State<EmiCalculatorPage> createState() => _EmiCalculatorPageState();
}

class _EmiCalculatorPageState extends State<EmiCalculatorPage> {
  double loanAmount = 500000;
  double interestRate = 9.5;
  double loanTenure = 5;
  
  bool showBreakup = false; 
  double emiResult = 0;
  double totalInterest = 0;
  double totalPayment = 0;

  @override
  void initState() {
    super.initState();
    calculateEMI();
  }

  void calculateEMI() {
    double r = interestRate / 12 / 100;
    double n = loanTenure * 12;
    
    if (r > 0) {
      double emi = (loanAmount * r * pow(1 + r, n)) / (pow(1 + r, n) - 1);
      setState(() {
        emiResult = emi;
        totalPayment = emi * n;
        totalInterest = totalPayment - loanAmount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("EMI Calculator", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TOP EMI DISPLAY
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.grey.shade50,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("EMI", style: TextStyle(color: Colors.grey, fontSize: 14)),
                      Text(
                        "₹ ${emiResult.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primaryTeal),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text("for ${loanTenure.toInt()} Years", style: const TextStyle(color: Colors.grey, fontSize: 16)),
                ],
              ),
            ),

            // VIEW BREAK-UP BAR
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: const Color(0xFF6A858D), 
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Colors.white, size: 20),
                  const SizedBox(width: 10),
                  const Text("View Payment Break-Up", style: TextStyle(color: Colors.white)),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primaryTeal,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      elevation: 0,
                    ),
                    onPressed: () => setState(() => showBreakup = !showBreakup),
                    child: Text(showBreakup ? "Hide" : "View"),
                  )
                ],
              ),
            ),

            // TOGGLE BETWEEN SLIDERS AND CHART
            if (!showBreakup) _buildSliders() else _buildBreakupSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSliders() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          _buildInputSection("Loan Amount:", "₹${loanAmount.toInt()}", loanAmount, 100000, 5000000, (val) {
            setState(() => loanAmount = val);
            calculateEMI();
          }),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _buildInputSection("Tenure (Years)", "${loanTenure.toInt()}", loanTenure, 1, 30, (val) {
                setState(() => loanTenure = val);
                calculateEMI();
              })),
              const SizedBox(width: 20),
              Expanded(child: _buildInputSection("Interest (%)", interestRate.toStringAsFixed(1), interestRate, 5, 20, (val) {
                setState(() => interestRate = val);
                calculateEMI();
              })),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBreakupSection() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          // CUSTOM PIE CHART (No Package Needed)
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: CustomPaint(
                  painter: SimplePiePainter(
                    principal: loanAmount,
                    interest: totalInterest,
                    principalColor: AppColors.primaryTeal,
                    interestColor: const Color(0xFFF19E38),
                  ),
                ),
              ),
              Column(
                children: [
                  const Text("Total Payment", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  Text("₹${totalPayment.toStringAsFixed(0)}", 
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              )
            ],
          ),
          const SizedBox(height: 40),
          _rowInfo("Total Interest Payable", totalInterest, const Color(0xFFF19E38)),
          _rowInfo("Principal Loan Amount", loanAmount, AppColors.primaryTeal),
          const Divider(height: 40),
          _rowInfo("Total Payment", totalPayment, Colors.black, isBold: true),
        ],
      ),
    );
  }

  Widget _buildInputSection(String title, String valueDisplay, double val, double min, double max, Function(double) onChange) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Slider(
          value: val,
          min: min,
          max: max,
          activeColor: AppColors.primaryTeal,
          onChanged: onChange,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(8)),
          child: Text(valueDisplay, textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }

  Widget _rowInfo(String title, double amount, Color dotColor, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(width: 14, height: 14, decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle)),
          const SizedBox(width: 12),
          Text(title, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.w500)),
          const Spacer(),
          Text("₹ ${amount.toStringAsFixed(0)}", style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.w500)),
        ],
      ),
    );
  }
}

// --- CUSTOM PAINTER CLASS (Yeh magic hai jo chart banata hai) ---
class SimplePiePainter extends CustomPainter {
  final double principal;
  final double interest;
  final Color principalColor;
  final Color interestColor;

  SimplePiePainter({
    required this.principal,
    required this.interest,
    required this.principalColor,
    required this.interestColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double total = principal + interest;
    double principalAngle = (principal / total) * 2 * pi;
    double interestAngle = (interest / total) * 2 * pi;

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30
      ..strokeCap = StrokeCap.butt;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    // Draw Principal Arc
    paint.color = principalColor;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2, principalAngle, false, paint);

    // Draw Interest Arc
    paint.color = interestColor;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2 + principalAngle, interestAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}