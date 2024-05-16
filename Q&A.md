<h1>Web Development Questions</h1>

- When creating your web app, you selected a runtime stack. What was it? Does it work on the front end or the back end?

The runtime stack selected was PHP 8.2. The runtime stack is the software responsible for installing your web service's code, its dependencies, and running your service. It works on the back end.

- Inside the /var/www/html directory, there was another directory called assets. Explain what was inside that directory.

Inside the assets directory, there are two other directories: images and css. The images directory contains images for the HTML file, and the css directory contains the stylesheet (.css) for laying out and structuring web pages.

- Consider your response to the above question. Does this work with the front end or back end?

This works with the front end. These directories contain HTML and CSS, which are the heart of the web application where users interact directly.

<h2>Cloud Questions</h2>

- What is a cloud tenant?

A cloud tenant is an individual or an organization that utilizes the services and resources provided by a cloud computing provider, including but not limited to SaaS (Software as a Service), PaaS (Platform as a Service), and DaaS/DBaaS (Data as a Service/Database as a Service).

- Why would an access policy be important on a key vault?

An access policy is important because it offers a secure way to access secrets, certificates, and keys with authorized users or applications.

- Within the key vault, what are the differences between keys, secrets, and certificates?

Secrets: Sensitive data that needs to be stored securely.
Keys: Used to encrypt and decrypt data, supporting multiple key types and algorithms.
Certificates: Used in securing communication over the internet.

https://learn.microsoft.com/en-us/azure/key-vault/general/about-keys-secrets-certificates

<h3>Cryptography Questions</h3>

- What are the advantages of a self-signed certificate?

Free
Encrypts incoming and outgoing data with the same ciphers as any other paid SSL certificate

https://sectigostore.com/page/what-is-a-self-signed-certificate/

- What are the disadvantages of a self-signed certificate?

Browsers do not trust self-signed certificates and may show HTTPS in front of the domain name, causing warning pages to pop up and reduce traffic as users don’t trust them.
It’s easy for attackers to make self-signed certificates and perform MitM attacks.
- What is a wildcard certificate?

A wildcard certificate is a single certificate with a wildcard character in the sub-domain to secure multiple sub-domains pertaining to the same base domain (e.g., *.domainname.com).

- When binding a certificate to your website, Azure only provides TLS versions 1.0, 1.1, and 1.2. Explain why SSL 3.0 isn’t provided.

SSL 3.0 has a vulnerability that could allow an attacker to decrypt information.

- Is your browser returning an error for your SSL certificate? Why or why not?
  
No, because Azure’s cloud service provides a secure SSL certificate.

- What is the validity of your certificate (date range)?

Issued On: Thursday, January 25, 2024, at 6:00:00 PM

Expires On: Friday, July 26, 2024, at 6:59:59 PM

- Do you have an intermediate certificate? If so, what is it?
  
Yes, GeoTrust Global TLS

- Do you have a root certificate? If so, what is it?
  
Yes, DigiCert Global Root CA

- Does your browser have the root certificate in its root store?
  
Yes

- List one other root CA in your browser’s root store.
  
AAA Certificate Services

<h4>Cloud Security Questions</h4>

- What are the similarities and differences between Azure Web Application Gateway and Azure Front Door?

Both are load balancers, but they have different goals. Front Door is a global service that can distribute requests across regions, while Application Gateway is a regional service.

- A feature of the Web Application Gateway and Front Door is “SSL Offloading.” What is SSL offloading? What are its benefits?

SSL offloading is a cryptographic procedure that secures communications over the internet and requires CPU resources. SSL offloading means that all HTTPS traffic is decrypted on the Load Balancer and passed to the backend servers in plain HTTP. This process completes the handshaking quicker than the web server.

https://www.appviewx.com/blogs/the-benefits-of-offloading-ssl-certs-on-f5-devices-and-how-to-automate-it/

- What OSI layer does a WAF work on?

Layer 7

https://www.cloudflare.com/learning/ddos/glossary/web-application-firewall-waf/#:~:text=A%20WAF%20is%20a%20protocol,against%20all%20types%20of%20attacks

- Select one of the WAF managed rules (e.g., directory traversal, SQL injection, etc.), and define it.

SQL injection is a technique used to manipulate data from SQL databases by inserting a piece of code into an entry field.

https://www.cloudflare.com/learning/security/threats/sql-injection/

- Consider the rule that you selected. Could your website (as it is currently designed) be impacted by this vulnerability if Front Door wasn’t enabled? Why or why not?

No, if the website doesn't interact with any database or doesn't have any input fields that can be exploited for SQL injection, it is unlikely to be vulnerable to this kind of attack. However, it is always good practice to have security measures in place.

- Hypothetically, say that you create a custom WAF rule to block all traffic from Canada. Does that mean that anyone who resides in Canada would not be able to access your website? Why or why not?

No, because the WAF rule is blocking IP addresses originating from Canada. However, someone who resides in Canada could still access the website by using a VPN to bypass the custom WAF rule.
