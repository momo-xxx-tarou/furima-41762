function calculatePrice() {
  const priceInput = document.getElementById('item-price');
  const taxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  if (!priceInput) return; // 要素が見つからない場合は何もしない

  // 価格が入力された時に実行
  priceInput.addEventListener('input', function () {
    const price = parseInt(priceInput.value, 10);
    if (price >= 300 && price <= 9999999) {
      // 販売手数料（10%）の計算
      const tax = Math.floor(price * 0.1);
      const totalProfit = price - tax;

      // 手数料と利益の表示
      taxPrice.textContent = tax;
      profit.textContent = totalProfit;
    } else {
      // 無効な価格の場合は手数料と利益をクリア
      taxPrice.textContent = '';
      profit.textContent = '';
    }
  });
}

// DOMContentLoaded、turbo:load、turbo:render イベントに対応
document.addEventListener('DOMContentLoaded', calculatePrice);
document.addEventListener('turbo:load', calculatePrice);
document.addEventListener('turbo:render', calculatePrice);
