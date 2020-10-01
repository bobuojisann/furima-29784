window.addEventListener("load", function price () {
  const tax = document.getElementById("add-tax-price");
  const item_price = document.getElementById("item-price");
  const profit = document.getElementById("profit");

  item_price.addEventListener("input", () => {
  const price_value = document.getElementById("item-price").value;
  let price_tax = document.getElementById("add-tax-price");
  name = Math.floor(price_value * 0.1);
  price_tax.innerHTML = name
  console.log(price_tax)
  let sales_profit = document.getElementById("profit");
  // sales_profit.innerHTML = Math.floor(price_tax + price_value);
  sales_profit.innerHTML = price_value - name
  });
})
