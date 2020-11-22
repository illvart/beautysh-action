FROM python:3.9-slim-buster

LABEL "com.github.actions.name"="Bash shell beautifier"
LABEL "com.github.actions.description"="Run beautysh to beautify a bash shell scripts code."
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/illvart/beautysh-action"
LABEL "homepage"="https://github.com/illvart/beautysh-action"
LABEL "maintainer"="illvart"

RUN pip install beautysh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
