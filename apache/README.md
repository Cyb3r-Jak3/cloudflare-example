# Cloudflared + HTTPD

Example for using docker-compose to run cloudflared and httpd

## Getting Started

#### Create Tunnel

Run `cloudflared tunnel create <tunnel name>`

#### Move Credentials

Move `cert.pem` and `<tunnel id>.json` to [cloudflared](./cloudflared/).

Replace the tunnel id and domain in [config.yml](./config.yml) with your tunnel ID and domain

#### Route Tunnel

Run `cloudflared tunnel route <tunnel name> <your domain>`

#### Run

Run `docker-compose up`, wait until everything is running then you will be able to open `https://<your domain>`