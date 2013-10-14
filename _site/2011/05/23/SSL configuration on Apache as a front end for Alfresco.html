Use Case

I want to secure Alfresco (webdav) and Share Access through SSL.

Solution

The solution is to secure Alfresco access through Apache-SSL.

Why not directly use Tomcat SSL? Because I want to protect 2 tomcat instances and only make one SSL installation. Moreover, I need some Apache specific features like rewriting ones.

Only Apache access will be available so Alfresco will be available through ProxyPass features. Direct access is prohibited at the tomcat level.

Configuration

SSL CONFIGURATION

cd /etc/ssl
openssl genrsa -des3 -rand file1:file2:file3:file4:file5 -out server-with-passphrase.key 2048
openssl rsa -in server-with-passphrase.key -out server.pem
openssl req -new -key server.pem -out server.csr
openssl x509 -req -days 365 -in server.csr -signkey server.pem -out server.crt
SSL APACHE CONFIGURATION

You can then create the following configuration into your apache configuration file:

SSLEngine on
SSLCipherSuite ALL:!ADH:!EXPORT56:RC4+RSA:+HIGH:+MEDIUM:+LOW:+SSLv2:+EXP:+eNULL
SSLCertificateFile /etc/ssl/certs-specific/gollum.bluexml.com.crt
SSLCertificateKeyFile  /etc/ssl/private/gollum.bluexml.com.pem
PROXYPASS APACHE CONFIGURATION

Don't forget to activate proxy_http module:

a2enmod proxy_http
You can then create the following configuration into your apache configuration file:

    <Proxy *>
      AddDefaultCharset Off
      Order deny,allow
      Allow from all
    </Proxy>

    ProxyPass /share http://localhost:8080/share
    ProxyPassReverse /share http://localhost:8080/share
    ProxyPass /alfresco http://localhost:8080/alfresco
    ProxyPassReverse /alfresco http://localhost:8080/alfresco
Resources

1: http://slacksite.com/apache/certifi...