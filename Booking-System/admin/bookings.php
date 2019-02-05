<?php include"includes/admin_header.php"; ?>

    <div id="wrapper">
        
        <!-- Navigation -->
        <?php include"includes/admin_navigation.php"; ?>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Welcome To Admin
                            <?php echo ucfirst($_SESSION['s_username']); ?>
                        </h1>


                        <?php 

                        if (isset($_GET['source'])) {
                            $source = $_GET['source'];
                        }
                        else {
                            $source = "";
                        }

                        switch ($source) {
                            case 'update_user':
                                include "includes/update_user.php";
                                break;

                            default: ?>

                                         

                <!-- Blog Search Well -->
                <div class="col-md-4">
                <?
                    $connection = mysqli_connect('localhost', 'root', '', 'pandha_bus');
                    if(isset($_POST['search'])) {
                        $searchKey = $_POST['search'];
                        $sql = "SELECT * FROM orders WHERE user_name  LIKE '%$searchKey%'";
                    } else {
                    $sql = "SELECT * FROM orders";
                    $searchKey = ""
                    }
                    $result = mysqli_query($connection, $sql);
                        
                ?>
                    <h4>Search Bookings</h4>
                    <form action="" method="post">

                            <input name="search" type="text" class="form-control" placeholder="Enter text here" value = "<?php $searchKey; ?>">
                            <button class="btn btn-primary" type="submit" style="margin-left: 130px; margin-top: 10px;">Search</button>
                        
                    </form>
                    <!-- /.input-group -->
                </div>
                <div class="well">
                     <hr>
                     <hr>
                     <hr>
                    </div>


                                <table class="table table-bordered table-hover"> 
                                <thead>
                                    <tr>
                                        <th>Order Id</th>
                                        <th>Bus Id</th>
                                        <th>User Id</th>
                                        <th>Username</th>
                                        <th>User age</th>
                                        <th>Route</th>
                                        <th>Date</th>
                                        <th>Cost</th>
                                        
                                    </tr>
                                </thead>

                                <tbody>
                                    
                                    <?php 

                                        $query = "SELECT *  FROM  orders";
                                        $select_users = mysqli_query($connection,$query);

                                        while($row = mysqli_fetch_assoc($select_users)) {
                                            $order_id = $row['order_id'];
                                            $bus_id = $row['bus_id'];
                                            $user_id = $row['user_id'];
                                            $user_name = $row['user_name'];
                                            $user_age = $row['user_age'];
                                            $source = $row['source'];
                                            $destination = $row['destination'];  
                                            $date = $row['date'];
                                            $cost = $row['cost'];                                      

                                     ?>
                                    <tr>
                                        <td><?php echo $order_id ?></td>
                                        <td><?php echo $bus_id ?></td>
                                        <td><?php echo $user_id ?></td>
                                        <td><?php echo $user_name ?></td>
                                        <td><?php echo $user_age ?></td>
                                        <td><?php echo $source . " To ". $destination?></td>
                                        <td><?php echo $date ?></td>
                                        <td><?php echo $cost ?></td>
                                        
                                        <?php echo "<td><a href='users.php?delete=$order_id'>Cancel</a></td>"; ?>
                                         
                                    </tr>
                                    <?php } ?>
                                </tbody>
                                </table>                                
                                <?php
                                break;
                        }
                        // if ($source = 'add_bus') {
                        //        include "includes/add_bus.php";   
                        // }
                        // elseif ($source = '') {
                        //     
                        // }   
                      
                    

                        if (isset($_GET['delete'])) {
                            
                            $order_idd = $_GET['delete'];
                            // echo "$bus_idd";
                            $query = "DELETE FROM orders WHERE order_id = {$order_idd} ";

                            $delete_query = mysqli_query($connection,$query);
                            
                            if(!$delete_query) {
                                die("Query Failed" . mysqli_error($connection));
                            }
                            header("Location : users.php");
                        }

                        ?>

                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

<?php include"includes/admin_footer.php"; ?>