default:
    echo 'Hello, world!'

open-ports:
    # Open ports locally. See
    # https://blogs.oracle.com/developers/post/enabling-network-traffic-to-ubuntu-images-in-oracle-cloud-infrastructure
    sudo iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT
    sudo iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 443 -j ACCEPT
    echo "Don't forget to open the ports in the cloud console under subnet/**/rules or something"

each-boot:
    sudo sysctl -w net.ipv4.ip_unprivileged_port_start=80

    # Improve QUIC perf
    # https://github.com/quic-go/quic-go/wiki/UDP-Buffer-Sizes
    sudo sysctl -w net.core.rmem_max=7500000
    sudo sysctl -w net.core.wmem_max=7500000

    sudo sysctl --system

lint:
    just --fmt --unstable
    podman run --mount type=bind,src=Caddyfile,dst=/srv/Caddyfile caddy caddy fmt --overwrite

run:
    podman-compose up -d

stop:
    podman-compose down

reload:
    podman-compose exec -w /etc/caddy caddy caddy reload
