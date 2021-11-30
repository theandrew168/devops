#!/bin/bash

echo "These counts should always be the same!"
echo "  (if not working: brew install ripgrep)"

echo
echo "DigitalOcean domains:"
rg \"digitalocean_domain\" | wc -l

echo
echo "Linode domains:"
rg \"linode_domain\" | wc -l
