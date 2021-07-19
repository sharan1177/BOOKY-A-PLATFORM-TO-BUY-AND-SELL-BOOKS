<?php
    function customPageHeader(){
        echo "<link rel='stylesheet' type='text/css' href='includes/css/users.css'>";
    }
?>
<?php include "./templates/admin-header.php"; ?>
<?php if(isset($_SESSION['username'])&&isset($_SESSION['user_role'])&&$_SESSION['user_role']=='admin'){ ?>
<?php include "./templates/admin-navigation.php"; ?>

<style type="text/css">
	.huge {
    	font-size: 48px;
	}	
	.arrow-right {
		font-size: 16px;
	}
	.chart {
	  width: 100%; 
	  min-height: 450px;
	}
	.row {
	  margin:0 !important;
	}
</style>

<div class="container">
<div id="wrapper">
	<div id="page-wrapper">
		<div class="row">
			<div class="col-sm-4">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="row">
							<div class="col-sm-3">
								<i class="fa fa-user fa-8x"></i>
							</div>
							<div class="col-sm-9 text-right">
								<?php  
									$count_users = "SELECT COUNT(*) as total FROM users";
									$users_result = mysqli_query($connection, $count_users);
									$users = mysqli_fetch_assoc($users_result)['total'];
								?>
								<div class="huge"><?php echo $users ?></div>
								<div>Users</div>
							</div>
						</div>
					</div>
					<a href="users.php">
						<div class="panel-footer">
							<div class="pull-left">
								View details
							</div>
							<div class="pull-right arrow-right">
								<i class="glyphicon glyphicon-circle-arrow-right"></i>							
							</div>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>

			<div class="col-sm-12 col-lg-4 col-md-4">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="row">
							<div class="col-sm-3">
								<i class="fa fa-book fa-8x"></i>
							</div>
							<div class="col-sm-9 text-right">
								<?php  
									$count_books = "SELECT COUNT(*) as total FROM books";
									$books_result = mysqli_query($connection, $count_books);
									$books = mysqli_fetch_assoc($books_result)['total'];
								?>
								<div class="huge"><?php echo $books ?></div>
								<div>Books</div>
							</div>
						</div>
					</div>
					<a href="books.php">
						<div class="panel-footer">
							<div class="pull-left">
								View details
							</div>
							<div class="pull-right arrow-right">
								<i class="glyphicon glyphicon-circle-arrow-right"></i>							
							</div>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>

			<div class="col-sm-4">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="row">
							<div class="col-sm-3">
								<i class="glyphicon glyphicon-transfer" style="font-size: 8em;"></i>
							</div>
							<div class="col-sm-9 text-right">
								<?php  
									$count_orders = "SELECT COUNT(*) as total FROM buyers";
									$orders_result = mysqli_query($connection, $count_orders);
									$orders = mysqli_fetch_assoc($orders_result)['total'];
								?>
								<div class="huge"><?php echo $orders ?></div>
								<div>Purchases</div>
							</div>
						</div>
					</div>
					<a href="transactions.php">
						<div class="panel-footer">
							<div class="pull-left">
								View details
							</div>
							<div class="pull-right arrow-right">
								<i class="glyphicon glyphicon-circle-arrow-right"></i>							
							</div>
							<div class="clearfix"></div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
</div> 
<?php include "templates/admin-footer.php"; ?>
<?php }else{
		header("Location: ../index.php");
	}  
?> 