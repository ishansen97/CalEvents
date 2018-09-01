<%-- 
    Document   : add
    Created on : Sep 2, 2018, 12:20:53 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Facilities</title>
        
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
            <style>
            .button {
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 16px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
                cursor: pointer;
            }
            
            .button5 {
                background-color: white;
                color: black;
                border: 2px solid #555555;
            }
            .button5:hover {
                background-color: #555555;
                color: white;
            }
            select {
                background-repeat:no-repeat;
                background-position:300px;
                width:353px;
                padding:5px;
                margin-top:8px;
                border-radius:5px;
                background-color:white;
                color:#555555;
                font-size:15px;
            }
            
            select:hover {
                color:white;
                background-color:#555555;
            }
            
            input[type=text], select {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
        </style>
</head>
<body>

    
<div class="w3-bar w3-black">
<button class="w3-bar-item w3-button" onclick="openA('tentForm')">Tents</button>
<button class="w3-bar-item w3-button" onclick="openA('soundsForm')">Sounds</button>
<button class="w3-bar-item w3-button" onclick="openA('lightsForm')">Lights</button>
<button class="w3-bar-item w3-button" onclick="openA('kitchenForm')">Kitchen Utensils</button>
<button class="w3-bar-item w3-button" onclick="openA('tablesForm')">Tables</button>
<button class="w3-bar-item w3-button" onclick="openA('chairsForm')">Chairs</button>
</div>
        
<form class="form-inline" id="myForm" action="../addfacilityservelet" method="POST">
<div id="tentForm" class="w3-container formN">
  <h2>Add Tents</h2>
  <p>Please make sure every field is filled!</p>
  <table>           
            
                <tr>
                    <td id="nameText1" >Name </td>
                    <td id="nameText2" >:</td>                    
                    <td id="name" ><input type="text" name="name" id="name" required="" />
                </tr>
                <tr>
                    <td id="quantityText1" >Quantity </td>
                    <td id="quantityText2" >:</td>                  
                    <td id="quantity" ><input type="text" name="quantity" id="quantity" required=""/>
                </tr>  
                <tr>
                    <td id="conditionText1" > Condition  </td>  
                    <td id="conditionText2" >:</td>           
                    <td id="condition" style=" text-align: center;" >
                    <select name="condition" style="width:100%;" required>
                    <option value="">select condition</option>                       
                    <option value="good">good</option>
                    <option value="very good">very good</option>
                    <option value="bad">bad</option>
                    <option value="very bad">very bad</option>            
                    </select>
                    </td>        
                </tr>
                <tr>
                    <td id="colorText1">Color </td>
                    <td id="colorText2">:</td>
                    <td id="colort"><input type="text" name="color" id="color" required=""/>
                </tr>
                <tr>
                    <td id="sizeText1">Size </td>
                    <td id="sizeText2">:</td>          
                    <td id="sizet"><input type="text" name="size" id="size" required=""/>
                </tr> 
                <tr>
                    <td></td>
                    <td></td>
                    <td style="text-align: right;"><button type="submit" class="button button5" name="tents" id="button1">Add to Tents</button></td>
                    
                </tr>
  </table>
</div>

<div id="soundsForm" class="w3-container formN" style="display:none">
  <h2>Add Sounds</h2>
  <p>Please make sure every field is filled!</p>
  <table>           
            
                <tr>
                    <td id="nameText1" >Name </td>
                    <td id="nameText2" >:</td>                    
                    <td id="name" ><input type="text" name="name" id="name" required="" />
                </tr>
                <tr>
                    <td id="quantityText1" >Quantity </td>
                    <td id="quantityText2" >:</td>                  
                    <td id="quantity" ><input type="text" name="quantity" id="quantity" required=""/>
                </tr>  
                <tr>
                    <td id="conditionText1" > Condition  </td>  
                    <td id="conditionText2" >:</td>           
                    <td id="condition" style=" text-align: center;" >
                    <select name="condition" style="width:100%;" required>
                    <option value="">select condition</option>                       
                    <option value="good">good</option>
                    <option value="very good">very good</option>
                    <option value="bad">bad</option>
                    <option value="very bad">very bad</option>            
                    </select>
                    </td>        
                </tr>                 
                <tr>
                    <td id="brandText1">Brand </td>
                    <td id="brandText2">:</td>          
                    <td id="brandt"><input type="text" name="brand" id="brand" required=""/>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td style="text-align: right;"><button type="submit" class="button button5" name="tents" id="button1">Add to Sounds</button></td>
                    
                </tr>
  </table>
</div>

<div id="lightsForm" class="w3-container formN" style="display:none">
  <h2>Add Lights</h2>
  <p>Please make sure every field is filled!</p>
  <table>           
            
                <tr>
                    <td id="nameText1" >Name </td>
                    <td id="nameText2" >:</td>                    
                    <td id="name" ><input type="text" name="name" id="name" required="" />
                </tr>
                <tr>
                    <td id="quantityText1" >Quantity </td>
                    <td id="quantityText2" >:</td>                  
                    <td id="quantity" ><input type="text" name="quantity" id="quantity" required=""/>
                </tr>  
                <tr>
                    <td id="conditionText1" > Condition  </td>  
                    <td id="conditionText2" >:</td>           
                    <td id="condition" style=" text-align: center;" >
                    <select name="condition" style="width:100%;" required>
                    <option value="">select condition</option>                       
                    <option value="good">good</option>
                    <option value="very good">very good</option>
                    <option value="bad">bad</option>
                    <option value="very bad">very bad</option>            
                    </select>
                    </td>        
                </tr> 
                <tr>
                    <td></td>
                    <td></td>
                    <td style="text-align: right;"><button type="submit" class="button button5" name="tents" id="button1">Add to Lights</button></td>
                    
                </tr>
  </table>
</div>

<div id="kitchenForm" class="w3-container formN" style="display:none">
  <h2>Add Kitchen Utensils</h2>
  <p>Please make sure every field is filled!</p>
  <table>           
            
                <tr>
                    <td id="nameText1" >Name </td>
                    <td id="nameText2" >:</td>                    
                    <td id="name" ><input type="text" name="name" id="name" required="" />
                </tr>
                <tr>
                    <td id="quantityText1" >Quantity </td>
                    <td id="quantityText2" >:</td>                  
                    <td id="quantity" ><input type="text" name="quantity" id="quantity" required=""/>
                </tr>  
                <tr>
                    <td id="conditionText1" > Condition  </td>  
                    <td id="conditionText2" >:</td>           
                    <td id="condition" style=" text-align: center;" >
                    <select name="condition" style="width:100%;" required>
                    <option value="">select condition</option>                       
                    <option value="good">good</option>
                    <option value="very good">very good</option>
                    <option value="bad">bad</option>
                    <option value="very bad">very bad</option>            
                    </select>
                    </td>        
                </tr>                
                <tr>
                    <td id="typeText1" >Type </td>
                    <td id="typeText2" >:</td>          
                    <td id="typet" ><input type="text" name="brand" id="type" required=""/>
                </tr> 
                <tr>
                    <td></td>
                    <td></td>
                    <td style="text-align: right;"><button type="submit" class="button button5" name="tents" id="button1">Add to Kitchen Utensils</button></td>
                    
                </tr>
  </table>
</div>

<div id="tablesForm" class="w3-container formN" style="display:none">
  <h2>Add Tables</h2>
  <p>Please make sure every field is filled!</p>
  <table>           
            
                <tr>
                    <td id="nameText1" >Name </td>
                    <td id="nameText2" >:</td>                    
                    <td id="name" ><input type="text" name="name" id="name" required="" />
                </tr>
                <tr>
                    <td id="quantityText1" >Quantity </td>
                    <td id="quantityText2" >:</td>                  
                    <td id="quantity" ><input type="text" name="quantity" id="quantity" required=""/>
                </tr>  
                <tr>
                    <td id="conditionText1" > Condition  </td>  
                    <td id="conditionText2" >:</td>           
                    <td id="condition" style=" text-align: center;" >
                    <select name="condition" style="width:100%;" required>
                    <option value="">select condition</option>                       
                    <option value="good">good</option>
                    <option value="very good">very good</option>
                    <option value="bad">bad</option>
                    <option value="very bad">very bad</option>            
                    </select>
                    </td>        
                </tr>                  
                <tr>
                    <td id="tbSizeText1">Table Size </td>
                    <td id="tbSizeText2">:</td>          
                    <td id="tbSizet"><input type="text" name="brand" id="tbSize" required=""/>
                </tr>                   
                <tr>
                    <td id="noText1">No Of Chairs </td>
                    <td id="noText2">:</td>          
                    <td id="not"><input type="text" name="brand" id="no" required=""/>
                </tr>                  
                <tr>
                    <td id="shapeText1">Shape </td>
                    <td id="shapeText2">:</td>          
                    <td id="shapet"><input type="text" name="brand" id="brand" required=""/>
                </tr> 
                <tr>
                    <td></td>
                    <td></td>
                    <td style="text-align: right;"><button type="submit" class="button button5" name="tents" id="button1">Add to Tables</button></td>
                    
                </tr>
  </table>
</div>

<div id="chairsForm" class="w3-container formN" style="display:none">
  <h2>Add Chairs</h2>
  <p>Please make sure every field is filled!</p>
  <table>           
            
                <tr>
                    <td id="nameText1" >Name </td>
                    <td id="nameText2" >:</td>                    
                    <td id="name" ><input type="text" name="name" id="name" required="" />
                </tr>
                <tr>
                    <td id="quantityText1" >Quantity </td>
                    <td id="quantityText2" >:</td>                  
                    <td id="quantity" ><input type="text" name="quantity" id="quantity" required=""/>
                </tr>  
                <tr>
                    <td id="conditionText1" > Condition  </td>  
                    <td id="conditionText2" >:</td>           
                    <td id="condition" style=" text-align: center;" >
                    <select name="condition" style="width:100%;" required>
                    <option value="">select condition</option>                       
                    <option value="good">good</option>
                    <option value="very good">very good</option>
                    <option value="bad">bad</option>
                    <option value="very bad">very bad</option>            
                    </select>
                    </td>        
                </tr>                    
                <tr>
                    <td id="mText1">Material </td>
                    <td id="mText2">:</td>          
                    <td id="mt"><input type="text" name="brand" id="material" required=""/>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td style="text-align: right;"><button type="submit" class="button button5" name="tents" id="button1">Add to Chairs</button></td>
                    
                </tr>
  </table>
</div>  

</form>
    
<script>
function openA(form_name) {
    var i;
    var x = document.getElementsByClassName("formN");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    document.getElementById(form_name).style.display = "block";  
}
</script>    
</body>
</html>
