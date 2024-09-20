<h1>Building a Website Blog in Azure WebApp: Step-by-Step Guide </h1>

In this tutorial, I'll walk you through the steps I took to create a fully functional website blog deployed on Azure WebApp. Throughout this process, I sharpened my skills in HTML, CSS, and gained hands-on experience with web servers, specifically NGINX. One of the most significant challenges I faced was configuring a custom domain using DNS, which required me to bind the domain to the Azure WebApp and ensure secure communication by opening an SSH connection to configure the web server.

I also installed Git to clone my repository, and set up the NGINX configuration through the sites-available/default file to direct traffic properly. Once the configurations were in place, I restarted the NGINX service to apply the changes. To streamline the startup process, I used a bash script (.sh) as a startup command to automate certain tasks.

This tutorial combines both the technical setup and problem-solving skills that helped me overcome various challenges, ensuring a smooth deployment process from code to live website.

<h2>Create App Services</h2>

1. Log in to Azure Portal
Visit the Azure Portal and log in using your Azure account credentials.
2. Navigate to App Services
In the Azure Portal, use the search bar at the top and type "App Services."
Click on App Services from the search results.
3. Create New App Service
On the App Services page, click the + Create button (or + Add if applicable).
This will open the "Create Web App" wizard.
![create](img/10AppServices.png)
5. Configure Basic Settings
Subscription: Choose your Azure subscription.
Resource Group: Either select an existing resource group or create a new one.
Name: Enter a unique name for your app service (this will be part of your app's URL, e.g., myapp.azurewebsites.net).
Publish: Choose either Code (for typical web apps) or Docker (if you're using Docker containers).
Runtime stack: Select the programming language and version you want to use (e.g., .NET, Node.js, PHP, Python, Java). In this case I will use PHP 8.2, when you deploy a PHP application to Azure App Service with PHP 8.x or later, it's likely being served by NGINX by default
Region: Select the geographic region where you want your app to be hosted.
![pricing](img/11AppServices.png)
7. Select Basic Pricing Tier (B1)
Plan: Under the App Service Plan section, either select an existing plan or create a new one.
Pricing Tier: Click on Change Size and choose the Basic B1 pricing tier, To bind a custom domain to an Azure App Service, you’ll need at least the Basic B1 pricing tier.
Click Apply to confirm your selection.
![create](img/12AppServices.png)
8. Configure Deployment Settings (Optional)
If you want, you can configure continuous deployment using GitHub, Bitbucket, Azure Repos, etc. Otherwise, you can skip this step for manual deployment which is what we are going to do in this guide.
9. Review and Create
Review all your settings and make sure everything is configured correctly.
Click the Create button at the bottom of the page.

10. Deployment Process
Azure will now deploy the App Service, which can take a couple of minutes. You can monitor the progress in the Notifications area at the top of the portal.
</br>

<h2>Bind a Custom Domain</h2>

</br>
Prepare Your Domain:

Ensure that you have access to a domain name (through providers like GoDaddy, Namecheap, etc.).
You’ll need to manage the DNS settings of your domain to point to your Azure App Service.
Add Custom Domain in Azure:
![add](img/13AppServices.png)
Once your App Service is on the Basic B1 plan or higher, in the App Service's settings, scroll down to the Settings section and click Custom domains.
Click Add custom domain at the top.
Verify Domain Ownership:

Enter your domain: 

Enter the custom domain you want to bind (e.g., mydomain.com).
</br>
![manage](img/14Domain.png)
</br>
Verify ownership: Azure will ask you to verify ownership of the domain. You can verify in two ways:
</br>
CNAME Record: Set a CNAME record in your domain's DNS settings to point to the default Azure App Service URL (your-app-name.azurewebsites.net).
</br>
<b>Azure recommends using CNAME records to map a custom domain (like www.maindomain.com) to an Azure Web App URL (yourapp.azurewebsites.net)</b>
</br>
TXT Record: Add a TXT record in your DNS settings to prove ownership.
</br>
Or/and
</br>
A Record: If using the root domain (e.g., mydomain.com), set an A record pointing to your App Service’s IP address, which can be found in the Custom domains settings.
</br>
TXT Record: Add a TXT record in your DNS settings to prove ownership.
</br></br>
![add](img/15Domain.png)
</br>
![validate](img/16Domain.png)
![validate](img/16Domain2.png)

</br>

Once you've added the required DNS records, click Verify in Azure to confirm ownership.

Configure A and/or CNAME Record:

After verifying ownership, configure either an A Record or a CNAME Record in your domain's DNS settings to bind the domain to your App Service:
CNAME: If using a subdomain (e.g., www.mydomain.com), set the CNAME record to point to your App Service’s default URL (your-app-name.azurewebsites.net).
A Record: If using the root domain (e.g., mydomain.com), set an A record pointing to your App Service’s IP address, which can be found in the Custom domains settings.

In seconds azure will bind the certificate and allow https  
![rready](img/16Web.png)

<h2>SSH Manual Deployment</h2>



- HTTP Methods Report:

Create a report showing a table of the different HTTP methods (GET, POST, HEAD, etc.).

This will provide insight into the type of HTTP activity being requested against their web server.

`source="apache_logs.txt" | top method`

![Method](Pictures/apache/1Method_Apache.png)


<b><h3>------------------Alerts------------------</h3></b>
