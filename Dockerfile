FROM docker:17.10.0-ce

WORKDIR /app

RUN apk update && \
    apk add --no-cache \
            curl \
            python \
            py-crcmod \
            bash \
            libc6-compat \
            openssh-client \
            git

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    mv kubectl /usr/local/bin && \
    chmod 755 /usr/local/bin/kubectl

ENV CLOUD_SDK_VERSION 174.0.0
ENV PATH /app/google-cloud-sdk/bin:$PATH
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    ln -s /lib /lib64 && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image

RUN kubectl config set-cluster minikube --server=https://192.168.99.100:8443 \
      --certificate-authority=/minikube/ca.crt && \
    kubectl config set-credentials minikube --certificate-authority=/root/.minikube/ca.crt \
      --client-key=/minikube/client.key \
      --client-certificate=/minikube/client.crt && \
    kubectl config set-context minikube --cluster=minikube --user=minikube && \
    kubectl config use-context minikube
