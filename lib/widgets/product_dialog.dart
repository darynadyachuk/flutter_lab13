import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/products_provider.dart';

class ProductDialog extends StatefulWidget {
  final int? index;

  const ProductDialog({super.key, this.index});

  @override
  State<ProductDialog> createState() => _ProductDialogState();
}

class _ProductDialogState extends State<ProductDialog> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.index != null;

    final productsProvider = context.read<ProductsProvider>();

    final initialName = _isEditing
        ? productsProvider.products[widget.index!]['name']
        : '';
    final initialPrice = _isEditing
        ? productsProvider.products[widget.index!]['price'].toString()
        : '';

    _nameController = TextEditingController(text: initialName);
    _priceController = TextEditingController(text: initialPrice);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(_isEditing ? l10n.edit : l10n.add),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: _priceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Price'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancel),
        ),
        ElevatedButton(
          onPressed: () {
            final name = _nameController.text;
            final price = double.tryParse(_priceController.text) ?? 0.0;

            if (name.isNotEmpty) {
              final provider = context.read<ProductsProvider>();
              if (_isEditing) {
                provider.editProduct(widget.index!, name, price);
              } else {
                provider.addProduct(name, price);
              }
              Navigator.pop(context);
            }
          },
          child: Text(l10n.save),
        ),
      ],
    );
  }
}
