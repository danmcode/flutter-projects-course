import 'package:flutter/material.dart';
import 'package:productos_app/src/models/models.dart';

class ProductCard extends StatelessWidget {
  final Products product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 15, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(
              picture: product.picture,
            ),
            _ProductDetails(
              id: product.id,
              name: product.name,
              price: product.price,
            ),
            Positioned(
              child: _PriceTag(
                price: product.price,
              ),
              top: 0,
              right: 0,
            ),
            if (!product.available)
              const Positioned(
                child: _ProductAvailable(),
                top: 0,
                left: 0,
              ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 5),
            blurRadius: 10,
          ),
        ],
      );
}

class _ProductAvailable extends StatelessWidget {
  const _ProductAvailable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        color: Colors.yellow[800],
      ),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'No disponible',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  const _PriceTag({
    Key? key,
    required this.price,
  }) : super(key: key);

  final double price;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 70,
      width: 100,
      decoration: _priceTagDecoration(),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "\$$price",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _priceTagDecoration() => const BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(25),
        bottomLeft: Radius.circular(25),
      ));
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({
    Key? key,
    required this.name,
    required this.price,
    required this.id,
  }) : super(key: key);

  final String name;
  final double price;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        width: double.infinity,
        height: 70,
        decoration: _bottonBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              id!,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _bottonBoxDecoration() => const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      );
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    Key? key,
    this.picture,
  }) : super(key: key);

  final String? picture;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: SizedBox(
        width: double.infinity,
        height: 400,
        child: picture != null
            ? FadeInImage(
                image: NetworkImage(picture!),
                placeholder: const AssetImage('assets/jar-loading.gif'),
                fit: BoxFit.cover,
              )
            : const Image(
                image: AssetImage('assets/no-image.png'),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
