<%@ page import="java.util.List" %>
<%@ page import="entities.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>User Table Manager</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        body {
            color: #566787;
            background: #f5f5f5;
            font-family: 'Varela Round', sans-serif;
            font-size: 13px;
        }

        .table-responsive {
            margin: 30px 0;
        }

        .table-wrapper {
            background: #fff;
            padding: 20px 25px;
            border-radius: 3px;
            min-width: 1000px;
            box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
        }

        .table-title {
            padding-bottom: 15px;
            background: #435d7d;
            color: #fff;
            padding: 16px 30px;
            min-width: 100%;
            margin: -20px -25px 10px;
            border-radius: 3px 3px 0 0;
        }

        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }

        .table-title .btn-group {
            float: right;
        }

        .table-title .btn {
            color: #fff;
            float: right;
            font-size: 13px;
            border: none;
            min-width: 50px;
            border-radius: 2px;
            border: none;
            outline: none !important;
            margin-left: 10px;
        }

        .table-title .btn i {
            float: left;
            font-size: 21px;
            margin-right: 5px;
        }

        .table-title .btn span {
            float: left;
            margin-top: 2px;
        }

        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
            padding: 12px 15px;
            vertical-align: middle;
        }

        table.table tr th:first-child {
            width: 60px;
        }

        table.table tr th:last-child {
            width: 100px;
        }

        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }

        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }

        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }

        table.table td:last-child i {
            opacity: 0.9;
            font-size: 22px;
            margin: 0 5px;
        }

        table.table td a {
            font-weight: bold;
            color: #566787;
            display: inline-block;
            text-decoration: none;
            outline: none !important;
        }

        table.table td a:hover {
            color: #2196F3;
        }

        table.table td a.edit {
            color: #FFC107;
        }

        table.table td a.delete {
            color: #F44336;
        }

        table.table td i {
            font-size: 19px;
        }

        table.table .avatar {
            border-radius: 50%;
            vertical-align: middle;
            margin-right: 10px;
        }

        .pagination {
            float: right;
            margin: 0 0 5px;
        }

        .pagination li a {
            border: none;
            font-size: 13px;
            min-width: 30px;
            min-height: 30px;
            color: #999;
            margin: 0 2px;
            line-height: 30px;
            border-radius: 2px !important;
            text-align: center;
            padding: 0 6px;
        }

        .pagination li a:hover {
            color: #666;
        }

        .pagination li.active a, .pagination li.active a.page-link {
            background: #03A9F4;
        }

        .pagination li.active a:hover {
            background: #0397d6;
        }

        .pagination li.disabled i {
            color: #ccc;
        }

        .pagination li i {
            font-size: 16px;
            padding-top: 6px
        }

        .hint-text {
            float: left;
            margin-top: 10px;
            font-size: 13px;
        }

        /* Custom checkbox */
        .custom-checkbox {
            position: relative;
        }

        .custom-checkbox input[type="checkbox"] {
            opacity: 0;
            position: absolute;
            margin: 5px 0 0 3px;
            z-index: 9;
        }

        .custom-checkbox label:before {
            width: 18px;
            height: 18px;
        }

        .custom-checkbox label:before {
            content: '';
            margin-right: 10px;
            display: inline-block;
            vertical-align: text-top;
            background: white;
            border: 1px solid #bbb;
            border-radius: 2px;
            box-sizing: border-box;
            z-index: 2;
        }

        .custom-checkbox input[type="checkbox"]:checked + label:after {
            content: '';
            position: absolute;
            left: 6px;
            top: 3px;
            width: 6px;
            height: 11px;
            border: solid #000;
            border-width: 0 3px 3px 0;
            transform: inherit;
            z-index: 3;
            transform: rotateZ(45deg);
        }

        .custom-checkbox input[type="checkbox"]:checked + label:before {
            border-color: #03A9F4;
            background: #03A9F4;
        }

        .custom-checkbox input[type="checkbox"]:checked + label:after {
            border-color: #fff;
        }

        .custom-checkbox input[type="checkbox"]:disabled + label:before {
            color: #b8b8b8;
            cursor: auto;
            box-shadow: none;
            background: #ddd;
        }

        /* Modal styles */
        .modal .modal-dialog {
            max-width: 400px;
        }

        .modal .modal-header, .modal .modal-body, .modal .modal-footer {
            padding: 20px 30px;
        }

        .modal .modal-content {
            border-radius: 3px;
            font-size: 14px;
        }

        .modal .modal-footer {
            background: #ecf0f1;
            border-radius: 0 0 3px 3px;
        }

        .modal .modal-title {
            display: inline-block;
        }

        .modal .form-control {
            border-radius: 2px;
            box-shadow: none;
            border-color: #dddddd;
        }

        .modal textarea.form-control {
            resize: vertical;
        }

        .modal .btn {
            border-radius: 2px;
            min-width: 100px;
        }

        .modal form label {
            font-weight: normal;
        }
    </style>
    <script>
        $(document).ready(function () {
            // Activate tooltip
            $('[data-toggle="tooltip"]').tooltip();

            // Select/Deselect checkboxes
            var checkbox = $('table tbody input[type="checkbox"]');
            $("#selectAll").click(function () {
                if (this.checked) {
                    checkbox.each(function () {
                        this.checked = true;
                    });
                } else {
                    checkbox.each(function () {
                        this.checked = false;
                    });
                }
            });
            checkbox.click(function () {
                if (!this.checked) {
                    $("#selectAll").prop("checked", false);
                }
            });
        });
    </script>
