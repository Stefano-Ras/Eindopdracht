<html>
    <body style="width:75%;margin-top:25px;margin-bottom:25px;margin-left:auto;margin-right:auto;">
        <div>
            <form action="" method="post">
                <?php
                    include("connect.php");
                    
    
                    $conn = new mysqli("localhost", "root", "", "recipe");
                    if ($conn->connect_error) {
                        # Display an error mesage if the connection fails
                        die("Connection failed: " . $conn->connect_error);
                    }
                    $sql = "SELECT * FROM region;";
                    $result = $conn->query($sql);
                    $resultCheck = mysqli_num_rows($result);
                    if($resultCheck > 0) {
                        echo "<select>";
                        while($row = $result->fetch_assoc()) {
                            echo "<option>" . $row['Name'] . "</option>";
                        }
                        echo "</select>";

                        while($row = $result->fetch_assoc()) {
                            echo "<div>" . $row['Description'] . "</div><br><br>";
                        }
                    }
                    
                ?>
            </form>
        </div>
    </body>
</html>