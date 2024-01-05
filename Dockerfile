# Build from nvidia image
FROM nvidia/cuda:12.3.1-base-ubuntu22.04

# Set the time zone
ENV TZ=America/Los_Angeles

# Install time zone data package
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y tzdata

# Add packages for repo management
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository universe && \
    rm -rf /var/lib/apt/lists/*

# Deal with other packages, download jellyfin install script
RUN apt-get update && \
    apt-get install -y wget curl netcat unzip net-tools git python3 gdebi

# Base Installation Process
WORKDIR /opt
RUN wget https://repo.jellyfin.org/releases/server/linux/stable/combined/jellyfin_10.8.13_amd64.tar.gz
RUN tar xzf jellyfin_10.8.13_amd64.tar.gz -C /opt/
RUN rm  jellyfin_10.8.13_amd64.tar.gz
RUN mv /opt/jellyfin_10.8.13 /opt/jellyfin
RUN mkdir /opt/jellyfin/config
RUN mkdir /opt/jellyfin/config/data /opt/jellyfin/config/cache /opt/jellyfin/config/config /opt/jellyfin/config/log

# ffmpeg install
RUN wget https://repo.jellyfin.org/releases/server/ubuntu/versions/jellyfin-ffmpeg/5.1.4-2/jellyfin-ffmpeg5_5.1.4-2-jammy_amd64.deb
RUN gdebi -n jellyfin-ffmpeg5_5.1.4-2-jammy_amd64.deb
RUN dpkg -i jellyfin-ffmpeg5_5.1.4-2-jammy_amd64.deb
RUN apt-get install -y libnvidia-encode-535-server

# Run Jellyfin
COPY jellyfin.sh /opt/jellyfin
RUN chmod +x /opt/jellyfin/jellyfin.sh
CMD ["/opt/jellyfin/jellyfin.sh"]
