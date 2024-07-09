// ★ StateNotifierProvider 실습

// StateNotifierProvider에 넣어줄 모델
class ShoppingItemModel {
  // 이름
  final String name;

  // 갯수
  final int quantity;

  // 구매 여부
  final bool hasBought;

  // 매운 여부
  final bool isSpicy;

  // 값을 받아주자!
  ShoppingItemModel({
    required this.name,
    required this.quantity,
    required this.hasBought,
    required this.isSpicy,
  });
}
