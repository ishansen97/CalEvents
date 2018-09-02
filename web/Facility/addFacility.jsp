<%-- 
    Document   : addFacility
    Created on : Aug 30, 2018, 11:19:21 PM
    Author     : User
--%>

<%@page import="supporting.Fetch"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Facility</title>
        <script>
            
        function addTents()
        {
            //hide
            
            document.getElementById('button2').style.display='none'; 
            document.getElementById('button3').style.display='none'; 
            document.getElementById('button4').style.display='none'; 
            document.getElementById('button5').style.display='none'; 
            document.getElementById('button6').style.display='none'; 
            
            
            document.getElementById('colorText1').style.display='none';
            document.getElementById('colorText2').style.display='none';
            document.getElementById('colort').style.display='none';
            
            document.getElementById('brandText1').style.display='none';
            document.getElementById('brandText2').style.display='none';
            document.getElementById('brandt').style.display='none';
            
//            document.getElementById('color').required=false;

            document.getElementById('sizeText1').style.display='none';
            document.getElementById('sizeText2').style.display='none';
            document.getElementById('sizet').style.display='none';
            
//            document.getElementById('size').required=false;

            document.getElementById('typeText1').style.display='none';
            document.getElementById('typeText2').style.display='none';
            document.getElementById('typet').style.display='none';
            
            document.getElementById('mText1').style.display='none';
            document.getElementById('mText2').style.display='none';
            document.getElementById('mt').style.display='none';
            
            document.getElementById('tbSizeText1').style.display='none';
            document.getElementById('tbSizeText2').style.display='none';
            document.getElementById('tbSizet').style.display='none';
            
            document.getElementById('noText1').style.display='none';
            document.getElementById('noText2').style.display='none';
            document.getElementById('not').style.display='none';
            
            document.getElementById('shapeText1').style.display='none';
            document.getElementById('shapeText2').style.display='none';
            document.getElementById('shapet').style.display='none';

            //show
            document.getElementById('nameText1').style.display='';
            document.getElementById('nameText2').style.display='';
            document.getElementById('name').style.display='';
            
            document.getElementById('quantityText1').style.display='';
            document.getElementById('quantityText2').style.display='';
            document.getElementById('quantity').style.display='';
            
            document.getElementById('conditionText1').style.display='';
            document.getElementById('conditionText2').style.display='';
            document.getElementById('condition').style.display='';
            
            document.getElementById('colorText1').style.display='';
            document.getElementById('colorText2').style.display='';
            document.getElementById('colort').style.display='';
//            document.getElementById('color').required=true;

            document.getElementById('sizeText1').style.display='';
            document.getElementById('sizeText2').style.display='';
            document.getElementById('sizet').style.display='';
//            document.getElementById('size').required=true;
            document.getElementById('button1').style.display='';
        }            
        function addSounds()
        {
           //hide
           
            document.getElementById('button1').style.display='none'; 
            document.getElementById('button3').style.display='none'; 
            document.getElementById('button4').style.display='none'; 
            document.getElementById('button5').style.display='none'; 
            document.getElementById('button6').style.display='none'; 
            
            document.getElementById('colorText1').style.display='none';
            document.getElementById('colorText2').style.display='none';
            document.getElementById('colort').style.display='none';
            
            document.getElementById('brandText1').style.display='none';
            document.getElementById('brandText2').style.display='none';
            document.getElementById('brandt').style.display='none';
            
//            document.getElementById('color').required=false;

            document.getElementById('sizeText1').style.display='none';
            document.getElementById('sizeText2').style.display='none';
            document.getElementById('sizet').style.display='none';
            
//            document.getElementById('size').required=false;

            document.getElementById('typeText1').style.display='none';
            document.getElementById('typeText2').style.display='none';
            document.getElementById('typet').style.display='none';
            
            document.getElementById('mText1').style.display='none';
            document.getElementById('mText2').style.display='none';
            document.getElementById('mt').style.display='none';
            
            document.getElementById('tbSizeText1').style.display='none';
            document.getElementById('tbSizeText2').style.display='none';
            document.getElementById('tbSizet').style.display='none';
            
            document.getElementById('noText1').style.display='none';
            document.getElementById('noText2').style.display='none';
            document.getElementById('not').style.display='none';
            
            document.getElementById('shapeText1').style.display='none';
            document.getElementById('shapeText2').style.display='none';
            document.getElementById('shapet').style.display='none';
            
            //show
            document.getElementById('nameText1').style.display='';
            document.getElementById('nameText2').style.display='';
            document.getElementById('name').style.display='';
            
            document.getElementById('quantityText1').style.display='';
            document.getElementById('quantityText2').style.display='';
            document.getElementById('quantity').style.display='';
            
            document.getElementById('conditionText1').style.display='';
            document.getElementById('conditionText2').style.display='';
            document.getElementById('condition').style.display='';
            
            document.getElementById('brandText1').style.display='';
            document.getElementById('brandText2').style.display='';
            document.getElementById('brandt').style.display='';
//            document.getElementById('brand').required=true;
            document.getElementById('button2').style.display='';
        }           
        function addKitchen()
        {
            //hide
            
            document.getElementById('button1').style.display='none'; 
            document.getElementById('button2').style.display='none'; 
            document.getElementById('button4').style.display='none'; 
            document.getElementById('button5').style.display='none'; 
            document.getElementById('button6').style.display='none'; 
            
            document.getElementById('colorText1').style.display='none';
            document.getElementById('colorText2').style.display='none';
            document.getElementById('colort').style.display='none';
            
            document.getElementById('brandText1').style.display='none';
            document.getElementById('brandText2').style.display='none';
            document.getElementById('brandt').style.display='none';
            
//            document.getElementById('color').required=false;

            document.getElementById('sizeText1').style.display='none';
            document.getElementById('sizeText2').style.display='none';
            document.getElementById('sizet').style.display='none';
            
//            document.getElementById('size').required=false;

            document.getElementById('typeText1').style.display='none';
            document.getElementById('typeText2').style.display='none';
            document.getElementById('typet').style.display='none';
            
            document.getElementById('mText1').style.display='none';
            document.getElementById('mText2').style.display='none';
            document.getElementById('mt').style.display='none';
            
            document.getElementById('tbSizeText1').style.display='none';
            document.getElementById('tbSizeText2').style.display='none';
            document.getElementById('tbSizet').style.display='none';
            
            document.getElementById('noText1').style.display='none';
            document.getElementById('noText2').style.display='none';
            document.getElementById('not').style.display='none';
            
            document.getElementById('shapeText1').style.display='none';
            document.getElementById('shapeText2').style.display='none';
            document.getElementById('shapet').style.display='none';

            //show
            document.getElementById('nameText1').style.display='';
            document.getElementById('nameText2').style.display='';
            document.getElementById('name').style.display='';
            
            document.getElementById('quantityText1').style.display='';
            document.getElementById('quantityText2').style.display='';
            document.getElementById('quantity').style.display='';
            
            document.getElementById('conditionText1').style.display='';
            document.getElementById('conditionText2').style.display='';
            document.getElementById('condition').style.display='';
            
            document.getElementById('typeText1').style.display='';
            document.getElementById('typeText2').style.display='';
            document.getElementById('typet').style.display='';
            document.getElementById('button3').style.display='';
             
        }         
        
        function addChairs()
        {
            //hide
            
            document.getElementById('button1').style.display='none'; 
            document.getElementById('button3').style.display='none'; 
            document.getElementById('button2').style.display='none'; 
            document.getElementById('button5').style.display='none'; 
            document.getElementById('button6').style.display='none'; 
            
            document.getElementById('colorText1').style.display='none';
            document.getElementById('colorText2').style.display='none';
            document.getElementById('colort').style.display='none';
            
            document.getElementById('brandText1').style.display='none';
            document.getElementById('brandText2').style.display='none';
            document.getElementById('brandt').style.display='none';
            
//            document.getElementById('color').required=false;

            document.getElementById('sizeText1').style.display='none';
            document.getElementById('sizeText2').style.display='none';
            document.getElementById('sizet').style.display='none';
            
//            document.getElementById('size').required=false;

            document.getElementById('typeText1').style.display='none';
            document.getElementById('typeText2').style.display='none';
            document.getElementById('typet').style.display='none';
            
            document.getElementById('mText1').style.display='none';
            document.getElementById('mText2').style.display='none';
            document.getElementById('mt').style.display='none';
            
            document.getElementById('tbSizeText1').style.display='none';
            document.getElementById('tbSizeText2').style.display='none';
            document.getElementById('tbSizet').style.display='none';
            
            document.getElementById('noText1').style.display='none';
            document.getElementById('noText2').style.display='none';
            document.getElementById('not').style.display='none';
            
            document.getElementById('shapeText1').style.display='none';
            document.getElementById('shapeText2').style.display='none';
            document.getElementById('shapet').style.display='none';

            //show
            document.getElementById('nameText1').style.display='';
            document.getElementById('nameText2').style.display='';
            document.getElementById('name').style.display='';
            
            document.getElementById('quantityText1').style.display='';
            document.getElementById('quantityText2').style.display='';
            document.getElementById('quantity').style.display='';
            
            document.getElementById('conditionText1').style.display='';
            document.getElementById('conditionText2').style.display='';
            document.getElementById('condition').style.display='';
            
            document.getElementById('mText1').style.display='';
            document.getElementById('mText2').style.display='';
            document.getElementById('mt').style.display='';
            document.getElementById('button4').style.display='';
        }         
        
        function addLights()
        {
            //hide
            
            document.getElementById('button1').style.display='none'; 
            document.getElementById('button3').style.display='none'; 
            document.getElementById('button4').style.display='none'; 
            document.getElementById('button2').style.display='none'; 
            document.getElementById('button6').style.display='none'; 
            
            document.getElementById('colorText1').style.display='none';
            document.getElementById('colorText2').style.display='none';
            document.getElementById('colort').style.display='none';
            
            document.getElementById('brandText1').style.display='none';
            document.getElementById('brandText2').style.display='none';
            document.getElementById('brandt').style.display='none';
            
//            document.getElementById('color').required=false;

            document.getElementById('sizeText1').style.display='none';
            document.getElementById('sizeText2').style.display='none';
            document.getElementById('sizet').style.display='none';
            
//            document.getElementById('size').required=false;

            document.getElementById('typeText1').style.display='none';
            document.getElementById('typeText2').style.display='none';
            document.getElementById('typet').style.display='none';
            
            document.getElementById('mText1').style.display='none';
            document.getElementById('mText2').style.display='none';
            document.getElementById('mt').style.display='none';
            
            document.getElementById('tbSizeText1').style.display='none';
            document.getElementById('tbSizeText2').style.display='none';
            document.getElementById('tbSizet').style.display='none';
            
            document.getElementById('noText1').style.display='none';
            document.getElementById('noText2').style.display='none';
            document.getElementById('not').style.display='none';
            
            document.getElementById('shapeText1').style.display='none';
            document.getElementById('shapeText2').style.display='none';
            document.getElementById('shapet').style.display='none';

            //show
            document.getElementById('nameText1').style.display='';
            document.getElementById('nameText2').style.display='';
            document.getElementById('name').style.display='';
            
            document.getElementById('quantityText1').style.display='';
            document.getElementById('quantityText2').style.display='';
            document.getElementById('quantity').style.display='';
            
            document.getElementById('conditionText1').style.display='';
            document.getElementById('conditionText2').style.display='';
            document.getElementById('condition').style.display='';
            document.getElementById('button5').style.display='';
            
        }   
        
        
        function addTables()
        {
            //hide
            
            document.getElementById('button1').style.display='none'; 
            document.getElementById('button3').style.display='none'; 
            document.getElementById('button4').style.display='none'; 
            document.getElementById('button5').style.display='none'; 
            document.getElementById('button2').style.display='none'; 
            
            document.getElementById('colorText1').style.display='none';
            document.getElementById('colorText2').style.display='none';
            document.getElementById('colort').style.display='none';
            
            document.getElementById('brandText1').style.display='none';
            document.getElementById('brandText2').style.display='none';
            document.getElementById('brandt').style.display='none';
            
//            document.getElementById('color').required=false;

            document.getElementById('sizeText1').style.display='none';
            document.getElementById('sizeText2').style.display='none';
            document.getElementById('sizet').style.display='none';
            
//            document.getElementById('size').required=false;

            document.getElementById('typeText1').style.display='none';
            document.getElementById('typeText2').style.display='none';
            document.getElementById('typet').style.display='none';
            
            document.getElementById('mText1').style.display='none';
            document.getElementById('mText2').style.display='none';
            document.getElementById('mt').style.display='none';

            //show
            document.getElementById('nameText1').style.display='';
            document.getElementById('nameText2').style.display='';
            document.getElementById('name').style.display='';
            
            document.getElementById('quantityText1').style.display='';
            document.getElementById('quantityText2').style.display='';
            document.getElementById('quantity').style.display='';
            
            document.getElementById('conditionText1').style.display='';
            document.getElementById('conditionText2').style.display='';
            document.getElementById('condition').style.display='';
            
            document.getElementById('tbSizeText1').style.display='';
            document.getElementById('tbSizeText2').style.display='';
            document.getElementById('tbSizet').style.display='';
            
            document.getElementById('noText1').style.display='';
            document.getElementById('noText2').style.display='';
            document.getElementById('not').style.display='';
            
            document.getElementById('shapeText1').style.display='';
            document.getElementById('shapeText2').style.display='';
            document.getElementById('shapet').style.display='';
            document.getElementById('button6').style.display='';
        }   
        
        </script>
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
    <body style="background-color: #d6d6d6">
        <form class="form-inline" id="myForm" action="../addfacilityservelet" method="POST">
            
            <div style="background-color: #d6d6d6; padding-left: 0%; color:#555555;">
                    
            <input type="button" class="button button5" onclick="javascript:addTents();" value="Add Tents" name="tents"/>
            <input type="button" class="button button5" onclick="javascript:addSounds();" value="Add Sounds" name="sounds"/>
            <input type="button" class="button button5" onclick="javascript:addKitchen();" value="Add Kitchen Utensils" name="kitchen"/>
            <input type="button" class="button button5" onclick="javascript:addChairs();" value="Add Chairs" name="chairs"/>
            <input type="button" class="button button5" onclick="javascript:addLights();" value="Add Lights" name="lights"/>
            <input type="button" class="button button5" onclick="javascript:addTables();" value="Add Tables" name="tables"/>
            
            <table>           
            
                <tr>
                    <td id="nameText1" style="display: none" >Name </td>
                    <td id="nameText2" style="display: none" >:</td>                    
                    <td id="name" style="display: none" ><input type="text" name="name" id="name" required="" />
                </tr>
                <tr>
                    <td id="quantityText1" style="display: none" >Quantity </td>
                    <td id="quantityText2" style="display: none" >:</td>                  
                    <td id="quantity" style="display: none" ><input type="text" name="quantity" id="quantity" required=""/>
                </tr>  
                <tr>
                    <td id="conditionText1" style="display: none" > Condition  </td>  
                    <td id="conditionText2" style="display: none" >:</td>           
                    <td id="condition" style=" text-align: center; display: none;" >
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
                    <td id="colorText1" style="display: none" >Color </td>
                    <td id="colorText2" style="display: none" >:</td>
                    <td id="colort" style="display: none" ><input type="text" name="color" id="color" />
                </tr>
                <tr>
                    <td id="sizeText1" style="display: none" >Size </td>
                    <td id="sizeText2" style="display: none" >:</td>          
                    <td id="sizet" style="display: none" ><input type="text" name="size" id="size" />
                </tr>                 
                <tr>
                    <td id="brandText1" style="display: none" >Brand </td>
                    <td id="brandText2" style="display: none" >:</td>          
                    <td id="brandt" style="display: none" ><input type="text" name="brand" id="brand" />
                </tr>                
                <tr>
                    <td id="typeText1" style="display: none" >Type </td>
                    <td id="typeText2" style="display: none" >:</td>          
                    <td id="typet" style="display: none" ><input type="text" name="type" id="type" />
                </tr>                    
                <tr>
                    <td id="mText1" style="display: none" >Material </td>
                    <td id="mText2" style="display: none" >:</td>          
                    <td id="mt" style="display: none" ><input type="text" name="material" id="material" />
                </tr>                  
                <tr>
                    <td id="tbSizeText1" style="display: none" >Table Size </td>
                    <td id="tbSizeText2" style="display: none" >:</td>          
                    <td id="tbSizet" style="display: none" ><input type="text" name="tcSize" id="tbSize" />
                </tr>                   
                <tr>
                    <td id="noText1" style="display: none" >No Of Chairs </td>
                    <td id="noText2" style="display: none" >:</td>          
                    <td id="not" style="display: none" ><input type="text" name="no" id="no" />
                </tr>                  
                <tr>
                    <td id="shapeText1" style="display: none" >Shape </td>
                    <td id="shapeText2" style="display: none" >:</td>          
                    <td id="shapet" style="display: none" ><input type="text" name="shape" id="shape" />
                </tr>                
            </table>

                <br>
                <br>
                <button type="submit" class="button button5" style="display: none;" name="tents" id="button1">Add to Tents</button>
                <button type="submit" class="button button5" style="display: none;" name="sounds" id="button2">Add to Sounds</button>
                <button type="submit" class="button button5" style="display: none;" name="kitchen" id="button3">Add to Kitchen Utensils</button>
                <button type="submit" class="button button5" style="display: none;" name="chairs" id="button4">Add to Chairs</button>
                <button type="submit" class="button button5" style="display: none;" name="lights" id="button5">Add to Lights</button>
                <button type="submit" class="button button5" style="display: none;" name="tables" id="button6">Add to Tables</button>
                
            </div>
        </form>
        <div style="text-align: center; margin-top: 20%">


        </div>
    </body>
</html>
