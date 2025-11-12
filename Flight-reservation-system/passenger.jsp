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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Passenger Dashboard</title>
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
            background: #1a1a1a;
            color: white;
            padding: 20px;
            font-size: 18px;
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
            background: #333;
        }

        .content {
            flex: 1;
            padding: 20px;
            background: #e2e7ed;
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

        .booking-form, .personal-details-form {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .bookings-table {
            margin-top: 20px;
        }

        /* Simple icon fallbacks using CSS */
        /* Responsive design */
        @media (max-width: 768px) {
            .dashboard {
                flex-direction: column;
            }
            
            .sidebar {
                width: 100%;
            }
            
            .form-row {
                grid-template-columns: 1fr;
            }
        }

        /* Add Modal Styles */
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
            z-index: 1000;
        }

        .modal-content {
            background: white;
            padding: 20px;
            border-radius: 10px;
            width: 100%;
            max-width: 500px;
            position: relative;
        }

        .close {
            position: absolute;
            right: 20px;
            top: 20px;
            cursor: pointer;
            font-size: 1.5rem;
            color: #666;
        }

        .close:hover {
            color: #000;
        }

        /* Add this to your existing CSS */
        .ticket-details {
            display: grid;
            grid-template-columns: auto 1fr;
            gap: 10px;
            margin: 20px 0;
        }

        .ticket-details dt {
            font-weight: bold;
            color: #666;
        }

        .ticket-details dd {
            margin: 0;
        }

        .modal-title {
            margin-bottom: 20px;
            padding-right: 30px;
        }
        h4.text{
            color: #e2e7ed;
        }
    </style>
</head>
<body>
    <div class="dashboard">
        <nav class="sidebar">
            <div class="logo">
                <img src="logo1.png" id="logo1" alt="FindFlights Logo">
                <h1>FindFlights</h1>
            </div>
            <ul>
                <li class="active"><a href="#home"> Home</a></li>
                <li><a href="#book-ticket"> Book Ticket</a></li>
                <li><a href="#my-bookings"> My Bookings</a></li>
            </ul>
        </nav>
        <main class="content">
            <header>
                <h2>Welcome</h2>
                <div class="user-actions">
                    <button class="btn" onclick="window.location.href='http://127.0.0.1:7575/JSP/project/FindFlights/login/login.jsp'">Logout</button>
                    
                </div>
            </header>
            <section id="home" class="active">
                <h2>Dashboard Overview</h2>
                <div class="dashboard-cards">
                </div>
            </section>
            <section id="book-ticket">
                <h2>Book a New Ticket</h2>
                <h4 class="text" >.</h4>
                <form class="booking-form">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="from">From:</label>
                            <input type="text" id="from" name="from" required>
                        </div>
                        <div class="form-group">
                            <label for="to">To:</label>
                            <input type="text" id="to" name="to" required>
                        </div>
                        <div class="form-group">
                            <label for="departure">Departure:</label>
                            <input type="date" id="departure" name="departure" required>
                        </div>
                        <div class="form-group">
                            <label>&nbsp;</label>
                            <button type="submit" class="btn btn-primary" name="search">Search Flights</button>
                        </div>
                    </div>
                </form>
<%
String search = request.getParameter("search");
String from , to,fl_no ;
if(search!=null)
{   
    from = request.getParameter("from");
    to = request.getParameter("to");
    
    psmt = con.prepareStatement("select * from flights where from_city = ? && to_city = ? ");
    psmt.setString(1,from);
    psmt.setString(2,to);
    rs = psmt.executeQuery();

            out.println(".");
            out.println("<table>");
            out.println("<tr>");    
            out.println("<th>Flight no</th>");
            out.println("<th>From</th>");
            out.println("<th>To</th>");
            out.println("<th>Departure date</th>");
            out.println("<th>Arrival date</th>");
            out.println("<th>Price</th>");
            out.println("<th>Company</th>");
            out.println("</tr>"); 
    while(rs.next())
    {   
        if(from.equals(rs.getString(2)) && to.equals(rs.getString(3)))
        {
            out.println("<td>"+rs.getString(1)+"</td>");
            out.println("<td>"+rs.getString(2)+"</td>");
            out.println("<td>"+rs.getString(3)+"</td>");
            out.println("<td>"+rs.getString(4)+"</td>");
            out.println("<td>"+rs.getString(5)+"</td>");
            out.println("<td>"+rs.getInt(6)+"</td>");
            out.println("<td>"+rs.getString(7)+"</td>");
            out.println("</tr>");
        }
        else
        {
            out.println("<h3>Flights for this route is not available</h3>");
        }
    }
}             
%>  </table>
<h4 class="text" >.</h4>
    <button class="btn btn-primary" onclick="openModal('BookTicketModal')">Book</button>
            </section>
            <section id="my-bookings">
                <form class="personal-details-form">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="name">Name :</label>
                            <input type="text" id="name" name="nam"  required>
                        </div>
                        <div class="form-group">
                            <label >Passport No :</label>
                            <input type="text"  name="passp"  required>
                        </div>
                    </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary" name="show">Show</button>
                        </div>
                </form>
                        <table class="bookings-table">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Passport NO</th>
                                    <th>Flight number</th>
                                    <th>From</th>
                                    <th>To</th>
                                    <th>Date</th>
                                    <th>Company</th>
                                    <th>Class</th>
                                </tr>
                            </thead>
                        </tbody>
                        <% 
                        String sh = request.getParameter("show");
                        if(sh!=null)
                        {
                            String nam = request.getParameter("nam");
                            String passp = request.getParameter("passp");
                            smt = con.createStatement();
                            rs = smt.executeQuery("select * from bookings");
                            while(rs.next())
                            {
                                if(nam.equals(rs.getString(1)) && passp.equals(rs.getString(2)))
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
                            }
                        }
                        %>
                    </table>
            </section>
            <section id="personal-details">
                <h2>Personal Details</h2>
                <form class="personal-details-form">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="name">Full Name :</label>
                            <input type="text" id="name" name="name" value="John Doe" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email :</label>
                            <input type="email" id="email" name="email" value="john.doe@example.com" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone :</label>
                            <input type="tel" id="phone" name="phone" value="+1 234 567 8900" required>
                        </div>
                        <div class="form-group">
                            <label for="address">Address :</label>
                            <input type="text" id="address" name="address" value="123 Main St, Anytown, USA" required>
                        </div>
                    </div>
                    <!-- <div class="form-row"> -->
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </div>
                    <!-- </div> -->
                </form>
            </section>
        </main>
    </div>

    <!-- View Ticket Modal -->
    <div id="viewTicketModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('viewTicketModal')">&times;</span>
            <h2 class="modal-title">Ticket Details</h2>
            <dl class="ticket-details">
                <dt>Flight Number:</dt>
                <dd id="modalFlightNo">SK123</dd>
                
                <dt>Passenger Name:</dt>
                <dd>John Doe</dd>
                
                <dt>From:</dt>
                <dd>New York (JFK)</dd>
                
                <dt>To:</dt>
                <dd>London (LHR)</dd>
                
                <dt>Date:</dt>
                <dd>June 15, 2023</dd>
                
                <dt>Departure Time:</dt>
                <dd>10:00 AM</dd>
                
                <dt>Arrival Time:</dt>
                <dd>10:00 PM</dd>
                
                <dt>Seat:</dt>
                <dd>12A</dd>
                
                <dt>Class:</dt>
                <dd>Economy</dd>
                
                <dt>Status:</dt>
                <dd><span class="status confirmed">Confirmed</span></dd>
            </dl>
            <div class="form-group">
                <button class="btn btn-primary" onclick="downloadTicket()">Download Ticket</button>
            </div>
        </div>
    </div>

    <!-- Edit Profile Modal -->
    <div id="editProfileModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('editProfileModal')">&times;</span>
            <h2 class="modal-title">Edit Profile</h2>
            <form class="form-row">
                <div class="form-group">
                    <label for="editName">Full Name:</label>
                    <input type="text" id="editName" name="editName" value="John Doe" required>
                </div>
                <div class="form-group">
                    <label for="editEmail">Email:</label>
                    <input type="email" id="editEmail" name="editEmail" value="john.doe@example.com" required>
                </div>
                <div class="form-group">
                    <label for="editPhone">Phone:</label>
                    <input type="tel" id="editPhone" name="editPhone" value="+1 234 567 8900" required>
                </div>
                <div class="form-group">
                    <label for="editAddress">Address:</label>
                    <input type="text" id="editAddress" name="editAddress" value="123 Main St, Anytown, USA" required>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </div>
            </form>
        </div>
    </div>

    <div id="BookTicketModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('editProfileModal')">&times;</span>
            <h2 class="modal-title">Book-ticket</h2>
            <form class="form-row">
                <div class="form-group">
                    <label for="editName">Select Flight no :</label>
                    <select name="fl_no">
                        <%
                        from = request.getParameter("from");
                        to = request.getParameter("to");
                        String f = from;
                        String t = to;
                        
                        psmt = con.prepareStatement("select * from flights where from_city = ? && to_city = ? ");
                        psmt.setString(1,from);
                        psmt.setString(2,to);
                        rs = psmt.executeQuery();
                        while(rs.next())
                        {
                            if(from.equals(rs.getString(2)) && to.equals(rs.getString(3)))
                            {
                                out.println("<option>"+rs.getString(1)+"</option>");
                            }
                        }
                        fl_no = request.getParameter("fl_no");
                        %>   
                    </select>
                </div>
                <div class="form-group">
                    <label for="editAddress">Name :</label>
                    <input type="text" id="editAddress" name="namep" value="" required>
                </div>
                <div class="form-group">
                    <label for="editAddress">Passport no :</label>
                    <input type="text" id="editAddress" name="passport" value="" required>
                </div>
                <div class="form-group">
                    <label for="editAddress">Phone no :</label>
                    <input type="text" id="editAddress" name="phone_no" value="" required>
                </div>
                <div class="form-group">
                    <label for="editEmail">Select class :</label>
                    <select name="classp" required>
                        <option>Economy</option>
                        <option>Premium economy</option>
                        <option>Business</option>
                        <option>First class</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Confirm booking :</label>
                    <button type="btn" name="confirm" class="btn btn-primary">Book</button>
                </div>
            </form>
        </div>
    </div>
    <%
        String confirm = request.getParameter("confirm");
        if(confirm!=null)
        {
            String name = request.getParameter("namep");
            String passport = request.getParameter("passport");
            String phone_no = request.getParameter("phone_no");
            String classp = request.getParameter("classp");
            psmt = con.prepareStatement("select * from flights where flight_no = ? ");
            psmt.setString(1,fl_no);
            rs = psmt.executeQuery();
            String ff="",dd="",tt="",comm="";
            while(rs.next())
            {
                ff = rs.getString(2);
                tt = rs.getString(3);
                dd = rs.getString(4);
                comm = rs.getString(7);
            }
            psmt = con.prepareStatement("insert into Bookings values (?,?,?,?,?,?,?,?)");
            psmt.setString(1,name);
            psmt.setString(2,passport);
            psmt.setString(3,fl_no);
            psmt.setString(4,ff);
            psmt.setString(5,tt);
            psmt.setString(6,dd);
            psmt.setString(7,comm);
            psmt.setString(8,classp);
            int cnt = psmt.executeUpdate();
            if(cnt>=1)
                out.println("<script>alert('booked')</script>");
            else{

            }
        } 
    %>

    <script>
        // Navigation
        document.addEventListener('DOMContentLoaded', function() {
            // Handle sidebar navigation
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

            // Handle form submissions
            // document.querySelectorAll('form').forEach(form => {
            //     form.addEventListener('submit', (e) => {
            //         e.preventDefault();
            //         alert('Form submitted successfully!');
            //     });
            // });

            // Handle booking cancellations
            document.querySelectorAll('.btn-danger').forEach(button => {
                button.addEventListener('click', () => {
                    if (confirm('Are you sure you want to cancel this booking?')) {
                        alert('Booking cancelled successfully!');
                        // Here you would typically make an API call to cancel the booking
                    }
                });
            });

            // Placeholder for logo if not found
            const logo = document.getElementById('logo1');
            if (logo) {
                logo.onerror = function() {
                    this.src = 'data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17.8 19.2L16 11l3.5-3.5C21 6 21.5 4 21 3c-1-.5-3 0-4.5 1.5L13 8 4.8 6.2c-.5-.1-.9.1-1.1.5l-.3.5c-.2.5-.1 1 .3 1.3L9 12l-2 3H4l-1 1 3 2 2 3 3-2v-3l3-2 3.5 5.3c.3.4.8.5 1.3.3l.5-.2c.4-.3.6-.7.5-1.2z"/></svg>';
                };
            }

            // Add click handler for user profile button
            const userProfileBtn = document.querySelector('.user-actions .btn:last-child');
            userProfileBtn.addEventListener('click', () => {
                openModal('editProfileModal');
            });

            // Handle form submissions in modals
            // document.querySelectorAll('.modal form').forEach(form => {
            //     form.addEventListener('submit', (e) => {
            //         e.preventDefault();
            //         alert('Changes saved successfully!');
            //         closeModal(e.target.closest('.modal').id);
            //     });
            // });
        });

        // Modal functions
        function openModal(modalId, flightNo = null) {
            const modal = document.getElementById(modalId);
            modal.style.display = 'flex';
            
            if (flightNo && modalId === 'viewTicketModal') {
                document.getElementById('modalFlightNo').textContent = flightNo;
                // Here you would typically fetch the ticket details from a server
                // and populate the modal with the retrieved data
            }
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

        // Download ticket function (placeholder)
        function downloadTicket() {
            alert('Downloading ticket...');
            // Here you would typically generate and download a PDF ticket
        }
    </script>
</body>
</html>
<%
    }
    catch(Exception e)
    {
        out.println(""+e);
    }
%>
