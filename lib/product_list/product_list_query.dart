String getProductsQuery = r'''
  query GetProducts($cursor: String) {
    products(first: 10, after: $cursor) {
      pageInfo {
        hasNextPage
        endCursor
      }
      edges {
        cursor
        node {
          id
          title
          handle
          images(first: 1) {
            edges {
              node {
                src
                altText
              }
            }
          }
          variants(first: 1) {
            edges {
              node {
                price {
                  amount
                  currencyCode
                }
                compareAtPrice {
                  amount
                  currencyCode
                }
              }
            }
          }
        }
      }
    }
  }
''';
