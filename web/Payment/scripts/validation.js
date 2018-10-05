function validateInput(input, match, keepContent) {
  if (match === true || input.value.match(match)) {
    input.classList.remove('is-invalid');
    return true;
  }
  input.value = '';
  input.classList.add('is-invalid');
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

function validateExpense() {
  var form = document.forms["expenses"];
  var dept = form["dept"];
  var desc = form["desc"];
  var method = form["desc"];
  var amount = form["amount"];

  var validDept = validateInput(dept, dept.value !== "");
  var validDesc = validateInput(desc, true);
  var validMethod = validateInput(method, method.value !== "");
  var validAmount = validateInput(amount, /^\d+(\.\d+)?$/);

  return validDept && validDesc && validMethod && validAmount;
}