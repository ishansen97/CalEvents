<!DOCTYPE html>

<title>Menu - Add Item</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ include file="./Layouts/Styles.jsp" %>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="Layouts/validation.js" type="text/javascript"></script>
<style>
    .fakeimg {
        height: 200px;
        background: #aaa;
    }
</style>
<script>
    function itemDemo() {
        document.getElementById("item_name").value = "Lava cake";
        document.getElementById("ingredients").value = "Chocolate,Sugar,Butter,Cocoa";
        document.getElementById("price").value = 2;
        
    }
</script>
<body class="w3-light-grey">
    <%@ include file="./Layouts/Navigation.jsp" %>
    <!-- !PAGE CONTENT! -->
    <div class="w3-main" style="margin-left:300px;margin-top:43px;">
        <br>
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Add Item</h3>
                    <hr>
                    <form name="item_form" method="post" action="<%=request.getContextPath()%>/AddMenuItem" onsubmit="return formValidate()">
                        <div class="form-row">
                            <div class="col-md-7 form-group">
                                <label class="text-muted">Name</label>
                                <input type="text" class="form-control" placeholder="Item Name " name="item_name" id="item_name" required>
                            </div>
                            <div class="col-md-5 form-group">
                                <label class="text-muted">Category</label>
                                <select class="form-control" name="item_category" required>
                                    <option value="" selected>Choose...</option>
                                    <option value="Appetizer">Appetizer</option>
                                    <option value="Main Dish">Main Dish</option>
                                    <option value="Dessert">Dessert</option>
                                    <option value="Refreshment">Refreshment</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-7 form-group">
                                <label>Ingredients</label>
                                <input type="text" class="form-control" placeholder="Ingredients" name="item_ingredients" id="ingredients" required>
                            </div>  

                            <div class="col-md-5 form-group">
                                <label>Price</label>
                                <div class="input-group">
                                    <div class="input-group-prepend"><span class="input-group-text">$</span></div>
                                    <input type="text" class="form-control" placeholder="Price" name="item_price" id="price" required>
                                </div>
                            </div> 
                        </div>
                        <div class="form-row">
                            <div class="col-md-6">
                                <button type="submit" class="btn btn-primary">Add Item</button>
                                <button type="button" class="btn btn-success" onclick="itemDemo()">Show Demo</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%@ include file="Layouts/Footer.jsp" %>
        <!-- End page content -->
    </div>
    <%@ include file="Layouts/Scripts.jsp" %>
</body>
