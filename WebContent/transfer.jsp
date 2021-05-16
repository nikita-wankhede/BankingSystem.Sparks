<%@ include file="dbConn.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>processing</title>

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-finance-business.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    
     <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
     <script>
	$(document).ready(function(){
		$("#responseModal").modal('show');
	});
	
	 function redirect(){
		    window.location.href = "trans_history.jsp";
		  }
</script>

</head>
<body>
<%
boolean isAvailable;
String trans_from=(String)session.getAttribute("user");
String trans_to=request.getParameter("transferto");
int money=Integer.parseInt(request.getParameter("amount"));
String st="select * from customer where username=?";
PreparedStatement stmt=con.prepareStatement(st);
stmt.setString(1, trans_to);
ResultSet rs=stmt.executeQuery();
if(rs.next()){
    isAvailable = true;
}else{
    isAvailable = false;
}
 if(isAvailable!=false){
		String qr="insert into transfer(transfer_from,transfer_to,amount,dt,time)values(?,?,?,curdate(),curtime())";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1,trans_from);
		ps.setString(2,trans_to);
		ps.setInt(3,money);
		int i=ps.executeUpdate();
	    if(i>0){
	    	String up="update customer set balance=balance-? where username=?";
	    	String sg="update customer set balance=balance+? where username=?";
	    	PreparedStatement pup=con.prepareStatement(up);
	    	PreparedStatement pt=con.prepareStatement(sg);
			pup.setInt(1,money);
			pup.setString(2,trans_from);
			pt.setInt(1,money);
			pt.setString(2,trans_to);
			int q=pup.executeUpdate();
			pt.executeUpdate();
			%>
      <div id="responseModal" class="modal fade">
       <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Successful!!</h5>
                <button type="button" class="close">&times;</button>
            </div>
            <div class="modal-body">
				<p>Check your status hear..</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" Onclick="redirect()">Ok</button>
            </div>
        </div>
    </div>
    </div>

			<% System.out.println(q+" updated");
	    }
		System.out.print(i+" rows inserted");
 }
 else{
	 out.println("User not Exist");
 }
%>
</body>
</html>