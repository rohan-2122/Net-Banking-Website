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
    <%
        try{
            String snd=request.getParameter("Sender");
            String rcv=request.getParameter("Receiver");
            String amt=request.getParameter("Amount");
            String id=request.getParameter("ID");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bankdb","root","");
            String s="insert into transhis(Sender,Receiver,Amount) values(?,?,?)";
            PreparedStatement psmt=con.prepareStatement(s);

            psmt.setString(1,snd);
            psmt.setString(2,rcv); 
            psmt.setString(3,amt);

            psmt.executeUpdate();


            
            String s1="update transuser set Balance=Balance-? where Name=?";
            PreparedStatement psmt1=con.prepareStatement(s1);

            psmt1.setString(1,amt);
            psmt1.setString(2,snd);
            psmt1.executeUpdate();

            String s2="update transuser set Balance=Balance+? where Name=?";
            PreparedStatement psmt2=con.prepareStatement(s2);

            psmt2.setString(1,amt);
            psmt2.setString(2,rcv);
            psmt2.executeUpdate();

            con.close();
        }
        catch(Exception ex){}
    

    %>
    <table class="tb1" border="1" cellspacing="10" cellpadding="10">
        <tr><th>Sender</th><th>Reciever</th><th>Amount</th><th>Date And Time</th></tr>

    
    <%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bankdb","root",""); 
    String sql="select * from transhis";
    Statement smt=con.createStatement();
    ResultSet rs=smt.executeQuery(sql);
    while(rs.next())
    {
        String snd1=rs.getString("Sender");
        String rec1=rs.getString("Receiver");
        String amt1=rs.getString("Amount");
        String dt=rs.getString("Date And Time");
    %>
    <tr>
        <td><%= snd1%></td>
        <td><%= rec1%></td>
        <td><%= amt1%></td>
        <td><%= dt%></td>
    </tr>
    <%
    }
    con.close();
    %>

    <%
    try{
        String amt1=request.getParameter("Amount");

    }
    catch(Exception ex){}


    %>

    </table>

</body>
</html>