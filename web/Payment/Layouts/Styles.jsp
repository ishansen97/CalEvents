<link href="../External/w3/all.css" rel="stylesheet">
<link href="../External/Bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="../External/Bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="../External/Bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="../External/Font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="../External/Font-awesome/css/all.css" rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link href="../External/Datatables/dataTables.bootstrap4.css" rel="stylesheet">

<!--<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">-->

<style>
  html, body, h1, h2, h3, h4, h5 {
    /*font-family: "Raleway", sans-serif*/
  }

  .table td, .table th {
    white-space:nowrap;
    vertical-align: middle;
  }

  tr.padding-sm th, tr.padding-sm td {
    padding-top: 0.25rem !important;
    padding-bottom: 0.25rem !important;
  }

  @media print {
    table, table td, table th, .table-bordered, .table-bordered td, .table-bordered th {
      border-color: #000 !important;
    }
    th.border-0, td.border-0 {
      border-width: 0 !important;
    }
    th.border-top-0, td.border-top-0 {
      border-top-width: 0 !important;
    }
    th.border-right-0, td.border-right-0 {
      border-right-width: 0 !important;
    }
    th.border-bottom-0, td.border-bottom-0 {
      border-bottom-width: 0 !important;
    }
    th.border-left-0, td.border-left-0  {
      border-left-width: 0 !important;
    }
  }

  .row-fade a{
    opacity: 0.6;
  }
  .row-fade a:hover {
    opacity: 0.9;
  }
</style>

<script type="text/javascript">
  function confirmDelete(id) {
    if (confirm("Are you sure you want to delete this invoice?")) {
      location = "./invoice.jsp?id=" + id
    }
  }
</script>