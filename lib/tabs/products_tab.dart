import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/products_provider.dart';
import '../../utils/currency_formatter.dart';
import '../../widgets/product_dialog.dart';
import '../../widgets/delete_product_dialog.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({super.key});

  void _openProductDialog(BuildContext context, {int? index}) {
    showDialog(
      context: context,
      builder: (_) => ProductDialog(index: index),
    );
  }

  Future<void> _openDeleteDialog(BuildContext context, int index) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => const DeleteProductDialog(),
    );

    if (confirmed == true && context.mounted) {
      context.read<ProductsProvider>().deleteProduct(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final productsProvider = context.watch<ProductsProvider>();
    final products = productsProvider.products;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.helloUser('Дарина'),
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),

          TextField(
            onChanged: (value) {
              context.read<ProductsProvider>().updateSearchQuery(value);
            },
            decoration: InputDecoration(
              hintText: l10n.searchPlaceholder,
              prefixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 20),
          Text(
            l10n.itemsCount(products.length),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const Divider(),

          if (products.isEmpty)
            const Expanded(
              child: Center(
                child: Text(
                  'No products yet',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final item = products[index];
                  return Card(
                    child: ListTile(
                      title: Text(item['name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(context.formatPrice(item['price'])),
                          Text(l10n.addedDate(item['date'])),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.orange),
                            tooltip: l10n.edit,
                            onPressed: () =>
                                _openProductDialog(context, index: index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            tooltip: l10n.delete,
                            onPressed: () => _openDeleteDialog(context, index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

          SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _openProductDialog(context),
                icon: const Icon(Icons.add),
                label: Text(l10n.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
