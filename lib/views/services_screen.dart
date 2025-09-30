import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../services/service_data.dart';
import '../widgets/service_card.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = ServiceData.getServices();

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          // Tab Bar for Material vs Cupertino (Requirement 5)
          const TabBar(
            tabs: [
              Tab(text: 'Material Design'),
              Tab(text: 'Cupertino Design'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Material Design Version
                _buildMaterialDesign(services),
                // Cupertino Design Version
                _buildCupertinoDesign(services),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Material Design Implementation
  Widget _buildMaterialDesign(List services) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Our Services - Material Design',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            // Using Third-party package (Requirement 9)
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              itemCount: services.length,
              itemBuilder: (context, index) {
                return ServiceCard(service: services[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Cupertino Design Implementation
  Widget _buildCupertinoDesign(List services) {
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Our Services - Cupertino Design',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: CupertinoListTile(
                      title: Text(service.name),
                      subtitle: Text(service.description),
                      trailing: Text(
                        service.price,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.systemGreen,
                        ),
                      ),
                      onTap: () {
                        showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: Text(service.name),
                            content: Text(service.description),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text('Book Now'),
                                onPressed: () => Navigator.pop(context),
                              ),
                              CupertinoDialogAction(
                                child: const Text('Cancel'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
