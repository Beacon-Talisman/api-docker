mysqladmin -u root password gemini2
mysql -u root --password=gemini2 -e 'create database talisman'
bzcat api_dev.sql.bz2 |mysql -u root --password=gemini2 talisman