<%-- 
    Document   : newjsp
    Created on : Aug 31, 2018, 6:53:02 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>test</title>
        <script>
        function addChairs()
        {
            hide_text_boxes();
            document.getElementById('textbox1').style.display='block';
            document.getElementById('textbox2').style.display='block';

        }

        function hide_text_boxes()
        {

            document.getElementById('textbox3').style.display='none';

        }
        </script>
    </head>
    <body>
<form id="form">
    <input type="button" onclick="javascript:addChairs();" value="addChairs" />
<input type="button" onclick="javascript:hide_text_boxes();" value="Hide Textboxes" />

<input type="text" id="textbox1" name="textbox1" style="display:none;"/>
<input type="text" id="textbox2" name="textbox2" style="display:none;" />
<input type="text" id="textbox3" name="textbox3" style="display:block;" />
</form>
    </body>
</html>
