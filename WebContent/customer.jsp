<%@ include file="dbConn.jsp" %>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
    rel="stylesheet">

  <title>Customer</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Additional CSS Files -->
  <link rel="stylesheet" href="assets/css/fontawesome.css">
  <link rel="stylesheet" href="assets/css/templatemo-finance-business.css">
  <link rel="stylesheet" href="assets/css/owl.css">
  
</head>

<body>

  <!-- ***** Preloader Start ***** -->
  <div id="preloader" style="opacity: 0; visibility: hidden; display: none;">
    <div class="jumper">
      <div></div>
      <div></div>
      <div></div>
    </div>
  </div> 
  <!-- ***** Preloader End ***** -->

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
    
<%
String uName=request.getParameter("name");
String mail=request.getParameter("mail");
try{
int cu_balance=Integer.parseInt(request.getParameter("balance"));
}catch(Exception e){
	e.printStackTrace();
}
session.setAttribute("user",uName);
%>
  <!-- Page Content -->
  <div class="page-heading header-text">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1>Welcome <%=uName %></h1>
          <span>Connect with your Friends and Family!</span>
        </div>
      </div>
    </div>
    </div><br><br>
   
  <div id="login">
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="transfer.jsp" method="post">
              
                            <div class="form-group" >
                                <label for="transferto" class="text-info" style="color:#B7DC0F !important">Transfer To:</label><br>
                                <input type="text" placeholder="transfer to" name="transferto" id="transferto" class="form-control">
                            </div>
                            <div class="form-group" >
                                <label for="amount" class="text-info"  style="color:#B7DC0F !important">Amount:</label><br>
                                <input type="number" placeholder="amount" name="amount" id="amount" class="form-control">
                            </div>
                            <div class="form-group">
                                 <input type="submit" name="submit" class="btn btn-info btn-md"  style="background-color:#B7DC0F !important" value="Transfer">
                            </div>
                          
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
   


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