<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Process Data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            padding: 20px;
        }
        fieldset {
            background-color: #dbe0fa;
            border: 1px solid #7a82bb;
            padding: 15px 20px;
        }
        .field label {
            width: 120px;
            text-align: right;
            padding-right:12px;
            display: inline-block;
        }
        .field textarea {
            vertical-align: top;
        }
    </style>
</head>
<body>
    <h2>Register</h2>

<?php
$errors = array();
if (isset($_POST['submit'])){
    require 'validate.inc';
    validateName($errors, $_POST, 'surname');
    if ($errors){
        echo '<h3>Invalid, correct the following errors:</h3>';
        foreach ($errors as $field => $error){
            echo "$field $error<br/>";
        }
        include 'form.inc';
    }else{
        echo 'Form submitted successfully with no errors';
    }
}else{
    include 'form.inc';
}
?>

</body>
</html>
