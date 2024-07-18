<html>
    <body>
        <div>
            <form action="main.php" method="get">
                <?php
                    include("connect.php");
                    
                    $dbconn = new DbConnect();
                    $conn = $dbconn->getDbConnect();

                    if(isset($_GET["selectRegion"])) {
                        $regionId = $_GET["selectRegion"];
                    } else {
                        $regionId = 0;
                    }
                    //Prepared statement binding class
                    $stmt = $conn->prepare("INSERT INTO region (ID, Name, Description) VALUES (?, ?, ?)");
                    $stmt->bind_param("iss", $ID, $Name, $Description);
                    //SQL query class
                    class prepareStatement{
                        function getPrepareStatement() {
                        }
                    }

                    $sql = "SELECT * FROM region;";
                    $result = $conn->query($sql);
                    $resultCheck = mysqli_num_rows($result);
                    if($resultCheck > 0) {
                        echo "<select class='selection' name='selectRegion'>";
                        while($row = $result->fetch_assoc()) {
                            echo "<option value='$row[ID]'";
                            echo $row['ID'] == $regionId ? " selected" : "";
                            echo ">" . $row['Name'] . "</option>";
                        }
                        echo "</select>";
                        echo "<input type='submit' value='Submit' class='submit'>";
                    }

                    $stmt = $conn->prepare
                        ("SELECT region.Description AS regionDescription, recipe.Name, recipe.Description
                        AS recipeDescription, recipe.Instructions, recipe.Life_Story,
                        ingredientlist.Ingredients AS ingredientList
                        FROM ingredientlist JOIN recipe ON ingredientlist.recipeId = recipe.ID
                        JOIN region ON recipe.regionId = region.ID
                        WHERE regionId = ?");
                    $stmt->bind_param("i", $regionId);
                    $stmt->execute();
                    $resultRecipe = $stmt->get_result();
                    $resultCheckRecipe = mysqli_num_rows($resultRecipe);
                    if($resultCheckRecipe > 0) {
                        $recipes = [];
                        while($row = mysqli_fetch_assoc($resultRecipe)) {
                            $recipes[] = $row;
                        }

                        echo '<p class="description">' . $recipes[0]['regionDescription'] . '</p><hr>';

                        foreach ($recipes as $recipe) {
                            echo "<span class='title'>" . $recipe['Name'] . "</span><br><br>" . $recipe['recipeDescription'] . "<br><br>" . $recipe['Life_Story'] . "<br><br>" . $recipe['ingredientList'] . "<br><br>" . $recipe['Instructions'] . "<br><hr/>";
                        }
                    print_r($conn);
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

    .submit {
        width: 250px;
        height: 30px;
        display: block;
        font-size: 20px;
        text-align: center;
        margin: 0 auto 25px auto;
    }

    .title, .description {
        text-align: center;
    }

    hr {
        margin: 25px 0;
        opacity: 25%;
    }
</style>