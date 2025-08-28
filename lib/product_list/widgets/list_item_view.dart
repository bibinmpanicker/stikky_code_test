part of '../product_list_page.dart';

class _ListItemView extends StatelessWidget {
  const _ListItemView(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final p = product.variants;

    return InkWell(
      onTap: _onTap,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ink(
              width: 100,
              height: 80,
              child:
                  product.images.isNotEmpty &&
                      product.images.first.src.isNotEmpty
                  ? Image(
                      image: CachedNetworkImageProvider(
                        product.images.first.src,
                      ),
                      fit: BoxFit.fill,
                    )
                  : const Icon(
                      Icons.image_not_supported_outlined,
                      size: 32,
                      color: Colors.grey,
                    ),
            ),
            Expanded(
              child: Ink(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${p.first.price.currencyCode} ${p.first.price.amount}',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black54,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          p.first.compareAtPrice != null
                              ? '${p.first.compareAtPrice?.currencyCode ?? ''} '
                                    '${p.first.compareAtPrice!.amount}'
                              : '',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.black38,
                            decorationThickness: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTap() {
    final productUrl =
        'https://${Env.shopifyEndpoint}/products/${product.handle}';

    SharePlus.instance.share(ShareParams(text: productUrl));
  }
}
