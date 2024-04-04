<?php
session_start();

?>

<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Pooling home page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
            height: 100vh;
            background-color: pink;
        }

        header {
            background-color: #007bff;
            padding: 20px;
            text-align: center;
        }

        header a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
        }

        header a:hover {
            color: #ccc;
        }

        main {
            padding: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            max-width: 400px;
            margin: 0 auto;
            
        }

        label {
            margin-bottom: 5px;
        }

        h1{
            color: white;
        }

        input[type="text"],
        input[type="date"],
        input[type="number"] {
            margin-bottom: 15px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
            
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            padding: 8px;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: #ff0000;
            margin-top: 8px;
            font-size: 14px;
        }

        img {
            width: 40%;
            height: 40%;
            margin-top: 25px;
        }

        .immagine_principale {
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>

<body>
    <header>

        <?php if (!isset($_SESSION['username'])): ?>
            <h1>Accedi o registrati su Car Pooling</h1>
            <nav>
                <a href="static/pages/area_riservata/login.html">Accedi</a>
                <a href="static/pages/area_riservata/registrazione.html">Registrati</a>

            </nav>

            <div class="immagine_principale">
                <img src="https://st3.depositphotos.com/6751976/14041/v/950/depositphotos_140411090-stock-illustration-funny-blue-car-with-eyes.jpg"
                    alt="immagine macchina">

            </div>
        <?php else: ?>
            <h1>Benvenuto su Car Pooling</h1>
            <a href="static/pages/area_riservata/logout.php">Logout</a>

            <a href="static/pages/area_riservata/inserisciRecensioni.html">Inserisci recensione</a>
            <a href="static/pages/area_riservata/visualizzaRecensioni.php">Visualizza recensioni</a>
            <a href="static/pages/area_riservata/pubblicaViaggio.php">Pubblica passaggio</a>
            <a href="static/pages/newsletter.php">Newsletter</a>
            <a href="static/pages/chiSiamo.php">Chi Siamo</a>
        </header>
        <main>

            <form action="static/pages/area_riservata/ricercaViaggio.php" method="post">
                <label for="partenza">Partenza</label>
                <input type="text" name="partenza" id="partenza" required>
                <label for="arrivo">Arrivo</label>
                <input type="text" name="arrivo" id="arrivo" required>

                <label for="data">Data</label>
                <input type="date" name="data" id="data" required>
                <label for="passeggeri">Numero passeggeri</label>
                <input type="number" name="passeggeri" id="passeggeri" required>
                <input type="submit" value="cerca">
            </form>

        </main>
    <?php endif; ?>







    <footer>
        <p>&copy; 2024 Car Pooling</p>
    </footer>
</body>

</html>