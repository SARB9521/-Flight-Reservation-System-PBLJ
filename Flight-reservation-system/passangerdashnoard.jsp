<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Passenger Dashboard</title>
    <link rel="stylesheet" href="styles.css">
    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>
</head>
<body>
    <form>
    <div class="dashboard">
        <nav class="sidebar">
            <div class="logo">
                <img src="/FindFlights/images/logo1.png" id="logo1">
                <h1>FindFlights</h1>
            </div>
            <ul>
                <li class="active"><a href="#home"> Home</a></li>
                <li><a href="#book-ticket"> Book Ticket</a></li>
                <li><a href="#my-bookings"> My Bookings</a></li>
                <li><a href="#personal-details"> Personal Details</a></li>
                <li><a href="#personal-details">Logout</a></li>
            </ul>
        </nav>
        <main class="content">
            <header>
                <h2>Welcome, Rehan </h2>
                <div class="user-actions">
                </div>
            </header>
            <section id="home" class="active">
                <h2>Dashboard Overview</h2>
                <div class="dashboard-cards">
                    <div class="card">
                        <h3>Upcoming Flights</h3>
                        <p class="big-number">2</p>
                    </div>
                    <div class="card">
                        <h3>Miles Earned</h3>
                        <p class="big-number">1,250</p>
                    </div>
                    <div class="card">
                        <h3>Loyalty Status</h3>
                        <p class="big-number">Gold</p>
                    </div>
                </div>
            </section>
            <section id="book-ticket">
                <h2>Book a New Ticket</h2>
                
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
                            <label for="return">Return:</label>
                            <input type="date" id="return" name="return">
                        </div>
                        <div class="form-group">
                            <label for="class">Class:</label>
                            <select id="class" name="class" required>
                                <option value="economy">Economy</option>
                                <option value="business">Business</option>
                                <option value="first">First Class</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary" name="search">Search Flights</button>
                        </div>        
                    </div>
                <%
                    try
                    {
                    String search = request.getParameter("search");
                    if(search!=null)
                    {              
                    out.println("inside");
                    out.println("<table>");
                    out.println("<th>Flight no</th>");
                    out.println("<th>From</th>");
                    out.println("<th>TO</th>");
                    out.println("<th>Departure date</th>");
                    out.println("<th>Arrival date</th>");
                    out.println("<th>Price</th>");
                    out.println("<th>Company</th>");
                    out.println("</table>");
                    }
                %>
            </section>
            <section id="bookings">
                <h2>All Bookings</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Passenger Name</th>
                            <th>Flight No.</th>
                            <th>From</th>
                            <th>To</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>B001</td>
                            <td>John Doe</td>
                            <td>SK123</td>
                            <td>New York</td>
                            <td>London</td>
                            <td>2023-06-15</td>
                            <td><span class="status confirmed">Confirmed</span></td>
                            <td>
                                <button class="btn btn-danger">Cancel</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </section>
            <section id="my-bookings">
                <h2>My Bookings</h2>
                <table class="bookings-table">
                    <thead>
                        <tr>
                            <th>Flight No.</th>
                            <th>From</th>
                            <th>To</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>SK123</td>
                            <td>New York</td>
                            <td>London</td>
                            <td>2023-06-15</td>
                            <td><span class="status confirmed">Confirmed</span></td>
                            <td><button class="btn btn-danger">Cancel</button></td>
                        </tr>
                        <tr>
                            <td>SK456</td>
                            <td>London</td>
                            <td>Paris</td>
                            <td>2023-07-01</td>
                            <td><span class="status confirmed">Confirmed</span></td>
                            <td><button class="btn btn-danger">Cancel</button></td>
                        </tr>
                    </tbody>
                </table>
            </section>
            <section id="personal-details">
                <h2>Personal Details</h2>
                <form class="personal-details-form">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="name">Full Name:</label>
                            <input type="text" id="name" name="name" value="John Doe" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" value="john.doe@example.com" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone:</label>
                            <input type="tel" id="phone" name="phone" value="+1 234 567 8900" required>
                        </div>
                        <div class="form-group">
                            <label for="address">Address:</label>
                            <input type="text" id="address" name="address" value="123 Main St, Anytown, USA" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </div>
                    </div>
                </form>
            </section>
        </main>
    </div>
    <script src="script.js"></script>
</body>
</html>
<%
    }
    catch(Exception e)
    {
        out.println(""+e);
    }
%>
