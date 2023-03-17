import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lojinha/models/product.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({Key? key}) : super(key: key);

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _priceFocus = FocusNode();
  final _descriptionFocus = FocusNode();

  final _imageUrlFocus = FocusNode();
  final _imageUrlController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageUrlFocus.addListener((updateImage));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
    _imageUrlFocus.dispose();
    _imageUrlFocus.removeListener((updateImage));
  }

  void updateImage() {
    setState(() {});
  }

  void _subitForm() {
    final isValid = _for
    _formKey.currentState?.save();


    final newProduct = Product(
      id: Random().nextDouble().toString(),
      title: _formData['Nome'] as String,
      description: _formData['Descrição'] as String,
      price: _formData['Preço'] as double,
      imageUrl: _formData['Imagem'] as String,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        title: const Text('Formulário'),
        actions: [
          IconButton(
            onPressed: _subitForm,
            icon: const Icon(Icons.send_sharp),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocus);
                },
                onSaved: (name) => _formData['Nome'] = name ?? '',
              ),
              TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  labelText: 'Preço',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                textInputAction: TextInputAction.next,
                focusNode: _priceFocus,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocus);
                },
                onSaved: (price) =>
                    _formData['Preço'] = double.parse(price ?? '0'),
              ),
              TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                focusNode: _descriptionFocus,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                onSaved: (description) =>
                    _formData['Descrição'] = description ?? '',
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'URL da Imagem',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      focusNode: _imageUrlFocus,
                      controller: _imageUrlController,
                      keyboardType: TextInputType.url,
                      onFieldSubmitted: (_) => _subitForm(),
                      onSaved: (imageUrl) =>
                          _formData['Imagem'] = imageUrl ?? '',
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white54,
                        width: 1,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: _imageUrlController.text.isEmpty
                        ? const Text(
                            'URL',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        : FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(_imageUrlController.text),
                          ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
