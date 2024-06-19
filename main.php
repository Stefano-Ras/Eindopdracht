<html>
    <body>
        <div>
            <form action="main.php" method="get">
                <?php
                    include("connect.php");
                    $conn = new mysqli("localhost", "root", "", "recipe");
                    if ($conn->connect_error) {
                        # Display an error mesage if the connection fails
                        die("Connection failed: " . $conn->connect_error);
                    }?>
                <!--?php*
                    $region = $conn->prepare("SELECT * FROM region");
                    $region = $conn->prepare("INSERT INTO region (Name, Description) VALUES (?, ?, ?)");
                    $region->bind_param("userregion", $Name, $Description);

                    file_put_contents("./recipe.json", json_encode($region));
                    //SELECT * FROM region WHERE Name = filtered name
                    $regionResult = $db("SELECT DISTINCT Region FROM Recipe ORDER BY Name ASC");
                    //$sql = "SELECT * FROM region;";
                    ?>
                -->
                    <!-- <div class="search-box">
                        <select id="region" name="region[]">
                            <option value="0" selected="selected">Select region</option>
                            <x?php
                                if (! empty($regionResult)) {
                                     foreach ($regionResult as $key => $value) {
                                         echo '<option value="' . $regionResult[$key]['Region'] . '">' . $regionResult[$key]['Region'] . '</option>';
                                     }
                                 }
                            ?>
                        </select>
                        <button id="filter">Search</button>
                    </div> -->
                <?php
                    if(isset($_GET["selectRegion"])) {
                        $regionId = $_GET["selectRegion"];
                    } else {
                        $regionId = 0;
                    }

                    $stmt = $conn->prepare("INSERT INTO region (ID, Name, Description) VALUES (?, ?, ?)");
                    $stmt->bind_param("iss", $ID, $Name, $Description);
                    
                    $sql = "SELECT * FROM region;";
                    $result = $conn->query($sql);
                    $result1 = $conn->query($sql);
                    $resultCheck = mysqli_num_rows($result);
                    if($resultCheck > 0) {
                        echo "<select class='selection' name='selectRegion'>";
                        while($row = $result->fetch_assoc()) {
                            echo "<option value='$row[ID]'";
                            echo $row['ID'] == $regionId ? " selected" : "";
                            echo ">" . $row['Name'] . "</option>";
                        }
                        echo "</select>";
                        echo "<input type='submit' value='submit'>";
                       /*  while($row1 = $result1->fetch_assoc()) {
                            echo $row1['Description'] . "<br/><hr/>";
                        } */
                    }

                    $stmt = $conn->prepare("SELECT * FROM recipe JOIN region ON recipe.regionId = region.ID WHERE regionId = ?");
                    $stmt->bind_param("i", $regionId);
                    $stmt->execute();
                    $resultRecipe = $stmt->get_result();
                    print_r($resultRecipe);
                    $resultCheckRecipe = mysqli_num_rows($resultRecipe);
                    if($resultCheckRecipe > 0) {
                        while($row = mysqli_fetch_assoc($resultRecipe)) {
                            echo "<span='title'>" . $row['Name'] . "</span><br><br>" . $row['Description'] . "<br><br>" . $row['Life_Story'] . "<br><br>" . $row['Instructions'] . "<br><hr/>";
                        }
                    }
                    
                    $sqlIngredients = "SELECT * FROM ingredients;";
                    $resultIngredients = mysqli_query($conn, $sqlIngredients);
                    $resultCheckIngredients = mysqli_num_rows($resultIngredients);
                    if($resultCheckIngredients > 0) {
                        while($row = mysqli_fetch_assoc($resultIngredients)) {
                            echo $row['Amount'] . " " . $row['Unit'] . " " . $row['Name'] . "<br><br>";
                        }
                    }
                ?>
            </form>
        </div>
    </body>
</html>
<?php
    $conn->close();
?>
<style>
    body {
        font-family: Helvetica, Arial, sans-serif;
        width: 70%;
        margin-top: 25px;
        margin-left: auto;
        margin-right: auto;
        margin-bottom: 25px;
    }

    .selection {
        width: 250px;
        height: 30px;
        display: block;
        font-size: 20px;
        text-align: center;
        margin: 0 auto 25px auto;
    }

    .title {
        text-align: center;
    }

    hr {
        margin: 25px 0;
        opacity: 25%;
    }
</style>