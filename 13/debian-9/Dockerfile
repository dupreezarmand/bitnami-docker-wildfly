FROM bitnami/minideb-extras:stretch-r136
LABEL maintainer "Bitnami <containers@bitnami.com>"

# Install required system packages and dependencies
RUN install_packages libaio1 libblkid1 libbsd0 libc6 libffi6 libgcc1 libglib2.0-0 libmount1 libpcre3 libselinux1 libstdc++6 libuuid1 libx11-6 libxau6 libxcb1 libxdmcp6 libxext6 zlib1g
RUN bitnami-pkg install java-1.8.181-1 --checksum 66bba4b4a2647f981339d306da796905c222057c4277a5ef045e079981a404f4
RUN bitnami-pkg unpack wildfly-13.0.0-0 --checksum 8000b1947ea78c207c620a88ffe9b459dbc28e92cd9d7d89a2f0421693696c84
RUN ln -sf /opt/bitnami/wildfly/data /app

RUN apt-get update && apt-get install -y --no-install-recommends openssh-server && echo "root:Docker!" | chpasswd

COPY sshd_config /etc/ssh/
COPY rootfs /

ENV BITNAMI_APP_NAME="wildfly" \
    BITNAMI_IMAGE_VERSION="13.0.0-debian-9-r54" \
    PATH="/opt/bitnami/java/bin:/opt/bitnami/wildfly/bin:$PATH" \
    WILDFLY_JAVA_HOME="" \
    WILDFLY_JAVA_OPTS="" \
    WILDFLY_MANAGEMENT_HTTP_PORT_NUMBER="9990" \
    WILDFLY_PASSWORD="bitnami" \
    WILDFLY_PUBLIC_CONSOLE="true" \
    WILDFLY_SERVER_AJP_PORT_NUMBER="8009" \
    WILDFLY_SERVER_HTTP_PORT_NUMBER="8080" \
    WILDFLY_SERVER_INTERFACE="0.0.0.0" \
    WILDFLY_USERNAME="user" \
    WILDFLY_WILDFLY_HOME="/home/wildfly" \
    WILDFLY_WILDFLY_OPTS="-Dwildfly.as.deployment.ondemand=false"

EXPOSE 8080 9990 2222

ENTRYPOINT [ "/app-entrypoint.sh" ]
CMD [ "nami", "start", "--foreground", "wildfly" ]
