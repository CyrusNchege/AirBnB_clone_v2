#!/bin/bash

# Install Nginx if not already installed
if [ ! -x "$(command -v nginx)" ]; then
    sudo apt update
    sudo apt install -y nginx
fi

# Create necessary directories if they don't exist
sudo mkdir -p /data/web_static/releases/test /data/web_static/shared

# Create a fake HTML file for testing
sudo echo -e "<html>\n  <head>\n  </head>\n  <body>\n    Holberton School\n  </body>\n</html>" | sudo tee /data/web_static/releases/test/index.html

# Create symbolic link and set ownership
sudo rm -rf /data/web_static/current
sudo ln -sf /data/web_static/releases/test /data/web_static/current
sudo chown -R root:root /data/

# Update Nginx configuration
sudo sed -i '/^\tserver {/a \\\n\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n' /etc/nginx/sites-available/default

# Restart Nginx
sudo service nginx restart

exit 0

