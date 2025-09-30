import '../models/service.dart';

class ServiceData {
  static List<Service> getServices() {
    return [
      Service(
        name: 'Basic Groom',
        description: 'Bath and brush for your pet',
        price: '\$30',
      ),
      Service(
        name: 'Full Groom',
        description: 'Bath, brush, and haircut',
        price: '\$55',
      ),
      Service(
        name: 'Nail Trim',
        description: 'Trim and file nails',
        price: '\$15',
      ),
      Service(
        name: 'Teeth Cleaning',
        description: 'Professional dental care',
        price: '\$40',
      ),
      Service(
        name: 'Flea Treatment',
        description: 'Complete flea removal treatment',
        price: '\$25',
      ),
      Service(
        name: 'De-shedding',
        description: 'Remove excess fur and reduce shedding',
        price: '\$35',
      ),
    ];
  }
}
