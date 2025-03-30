# Inception

![GitHub repo size](https://img.shields.io/github/repo-size/redadoo/Inception)
![GitHub contributors](https://img.shields.io/github/contributors/redadoo/Inception)
![GitHub stars](https://img.shields.io/github/stars/redadoo/Inception?style=social)
![GitHub forks](https://img.shields.io/github/forks/redadoo/Inception?style=social)

## Description

**Inception** is a project from the 42 school's Common Core curriculum designed to broaden your knowledge of system administration using Docker. The primary goal is to virtualize various services by creating an infrastructure composed of Docker containers for Nginx, WordPress, and MariaDB.

## Project Structure

- **Nginx**: Configured as a web server to serve static content and as a reverse proxy for requests directed to WordPress.
- **WordPress with PHP-FPM**: Manages dynamic content and processes PHP scripts.
- **MariaDB**: Database management system for storing WordPress data, including posts, comments, and user information.

## Key Features

- Implementation of a Docker network to facilitate communication between containers.
- Use of Docker volumes for data persistence.
- Configuration of SSL certificates for Nginx to ensure secure connections.

## Installation

1. Ensure Docker and Docker Compose are installed on your system.
2. Clone this repository:

   ```sh
   git clone https://github.com/redadoo/Inception.git
   ```
3. Navigate into the project directory:
   ```sh
   Inception/
   ```
4. Build and start the Docker containers:
   ```sh
   make all
   ```
5. Visit wordpress site on:
   [site](https://localhost:443)
   
  
