<%@ include file="dbConn.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Records</title>
   <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
    rel="stylesheet">

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Additional CSS Files -->
  <link rel="stylesheet" href="assets/css/fontawesome.css">
  <link rel="stylesheet" href="assets/css/templatemo-finance-business.css">
  <link rel="stylesheet" href="assets/css/owl.css">
</head>

<body>

<div id="preloader" style="opacity: 0; visibility: hidden; display: none;">
    <div class="jumper">
      <div></div>
      <div></div>
      <div></div>
    </div>
  </div> 

  <!-- Header -->
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  <div class="container">
    <a class="navbar-brand" href="home.html" style="font-size:30px;color:#B7DC0F;"><b>The Sparks</b></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item ">
          <a class="nav-link" href="home.html">Home
                <span class="sr-only">(current)</span>
              </a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="services.html">Services</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contact.html">Contact</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
    <br><br><br><br>
<table class="table table-striped" style="width:70%;margin-left:auto;margin-right:auto;text-align:center; ">
  <thead>
    <tr>
      <th scope="col">Transfer From</th>
      <th scope="col">Transfer to</th>
      <th scope="col">Transfered Balance</th> 
      <th scope="col">Date</th> 
      <th scope="col">Time</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  String qr="select * from transfer order by dt DESC";
  Statement st=con.createStatement();
  ResultSet rs=st.executeQuery(qr);
  if(rs.next())
  {
  	do
  	{
  		String from=rs.getString("transfer_from");
  		String to=rs.getString("transfer_to");
  		int balance=rs.getInt("amount"); 
  		Date date=rs.getDate("dt");
  		Time time=rs.getTime("time");
  %>
    <tr>
      <td><%=from %></td>
      <td><%=to %></td>
      <td><%=balance %></td>
      <td><%=date %></td>
      <td><%=time %></td>
     </tr>
     
    <%
	}while(rs.next());
}
else
{
	out.println("Oops! No Records Found..");
}
con.close();
%>
    </tbody>
    </table>


  <div class="sub-footer">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
         <p>@ 2021 Sparks.Foundation
            
            - Design: Niks </p>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Additional Scripts -->
  <script src="assets/js/custom.js"></script>
  <script src="assets/js/owl.js"></script>
  <script src="assets/js/slick.js"></script>
  <script src="assets/js/accordions.js"></script>
</body>
</html>