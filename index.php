<?php
    include_once 'connection.php';
?>
<html>
<body>
    <h1>Formulário de Cadastro</h1>
    <form action="index.php" method="post" name="cadastro">
        <div class="form">
            <div class="Usuário">
                <span>Usuário:</span>
                <input type="text" name="Usuário" id="Usuário">
            </div>
            <div class="E-mail">
            <span>E-mail:</span>
                <input type="text" name="E-mail" id="E-mail">
            </div>
            <div class="Senha">
            <span>Senha:</span>
                <input type="text" name="Senha" id="Senha">
            </div>
            <div class="Confirmar Senha">
            <span>Confirmar Senha:</span>
                <input type="text" name="Confirmar Senha" id="Confirmar Senha">
            <input type="submit" value="Enviar">
        </div>
    </form>
    
    <?php
        if(isset($_POST['cadastro'])) {
            $name = mysqli_real_escape_string($connection, $_POST['Usuário']);
            $email = mysqli_real_escape_string($connection, $_POST['E-mail']);
            $senha = mysqli_real_escape_string($connection, $_POST['Senha']);
            $confirmarSenha = mysqli_real_escape_string($connection, $_POST['Confirmar Senha']);

            $sql = "INSERT INTO usuario (Nome_Usuario, Email, Senha) VALUES ('$name', '$email', '$senha')";

            if(mysqli_query($connection, $sql)) {
                echo 'Success!';
            } else {
                echo 'Error! Could not able to execute $sql' . mysqli_error($connection);
            }
        }

        mysqli_close($connection);
    ?>

</body>
</html>