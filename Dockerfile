# Gunakan image PHP dengan Apache
FROM php:8.2-apache

# Install ekstensi MySQLi dan PDO (Wajib untuk koneksi database yang kamu tanya sebelumnya)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Aktifkan mod_rewrite (Penting untuk framework modern atau .htaccess)
RUN a2enmod rewrite

# Copy semua file project ke dalam container
COPY . /var/www/html/

# Ubah kepemilikan folder agar Apache bisa baca/tulis
RUN chown -R www-data:www-data /var/www/html

# Ganti DocumentRoot jika pakai Laravel (opsional, hapus jika PHP native biasa)
# ENV APACHE_DOCUMENT_ROOT /var/www/html/public
# RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
# RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf

# Port yang digunakan Render biasanya 80 untuk container ini
EXPOSE 80
