<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Cache-control" content="no-cache">
<meta http-equiv="Expires" content="-1">
<link href="../External/w3/all.css" rel="stylesheet">
<link href="../External/w3/avatar_upload.css" rel="stylesheet" type="text/css"/>
<link href="../External/Bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="../External/Bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="../External/Font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="../External/Font-awesome/css/all.css" rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link href="../External/Datatables/dataTables.bootstrap4.css" rel="stylesheet">
<script src="DepartmentStatistics.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">

<style>
    @import url('https://fonts.googleapis.com/css?family=Quicksand');

    html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}

    #snackbar {
        visibility: hidden;
        min-width: 250px;
        margin-left: -125px;
        background-color: #333;
        color: #fff;
        text-align: center;
        border-radius: 2px;
        padding: 16px;
        position: fixed;
        z-index: 1;
        left: 50%;
        bottom: 30px;
        font-size: 17px;
    }

    #snackbar.show {
        visibility: visible;
        -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
        animation: fadein 0.5s, fadeout 0.5s 2.5s;
    }

    @-webkit-keyframes fadein {
        from {bottom: 0; opacity: 0;} 
        to {bottom: 30px; opacity: 1;}
    }

    @keyframes fadein {
        from {bottom: 0; opacity: 0;}
        to {bottom: 30px; opacity: 1;}
    }

    @-webkit-keyframes fadeout {
        from {bottom: 30px; opacity: 1;} 
        to {bottom: 0; opacity: 0;}
    }

    @keyframes fadeout {
        from {bottom: 30px; opacity: 1;}
        to {bottom: 0; opacity: 0;}
    }
</style>



<style type="text/css">
    .modal-confirm {
        margin-top: 10%;
        color: #636363;
        width: 400px;
    }
    .modal-confirm .modal-content {
        padding: 20px;
        border-radius: 5px;
        border: none;
        text-align: center;
        font-size: 14px;
    }
    .modal-confirm .modal-header {
        border-bottom: none;   
        position: relative;
    }
    .modal-confirm h4 {
        text-align: center;
        font-size: 26px;
        margin: 30px 0 -10px;
    }
    .modal-confirm .close {
        position: absolute;
        top: -5px;
        right: -2px;
    }
    .modal-confirm .modal-body {
        color: #999;
    }
    .modal-confirm .modal-footer {
        border: none;	
        border-radius: 5px;
        font-size: 13px;
        padding: 10px 15px 25px;
    }
    .modal-confirm .modal-footer a {
        color: #999;
    }		
    .modal-confirm .icon-box {
        width: 80px;
        height: 80px;
        margin: 0 0 0 0;
        border-radius: 50%;
        z-index: 9;
        text-align: center;
        border: 3px solid #ffc107!important;
    }
    .modal-confirm .icon-box i {
        color: #f15e5e;
        font-size: 46px;
        display: inline-block;
        margin-top: 13px;
    }

    .modal-confirm .btn {
        color: #fff;
        border-radius: 4px;
        background: #60c7c1;
        text-decoration: none;
        transition: all 0.4s;
        line-height: normal;
        border: none;
        border-radius: 3px;
        outline: none !important;
    }
    .modal-confirm .btn-info {
        background: #c1c1c1;
    }
    .modal-confirm .btn-info:hover, .modal-confirm .btn-info:focus {
        background: #a8a8a8;
    }
    .modal-confirm .btn-danger {
        background: #f15e5e;
    }
    .modal-confirm .btn-danger:hover, .modal-confirm .btn-danger:focus {
        background: #ee3535;
    }
    .trigger-btn {
        display: inline-block;
        margin: 100px auto;
    }
</style>