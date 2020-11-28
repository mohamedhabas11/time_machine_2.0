FROM ubuntu:18.04 AS base

ARG GITHUB_RUNNER_VERSION

ENV RUNNER_NAME "runner"
ENV GITHUB_PAT ""
ENV GITHUB_OWNER ""
ENV GITHUB_REPOSITORY ""
ENV RUNNER_WORKDIR "work"
ENV RUNNER_LABELS ""
ENV AGENT_TOOLSDIRECTORY="/opt/hostedtoolcache"

RUN apt update \
    && apt install -y \
        curl sudo git jq \
        gcc make libglu1 libxi-dev libxt6 \
        software-properties-common \
    && add-apt-repository ppa:git-core/ppa -y \
    && apt install git -y \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m runner \
    && usermod -aG sudo runner \
    && echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER runner
WORKDIR /home/runner

RUN curl -Ls https://github.com/actions/runner/releases/download/v${GITHUB_RUNNER_VERSION}/actions-runner-linux-x64-${GITHUB_RUNNER_VERSION}.tar.gz | tar xz \
    && sudo ./bin/installdependencies.sh

RUN sudo mkdir ${AGENT_TOOLSDIRECTORY} -p && sudo chown -R runner:runner ${AGENT_TOOLSDIRECTORY}

COPY entrypoint.sh ./entrypoint.sh
RUN sudo chown -R runner:runner ./entrypoint.sh
RUN sudo chmod u+x ./entrypoint.sh

ENTRYPOINT ["/home/runner/entrypoint.sh"]