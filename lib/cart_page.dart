import 'package:flutter/material.dart';
import 'perfume_model.dart';

class CartPage extends StatelessWidget {
  final List<Perfume> cartItems;
  final ValueChanged<Perfume> onRemove;

  const CartPage({
    super.key,
    required this.cartItems,
    required this.onRemove,
  });

  double _priceValue(String price) {
    final numeric = price.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(numeric.replaceAll(',', '')) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final total = cartItems.fold<double>(
      0,
      (sum, item) => sum + _priceValue(item.price),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'Your cart is empty. Add a perfume to see it here.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final perfume = cartItems[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 14),
                          child: ListTile(
                            leading: Image.asset(
                              perfume.image,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            title: Text(perfume.name),
                            subtitle: Text('${perfume.brand} • ${perfume.category}'),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(perfume.price),
                                const SizedBox(height: 6),
                                GestureDetector(
                                  onTap: () => onRemove(perfume),
                                  child: const Text(
                                    'Remove',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${total.toStringAsFixed(0)} ETB',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
