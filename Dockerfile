FROM node:14-alpine3.12

ARG PROJECT_NAMESPACE=WIPRO
ARG PROJECT_NAME=demoapp

RUN apk add --no-cache git g++ python2 make

ENV HOST=0.0.0.0 \
    PORT=3000

COPY --chown=node:node demo /opt/${PROJECT_NAMESPACE}/${PROJECT_NAME}

WORKDIR /opt/${PROJECT_NAMESPACE}/${PROJECT_NAME}

USER node:node

RUN npm install --only=production && \
    npm cache clean --force

EXPOSE ${PORT}/tcp

ENTRYPOINT ["npm"]

CMD ["start"]
