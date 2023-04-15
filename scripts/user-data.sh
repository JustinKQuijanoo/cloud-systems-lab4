#!/bin/bash
###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 4
###

# install apache webserver  
sudo yum install httpd -y

# create index.html file 
cd /var/www/html

tee -a /var/www/html/index.html << END
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Stay Hydrated</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">
    <style> 
        body {
    font-family: sans-serif;
    margin: 0;
    padding: 0;
  }
  
  a {
    color: #0066CC;
    text-decoration: none;
  }
  
  ul, ol {
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  h1, h2, h3, h4, h5, h6 {
    margin: 0;
    padding: 0;
    font-weight: normal;
  }
  
  button {
    font-family: sans-serif;
  }

  
  
  /*

  /* Header Styles */
.header {
    background-color: #FFFFFF;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 999;
  }
  
  .header-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 16px;
    max-width: 1200px;
    margin: 0 auto;
  }
  
  .logo {
    font-size: 24px;
    font-weight: bold;
    color: #000000;
  }
  
  .nav ul {
    display: flex;
    justify-content: flex-end;
  }
  
  .nav li {
    margin-left: 16px;
  }
  
  .nav a {
    color: #000000;
    font-size: 16px;
    font-weight: bold;
    text-transform: uppercase;
    padding: 8px 12px;
    border-radius: 4px;
    transition: background-color 0.2s ease-in-out;
  }
  
  .nav a:hover {
    background-color: #0066CC;
    color: #FFFFFF;
  }

  .photo {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
  }

  p {
    text-align: center;
  }
    </style>
  </head>
  <body>
    <header class="header">
        <div class="header-container">
          <a href="#" class="logo">Stay Hydrated</a>
          <nav class="nav">
            <ul>
              <li><a href="#">Home</a></li>
              <li><a href="#">Benefits</a></li>
              <li><a href="#">Tips</a></li>
              <li><a href="#">Products</a></li>
              <li><a href="#">Contact</a></li>
            </ul>
          </nav>
        </div>
      </header>

    <main>
      
        <img src="https://cdn-images-1.medium.com/max/1200/1*r3hv6k1lH5RtKhP3wfnydg.png" alt="picture of hydrohomie" class="photo">
      
    </main>

    <footer>
      <p>&copy; 2023 Stay Hydrated</p>
      <p>Hello from Justin Quijano at $(hostname -f)</p>
    </footer>
  </body>
</html>
END

# restart and enable httpd service
systemctl restart httpd
systemctl enable httpd