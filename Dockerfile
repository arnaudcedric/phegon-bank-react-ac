# Build stage
FROM node:22-alpine AS builder

WORKDIR /app

# Copy package files first for caching
COPY package*.json ./

RUN npm install

# Copy source code
COPY . .

# Build React app
RUN npm run build

# Production stage
FROM nginx:alpine

COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]