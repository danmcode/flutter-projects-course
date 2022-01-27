import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:productos_app/src/providers/product_form_provider.dart';
import 'package:productos_app/src/services/services.dart';
import 'package:productos_app/src/ui/input_decorations.dart';
import 'package:productos_app/src/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider<ProductFormProvider>(
      create: (_) => ProductFormProvider(productService.selectedProduct),
      child: _ProductScreenBody(productService: productService),
    );
    //return _ProductScreenBody(productService: productService);
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductsService productService;

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(
                  url: productService.selectedProduct.picture,
                ),
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    onPressed: () async {
                      final picker = ImagePicker();
                      final XFile? pickedFile = await picker.pickImage(
                        source: ImageSource.camera,
                        imageQuality: 100,
                      );

                      if (pickedFile == null) {
                        print('No selecciono nada');
                        return;
                      }

                      productService
                          .updateSelectedProductImage(pickedFile.path);
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
            const _ProductForm(),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: productService.isSaving
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : const Icon(Icons.save_outlined),
        onPressed: productService.isSaving
            ? null
            : () async {
                if (!productForm.isValid()) return;

                final String? imgUrl = await productService.uploadImage();

                if (imgUrl != null) productForm.product.picture = imgUrl;

                await productService.saveorCreateProduct(productForm.product);
              },
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productFormProvider = Provider.of<ProductFormProvider>(context);
    final product = productFormProvider.product;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Container(
        width: double.infinity,
        decoration: _buildProductFormDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: productFormProvider.formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: product.name,
                  onChanged: (value) => product.name = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El nombre es obligatorio';
                    }
                  },
                  decoration: InputDecorations.authInputDecorations(
                    hintText: 'Nombre del producto',
                    labelText: 'Nombre: ',
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                  onChanged: (value) {
                    if (double.tryParse(value) == null) {
                      product.price = 0;
                    } else {
                      product.price = double.parse(value);
                    }
                  },
                  keyboardType: TextInputType.number,
                  initialValue: '\$${product.price}',
                  decoration: InputDecorations.authInputDecorations(
                    hintText: '\$19.00',
                    labelText: 'Precio: ',
                  ),
                ),
                const SizedBox(height: 30),
                SwitchListTile.adaptive(
                  title: const Text('Disponible: '),
                  activeColor: Colors.indigo,
                  value: product.available,
                  onChanged: productFormProvider.updateAvailability,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildProductFormDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(45),
          bottomRight: Radius.circular(45),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 5),
            blurRadius: 5,
          ),
        ],
      );
}
