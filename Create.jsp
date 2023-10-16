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
    
    <form class="creform" action="User.jsp" method="post">
        <center>
        <div class="contcre">
           <input type="text" name="Name" placeholder="Enter Your Name">
            <input type="email" name="Email" placeholder="Enter Your Email">
             <input type="number" name="Balance" placeholder="Enter Balance">
        </div>
    </center>    
          <center>   <input class="btn" type="submit" value="Submit"></center>    
    </form>

    
</body>
</html>