</head>
<body>
<div class="container-xl">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <a href="admin-users?command=READ"><h2>Manage <b>User</b></h2></a>
                        <a href="admin-dashboard"> <h2>Back to <b>Dashboard</b></h2></a>
                    </div>
                    <div class="col-sm-6">
                        <a href="#addUserModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i>
                            <span>Add New User</span></a>
                        <a href="#deleteUserModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i>
                            <span>Delete</span></a>
                    </div>
                </div>
                <div class="active-cyan-4 mb-4">
                    <form action="admin-users" method="GET">
                        <input type="hidden" name="command" value="SEARCH">
                        <input class="form-control" type="text" name="searchValue" placeholder="Search"
                               aria-label="Search">
                    </form>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>
							<span class="custom-checkbox">
								<input type="checkbox" id="selectAll">
								<label for="selectAll"></label>
							</span>
                    </th>

                    <th>ID</th>
                    <th>First name</th>
                    <th>Last name</th>
                    <th>Email address</th>
                    <th>Password</th>
                    <th>Country</th>
                    <th>Street address</th>
                    <th>Apartment</th>
                    <th>City</th>
                    <th>Postcode</th>
                    <th>Phone</th>
                    <th>Role</th>
                    <th>Active</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <% List<User> listUsers = (List<User>) request.getAttribute("listUsers");%>
                <% if (listUsers != null && !listUsers.isEmpty()) { %>
                <% for (User user : listUsers) { %>
                <tr>
                    <td>
							<span class="custom-checkbox">
								<input type="checkbox" id="checkbox1" name="options[]" value="1">
								<label for="checkbox1"></label>
							</span>
                    </td>
                    <td><%=user.getId()%>
                    </td>
                    <td><%=user.getFirstName()%>
                    </td>
                    <td><%=user.getLastName()%>
                    </td>
                    <td><%=user.getEmailAddress()%>
                    </td>
                    <td><%=user.getPassword()%>
                    </td>
                    <td><%=user.getCountry()%>
                    </td>
                    <td><%=user.getStreetAddress()%>
                    </td>
                    <td><%=user.getApartment()%>
                    </td>
                    <td><%=user.getCity()%>
                    </td>
                    <td><%=user.getPostcode()%>
                    </td>
                    <td><%=user.getPhone()%>
                    </td>
                    <td><%=user.getRole()%>
                    </td>
                    <td><%=user.isActive()%></td>
                    <td>
                        <a href="#editUserModal_<%=user.getId()%>" class="edit" data-toggle="modal"><i
                                class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                        <a href="#deleteUserModal_<%=user.getId()%>" class="delete" data-toggle="modal"><i
                                class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                    </td>
                </tr>
                <% } %>
                <% } %>
                </tbody>
            </table>
            <%--            <div class="clearfix">--%>
            <%--                <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>--%>
            <%--                <ul class="pagination">--%>
            <%--                    <li class="page-item disabled"><a href="#">Previous</a></li>--%>
            <%--                    <li class="page-item"><a href="#" class="page-link">1</a></li>--%>
            <%--                    <li class="page-item"><a href="#" class="page-link">2</a></li>--%>
            <%--                    <li class="page-item active"><a href="#" class="page-link">3</a></li>--%>
            <%--                    <li class="page-item"><a href="#" class="page-link">4</a></li>--%>
            <%--                    <li class="page-item"><a href="#" class="page-link">5</a></li>--%>
            <%--                    <li class="page-item"><a href="#" class="page-link">Next</a></li>--%>
            <%--                </ul>--%>
            <%--            </div>--%>
        </div>
    </div>
</div>
<!-- Add Modal HTML -->

