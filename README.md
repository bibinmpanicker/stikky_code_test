# stikky_code_test

A Flutter application that fetches and displays products using the **Shopify Storefront GraphQL
API** with pagination.

---

## 📱 Features

- Fetch products via **GraphQL API**
- Infinite scroll & pagination
- Image caching for performance
- State management with **BLoC**
- Share products with friends

---

## 📦 Packages Used & Why

- **[graphql_flutter](https://pub.dev/packages/graphql_flutter)**  
  Used to interact with Shopify’s **GraphQL API** for fetching products and supporting pagination.

- **[cached_network_image](https://pub.dev/packages/cached_network_image)**  
  Efficiently caches product images to improve performance and reduce bandwidth usage.

- **[flutter_bloc](https://pub.dev/packages/flutter_bloc)**  
  Handles state management using the BLoC (Business Logic Component) pattern, ensuring a clean and
  scalable architecture.

- **[share_plus](https://pub.dev/packages/share_plus)**  
  Allows users to share product details (links, text, etc.) across apps like WhatsApp, Email, and
  more.

---

## 🛠️ Getting Started

- [Flutter SDK](https://docs.flutter.dev/get-started/install)  
  Version: **Flutter 3.35.2 (stable)**  
  Dart: **3.9.0**
- Android Studio / VS Code (with Flutter & Dart extensions)

### Installation

- clone https://github.com/bibinmpanicker/stikky_code_test.git
- cd stikky_code_test
- flutter pub get
- flutter run --dart-define=SHOPIFY_ENDPOINT=<---your-shopify-endpoint.myshopify.com--->
  --dart-define=SHOPIFY_TOKEN=<---your-access-token--->
- (replace <---your-shopify-endpoint.myshopify.com---> and <---your-access-token---> with your
  actual Shopify Storefront API details.)

---

## AL Usage

- Model class generation.
- README.md polishing.
