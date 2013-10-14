Use Case

I want Alfresco to be able to authenticate on a Ldap server, secured with SSL.

Problem

Ldaps is a ldap service secured on SSL. So you need to accept the SSL certificate to use the service.

Solution

To do so in the java world, you need a java keystore which stores the certificates (and private keys too). This is a file usually stored in /etc/java/keystore.jks

Installation

You first need to get the SSL certificate of the ldaps service. You can get it through openssl command:

openssl s_client -connect YOUR_SERVER:YOUR_PORT -showcerts
Just copy the lines beetween -BEGIN- until -END- with these latter included into ldaps.crt for example. If you want a more automated procedure, just have a look to get-cert script which wraps "openssl s_client". You can then import it into your keystore:

keytool -import -alias ldaps -file ldaps.crt -keystore /etc/java/keystore.jks
Usage

Just launch Tomcat with the following option:

export JAVA_OPTS=$JAVA_OPTS' -Djavax.net.ssl.trustStore=/etc/java/keystore.jks'