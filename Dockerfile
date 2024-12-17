# Stage 1: Build stage
# FROM node:18 AS build
FROM node:18-alpine AS build

# Set working directory
WORKDIR /usr/src/app

# Copy package files and install dependencies (use production flag to skip dev dependencies)
COPY package*.json ./
RUN npm install --production --no-cache

# Copy source code to the container
COPY . .

# Stage 2: Production stage
FROM node:18-slim

# Set working directory for the production image
WORKDIR /usr/src/app

# Copy only the production files from the build stage
COPY --from=build /usr/src/app /usr/src/app

# Clean up any cache or build-related files
RUN rm -rf /usr/src/app/node_modules && npm install --production --no-cache

# Expose the port that the app runs on
EXPOSE 5173

# Start the application
CMD ["npm", "run", "dev"]

# Start the application for production
# CMD ["npm", "run", "start"]
