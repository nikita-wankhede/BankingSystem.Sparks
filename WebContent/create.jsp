<%@ include file="dbConn.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>New User</title>
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script>
	$(document).ready(function(){
		$("#myModal").modal('show');
	});
	
	 function redirect(){
		    window.location.href = "viewCustom.jsp";
		  }
</script>
</head>
<body>
<%
String uname=request.getParameter("name");
String mail=request.getParameter("mail");
int bal=Integer.parseInt(request.getParameter("money"));
String qr="insert into customer(username,email,balance) values(?,?,?)";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1,uname);
ps.setString(2,mail);
ps.setInt(3,bal);
int i=ps.executeUpdate();
if(i>0){
	%>
	<div id="myModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Dear <%=uname %></h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
				<p>account created Successfully!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" Onclick="redirect()">Ok</button>
            </div>
        </div>
    </div>
</div>
<% 
}
%>
</body>
</html>