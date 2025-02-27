# build stage
FROM node:20 AS build-stage

RUN npm install -g pnpm

ENV NODE_ENV=development
WORKDIR /app

COPY package.json .
COPY pnpm-lock.yaml .
COPY tsconfig.json .
COPY tsconfig.app.json .
COPY tsconfig.node.json .
COPY vite.config.ts .
RUN pnpm install

COPY src src
COPY public public
COPY index.html .
RUN pnpm build

# prod stage
FROM nginx:alpine AS prod-stage

COPY --from=build-stage /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]