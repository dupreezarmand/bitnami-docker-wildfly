FROM bitnami/oraclelinux-extras:7-r102
LABEL maintainer "Bitnami <containers@bitnami.com>"

# Install required system packages and dependencies
RUN install_packages glib2 glibc libaio libblkid libffi libgcc libmount libselinux libstdc++ libuuid pcre zlib
RUN bitnami-pkg install java-1.8.181-1 --checksum 6e7fc2779b6e0e3c6c0a2687b1d747d8a427594ff80b8c94b055c839e387e6b1
RUN bitnami-pkg unpack wildfly-12.0.0-0 --checksum f3ee864749fdf8891945ec0f49bee448ea4a4445a76293feb7e4ad28b63178fb
RUN ln -sf /opt/bitnami/wildfly/data /app

RUN apt-get update && apt-get install -y --no-install-recommends openssh-server && echo "root:Docker!" | chpasswd

COPY sshd_config /etc/ssh/
COPY rootfs /

ENV BITNAMI_APP_NAME="wildfly" \
    BITNAMI_IMAGE_VERSION="12.0.0-ol-7-r68" \
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
