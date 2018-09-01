<%-- 
    Document   : deleteFacility
    Created on : Sep 1, 2018, 11:54:24 AM
    Author     : Lini Eisha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Faciities</title>
        
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
#tentsTable {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
    margin-left: 30%;
    margin-top: 10%
}

#tentsTable td, #tentsTable th {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center;
}

#tentsTable tr:nth-child(even){background-color: #f2f2f2;}

#tentsTable tr:hover {background-color: #ddd;}

#tentsTable th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #555555;
    color: white;
}
</style>
    </head>
    <body>
        
        <input type="submit" class="button button5"  value="Delete Tents" name="Tents" id="tents" onclick="javascript:tents();" />
        <input type="submit" class="button button5"  value="Delete sounds" name="Tents" id="tents" onclick="javascript:sounds();" />
        <input type="submit" class="button button5"  value="Delete lights" name="Tents" id="tents" onclick="javascript:lights();" />
        <input type="submit" class="button button5"  value="Delete kitchen utensils" name="Tents" id="tents" onclick="javascript:kitchen();" />
        <input type="submit" class="button button5"  value="Delete tables" name="Tents" id="tents" onclick="javascript:tables();" />
        <input type="submit" class="button button5"  value="Delete chairs" name="Tents" id="tents" onclick="javascript:chairs();" />
        <!--facility class-->
    </body>
</html>
