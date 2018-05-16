# README

  server use memcached to cache capthca which using rucapcha

* apt-get install memcached

  imagemagick for image upload

* apt-get install imagemagick

  use nginx serve static public files

* location /public/uploads/ {
*   try_files $uri /public/uploads/default.png; 
* }
