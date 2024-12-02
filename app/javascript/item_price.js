document.addEventListener('DOMContentLoaded', function () {
  const priceInput = document.getElementById('item-price');
  const taxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

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
});
