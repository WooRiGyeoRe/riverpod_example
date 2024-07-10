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

  // copyWith
  // ShoppingItemModel 반환해줄 거임(그대로 ShoppingItemModel의 인스턴스를 받아야 하므로)
  ShoppingItemModel copyWith({
    // 옵셔널이니까 물음표 붙여주기
    String? name,
    int? quantity,
    bool? hasBought,
    bool? isSpicy,
  }) {
    return ShoppingItemModel(
        // null이 아니면 입력받은 name으로 저장하고, 만약 null이면 (입력받지 X) this.name으로 저장
        name: name ?? this.name,
        quantity: quantity ?? this.quantity,
        hasBought: hasBought ?? this.hasBought,
        isSpicy: isSpicy ?? this.isSpicy);
  }
}
