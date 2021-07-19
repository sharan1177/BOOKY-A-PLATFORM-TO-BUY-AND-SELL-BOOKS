<?php include "./db.php"; ?>
<?php

    if(isset($_GET['search_key'])){
        $search_key = $_GET['search_key'];
        
        $query = "SELECT DISTINCT book_name from books WHERE book_name LIKE '%{$search_key}%'";

        $query_result = mysqli_query($connection,$query);

        $result = array();

        while($row = mysqli_fetch_assoc($query_result)){
            $result[] = $row['book_name'];
        }    


        $myJSON = json_encode($result);
        echo $myJSON;
        
    }
?>