<script>
	$(document).ready(function() {
	    $('#booksTable').DataTable();
	} );
</script>

<h3 class="text-center"><b><u>ALL BOOKS</u></b></h3>

<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 table-responsive">
		<table class="table table-bordered table-hover" id="booksTable">
			<thead>
				<tr>
					<th class="text-center">SellerName</th>
					<th class="text-center">BookName</th>
					<th class="text-center">Author</th>
					<th class="text-center">Edition</th>
					<th class="text-center">Subject</th>
					<th class="text-center">Price</th>
					<th class="text-center">OriginalPrice</th>
					<th></th>
				</tr>
			</thead>
			<tbody>

				<?php
					$query = "SELECT * from books";

					$query_result = mysqli_query($connection,$query);

					if(!$query_result){
						die("QUERY FAILED " .mysqli_error($connection));
					}else{
						while ($row = mysqli_fetch_assoc($query_result)) {
							$bookid = $row['book_id'];
							$sellername = $row['username'];
							$bookname = $row['book_name'];
							$author = $row['author'];
							$edition = $row['edition'];
							$subject = $row['subject'];
							$price = $row['book_price'];
							$originalprice = $row['book_original_price'];
				?>
							<tr>
								<td class="text-center"><?php echo $sellername ?></td>
								<td class="text-center"><?php echo $bookname ?></td>
								<td class="text-center"><?php echo $author ?></td>
								<td class="text-center"><?php echo $edition ?></td>
								<td class="text-center"><?php echo $subject ?></td>
								<td class="text-center"><?php echo $price ?></td>
								<td class="text-center"><?php echo $originalprice ?></td>
								<td class="text-center"><a href="view_more_books.php?bookid=<?php echo $bookid ?>" class="btn btn-primary">View More</a></td>
							</tr>
				<?php
						}

					}

				?>
			</tbody>						
		</table>
	</div>	
</div>