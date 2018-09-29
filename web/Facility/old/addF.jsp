<%-- 
    Document   : addF
    Created on : Sep 16, 2018, 10:09:13 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title>Add Facilities</title>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script>

            function addTents()
            {
                //hide

                document.getElementById('button2').style.display = 'none';
                document.getElementById('button3').style.display = 'none';
                document.getElementById('button4').style.display = 'none';
                document.getElementById('button5').style.display = 'none';
                document.getElementById('button6').style.display = 'none';


                document.getElementById('colorText1').style.display = 'none';
                document.getElementById('colorText2').style.display = 'none';
                document.getElementById('colort').style.display = 'none';

                document.getElementById('brandText1').style.display = 'none';
                document.getElementById('brandText2').style.display = 'none';
                document.getElementById('brandt').style.display = 'none';

                //            document.getElementById('color').required=false;

                document.getElementById('sizeText1').style.display = 'none';
                document.getElementById('sizeText2').style.display = 'none';
                document.getElementById('sizet').style.display = 'none';

                //            document.getElementById('size').required=false;

                document.getElementById('typeText1').style.display = 'none';
                document.getElementById('typeText2').style.display = 'none';
                document.getElementById('typet').style.display = 'none';

                document.getElementById('mText1').style.display = 'none';
                document.getElementById('mText2').style.display = 'none';
                document.getElementById('mt').style.display = 'none';

                document.getElementById('tbSizeText1').style.display = 'none';
                document.getElementById('tbSizeText2').style.display = 'none';
                document.getElementById('tbSizet').style.display = 'none';

                document.getElementById('noText1').style.display = 'none';
                document.getElementById('noText2').style.display = 'none';
                document.getElementById('not').style.display = 'none';

                document.getElementById('shapeText1').style.display = 'none';
                document.getElementById('shapeText2').style.display = 'none';
                document.getElementById('shapet').style.display = 'none';

                //show
                document.getElementById('nameText1').style.display = '';
                document.getElementById('nameText2').style.display = '';
                document.getElementById('name').style.display = '';

                document.getElementById('quantityText1').style.display = '';
                document.getElementById('quantityText2').style.display = '';
                document.getElementById('quantity').style.display = '';

                document.getElementById('conditionText1').style.display = '';
                document.getElementById('conditionText2').style.display = '';
                document.getElementById('condition').style.display = '';

                document.getElementById('colorText1').style.display = '';
                document.getElementById('colorText2').style.display = '';
                document.getElementById('colort').style.display = '';
                //            document.getElementById('color').required=true;

                document.getElementById('sizeText1').style.display = '';
                document.getElementById('sizeText2').style.display = '';
                document.getElementById('sizet').style.display = '';
                //            document.getElementById('size').required=true;
                document.getElementById('button1').style.display = '';
            }
            function addSounds()
            {
                //hide

                document.getElementById('button1').style.display = 'none';
                document.getElementById('button3').style.display = 'none';
                document.getElementById('button4').style.display = 'none';
                document.getElementById('button5').style.display = 'none';
                document.getElementById('button6').style.display = 'none';

                document.getElementById('colorText1').style.display = 'none';
                document.getElementById('colorText2').style.display = 'none';
                document.getElementById('colort').style.display = 'none';

                document.getElementById('brandText1').style.display = 'none';
                document.getElementById('brandText2').style.display = 'none';
                document.getElementById('brandt').style.display = 'none';

                //            document.getElementById('color').required=false;

                document.getElementById('sizeText1').style.display = 'none';
                document.getElementById('sizeText2').style.display = 'none';
                document.getElementById('sizet').style.display = 'none';

                //            document.getElementById('size').required=false;

                document.getElementById('typeText1').style.display = 'none';
                document.getElementById('typeText2').style.display = 'none';
                document.getElementById('typet').style.display = 'none';

                document.getElementById('mText1').style.display = 'none';
                document.getElementById('mText2').style.display = 'none';
                document.getElementById('mt').style.display = 'none';

                document.getElementById('tbSizeText1').style.display = 'none';
                document.getElementById('tbSizeText2').style.display = 'none';
                document.getElementById('tbSizet').style.display = 'none';

                document.getElementById('noText1').style.display = 'none';
                document.getElementById('noText2').style.display = 'none';
                document.getElementById('not').style.display = 'none';

                document.getElementById('shapeText1').style.display = 'none';
                document.getElementById('shapeText2').style.display = 'none';
                document.getElementById('shapet').style.display = 'none';

                //show
                document.getElementById('nameText1').style.display = '';
                document.getElementById('nameText2').style.display = '';
                document.getElementById('name').style.display = '';

                document.getElementById('quantityText1').style.display = '';
                document.getElementById('quantityText2').style.display = '';
                document.getElementById('quantity').style.display = '';

                document.getElementById('conditionText1').style.display = '';
                document.getElementById('conditionText2').style.display = '';
                document.getElementById('condition').style.display = '';

                document.getElementById('brandText1').style.display = '';
                document.getElementById('brandText2').style.display = '';
                document.getElementById('brandt').style.display = '';
                //            document.getElementById('brand').required=true;
                document.getElementById('button2').style.display = '';
            }
            function addKitchen()
            {
                //hide

                document.getElementById('button1').style.display = 'none';
                document.getElementById('button2').style.display = 'none';
                document.getElementById('button4').style.display = 'none';
                document.getElementById('button5').style.display = 'none';
                document.getElementById('button6').style.display = 'none';

                document.getElementById('colorText1').style.display = 'none';
                document.getElementById('colorText2').style.display = 'none';
                document.getElementById('colort').style.display = 'none';

                document.getElementById('brandText1').style.display = 'none';
                document.getElementById('brandText2').style.display = 'none';
                document.getElementById('brandt').style.display = 'none';

                //            document.getElementById('color').required=false;

                document.getElementById('sizeText1').style.display = 'none';
                document.getElementById('sizeText2').style.display = 'none';
                document.getElementById('sizet').style.display = 'none';

                //            document.getElementById('size').required=false;

                document.getElementById('typeText1').style.display = 'none';
                document.getElementById('typeText2').style.display = 'none';
                document.getElementById('typet').style.display = 'none';

                document.getElementById('mText1').style.display = 'none';
                document.getElementById('mText2').style.display = 'none';
                document.getElementById('mt').style.display = 'none';

                document.getElementById('tbSizeText1').style.display = 'none';
                document.getElementById('tbSizeText2').style.display = 'none';
                document.getElementById('tbSizet').style.display = 'none';

                document.getElementById('noText1').style.display = 'none';
                document.getElementById('noText2').style.display = 'none';
                document.getElementById('not').style.display = 'none';

                document.getElementById('shapeText1').style.display = 'none';
                document.getElementById('shapeText2').style.display = 'none';
                document.getElementById('shapet').style.display = 'none';

                //show
                document.getElementById('nameText1').style.display = '';
                document.getElementById('nameText2').style.display = '';
                document.getElementById('name').style.display = '';

                document.getElementById('quantityText1').style.display = '';
                document.getElementById('quantityText2').style.display = '';
                document.getElementById('quantity').style.display = '';

                document.getElementById('conditionText1').style.display = '';
                document.getElementById('conditionText2').style.display = '';
                document.getElementById('condition').style.display = '';

                document.getElementById('typeText1').style.display = '';
                document.getElementById('typeText2').style.display = '';
                document.getElementById('typet').style.display = '';
                document.getElementById('button3').style.display = '';

            }

            function addChairs()
            {
                //hide

                document.getElementById('button1').style.display = 'none';
                document.getElementById('button3').style.display = 'none';
                document.getElementById('button2').style.display = 'none';
                document.getElementById('button5').style.display = 'none';
                document.getElementById('button6').style.display = 'none';

                document.getElementById('colorText1').style.display = 'none';
                document.getElementById('colorText2').style.display = 'none';
                document.getElementById('colort').style.display = 'none';

                document.getElementById('brandText1').style.display = 'none';
                document.getElementById('brandText2').style.display = 'none';
                document.getElementById('brandt').style.display = 'none';

                //            document.getElementById('color').required=false;

                document.getElementById('sizeText1').style.display = 'none';
                document.getElementById('sizeText2').style.display = 'none';
                document.getElementById('sizet').style.display = 'none';

                //            document.getElementById('size').required=false;

                document.getElementById('typeText1').style.display = 'none';
                document.getElementById('typeText2').style.display = 'none';
                document.getElementById('typet').style.display = 'none';

                document.getElementById('mText1').style.display = 'none';
                document.getElementById('mText2').style.display = 'none';
                document.getElementById('mt').style.display = 'none';

                document.getElementById('tbSizeText1').style.display = 'none';
                document.getElementById('tbSizeText2').style.display = 'none';
                document.getElementById('tbSizet').style.display = 'none';

                document.getElementById('noText1').style.display = 'none';
                document.getElementById('noText2').style.display = 'none';
                document.getElementById('not').style.display = 'none';

                document.getElementById('shapeText1').style.display = 'none';
                document.getElementById('shapeText2').style.display = 'none';
                document.getElementById('shapet').style.display = 'none';

                //show
                document.getElementById('nameText1').style.display = '';
                document.getElementById('nameText2').style.display = '';
                document.getElementById('name').style.display = '';

                document.getElementById('quantityText1').style.display = '';
                document.getElementById('quantityText2').style.display = '';
                document.getElementById('quantity').style.display = '';

                document.getElementById('conditionText1').style.display = '';
                document.getElementById('conditionText2').style.display = '';
                document.getElementById('condition').style.display = '';

                document.getElementById('mText1').style.display = '';
                document.getElementById('mText2').style.display = '';
                document.getElementById('mt').style.display = '';
                document.getElementById('button4').style.display = '';
            }

            function addLights()
            {
                //hide

                document.getElementById('button1').style.display = 'none';
                document.getElementById('button3').style.display = 'none';
                document.getElementById('button4').style.display = 'none';
                document.getElementById('button2').style.display = 'none';
                document.getElementById('button6').style.display = 'none';

                document.getElementById('colorText1').style.display = 'none';
                document.getElementById('colorText2').style.display = 'none';
                document.getElementById('colort').style.display = 'none';

                document.getElementById('brandText1').style.display = 'none';
                document.getElementById('brandText2').style.display = 'none';
                document.getElementById('brandt').style.display = 'none';

                //            document.getElementById('color').required=false;

                document.getElementById('sizeText1').style.display = 'none';
                document.getElementById('sizeText2').style.display = 'none';
                document.getElementById('sizet').style.display = 'none';

                //            document.getElementById('size').required=false;

                document.getElementById('typeText1').style.display = 'none';
                document.getElementById('typeText2').style.display = 'none';
                document.getElementById('typet').style.display = 'none';

                document.getElementById('mText1').style.display = 'none';
                document.getElementById('mText2').style.display = 'none';
                document.getElementById('mt').style.display = 'none';

                document.getElementById('tbSizeText1').style.display = 'none';
                document.getElementById('tbSizeText2').style.display = 'none';
                document.getElementById('tbSizet').style.display = 'none';

                document.getElementById('noText1').style.display = 'none';
                document.getElementById('noText2').style.display = 'none';
                document.getElementById('not').style.display = 'none';

                document.getElementById('shapeText1').style.display = 'none';
                document.getElementById('shapeText2').style.display = 'none';
                document.getElementById('shapet').style.display = 'none';

                //show
                document.getElementById('nameText1').style.display = '';
                document.getElementById('nameText2').style.display = '';
                document.getElementById('name').style.display = '';

                document.getElementById('quantityText1').style.display = '';
                document.getElementById('quantityText2').style.display = '';
                document.getElementById('quantity').style.display = '';

                document.getElementById('conditionText1').style.display = '';
                document.getElementById('conditionText2').style.display = '';
                document.getElementById('condition').style.display = '';
                document.getElementById('button5').style.display = '';

            }


            function addTables()
            {
                //hide

                document.getElementById('button1').style.display = 'none';
                document.getElementById('button3').style.display = 'none';
                document.getElementById('button4').style.display = 'none';
                document.getElementById('button5').style.display = 'none';
                document.getElementById('button2').style.display = 'none';

                document.getElementById('colorText1').style.display = 'none';
                document.getElementById('colorText2').style.display = 'none';
                document.getElementById('colort').style.display = 'none';

                document.getElementById('brandText1').style.display = 'none';
                document.getElementById('brandText2').style.display = 'none';
                document.getElementById('brandt').style.display = 'none';

                //            document.getElementById('color').required=false;

                document.getElementById('sizeText1').style.display = 'none';
                document.getElementById('sizeText2').style.display = 'none';
                document.getElementById('sizet').style.display = 'none';

                //            document.getElementById('size').required=false;

                document.getElementById('typeText1').style.display = 'none';
                document.getElementById('typeText2').style.display = 'none';
                document.getElementById('typet').style.display = 'none';

                document.getElementById('mText1').style.display = 'none';
                document.getElementById('mText2').style.display = 'none';
                document.getElementById('mt').style.display = 'none';

                //show
                document.getElementById('nameText1').style.display = '';
                document.getElementById('nameText2').style.display = '';
                document.getElementById('name').style.display = '';

                document.getElementById('quantityText1').style.display = '';
                document.getElementById('quantityText2').style.display = '';
                document.getElementById('quantity').style.display = '';

                document.getElementById('conditionText1').style.display = '';
                document.getElementById('conditionText2').style.display = '';
                document.getElementById('condition').style.display = '';

                document.getElementById('tbSizeText1').style.display = '';
                document.getElementById('tbSizeText2').style.display = '';
                document.getElementById('tbSizet').style.display = '';

                document.getElementById('noText1').style.display = '';
                document.getElementById('noText2').style.display = '';
                document.getElementById('not').style.display = '';

                document.getElementById('shapeText1').style.display = '';
                document.getElementById('shapeText2').style.display = '';
                document.getElementById('shapet').style.display = '';
                document.getElementById('button6').style.display = '';
            }


        </script>
        
        <style>
            .btn-success{
                padding: 2% 4%;
                font-size: 150%;                
            }
        </style>
    </head>
    <body>
        <div class="container-fluid add" id="facilityactivitiesADD">
            <form class="form-group" id="myForm" action="../addfacilityservelet" method="POST">

                <div>

                    <input type="button" class="btn btn-success" onclick="javascript:addTents();" value="Add Tents" name="tents"/>
                    <input type="button" class="btn btn-success" onclick="javascript:addSounds();" value="Add Sounds" name="sounds"/>
                    <input type="button" class="btn btn-success" onclick="javascript:addKitchen();" value="Add Kitchen Utensils" name="kitchen"/>
                    <input type="button" class="btn btn-success" onclick="javascript:addChairs();" value="Add Chairs" name="chairs"/>
                    <input type="button" class="btn btn-success" onclick="javascript:addLights();" value="Add Lights" name="lights"/>
                    <input type="button" class="btn btn-success" onclick="javascript:addTables();" value="Add Tables" name="tables"/>

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
                            <td id="tbSizet" style="display: none" ><input type="text" name="tSize" id="tbSize" />
                        </tr>                   
                        <tr>
                            <td id="noText1" style="display: none" >No Of Chairs </td>
                            <td id="noText2" style="display: none" >:</td>          
                            <td id="not" style="display: none" ><input type="text" name="chairs" id="no" />
                        </tr>                  
                        <tr>
                            <td id="shapeText1" style="display: none" >Shape </td>
                            <td id="shapeText2" style="display: none" >:</td>          
                            <td id="shapet" style="display: none" ><input type="text" name="shape" id="brand" />
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
            </form></div>
    </body>
</html>
