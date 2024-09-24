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

While making your website accessible via both www and no-www versions can enhance user accessibility and flexibility, it introduces complexities that can affect SEO (search engine optimization), security, and maintenance efforts. To maximize benefits and minimize drawbacks, it's advisable to select a primary domain and ensure all traffic is redirected to it.

I do recommend to set both cname and A record to point to your Azure Web App to handle traffic from both domains, even if you plan to use only one as your primary domain.

I’ll explain how to redirect from the root (no-www) to subdomain www using the file default of nginx.

In seconds azure will bind the certificate and allow https  

![rready](img/16Web.png)

<h2>SSH Manual Deployment</h2>

1. In the Development Tools section, click on SSH. Open the SSH terminal by clicking on Go to SSH.
 
![ssh](img/18SSH.png)

2. Access the App Service's File System via SSH:

Once connected via SSH in the Azure portal, you’ll be inside the Azure App Service container.

![container](img/19Server.png)

<b>Note: Any data outside `/home' is not persisted</b>, this mean any data stored outside /home: Temporary and non-persistent; it is lost on app restarts, scaling, or redeployments.
Navigate to the Web Content Directory:

For App Services, the default content is typically located in the <b>/home/site/wwwroot directory:</b>

`cd /home/site/wwwroot`

Edit the hostingstart.html File:
You should see a file named hostingstart.html in this directory (it is the default web page for newly created App Services).

`nano hostingstart.html`

Modify the file to display "Hello, World!". Replace the content inside the body tag with the following:

![hello](img/20hostingstart.png)

Save the File:

After editing the file, press CTRL + X to exit nano, then press Y to confirm changes, and hit Enter to save the file.
Step 4: Verify the Changes
Visit Your Web App:
Open a browser and navigate to your App Service URL:

You should now see the modified hostingstart.html file displaying "Hello World!".

![display](img/21start.png)

<h2>Deploy Web Blog Sample From Github</h2>

Now that our web server is up and running, I'll walk you through the steps to clone my GitHub repository, which contains the following files: index.html, styles.css, Contact/, startup.sh, and default. I'll explain the purpose of the last two shortly.

Since the git command is not installed, we need to install it first by running:

'apt update && apt install git -y'

![git](img/23git.png)

Next, copy the HTTPS link to the repository and use the following command:

![repo](img/22Github.png)

`git clone <Path that you just copied>`

`cd Web-App-Azure/`

Move the necessary files to the wwwroot directory:

`mv index.html Contact/ styles.css /home/site/wwwroot/`

![mv](img/24mv.png)

Finally, open a browser and navigate to your App Service URL:

![mv](img/25Web.png)


<b><h3>------------------Alerts------------------</h3></b>
