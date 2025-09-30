import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class BookingScreen extends StatefulWidget {
  final bool useCupertino;

  const BookingScreen({
    super.key,
    required this.useCupertino,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String selectedService = 'Basic Groom';
  final TextEditingController petNameController = TextEditingController();
  final TextEditingController ownerNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Book Appointment',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff000000),
              ),
            ),
            const SizedBox(height: 25),

            // Service Dropdown
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: DropdownButton<String>(
                value: selectedService,
                isExpanded: true,
                underline: Container(),
                items: const [
                  DropdownMenuItem(
                      value: 'Basic Groom', child: Text('Basic Groom')),
                  DropdownMenuItem(
                      value: 'Full Groom', child: Text('Full Groom')),
                  DropdownMenuItem(
                      value: 'Nail Trim', child: Text('Nail Trim')),
                  DropdownMenuItem(
                      value: 'Teeth Cleaning', child: Text('Teeth Cleaning')),
                  DropdownMenuItem(
                      value: 'Flea Treatment', child: Text('Flea Treatment')),
                  DropdownMenuItem(
                      value: 'De-shedding', child: Text('De-shedding')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedService = value;
                    });
                  }
                },
              ),
            ),

            const SizedBox(height: 16),

            // Pet Name Field
            TextField(
              controller: petNameController,
              decoration: const InputDecoration(
                labelText: 'Pet Name',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            // Owner Name Field
            TextField(
              controller: ownerNameController,
              decoration: const InputDecoration(
                labelText: 'Owner Name',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            // Date and Time Display
            const Row(
              children: [
                Expanded(
                  child: Text(
                    'Date: 25/9/2025',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Time: 4:44 AM',
                    style: TextStyle(color: Colors.black54),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Fixed Book Appointment Button - Full width container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton.primary(
                text: 'Book Appointment',
                icon: Icons.calendar_today,
                width: double.infinity, // Make button take full available width
                height: 50,
                fontSize: 16,
                onPressed: () {
                  // Show confirmation dialog
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Booking Confirmed'),
                      content: Text(
                          'Your appointment for $selectedService has been booked!'),
                      actions: [
                        CustomButton.secondary(
                          text: 'Close',
                          width: 80,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    petNameController.dispose();
    ownerNameController.dispose();
    super.dispose();
  }
}
