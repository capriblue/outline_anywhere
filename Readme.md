# outline anywhere

## abstract 

Outline is super convenient wiki tool. However, it is a little bit complicated to set and check utility bacause the domain is required to run it. Then, I wrote a couple of codes which make it possible to check Outline without having global domain. 

This tool is still development state. I did not write any setting for production mode. But you can check outline in the local development.

## Requirements 

### local environment 

- mkcert
    you can get the information  [https://github.com/FiloSottile/mkcert](https://github.com/FiloSottile/mkcert)
- (If possible) access privilage to /etc/hosts (linux/mac OS) or C:\Windows\System32\drivers\etc\hosts (Windows)
    If you just want to check outline, you can use `localhost` and the subdomain for your applications. But, if you want to check original domain, the setting of these files is required. 

### production ( not yet )

- domain

In the production environment, this kit is going to use the Let's encrypt.

## setting for local environment

These are the simple explanation: 

1. copy `.env.example` file to `.env` file 
1. set environments in `.env` file 
1. run command `make local`  
1. wait about 1 min and access to the domain 

that's it!

### settings in `.env` file 

#### `DOMAIN` 

This is your domain for outline. If you run this application for the first time, I recommend the subdomain of `localhost`, such as `outline.localhost` to avoid problems. 


(for mac/linux user) Access the `/etc/hosts` file with Administrator privilege, and add like this if the domain you want to use is `your.domain`: 

```/etc/hosts
::1 your.domain # you can set `your.domain`
```

(for wsl user/windows user) Access the `C:\Windows\System32\drivers\etc\hosts` file with Administrator privilege, and add like this if the domain you want to use is `your.domain`: 

```C:\Windows\System32\drivers\etc\hosts
::1 your.domain # you can set `your.domain`
```

I provide the IPv6 example to avoid problems, especialy for the wsl user. But you can also use IPv4 localhost: 
```
127.0.0.1 your.domain
```

#### `TRAEFIK_DOMAIN` 

I used the traefik for https connection. You can access to Traefik's dashboard to set this environment. The guide for the setting for this domain is the same as the domain for Outline. 

```
::1 `your.traefik.domain` 
```

#### `SECRET_KEY` and `UTILS_SECRET` 

Outline requires the internal secret keys. you can get random key using this command: 

```shell 
$openssl rand -hex 32
022f77bd140ab3c8cb3f1cac10f8dfacd046d99edacf76cdd85c4fa0b5ba6166 # Please do not use this number. 
```
You can generate twice and paste them for each environemt value.  

#### SLACK integration and authentication 

Outline provides a variety of authentication ways. For the simplicity, I only select the SLACK integration because I will use SLACK auth 😅 ( sorry )

1. login to slack.com ( not your application but in the web browser) 
1. access to https://api.slack.com/apps  and click `create New app` 
1. select the `From a scratch`, give App Name and select your workspace
1. from the Basic information, you can set the values: SLACK_CLIENT_ID, SLACK_CLIENT_SECRET,SLACK_VERIFICATION_TOKEN, SLACK_APP_ID
1. access to the `OAuth & Permissions` from the left side. 
1. set Redirect URLs `https://your.domain/auth/slack.callback` please change `your.domain` to the value in which you set `DOMAIN`.  Also give User Token Scopes of `identity.avatar`, `identity.basic`, `identity.email`, and `identity.team` . 


#### smtp 

This setting is for the invitation to your Outline server. I give the example of gmail, which is the most common email. 

you set the `SMTP_USERNAME` to your gmail account and access to the google account setting and get app password. copy it and paste the value of `SMTP_PASSWORD` .   

