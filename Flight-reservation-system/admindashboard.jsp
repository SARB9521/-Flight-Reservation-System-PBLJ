<%@ page import="java.sql.*"%>
    <%!
            PreparedStatement psmt = null; 
            Statement smt = null;
            Connection con = null;
            ResultSet rs = null;
    %>
    <% 

        try 
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/FindFlights","root","");
            smt = con.createStatement();
            rs = smt.executeQuery("select * from flights");   
        
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <form>
    <meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .dashboard {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 250px;
            background: #0a2499e3;
            color: white;
            padding: 20px;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 40px;
        }

        .logo img {
            width: 40px;
            height: 40px;
        }

        .logo h1 {
            font-size: 1.5rem;
        }

        .sidebar ul {
            list-style: none;
        }

        .sidebar li {
            margin-bottom: 10px;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .sidebar a:hover, .sidebar li.active a {
            background: #f0f8ff;
            color: #333;
        }

        .content {
            flex: 1;
            padding: 20px;
            background: #f5f5f5;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .user-actions {
            display: flex;
            gap: 10px;
        }

        .btn {
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-primary {
            background: #007bff;
            color: white;
        }

        .btn-danger {
            background: #dc3545;
            color: white;
        }

        .btn-success {
            background: #28a745;
            color: white;
        }

        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .big-number {
            font-size: 2rem;
            font-weight: bold;
            margin-top: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #f8f9fa;
            font-weight: 600;
        }

        .status {
            padding: 4px 8px;
            border-radius: 15px;
            font-size: 0.875rem;
        }

        .confirmed {
            background: #d4edda;
            color: #155724;
        }

        .form-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        input, select, textarea {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }

        section {
            display: none;
            margin-top: 20px;
        }

        section.active {
            display: block;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background: white;
            padding: 20px;
            border-radius: 10px;
            width: 100%;
            max-width: 500px;
        }

        .close {
            float: right;
            cursor: pointer;
            font-size: 1.5rem;
        }
        h2.text{
            color:#f5f5f5 ;
        }
        h5.text{
            color:#f5f5f5 ;
        }
    </style>
</head>
<body>
    <div class="dashboard">
        <nav class="sidebar">
            <div class="logo">
                <img src="/FindFlights/images/logo.png" alt="FindFlights Logo">
                <h1>FindFlights</h1>
            </div>
            <ul>
                <li class="active"><a href="#dashboard"> Dashboard</a></li>
                <li><a href="#bookings"> Bookings</a></li>
                <li><a href="#flights"> Flights</a></li>
                <li><a href="#offers"> Offers</a></li>
                <li><a href="#complaints"> Complaints</a></li>
            </ul>
        </nav>
        <main class="content">
            <header>
                <h2>Admin Dashboard</h2>
                <div class="user-actions">
                    <button class="btn" onclick="window.location.href='http://127.0.0.1:7575/JSP/project/FindFlights/login/login.jsp'">Logout</button>
                </div>
            </header>

            <section id="dashboard" class="active">
                <h2>Overview</h2>
                <div class="dashboard-cards">
                    <div class="card">
                        <h3>Active Flights</h3>
                        <%  
                            int count= 0;
                            psmt = con.prepareStatement("SELECT COUNT(*) FROM flights");
                            rs = psmt.executeQuery();
                            while(rs.next())
                            {   
                                count = rs.getInt(1);
                            }
                            out.println("<p class='big-number'>"+count+"</p>");
                        %>
                    </div>
                    <div class="card">
                        <h3>Current Offers</h3>
                        <%  
                        int count1= 0;
                        psmt = con.prepareStatement("SELECT COUNT(*) FROM offers");
                        rs = psmt.executeQuery();
                        while(rs.next())
                        {   
                            count1 = rs.getInt(1);
                        }
                        out.println("<p class='big-number'>"+count1+"</p>");
                    %>
                    </div>
                </div>
            </section>

            <section id="bookings">
                <h2>All Bookings</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Passport no</th>
                            <th>Flight no</th>
                            <th>From</th>
                            <th>To</th>
                            <th>Date</th>
                            <th>Company</th>
                            <th>Class</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                            <%
                                smt = con.createStatement();
                                rs = smt.executeQuery("select * from bookings");
                                while(rs.next())
                                {
                                    out.println("<tr>");
                                    out.println("<td>"+rs.getString(1)+"</td>");
                                    out.println("<td>"+rs.getString(2)+"</td>");
                                    out.println("<td>"+rs.getString(3)+"</td>");
                                    out.println("<td>"+rs.getString(4)+"</td>");
                                    out.println("<td>"+rs.getString(5)+"</td>");
                                    out.println("<td>"+rs.getString(6)+"</td>");
                                    out.println("<td>"+rs.getString(7)+"</td>");
                                    out.println("<td>"+rs.getString(8)+"</td>");
                                    out.println("</tr>");
                                }
                             %>
                        
                    </tbody>
                </table>
            </section>

            <section id="complaints">
                <h2>All Bookings</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Complaint</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                            <%
                                smt = con.createStatement();
                                rs = smt.executeQuery("select * from complaints");
                                while(rs.next())
                                {
                                    out.println("<tr>");
                                    out.println("<td>"+rs.getString(1)+"</td>");
                                    out.println("<td>"+rs.getString(2)+"</td>");
                                    out.println("<td>"+rs.getString(3)+"</td>");
                                    out.println("<td>"+rs.getString(4)+"</td>");
                                    out.println("</tr>");
                                }
                             %>
                        
                    </tbody>
                </table>
            </section>

            <section id="flights">
                <h2>Manage Flights</h2>
                <h5 class="text" color=#f5f5f5;>.</h5>
                <button class="btn btn-primary" onclick="openModal('addFlightModal')">Add New Flight</button>
                <button class="btn btn-primary" onclick="openModal('addEditModal')">Edit</button>
                <button class="btn btn-primary" onclick="openModal('addDeleteModal')">Delete</button>
                <h5 class="text" color=#f5f5f5;>.</h5>
                <table>
                    <thead>
                        <tr>
                            <th>Flight No.</th>
                            <th>From</th>
                            <th>To</th>
                            <th>Departure</th>
                            <th>Arrival</th>
                            <th>Price</th>
                            <th>company</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            smt = con.createStatement();
                            rs = smt.executeQuery("select* from flights"); 
                            while(rs.next())
                            {
                                out.println("<tr>");
                                out.println("<td>"+rs.getString(1)+"</td>");
                                out.println("<td>"+rs.getString(2)+"</td>");
                                out.println("<td>"+rs.getString(3)+"</td>");
                                out.println("<td>"+rs.getString(4)+"</td>");
                                out.println("<td>"+rs.getString(5)+"</td>");
                                out.println("<td>"+rs.getString(6)+"</td>");
                                out.println("<td>"+rs.getString(7)+"</td></tr>");
                            }
                        %>
                    </tbody>
                </table>
            </section>

            <section id="offers">
                <h2>Manage Offers</h2>
                <h5 class="text" color=#f5f5f5;>.</h5>
                <button class="btn btn-primary" onclick="openModal('addOfferModal')">Add New Offer</button>
                <button class="btn btn-primary" onclick="openModal('addUpdateOffer')">Edit</button>
                <button class="btn btn-primary" onclick="openModal('addDeleteOffer')">Delete</button>
                <h5 class="text" color=#f5f5f5;>.</h5>
                <table>
                    <thead>
                        <tr>
                            <th>Offer ID</th>
                            <th>Title</th>
                            <th>Discount</th>
                            <th>Valid Until</th>
                        </tr>
                    </thead>
                    <tbody>
                         <% rs = smt.executeQuery("select * from offers"); 
                            while(rs.next())
                            {
                                out.println("<tr>");
                                out.println("<td>"+rs.getString(1)+"</td>");
                                out.println("<td>"+rs.getString(2)+"</td>");
                                out.println("<td>"+rs.getInt(3)+"%"+"</td>");
                                out.println("<td>"+rs.getString(4)+"</td></tr>");
                            }
                            String edit = request.getParameter("btn-danger");
                            if(edit!=null)
                            {   
                                psmt = con.prepareStatement("delete * from offers where offer_id=?");
                                psmt.setString(1,rs.getString(1));
                            }

                        %>
                    </tbody>
                </table>
            </section>
        </main>
    </div>

    <!-- Add Flight Modal -->
    <div id="addFlightModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('addFlightModal')">&times;</span>
            <h2>Add New Flight</h2>
            <h5 class="text" color=#f5f5f5;>.</h5>
            <form class="form-row">
                <div class="form-group">
                    <label for="flightNo">Flight Number:</label>
                    <input type="text" name="number" id="flightNo" required>
                </div>
                <div class="form-group">
                    <label for="from">From:</label>
                    <input type="text" name="from" id="from" required>
                </div>
                <div class="form-group">
                    <label for="to">To:</label>
                    <input type="text" name="to" id="to" required>
                </div>
                <div class="form-group">
                    <label for="departure">Departure:</label>
                    <input type="date" name="ddate" id="departure" required>
                </div>
                <div class="form-group">
                    <label for="arrival">Arrival:</label>
                    <input type="date" name="adate" id="arrival" required>
                </div>
                <div class="form-group">
                    <label for="Price">Price</label>
                    <input type="number" name="price" id="capacity" required>
                </div>
                <div class="form-group">
                    <label for="company">Company</label>
                    <input type="text" name="company" id="to" required>
                </div>
                <h5 class="text" color=#f5f5f5;>.</h5>
                <div class="form-group">
                    <button type="submit" name="add" class="btn btn-primary">Add Flight</button>
                </div>
            </form>
        </div>
    </div>
<%
String btn = request.getParameter("add");
if(btn!=null)
{
    String num = request.getParameter("number");
    String from = request.getParameter("from");
    String to = (request.getParameter("to"));
    String ddate = request.getParameter("ddate");
    String adate = (request.getParameter("adate"));
    int price = Integer.parseInt(request.getParameter("price"));
    String company = request.getParameter("company");

    psmt = con.prepareStatement("Insert into flights values(?,?,?,?,?,?,?)");
    psmt.setString(1,num);
    psmt.setString(2,from);
    psmt.setString(3,to);
    psmt.setString(4,ddate);
    psmt.setString(5,adate);
    psmt.setInt(6,price);
    psmt.setString(7,company);
    int cnt = psmt.executeUpdate();
    if(cnt>=1)
    {
        out.println("<script> alert('Flight added') </script>");
    }
    else
    {
        out.println("<script> alert('Flight not added') </script>");
    }
}
%>
    <!-- Add Update Flight Modal -->
    <div id="addEditModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('addEditModal')">&times;</span>
            <h2>Update Flight</h2>
            <h5 class="text" color=#f5f5f5;>.</h5>
            <form class="form-row">
                <div class="form-group">
                    <label for="Flightno">Flight no :</label>
                    <input type="text" name="upflightno" id="upflightno" required>
                </div>
                <div class="form-group">
                    <label for="Flightfrom">From :</label>
                    <input type="text" name="Flightfrom" id="Flightfrom" required>
                </div>
                <div class="form-group">
                    <label for="Flightto">To :</label>
                    <input type="text" name="Flightto" id="Flightto" required>
                </div>
                <div class="form-group">
                    <label for="date">Departure date :</label>
                    <input type="date" name="Departuredate" id="Departuredate" required>
                </div>
                <div class="form-group">
                    <label for="date">Arrival date :</label>
                    <input type="date" name="arrivaldate" id="arrivaldate" required>
                </div>
                <div class="form-group">
                    <label for="Price">Price</label>
                    <input type="number" name="upprice" id="capacity" required>
                </div>
                <div class="form-group">
                    <button type="submit" name="update" class="btn btn-primary">Update</button>
                </div>
            </form>
        </div>
    </div>
<%
String update = request.getParameter("update");
if(update!=null)
{
    String flightno = request.getParameter("upflightno");
    String Flightfrom = request.getParameter("Flightfrom");
    String Flightto = (request.getParameter("Flightto"));
    String Departuredate = request.getParameter("Departuredate");
    String arrivaldate = (request.getParameter("arrivaldate"));
    int upprice = Integer.parseInt(request.getParameter("upprice"));
    out.println(flightno+" "+Flightfrom+" "+Flightto+" "+Departuredate+" "+arrivaldate+" "+upprice);

    psmt = con.prepareStatement("update flights set from_city=?,to_city=?,departure_date=?,arrival_date=?,price=? where flight_no=?");
    psmt.setString(1,Flightfrom);
    psmt.setString(2,Flightto);
    psmt.setString(3,Departuredate);
    psmt.setString(4,arrivaldate);
    psmt.setInt(5,upprice);
    psmt.setString(6,flightno);

    int up = psmt.executeUpdate();
    if(up>=1)
    {
        out.println("<script> alert('Flight Updated') </script>");
    }
    else
    {
        out.println("<script> alert('Flight not Updated') </script>");
    }
} 
%>
    <!-- Add Delete Flight Modal -->
    <div id="addDeleteModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('addDeleteModal')">&times;</span>
            <h2>Delete Flight</h2>
            <form class="form-row">
                <div class="form-group">
                    <h5 class="text" color=#f5f5f5;>.</h5>
                    <label for="Flightno">Flight no :</label>
                    <input type="text" name="delFlightno" id="Flightno" required>
                    <button type="submit" name= "deleteflight" class="btn btn-primary">Delete</button>
                </div>
            </form>
        </div>
    </div>
<% 
String deletebtn = request.getParameter("deleteflight");
if(deletebtn!=null)
{   
    String delete = request.getParameter("delFlightno");
    psmt = con.prepareStatement("delete from flights where flight_no=?");
    psmt.setString(1,delete);
    int del = psmt.executeUpdate();
    if(del>=1)
    {
        out.println("<script> alert('Flight Deleted') </script>");
    }
    else
    {
        out.println("<script> alert('Flight not Deleted') </script>");
    }
}
 %>

    <!-- Add Offer Modal -->
    <div id="addOfferModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('addOfferModal')">&times;</span>
            <h2>Add New Offer</h2>
            <h5 class="text" color=#f5f5f5;>.</h5>
            <form class="form-row">
                <div class="form-group">
                    <label for="offerID">Offer ID:</label>
                    <input type="text" name="offerid" id="offerTitle" required>
                </div>
                <div class="form-group">
                    <label for="offerTitle">Title:</label>
                    <input type="text" name="title" id="offerTitle" required>
                </div>
                <div class="form-group">
                    <label for="discount">Discount (%):</label>
                    <input type="number" name="discount" id="discount" min="0" max="100" required>
                </div>
                <div class="form-group">
                    <label for="validUntil">Valid Until:</label>
                    <input type="date" name="valid" id="validUntil" required>
                </div>
                <div class="form-group">
                    <button type="submit" name="addoffer" class="btn btn-primary">Add Offer</button>
                </div>
            </form>
        </div>
    </div>
    <%
    try
    {  
        String offer = request.getParameter("addoffer");
        {    
            if(offer!=null)
            {
                String offerid = request.getParameter("offerid");
                String title = request.getParameter("title");
                int discount = Integer.parseInt(request.getParameter("discount"));
                String valid = request.getParameter("valid");
                psmt = con.prepareStatement("Insert into offers values(?,?,?,?);");
                psmt.setString(1,offerid);
                psmt.setString(2,title);
                psmt.setInt(3,discount);
                psmt.setString(4,valid);
                int cnt1 = psmt.executeUpdate();
                if(cnt1>=1)
                {
                    out.println("<script> alert('Offer inserted') </script>");
                }
                else
                {
                    out.println("<script> alert('Offer not inserted') </script>");
                }
            } 
        }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    } 
    %>
    <!-- Add Update offer Modal -->
    <div id="addUpdateOffer" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('addUpdateOffer')">&times;</span>
            <h2>Update Offer</h2>
            <h5 class="text" color=#f5f5f5;>.</h5>
            <form class="form-row">
                <div class="form-group">
                    <label for="offerID">Offer ID:</label>
                    <input type="text" name="upofferid" id="upofferid" required>
                </div>
                <div class="form-group">
                    <label for="offerTitle">Title:</label>
                    <input type="text" name="uptitle" id="upofferTitle" required>
                </div>
                <div class="form-group">
                    <label for="discount">Discount (%):</label>
                    <input type="number" name="updiscount" id="updiscount" min="0" max="100" required>
                </div>
                <div class="form-group">
                    <label for="validUntil">Valid Until:</label>
                    <input type="date" name="upvalid" id="upvalid" required>
                </div>
                <div class="form-group">
                    <button type="submit" name="updateOffer" class="btn btn-primary">Update</button>
                </div>
            </form>
        </div>
    </div>
<%          
String updateoff =  request.getParameter("updateOffer");
if(updateoff!=null)
{
    String tid="";
    String tname="";
    int tdisc=0;
    String tdate=""; 
    smt = con.createStatement();
    rs = smt.executeQuery("select * from offers where offer_id = (select max(offer_id) from offers)");
    while(rs.next())
    {
        tid = rs.getString(1);
        tname = rs.getString(2);
        tdisc = rs.getInt(3);
        tdate = rs.getString(4);
    }
    // out.println("<script>alert('hii')</script> ");
    String upofferid = request.getParameter("upofferid");
    String uptitle = request.getParameter("uptitle");
    int updiscount = Integer.parseInt(request.getParameter("updiscount"));
    String upvalid = request.getParameter("upvalid");
    if(tid.equals(upofferid) && tname.equals(uptitle) && tdisc==updiscount && tdate.equals(upvalid))
    {
        System.out.println("");
    }
    else 
    {   
        psmt = con.prepareStatement("Update offers set title = ?,discount = ?, valid_until = ? where offer_id = ?");
        psmt.setString(1,uptitle);
        psmt.setInt(2,updiscount);
        psmt.setString(3,upvalid);
        psmt.setString(4,upofferid);
        int cnt2 = psmt.executeUpdate();
        if(cnt2>=1)    
        {
            out.println("<script> alert('Offer Updated') </script>");
        }
        else
        {
            // 
            System.out.println("");
        }
    }
}
%>

    <!-- Add Delete Flight Modal -->
    <div id="addDeleteOffer" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('addDeleteOffer')">&times;</span>
            <h2>Delete Offer</h2>
            <h5 class="text" color=#f5f5f5;>.</h5>
            <form class="form-row">
                <div class="form-group">
                    <label for="Flightno">Offer id :</label>
                    <input type="text" name="dofferid" id="dofferid" required>
                    <button type="submit" name= "deleteoffer" class="btn btn-primary">Delete</button>
                </div>
            </form>
        </div>
    </div>
<% 
    String deleteoff = request.getParameter("dofferid");
    if(deleteoff!=null)
    {   
        String deleteoffer = request.getParameter("dofferid");
        psmt = con.prepareStatement("delete from offers where offer_id=?");
        psmt.setString(1,deleteoffer);
        int del = psmt.executeUpdate();
        if(del>=1)
        {
            out.println("<script> alert('Offer Deleted') </script>");
        }
        else
        {
            out.println("<script> alert('Offer not Deleted') </script>");
        }
    }
%>
    <script>
        // Navigation
        document.querySelectorAll('.sidebar a').forEach(link => {
            link.addEventListener('click', (e) => {
                e.preventDefault();
                const targetId = link.getAttribute('href').substring(1);
                
                // Update active section
                document.querySelectorAll('section').forEach(section => {
                    section.classList.remove('active');
                });
                document.getElementById(targetId).classList.add('active');
                
                // Update active link
                document.querySelectorAll('.sidebar li').forEach(li => {
                    li.classList.remove('active');
                });
                link.parentElement.classList.add('active');
            });
        });

        // Modal functions
        function openModal(modalId) {
            document.getElementById(modalId).style.display = 'flex';
        }

        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }

        // Close modal when clicking outside
        window.onclick = function(event) {
            if (event.target.classList.contains('modal')) {
                event.target.style.display = 'none';
            }
        }
    </script>
</body>
</html>
<%
    }catch(Exception e)
    {
        out.println(""+e);
        e.printStackTrace();
    }   
%>