include .env
export $(shell sed 's/=.*//' .env)
local:
	mkcert -key-file ./traefik_misc/tsl.key -cert-file ./traefik_misc/tsl.crt $(DOMAIN) $(TRAEFIK_DOMAIN)
	docker compose up 

production: # use Let's encrypt