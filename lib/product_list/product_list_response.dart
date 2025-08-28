class ProductListResponse {
  final PageInfo pageInfo;
  final List<ProductEdge> edges;

  const ProductListResponse({required this.pageInfo, required this.edges});

  factory ProductListResponse.fromJson(Map<String, dynamic> json) {
    return ProductListResponse(
      pageInfo: PageInfo.fromJson(json['pageInfo']),
      edges: (json['edges'] as List)
          .map((e) => ProductEdge.fromJson(e))
          .toList(),
    );
  }
}

class PageInfo {
  final bool hasNextPage;
  final String? endCursor;

  const PageInfo({required this.hasNextPage, this.endCursor});

  factory PageInfo.fromJson(Map<String, dynamic> json) {
    return PageInfo(
      hasNextPage: json['hasNextPage'] as bool,
      endCursor: json['endCursor'] as String?,
    );
  }
}

class ProductEdge {
  final String cursor;
  final Product product;

  const ProductEdge({required this.cursor, required this.product});

  factory ProductEdge.fromJson(Map<String, dynamic> json) {
    return ProductEdge(
      cursor: json['cursor'] as String,
      product: Product.fromJson(json['node']),
    );
  }
}

class Product {
  final String id;
  final String title;
  final String handle;
  final List<ProductImage> images;
  final List<ProductVariant> variants;

  const Product({
    required this.id,
    required this.title,
    required this.handle,
    required this.images,
    required this.variants,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      title: json['title'] as String,
      handle: json['handle'] as String,
      images: (json['images']['edges'] as List)
          .map((e) => ProductImage.fromJson(e['node']))
          .toList(),
      variants: (json['variants']['edges'] as List)
          .map((e) => ProductVariant.fromJson(e['node']))
          .toList(),
    );
  }
}

class ProductImage {
  final String src;
  final String? altText;

  const ProductImage({required this.src, this.altText});

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      src: json['src'] as String,
      altText: json['altText'] as String?,
    );
  }
}

class ProductVariant {
  final Price price;
  final Price? compareAtPrice;

  const ProductVariant({required this.price, this.compareAtPrice});

  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    return ProductVariant(
      price: Price.fromJson(json['price']),
      compareAtPrice: json['compareAtPrice'] != null
          ? Price.fromJson(json['compareAtPrice'])
          : null,
    );
  }
}

class Price {
  final String amount;
  final String currencyCode;

  const Price({required this.amount, required this.currencyCode});

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      amount: json['amount'] as String,
      currencyCode: json['currencyCode'] as String,
    );
  }
}
