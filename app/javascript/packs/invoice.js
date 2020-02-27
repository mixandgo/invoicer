import $ from 'jquery';

const tax = (amount) => {
  return (amount * 19) / 100;
};

$(document).on('input', '.invoice-new__item-quantity', (evt) => {
  const el = evt.currentTarget;
  const priceField = $(el).siblings('.invoice-new__item-price')[0];
  const totalField = $(el).siblings('.invoice-new__item-total')[0];
  const taxField = $(el).siblings('.invoice-new__item-tax')[0];
  const total = el.value * priceField.value;
  totalField.value = total;
  taxField.value = tax(total);
});

$(document).on('input', '.invoice-new__item-price', (evt) => {
  const el = evt.currentTarget;
  const quantityField = $(el).siblings('.invoice-new__item-quantity')[0];
  const totalField = $(el).siblings('.invoice-new__item-total')[0];
  const taxField = $(el).siblings('.invoice-new__item-tax')[0];
  const total = el.value * quantityField.value;
  totalField.value = total;
  taxField.value = tax(total);
});
