function validateInput(input, match) {
  if (match === true || input.value.match(match)) {
    input.classList.remove('is-invalid');
    return true;
  }
  input.classList.add('is-invalid');
  input.value = '';
  return false;
}

function validatePayment() {
  var ccNo = document.forms["payment"]["cardNumber"];
  var ccCCV = document.forms["payment"]["cardCCV"];
  var ccName = document.forms["payment"]["cardName"];
  var expMM = document.forms["payment"]["expiryMonth"];
  var expYY = document.forms["payment"]["expiryYear"];
  var dateMM = Number(expMM.value);
  var dateYY = Number(expYY.value);

  // validate CardNo and CCV
  var validCCNo = validateInput(ccNo, /^(\d{4}(\s|-)?){3}(\d{2,4})$/);
  var validCCV = validateInput(ccCCV, /^\d{3}$/);
  var validName = validateInput(ccCCV, /^\w+/);
  var validExMM = validateInput(expMM, (dateMM > 0 && dateMM <= 12));
  var validExYY = validateInput(expYY, (dateYY >= new Date().getFullYear() % 100));

  return validCCNo && validCCV && validExMM && validExYY;
}
