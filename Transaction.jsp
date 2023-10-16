<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Transaction</title>
    <link rel="stylesheet" href="style.css">
    <style>


    </style>
</head>
<body>
    <navbar>
        <div id="navbar">
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="Transaction.jsp">Create Transaction</a></li>
                <li><a href="TransHis.jsp">Transaction History</a></li>
                <li><a href="Create.jsp">Create User</a></li>
            </ul>
        </div>
    </navbar>
    <form class="formcont" action="TransHis.jsp" action="User.jsp" method="post">
        <div>
        <span>Tranfer From:</span>
        <%
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/bankdb","root","");
        String sql1="select * from transuser";
        Statement smt1=con1.createStatement();
        ResultSet res1=smt1.executeQuery(sql1);
        String nm1="";
        %>
        <select name="Sender" id="">
        <%
        while(res1.next())
        {
            nm1=res1.getString("Name");
            
        %>
        
            <option value="<%= nm1%>"><%= nm1%></option>
        
        <%
        }
        
        con1.close();
        %>
        </select> 
    </div>
    <div>
        <span>Tranfer  To :</span>
        <%
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con2=DriverManager.getConnection("jdbc:mysql://localhost/bankdb","root","");
        String sql2="select * from transuser";
        Statement smt2=con2.createStatement();
        ResultSet res2=smt2.executeQuery(sql2);
        String nm2="";
        %>
        <select name="Receiver" id="">
        <%
        while(res2.next())
        {
            nm2=res2.getString("Name");
            
        
        %>
            <option value="<%= nm2%>"><%= nm2%></option>
        <%
        }
        
        con2.close();
        %>
        </select>
    </div> 
    <div>
        <input type="number" placeholder="Enter Amount" name="Amount">
    </div>
        <center><input class="btn" id="submit" type="submit" value="Transfer Money"></center>
    </form>
</body>
</html>