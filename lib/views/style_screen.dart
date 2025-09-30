import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/custom_button.dart';

class StyleScreen extends StatefulWidget {
  const StyleScreen({super.key});

  @override
  State<StyleScreen> createState() => _StyleScreenState();
}

class _StyleScreenState extends State<StyleScreen> {
  bool useCupertino = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(useCupertino
            ? 'iOS Style (Cupertino)'
            : 'Android Style (Material)'),
        backgroundColor:
            useCupertino ? CupertinoColors.systemBlue : Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Toggle Button (Custom Button used here - demonstrates reusable button)
            CustomButton(
              text: useCupertino ? 'Switch to Material' : 'Switch to Cupertino',
              onPressed: () {
                setState(() {
                  useCupertino = !useCupertino;
                });
              },
              backgroundColor: useCupertino ? Colors.grey[600]! : Colors.blue,
              width: double.infinity,
            ),

            const SizedBox(height: 20),

            Text(
              useCupertino
                  ? 'iOS Style Components:'
                  : 'Android Style Components:',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // Service Card Demo (Material vs Cupertino)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: useCupertino
                    ? CupertinoColors.systemGrey6
                    : Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
                border: useCupertino
                    ? Border.all(color: CupertinoColors.systemGrey4)
                    : null,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Basic Groom',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color:
                          useCupertino ? CupertinoColors.label : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Bath and brush for your pet',
                    style: TextStyle(
                      fontSize: 14,
                      color: useCupertino
                          ? CupertinoColors.secondaryLabel
                          : Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '\$30',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: useCupertino
                          ? CupertinoColors.activeBlue
                          : Colors.green,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: useCupertino
                        ? CupertinoButton.filled(
                            child: const Text('Book Now'),
                            onPressed: () => _showAlert('iOS Button Pressed'),
                          )
                        : ElevatedButton(
                            onPressed: () =>
                                _showAlert('Android Button Pressed'),
                            child: const Text('Book Now'),
                          ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Button Examples
            Row(
              children: [
                Expanded(
                  child: useCupertino
                      ? CupertinoButton.filled(
                          child: const Text('iOS Button'),
                          onPressed: () => _showAlert('iOS Button'),
                        )
                      : ElevatedButton(
                          onPressed: () => _showAlert('Android Button'),
                          child: const Text('Android Button'),
                        ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: useCupertino
                      ? CupertinoButton(
                          child: const Text('iOS Text'),
                          onPressed: () => _showAlert('iOS Text Button'),
                        )
                      : TextButton(
                          onPressed: () => _showAlert('Android Text'),
                          child: const Text('Android Text'),
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showAlert(String message) {
    if (useCupertino) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('iOS Alert'),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Android Dialog'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
