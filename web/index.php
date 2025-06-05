<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Welcome to EC2</title>
  <style>
    /* Reset some basics */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      background: linear-gradient(135deg, #667eea, #764ba2);
      color: #fff;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
      padding: 20px;
    }

    .container {
      background: rgba(255, 255, 255, 0.15);
      border-radius: 15px;
      padding: 40px 60px;
      box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
      max-width: 400px;
      width: 100%;
    }

    h1 {
      font-size: 2.5rem;
      margin-bottom: 20px;
      text-shadow: 0 2px 8px rgba(0,0,0,0.3);
    }

    p {
      font-size: 1.2rem;
      margin-bottom: 10px;
      letter-spacing: 1px;
      font-weight: 500;
    }

    .timestamp {
      font-style: italic;
      font-size: 1rem;
      color: #e0e0e0;
    }

    @media (max-width: 480px) {
      .container {
        padding: 30px 20px;
      }
      h1 {
        font-size: 2rem;
      }
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Welcome to your EC2 Instance!</h1>
    <p>This page was served on:</p>
    <p class="timestamp"><?= date('l, F j, Y, g:i:s A T'); ?></p>
  </div>
</body>
</html>
