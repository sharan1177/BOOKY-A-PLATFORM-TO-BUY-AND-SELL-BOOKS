<script>
	$(document).ready(function() {
	    $('#reviewTable').DataTable();
	} );
</script>

<h3 class="text-center"><b><u>ALL REVIEWS</u></b></h3>
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 table-responsive">
		<table class="table table-bordered table-hover" id="reviewTable">
			<thead>
				<tr>
					<th class="text-center" onclick="sortTable(0)">BookId</th>
					<th class="text-center" onclick="sortTable(1)">Username</th>
					<th class="text-center" onclick="sortTable(2)">BookName</th>
					<th class="text-center" onclick="sortTable(3)">Ratings</th>
					<th class="text-center" onclick="sortTable(4)">Review</th>
				</tr>
			</thead>
			<tbody>

				<?php
					$query = "SELECT * from reviews";

					$query_result = mysqli_query($connection,$query);

					if(!$query_result){
						die("QUERY FAILED " .mysqli_error($connection));
					}else{
						while ($row = mysqli_fetch_assoc($query_result)) {
							$bookid = $row['book_id'];
							$username = $row['username'];
							$ratings = $row['ratings'];
							$review = $row['review_content'];
							
							$bookquery = "SELECT * FROM books WHERE book_id={$bookid}";
							$bookquery_result = mysqli_query($connection, $bookquery);
							if(!$bookquery_result){
								die("QUERY FAILED " .mysqli_error($connection));
							}else{	
								$bookrow = mysqli_fetch_assoc($bookquery_result);
								$bookname = $bookrow['book_name'];	
							}
				?>
							<tr>
								<td class="text-center"><?php echo $bookid ?></td>
								<td class="text-center"><?php echo $username ?></td>
								<td class="text-center"><?php echo $bookname ?></td>
								<td class="text-center"><?php echo $ratings ?></td>
								<td id="content_<?php echo $bookid; ?>" class="text-center"><?php echo $review ?></td>
							</tr>
				<?php
						}
					}
				?>
			</tbody>						
		</table>
	</div>	
</div>

