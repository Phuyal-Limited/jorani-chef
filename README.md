# learn_chef_httpd

Installs and configures Jorani.

Additional steps required to fully configure the app is below:

apt-get install mysql-server
CREATE DATABASE IF NOT EXISTS lms;

use lms;

source /var/www/html/jorani/sql/lms.sql;

CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON lms.* TO 'newuser'@'localhost';
FLUSH PRIVILEGES;

exit

nano /var/www/html/jorani/application/config/database.php
