<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            .loader {
                border: 16px solid #f3f3f3;
                border-radius: 50%;
                border-top: 16px solid #3498db;
                width: 120px;
                height: 120px;
                -webkit-animation: spin 2s linear infinite; /* Safari */
                animation: spin 2s linear infinite;
            }

            /* Safari */
            @-webkit-keyframes spin {
                0% { -webkit-transform: rotate(0deg); }
                100% { -webkit-transform: rotate(360deg); }
            }

            @keyframes spin {
                0% { transform: rotate(0deg); }
                100% { transform: rotate(360deg); }
            }
        </style>
        <%@ include file="Layouts/Styles.jsp" %>
    </head>
    <body class="bg-dark">
        <div class="row" style="margin-top:15%">
            <div class="container">
                <div class="offset-4 col-3 bg-white p-5 rounded">
                    <div class="loader offset-2 ml-5"></div>
                    <p class="text-center pt-5 ml-1">Please Wait ...</p>
                </div>
            </div>
        </div>
        <%@ include file="Layouts/Scripts.jsp" %>
    </body>
</html>
