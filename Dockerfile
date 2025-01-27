# Dockerfile
FROM ubuntu:24.04

# Install necessary packages
RUN apt-get update && \
    apt-get install -y openssh-server nginx wget && \
    mkdir /var/run/sshd && \
    echo 'root:password' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    mkdir -p /var/www/html/images

# Expose SSH and HTTP ports
EXPOSE 22 80

# Start SSH and Nginx
CMD service ssh start && nginx -g "daemon off;"