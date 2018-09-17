function formValidate() {
    var price = document.forms["item_form"]["item_price"];
    var category = document.forms["item_form"]["item_category"];

    var exp = /^[0-9]+(\.[0-9]+)?$/;
    if (price.value.match(exp)) {
        if (category.value !== "") {
            return true;
        } else {
            alert("Please select a category!");
        }
    } else {
        alert("Only numbers are allowed for price!");
        return false;
    }
}



