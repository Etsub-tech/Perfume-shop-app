import 'package:flutter/material.dart';
import 'perfume_model.dart';

class SearchPage extends StatefulWidget {
  final List<Perfume> allPerfumes;
  final ValueChanged<Perfume> onAddToCart;

  const SearchPage({
    super.key,
    required this.allPerfumes,
    required this.onAddToCart,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _query = '';

  List<Perfume> get _results {
    if (_query.isEmpty) {
      return widget.allPerfumes;
    }
    final searchLower = _query.toLowerCase();
    return widget.allPerfumes.where((perfume) {
      return perfume.name.toLowerCase().contains(searchLower) ||
          perfume.brand.toLowerCase().contains(searchLower) ||
          perfume.category.toLowerCase().contains(searchLower);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search perfumes'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search by name, brand or category',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onChanged: (value) {
                setState(() => _query = value);
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _results.isEmpty
                  ? const Center(
                      child: Text(
                        'No perfumes found. Try another search term.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _results.length,
                      itemBuilder: (context, index) {
                        final perfume = _results[index];
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
                            trailing: TextButton(
                              onPressed: () {
                                widget.onAddToCart(perfume);
                              },
                              child: const Text('Add'),
                            ),
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
