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

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">

<style>
    html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}

    .menu-item-check:checked + .menu-item {
        box-shadow: 0 0 5px #007bff !important;
    }
    .menu-item-check:checked + .menu-item .menu-item-checked-icon {
        visibility: visible;
    }
    .menu-item:hover {
        background: rgb(245,245,245) !important;
    }
    .menu-category {
        padding: 0.75em;
        flex-grow: 1;
    }
    .menu-item {
        height: 5em;
        overflow: hidden;
        background-color: #fff;
        background-clip: border-box;
        border: 1px solid rgba(0,0,0,.125);
        border-radius: .25rem;
        display: flex;
        flex-direction: row;
        min-width: 350px;
        flex-grow: 1;
        cursor: pointer;
    }
    .menu-item-img {
        width: 5em;
        height: 5em;
        flex-grow: 0;
        flex-shrink: 0;
        background: gray;
        overflow: hidden;
        display: flex;
        justify-content: center;
        align-items: center;
        align-content: stretch;
        position: relative;

    }
    .menu-item-img img {
        height: 100%;
        width: auto;
        position: absolute;
    }
    .menu-item-checked-icon {
        z-index: 2;
        text-shadow: 0 0 2px black;
        color: white;
        visibility: hidden;
    }
    .menu-item-description {
        flex-grow: 1;
        padding: 0.75em;
    }
    .menu-item-title {
        margin-bottom: 0.45em;
        font-weight: bold;
    }
    .menu-item-title .badge {
        opacity: 0.5;
    }
    .menu-item-ingredients {
        font-size: 80%;
        line-height: 1.15em;
    }
    .menu-item-select {
        display: flex;
        padding: 0.5em;
        justify-content:  center;
        align-items: center;
    }
</style>