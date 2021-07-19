<?php ob_start(); ?>
<?php session_start(); ?>
<?php include "./templates/db.php"; ?>
<?php 
	if (isset($_GET['notification_id']) && isset($_GET['type']) && isset($_SESSION['username'])) {
		$notification_id = $_GET['notification_id'];
		$type = $_GET['type'];
		$query = "SELECT * FROM notification WHERE notification_id = ".$notification_id;
		$query_result = mysqli_query($connection,$query);
		if(!$query_result){
            die("QUERY FAILED ".mysqli_error($connection));
        }else{
			$row =  mysqli_fetch_assoc($query_result);
			$buyer_username = $row['buyer_name'];
			$seller_username = $row['username'];
		}
        $contactQuery1 = "SELECT contact_no FROM contacts WHERE username = '{$seller_username}'";
        $contacts_set1 = mysqli_query($connection, $contactQuery1);
        if(!$contacts_set1){
                die("QUERY FAILED ".mysqli_error($connection));
            }else{
                    $contact_row1 = mysqli_fetch_assoc($contacts_set1); 
                    $contactNo1 = $contact_row1['contact_no'];  
            } 
		switch($type){
            case "acceptOrder":
                $query = "UPDATE notification SET offer_status = 'accepted' WHERE notification_id = {$notification_id}";
                $message = "{$seller_username} has accepted your order,Seller Contact No: {$contactNo1}";
                $reply_query = "INSERT INTO notification(username,message,status,buyer_name,offer_status,date) VALUES('$buyer_username','$message','Unseen','$seller_username','reply',now())";


                $mail_query = "SELECT email FROM users WHERE username = '{$buyer_username}'";
                $mail_query_result = mysqli_query($connection,$mail_query);
                if(!$mail_query_result){
                    die('QUERY FAILED '.mysqli_error($connection));
                }else{
                    $row = mysqli_fetch_assoc($mail_query_result);
                    $email = $row['email'];
                }
                $message = wordwrap($message);
                $subject = "Offer accepted";
                mail($email, $subject, $message); 
                break;

            case "declineOrder":
                $query = "UPDATE notification SET offer_status = 'rejected' WHERE notification_id = {$notification_id}";
                $message = "{$seller_username} has rejected your order";
                $reply_query = "INSERT INTO notification(username,message,status,buyer_name,offer_status,date) VALUES('$buyer_username','$message','Unseen','$seller_username','reply',now())";

                $mail_query = "SELECT email FROM users WHERE username = '{$buyer_username}'";
                $mail_query_result = mysqli_query($connection,$mail_query);
                if(!$mail_query_result){
                    die('QUERY FAILED '.mysqli_error($connection));
                }else{
                    $row = mysqli_fetch_assoc($mail_query_result);
                    $email = $row['email'];
                }
                $message = wordwrap($message);
                $subject = "Offer rejected";
                mail($email, $subject, $message); 
                break;
            default:
                $query = null;
                $reply_query = null;
                break;
        }
        
        
        if($query != null && $reply_query != null){
            $query_result = mysqli_query($connection,$query); 
            if(!$query_result){
                die("QUERY FAILED ".mysqli_error($connection));
            }else{
                echo "update success";
            }
            $query_result = mysqli_query($connection,$reply_query); 
            if(!$query_result){
                die("QUERY FAILED ".mysqli_error($connection));
            }else{
                echo "Reply success";
            }
        }
	}
?>