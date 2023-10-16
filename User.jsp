<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
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


    <!-- inserting the information of the user in the database -->
        <%
        try{
            String nm=request.getParameter("Name");
            String em=request.getParameter("Email");
            String bl=request.getParameter("Balance");
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bankdb","root","");
            String sql="insert into transuser(Name,Email,Balance) values(?,?,?)";
            PreparedStatement psmt=con.prepareStatement(sql);

            psmt.setString(1,nm);
            psmt.setString(2,em);
            psmt.setString(3,bl);

            psmt.executeUpdate();
            con.close();
     
        }
        catch(Exception ex){
            //out.println(ex);
        }
        %>
    <!-- Retriving the data of the user from the database -->
    <table class="tb1" border="1" cellspacing="10" cellpadding="10">
        <tr><th>ID</th><th>Name</th><th>Email</th><th>Balance</th></tr>
        <%
        try{
            String amt=request.getParameter("Amount");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bankdb","root","");
            String sql2="select * from transuser";
            Statement smt=con.createStatement();
            ResultSet res=smt.executeQuery(sql2);
            while(res.next())
            {
                String id=res.getString("ID");
                String nm2=res.getString("Name");
                String em2=res.getString("Email");
                String bl2=res.getString("Balance");
            %>
                <tr>
                    <td><%= id%></td>
                    <td><%= nm2%></td>
                    <td><%= em2%></td>
                    <td><%= bl2%></td>
                </tr>
            <%    
            
            }
            con.close();

        }

        catch(Exception ex){}
        %>

       
</table>
</body>

</html>