<div id="addUserModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="admin-users" method="POST">
                <input type="hidden" name="command" value="CREATE">
                <div class="modal-header">
                    <h4 class="modal-title">Add user</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">

                    <!-- First Name -->
                    <div class="form-group">
                        <label>First Name</label>
                        <input type="text" name="first_name" class="form-control" required>
                    </div>

                    <!-- Last Name -->
                    <div class="form-group">
                        <label>Last Name</label>
                        <input type="text" name="last_name" class="form-control" required>
                    </div>

                    <!-- Email Address -->
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" name="email_address" class="form-control" required>
                    </div>

                    <!-- Password -->
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>

                    <!-- Country -->
                    <div class="form-group">
                        <label>Country</label>
                        <input type="text" name="country" class="form-control" required>
                    </div>

                    <!-- Street Address -->
                    <div class="form-group">
                        <label>Street Address</label>
                        <input type="text" name="street_address" class="form-control" required>
                    </div>

                    <!-- Apartment -->
                    <div class="form-group">
                        <label>Apartment</label>
                        <input type="text" name="apartment" class="form-control">
                    </div>

                    <!-- City -->
                    <div class="form-group">
                        <label>City</label>
                        <input type="text" name="city" class="form-control" required>
                    </div>

                    <!-- Postcode -->
                    <div class="form-group">
                        <label>Postcode</label>
                        <input type="text" name="postcode" class="form-control" required>
                    </div>

                    <!-- Phone -->
                    <div class="form-group">
                        <label>Phone</label>
                        <input type="text" name="phone" class="form-control">
                    </div>

                    <!-- Role -->
                    <div class="form-group">
                        <label>User role:</label>
                        <select name="role_name" class="form-control" required>
                            <option value="Admin">Admin</option>
                            <option value="Customer">Customer</option>
                        </select>
                    </div>

                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success" value="Add">
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Edit Modal HTML -->
<% if (listUsers != null && !listUsers.isEmpty()) { %>
<% for (User user : listUsers) { %>
<div id="editUserModal_<%=user.getId()%>" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="admin-users" method="POST">
                <input type="hidden" name="command" value="UPDATE">
                <input type="hidden" name="userID" value="<%=user.getId()%>">
                <div class="modal-header">
                    <h4 class="modal-title">Edit User</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">

                    <!-- First Name -->
                    <div class="form-group">
                        <label>First Name</label>
                        <input type="text" name="first_name" class="form-control" value="<%=user.getFirstName()%>"
                               required>
                    </div>

                    <!-- Last Name -->
                    <div class="form-group">
                        <label>Last Name</label>
                        <input type="text" name="last_name" class="form-control" value="<%=user.getLastName()%>"
                               required>
                    </div>

                    <!-- Email Address -->
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" name="email_address" class="form-control"
                               value="<%=user.getEmailAddress()%>" required>
                    </div>

                    <!-- Password -->
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" name="password" class="form-control" value="<%=user.getPassword()%>"
                               required>
                    </div>

                    <!-- Country -->
                    <div class="form-group">
                        <label>Country</label>
                        <input type="text" name="country" class="form-control" value="<%=user.getCountry()%>" required>
                    </div>

                    <!-- Street Address -->
                    <div class="form-group">
                        <label>Street Address</label>
                        <input type="text" name="street_address" class="form-control"
                               value="<%=user.getStreetAddress()%>" required>
                    </div>

                    <!-- Apartment -->
                    <div class="form-group">
                        <label>Apartment</label>
                        <input type="text" name="apartment" class="form-control" value="<%=user.getApartment()%>">
                    </div>

                    <!-- City -->
                    <div class="form-group">
                        <label>City</label>
                        <input type="text" name="city" class="form-control" value="<%=user.getCity()%>" required>
                    </div>

                    <!-- Postcode -->
                    <div class="form-group">
                        <label>Postcode</label>
                        <input type="text" name="postcode" class="form-control" value="<%=user.getPostcode()%>"
                               required>
                    </div>

                    <!-- Phone -->
                    <div class="form-group">
                        <label>Phone</label>
                        <input type="text" name="phone" class="form-control" value="<%=user.getPhone()%>">
                    </div>

                    <!-- Role -->
                    <div class="form-group">
                        <label>User role:</label>
                        <select name="role_name" class="form-control" required>
                            <% if (user.getRole().equals("Admin")) {%>
                            <option value="Admin" selected>Admin</option>
                            <option value="Customer">Customer</option>
                            <% } else { %>
                            <option value="Admin">Admin</option>
                            <option value="Customer" selected>Customer</option>
                            <%}%>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-info" value="Save">
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Delete Modal HTML -->
<div id="deleteUserModal_<%=user.getId()%>" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="admin-users" method="get">
                <input type="hidden" name="command" value="DELETE">
                <input type="hidden" name="userID" value="<%=user.getId()%>">
                <div class="modal-header">
                    <h4 class="modal-title">Delete User</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete these Records?</p>
                    <p class="text-warning"><small>This action cannot be undone.</small></p>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-danger" value="Delete">
                </div>
            </form>
        </div>
    </div>
</div>
<% } %>
<% } %>
</body>
</html>