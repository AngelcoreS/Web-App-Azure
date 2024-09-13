<h1>Building a Website Blog in Azure WebApp: Step-by-Step Guide </h1>

In this tutorial, I'll walk you through the steps I took to create a fully functional website blog deployed on Azure WebApp. Throughout this process, I sharpened my skills in HTML, CSS, and gained hands-on experience with web servers, specifically NGINX. One of the most significant challenges I faced was configuring a custom domain using DNS, which required me to bind the domain to the Azure WebApp and ensure secure communication by opening an SSH connection to configure the web server.

I also installed Git to clone my repository, and set up the NGINX configuration through the sites-available/default file to direct traffic properly. Once the configurations were in place, I restarted the NGINX service to apply the changes. To streamline the startup process, I used a bash script (.sh) as a startup command to automate certain tasks.

This tutorial combines both the technical setup and problem-solving skills that helped me overcome various challenges, ensuring a smooth deployment process from code to live website.

<h2>Load and Analyze Apache Logs</h2>

Next, Apache web server logs representing “regular” activity for VSI were uploaded and analyzed:

- Select the “Add Data” option within Splunk. Select the “Upload” option. Select the apache_logs.txt.

- After successful upload, “Start Searching” was selected and the time range set to “All Time.”

</br>

<b><h3>------------------Reports------------------</h3></b>

</br>

- HTTP Methods Report:

Create a report showing a table of the different HTTP methods (GET, POST, HEAD, etc.).

This will provide insight into the type of HTTP activity being requested against their web server.

`source="apache_logs.txt" | top method`

![Method](Pictures/apache/1Method_Apache.png)

- Top 10 Referring Domains Report:

Create a report showing the top 10 domains that refer to VSI’s website.

This will assist VSI with identifying suspicious referrers.

`source="apache_logs.txt" | top limit=10 referer_domain`

![Referer](Pictures/apache/2Referer_domain_apache.png)

- HTTP Response Codes Report:

Creat a report showing the count of each HTTP response code.

This will provide insight into any suspicious levels of HTTP responses.

![Status](Pictures/apache/3Status_code_apache.png)

</br>

<b><h3>------------------Alerts------------------</h3></b>
