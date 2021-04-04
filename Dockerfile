FROM httpd
ADD lesson2.html /usr/local/apache2/htdocs
CMD ["httpd-foreground"]