<%@page import="supporting.Fetch"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Facility</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="jquery-3.3.1.min.js"></script>

        <%@ include file="Layouts/Styles.jsp" %><script>


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
                document.getElementById('pricefac1').style.display = '';
                document.getElementById('pricefac2').style.display = '';
                document.getElementById('pricefac3').style.display = '';
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

            .container-fluid{
                padding-left: 10%;
                padding-top: 5%;
            }

            .add{
                padding-top: 0;
            }

            .form{
                padding-top: 0;
                padding-left: 0;

            }
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

        </style>
    </head>
    <body class="w3-light-grey">

        <%@ include file="Layouts/Navigation.jsp" %>







        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:350px;margin-top:43px;">

            <!--<div id="a" style="overflow:scroll; height:400px;">-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-8">
                    <input type="text" name="search" id="search" placeholder="Search for facilities"/>
                    </div>
                    <div class="col-sm-4">
                        <button style="padding:3%; margin-top: 2.2%;" class="btn-success">SEARCH</button>
                    </div>
                </div>
            </div>
            <div class="alert alert-success">
                <h1>All Facilities</h1>
            </div>
            <div class="container-" style="overflow:scroll; height:400px;">
                <div class="row">
                    <div class="col-4" style="smargin-left: 60px;">
                        <div class="alert alert-warning">
                            <h4>Tents Details</h4>
                        </div>

                        <table class="table table-hover">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Facility Name</th>
                                    <th>Tent Color</th>
                                    <th>Tent Size</th>
                                    <th>Available Quantity</th>
                                    <th>Total Quantity</th>
                                </tr>
                            </thead>

                            <%
                                Fetch available_Tents = new Fetch();
                                ResultSet avalFacT = available_Tents.fetch_Facilities_By_Name("facilitytent");

                            %>
                            <tbody>
                                <tr>
                                    <%while (avalFacT.next()) {%>
                                    <td><%=avalFacT.getString("facilitiyName")%></td>
                                    <td><%=avalFacT.getString("tentColor")%></td>
                                    <td><%=avalFacT.getString("tentSize")%></td>
                                    <td class="danger"><%=avalFacT.getString("availableQuantity")%></td>
                                    <td><%=avalFacT.getString("totalQuantity")%></td>
                                </tr><%}%>
                            </tbody>
                        </table>
                    </div>


                    <div class="col-4" style="margin-left: 60px;">
                        <div class="alert alert-warning">
                            <h4>Sounds Details</h4>
                        </div>
                        <table class="table table-hover">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Facility Name</th>
                                    <th>Condition</th>
                                    <th>Brand</th>
                                    <th>Available Quantity</th>
                                    <th>Total Quantity</th>
                                </tr>
                            </thead>

                            <%
                                Fetch available_sounds = new Fetch();
                                ResultSet avalFacS = available_sounds.fetch_Facilities_By_Name("facilitysound");

                            %>
                            <tbody>
                                <tr>
                                    <%while (avalFacS.next()) {%>
                                    <td><%=avalFacS.getString("facilitiyName")%></td>
                                    <td><%=avalFacS.getString("facilityCondition")%></td>
                                    <td><%=avalFacS.getString("soundsBrand")%></td>
                                    <td class="danger"><%=avalFacS.getString("availableQuantity")%></td>
                                    <td><%=avalFacS.getString("totalQuantity")%></td>
                                </tr><%}%>
                            </tbody>
                        </table>
                    </div>


                </div>


                <div class="row">

                    <div class="col-sm-4" style="smargin-left: 60px;">
                        <div class="alert alert-warning">
                            <h4>Tables Details</h4>
                        </div>
                        <table class="table table-hover">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Facility Name</th>
                                    <th>Condition</th>
                                    <th>Size</th>
                                    <th>Available Quantity</th>
                                    <th>Total Quantity</th>
                                </tr>
                            </thead>

                            <%
                                Fetch available_tables = new Fetch();
                                ResultSet avalFacTA = available_sounds.fetch_Facilities_By_Name("facilitytable");

                            %>
                            <tbody>
                                <tr>
                                    <%while (avalFacTA.next()) {%>
                                    <td><%=avalFacTA.getString("facilitiyName")%></td>
                                    <td><%=avalFacTA.getString("facilityCondition")%></td>
                                    <td><%=avalFacTA.getString("tableSize")%></td>
                                    <td class="danger"><%=avalFacTA.getString("availableQuantity")%></td>
                                    <td><%=avalFacTA.getString("totalQuantity")%></td>
                                </tr><%}%>
                            </tbody>
                        </table>
                    </div>

                    <div class="col-4" style="margin-left: 60px;">
                        <div class="alert alert-warning">
                            <h4>Lights Details</h4>
                        </div>
                        <table class="table table-hover">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Facility Name</th>
                                    <th>Condition</th>
                                    <th>Available Quantity</th>
                                    <th>Total Quantity</th>
                                </tr>
                            </thead>

                            <%
                                Fetch available_Lights = new Fetch();
                                ResultSet avalFacL = available_Lights.fetch_Facilities_By_Name("facilitylight");

                            %>
                            <tbody>
                                <tr>
                                    <%while (avalFacL.next()) {%>
                                    <td><%=avalFacL.getString("facilitiyName")%></td>
                                    <td><%=avalFacL.getString("facilityCondition")%></td>
                                    <td class="danger"><%=avalFacL.getString("availableQuantity")%></td>
                                    <td><%=avalFacL.getString("totalQuantity")%></td>
                                </tr><%}%>
                            </tbody>
                        </table>
                    </div>
                </div>


                <div class="row">



                    <div class="col-sm-4" style="smargin-left: 60px;">
                        <div class="alert alert-warning">
                            <h4>Kitchen Utensils Details</h4>
                        </div>
                        <table class="table table-hover">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Facility Name</th>
                                    <th>Condition</th>
                                    <th>Type</th>
                                    <th>Available Quantity</th>
                                    <th>Total Quantity</th>
                                </tr>
                            </thead>

                            <%
                                Fetch available_kitchen = new Fetch();
                                ResultSet avalFacK = available_kitchen.fetch_Facilities_By_Name("facilitykitchen");

                            %>
                            <tbody>
                                <tr>
                                    <%while (avalFacK.next()) {%>
                                    <td><%=avalFacK.getString("facilitiyName")%></td>
                                    <td><%=avalFacK.getString("facilityCondition")%></td>
                                    <td><%=avalFacK.getString("kUType")%></td>
                                    <td class="danger"><%=avalFacK.getString("availableQuantity")%></td>
                                    <td><%=avalFacK.getString("totalQuantity")%></td>
                                </tr><%}%>
                            </tbody>
                        </table>
                    </div>


                    <div class="col-4" style="margin-left: 60px;">
                        <div class="alert alert-warning">
                            <h4>Chairs Details</h4>
                        </div>
                        <table class="table table-hover">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Facility Name</th>
                                    <th>Condition</th>
                                    <th>Material</th>
                                    <th>Available Quantity</th>
                                    <th>Total Quantity</th>
                                </tr>
                            </thead>

                            <%
                                Fetch available_Chairs = new Fetch();
                                ResultSet avalFacCh = available_Chairs.fetch_Facilities_By_Name("facilitychair");

                            %>
                            <tbody>
                                <tr>
                                    <%while (avalFacCh.next()) {%>
                                    <td><%=avalFacCh.getString("facilitiyName")%></td>
                                    <td><%=avalFacCh.getString("facilityCondition")%></td>
                                    <td><%=avalFacCh.getString("chairMaterial")%></td>
                                    <td class="danger"><%=avalFacCh.getString("availableQuantity")%></td>
                                    <td><%=avalFacCh.getString("totalQuantity")%></td>
                                </tr><%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--</div>-->


            <div class="container-fluid">
                <div class="alert alert-success">
                    <h1>Facility Operations</h1>
                </div>
                <button class="btn btn-danger" onclick="openTab('facilityactivitiesADD')" id="addf">Add Facilities</button>
                <button class="btn btn-danger" onclick="openTab('facilityactivitiesREMOVE')"  id="removef">Remove Facilities</button>
                <button class="btn btn-danger" onclick="openTab('facilityactivitiesUPDATE')"  id="updatef">Update Facilities</button>
            </div>

            <!--            <script>
                            $("#addf").click(function () {
                                $("#facilityactivitiesADD").toggle();
                                $(document).scrollTop($(document).height());
                            });
                            $("#removef").click(function () { // when #showhidecomment is clicked
                                $("#facilityactivitiesREMOVE").load("delete.jsp"); // load the sample.jsp page in the #chkcomments element
                            });
            
                            $("#removef").click(function () {
                                $("#facilityactivitiesREMOVE").toggle();
                                $(document).scrollTop($(document).height());
                            });
            
                            $("#updatef").click(function () {
                                $("#facilityactivitiesUPDATE").toggle();
                                $(document).scrollTop($(document).height());
                            });
            
                        </script>-->

            <script>
                function openTab(table_name) {
                    var i;
                    var x = document.getElementsByClassName("add");
                    for (i = 0; i < x.length; i++) {
                        x[i].style.display = "none";
                    }
                    document.getElementById(table_name).style.display = "block";
                    $(document).scrollTop($(document).height());
                }
            </script>

            <div style="display:none;" class="container-fluid add" id="facilityactivitiesREMOVE">
                <%@include file="delete.jsp" %>

            </div>

            <div style="display:none;" class="container-fluid add" id="facilityactivitiesUPDATE">
                <script>
                    function displayModal(obj) {
                        var item_id = obj;
                        //alert(item_id);

                        $.post("updateFacility.jsp", {event_id: item_id}, function (data) {
                            $("#updateModal .modal-body").html(data);
                        });
                        $("#updateModal").modal();
                    }
                </script>


                <div class="alert alert-danger">
                    <h1>Update Facilities</h1>
                </div>
                <div class="alert-danger">
                    <button class="button button5" onclick="openTu('tentTableu')">Tents</button>
                    <button class="button button5" onclick="openTu('soundsTableu')">Sounds</button>
                    <button class="button button5" onclick="openTu('lightsTableu')">Lights</button>
                    <button class="button button5" onclick="openTu('kitchenTableu')">Kitchen Utensils</button>
                    <button class="button button5" onclick="openTu('tablesTableu')">Tables</button>
                    <button class="button button5" onclick="openTu('chairsTableu')">Chairs</button>
                </div>


                <div id="tentTableu" class="w3-container tableName" style="margin-left: 0%; margin-top: 0%;">

                    <h2>Tent Information</h2>
                    <p>bellow table contains all the currently available facilities regarding TENTS.</p>            
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Tent</th>
                                <th>Available Quantity</th>
                                <th>Total Quantity</th>
                                <th>Condition</th>
                                <th>Color</th>
                                <th>Size</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%  Facility tentsU = new Tents();
                                ResultSet tentsVU = tentsU.fetch();
                            %>
                            <tr><%while (tentsVU.next()) {%>
                                <td><%= tentsVU.getString("facilitiyName")%></td>
                                <td><%= tentsVU.getString("availableQuantity")%></td>
                                <td><%= tentsVU.getString("totalQuantity")%></td>
                                <td><%= tentsVU.getString("facilityCondition")%></td>
                                <td><%= tentsVU.getString("tentColor")%></td>
                                <td><%= tentsVU.getString("tentSize")%></td>
                                <!--<td><a href="updateFacility.jsp?event_id=<%=tentsVU.getString("facilityID")%>" class="button button5">Update</a></td>-->
                                <td><button class="button button5" type="button" id="<%=tentsVU.getString("facilityID")%>" onclick="displayModal(this.id)">Update</button></td>
                            </tr><%}%>

                        </tbody>
                    </table>

                </div>        


                <div id="soundsTableu" class="w3-container tableName"  style="display: none;">

                    <h2>Sound Equipment Information</h2>
                    <p>bellow table contains all the currently available facilities regarding SOUND EQUIPMENTS.</p>            
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Sound Equipment</th>
                                <th>Available Quantity</th>
                                <th>Total Quantity</th>
                                <th>Condition</th>
                                <th>Brand</th>
                        </thead>
                        <tbody>
                            <%  Facility soundsU = new Sounds();
                                ResultSet soundsVU = soundsU.fetch();
                            %>
                            <tr><%while (soundsVU.next()) {%>
                                <td><%= soundsVU.getString("facilitiyName")%></td>
                                <td><%= soundsVU.getString("availableQuantity")%></td>
                                <td><%= soundsVU.getString("totalQuantity")%></td>
                                <td><%= soundsVU.getString("facilityCondition")%></td>
                                <td><%= soundsVU.getString("soundsBrand")%></td>
                                <!--<td><a href="updateFacility.jsp?event_id=<%=soundsVU.getString("facilityID")%>" class="button button5">Update</a></td>-->
                                <td><button class="button button5" type="button" id="<%=soundsVU.getString("facilityID")%>" onclick="displayModal(this.id)">Update</button></td>
                            </tr><%}%>
                        </tbody>
                    </table>
                </div>

                <div id="lightsTableu" class="w3-container tableName"  style="display: none;">

                    <h2>Lightning Equipment Information</h2>
                    <p>bellow table contains all the currently available facilities regarding LIGHTNING EQUIPMENTS.</p>            
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Light Equipment</th>
                                <th>Available Quantity</th>
                                <th>Total Quantity</th>
                                <th>Condition</th>
                        </thead>
                        <tbody>
                            <%  Facility lightsU = new Lights();
                                ResultSet lightsVU = lightsU.fetch();
                            %>
                            <tr><%while (lightsVU.next()) {%>
                                <td><%= lightsVU.getString("facilitiyName")%></td>
                                <td><%= lightsVU.getString("availableQuantity")%></td>
                                <td><%= lightsVU.getString("totalQuantity")%></td>
                                <td><%= lightsVU.getString("facilityCondition")%></td>
                                <!--<td><a href="updateFacility.jsp?event_id=<%=lightsVU.getString("facilityID")%>" class="button button5">Update</a></td>-->
                                <td><button class="button button5" type="button" id="<%=lightsVU.getString("facilityID")%>" onclick="displayModal(this.id)">Update</button></td>
                            </tr><%}%>
                        </tbody>
                    </table>
                </div>

                <div id="kitchenTableu" class="w3-container tableName"  style="display: none;">

                    <h2>Kitchen Utensils Information</h2>
                    <p>bellow table contains all the currently available facilities regarding KITCHEN UTENSILS.</p>            
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Item Name</th>
                                <th>Available Quantity</th>
                                <th>Total Quantity</th>
                                <th>Condition</th>
                                <th>Type</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%  Facility kitchenU = new KitchenUtensils();
                                ResultSet kitchenVU = kitchenU.fetch();
                            %>
                            <tr><%while (kitchenVU.next()) {%>
                                <td><%= kitchenVU.getString("facilitiyName")%></td>
                                <td><%= kitchenVU.getString("availableQuantity")%></td>
                                <td><%= kitchenVU.getString("totalQuantity")%></td>
                                <td><%= kitchenVU.getString("facilityCondition")%></td>
                                <td><%= kitchenVU.getString("kUType")%></td>
                                <!--<td><a href="updateFacility.jsp?event_id=<%=kitchenVU.getString("facilityID")%>" class="button button5">Update</a></td>-->
                                <td><button class="button button5" type="button" id="<%=kitchenVU.getString("facilityID")%>" onclick="displayModal(this.id)">Update</button></td>
                            </tr><%}%>
                        </tbody>
                    </table>

                </div> 

                <div id="tablesTableu" class="w3-container tableName"  style="display: none;">

                    <h2>Table Information</h2>
                    <p>bellow table contains all the currently available facilities regarding TABLES.</p>            
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Table Type</th>
                                <th>Available Quantity</th>
                                <th>Total Quantity</th>
                                <th>Condition</th>
                                <th>Table Size</th>
                                <th>No Of Chairs</th>
                                <th>Shape</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%  Facility tablesU = new Tables();
                                ResultSet tablesVU = tablesU.fetch();
                            %>
                            <tr><%while (tablesVU.next()) {%>
                                <td><%= tablesVU.getString("facilitiyName")%></td>
                                <td><%= tablesVU.getString("availableQuantity")%></td>
                                <td><%= tablesVU.getString("totalQuantity")%></td>
                                <td><%= tablesVU.getString("facilityCondition")%></td>
                                <td><%= tablesVU.getString("tableSize")%></td>
                                <td><%= tablesVU.getString("nOfChairsPT")%></td>
                                <td><%= tablesVU.getString("tableShape")%></td>
                                <!--<td><a href="updateFacility.jsp?event_id=<%=tablesVU.getString("facilityID")%>" class="button button5">Update</a></td>-->
                                <td><button class="button button5" type="button" id="<%=tablesVU.getString("facilityID")%>" onclick="displayModal(this.id)">Update</button></td>
                            </tr><%}%>
                        </tbody>
                    </table>

                </div>

                <div id="chairsTableu" class="w3-container tableName"  style="display: none;">

                    <h2>Chair Information</h2>
                    <p>bellow table contains all the currently available facilities regarding CHAIRS.</p>            
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Item</th>
                                <th>Available Quantity</th>
                                <th>Total Quantity</th>
                                <th>Condition</th>
                                <th>Material</th>
                        </thead>
                        <tbody>
                            <%  Facility chairsU = new Chairs();
                                ResultSet chairsVU = chairsU.fetch();
                            %>
                            <tr><%while (chairsVU.next()) {%>
                                <td><%= chairsVU.getString("facilitiyName")%></td>
                                <td><%= chairsVU.getString("availableQuantity")%></td>
                                <td><%= chairsVU.getString("totalQuantity")%></td>
                                <td><%= chairsVU.getString("facilityCondition")%></td>
                                <td><%= chairsVU.getString("chairMaterial")%></td>
                                <!--<td><a href="updateFacility.jsp?event_id=<%=chairsVU.getString("facilityID")%>" class="button button5">Update</a></td>-->
                                <td><button class="button button5" type="button" id="<%=chairsVU.getString("facilityID")%>" onclick="displayModal(this.id)">Update</button></td>
                            </tr><%}%>
                        </tbody>
                    </table>

                </div>

                <div class="modal fade" id="updateModal">
                    <div class="modal-dialog" style="width: 1200px">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title">Update</h1>
                            </div>
                            <div class="modal-body">

                            </div>
                        </div>
                    </div>
                </div>










                <script>
                    function openTu(table_name) {
                        var i;
                        var x = document.getElementsByClassName("tableName");
                        for (i = 0; i < x.length; i++) {
                            x[i].style.display = "none";
                        }
                        document.getElementById(table_name).style.display = "block";
                    }
                </script>

            </div>
            <div style="display:none;" class="container-fluid add" id="facilityactivitiesADD">

                <div class="alert alert-danger">
                    <h1>Add Facilities</h1>
                </div>
                <form class="form-group" id="myForm" action="../addfacilityservelet" method="POST">

                    <div>

                        <input type="button" class="button button5" onclick="javascript:addTents();" value="Add Tents" name="tents" id="addt"/>
                        <input type="button" class="button button5"  onclick="javascript:addSounds();" value="Add Sounds" name="sounds"/>
                        <input type="button" class="button button5"  onclick="javascript:addKitchen();" value="Add Kitchen Utensils" name="kitchen"/>
                        <input type="button" class="button button5" onclick="javascript:addChairs();" value="Add Chairs" name="chairs"/>
                        <input type="button" class="button button5" onclick="javascript:addLights();" value="Add Lights" name="lights"/>
                        <input type="button" class="button button5" onclick="javascript:addTables();" value="Add Tables" name="tables"/>

                        <table>           

                            <tr>
                                <td id="nameText1" style="display: none" >Name </td>
                                <td id="nameText2" style="display: none" >:</td>                    
                                <td id="name" style="display: none" ><input type="text" name="name" id="name" required="" /></td>
                            </tr>
                            <tr>
                                <td id="quantityText1" style="display: none" >Quantity </td>
                                <td id="quantityText2" style="display: none" >:</td>                  
                                <td id="quantity" style="display: none" ><input type="text" name="quantity" id="quantity" required=""/></td>
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
                                <td id="colort" style="display: none" ><input type="text" name="color" id="color" /></td>
                            </tr>
                            <tr>
                                <td id="sizeText1" style="display: none" >Size </td>
                                <td id="sizeText2" style="display: none" >:</td>          
                                <td id="sizet" style="display: none" ><input type="text" name="size" id="size" /></td>
                            </tr>                 
                            <tr>
                                <td id="brandText1" style="display: none" >Brand </td>
                                <td id="brandText2" style="display: none" >:</td>          
                                <td id="brandt" style="display: none" ><input type="text" name="brand" id="brand" /></td>
                            </tr>                
                            <tr>
                                <td id="typeText1" style="display: none" >Type </td>
                                <td id="typeText2" style="display: none" >:</td>          
                                <td id="typet" style="display: none" ><input type="text" name="type" id="type" /></td>
                            </tr>                    
                            <tr>
                                <td id="mText1" style="display: none" >Material </td>
                                <td id="mText2" style="display: none" >:</td>          
                                <td id="mt" style="display: none" ><input type="text" name="material" id="material" /></td>
                            </tr>                  
                            <tr>
                                <td id="tbSizeText1" style="display: none" >Table Size </td>
                                <td id="tbSizeText2" style="display: none" >:</td>          
                                <td id="tbSizet" style="display: none" ><input type="text" name="tSize" id="tSize" /></td>
                            </tr>                   
                            <tr>
                                <td id="noText1" style="display: none" >No Of Chairs </td>
                                <td id="noText2" style="display: none" >:</td>          
                                <td id="not" style="display: none" ><input type="text" name="no" id="no" /></td>
                            </tr>                  
                            <tr>
                                <td id="shapeText1" style="display: none" >Shape </td>
                                <td id="shapeText2" style="display: none" >:</td>          
                                <td id="shapet" style="display: none" ><input type="text" name="shape" id="shape" /></td>
                            </tr> 
                            <tr>
                                <td id="pricefac1" style="display:none">Unit Price</td>
                                <td id="pricefac2" style="display:none">:</td>
                                <td id="pricefac3" style="display:none"><input type="text" name="price" id="price" /></td>


                            </tr>
                        </table>

                        <br>
                        <br>
                        <button type="submit" class="button button5" style="display: none;" name="tentss" id="button1">Add to Tents</button>
                        <button type="submit" class="button button5" style="display: none;" name="soundss" id="button2">Add to Sounds</button>
                        <button type="submit" class="button button5" style="display: none;" name="kitchens" id="button3">Add to Kitchen Utensils</button>
                        <button type="submit" class="button button5" style="display: none;" name="chairss" id="button4">Add to Chairs</button>
                        <button type="submit" class="button button5" style="display: none;" name="lightss" id="button5">Add to Lights</button>
                        <button type="submit" class="button button5" style="display: none;" name="tabless" id="button6">Add to Tables</button>

                    </div>
                </form>
            </div>

            <% String message = (String) session.getAttribute("FacilityErrorMessage");%>
            <%if (message != null) {%>
            <script type="text/javascript">
                var msg = "<%=message%>";
                alert(msg);

            </script><%
                    session.removeAttribute("FacilityErrorMessage");
                }%>



            <!-- End page content -->
        </div>

        <%@ include file="Layouts/Scripts.jsp" %>
    </body>
</html>
