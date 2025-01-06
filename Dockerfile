# Stage 1: Build stage
FROM node:18-alpine AS build

# Set working directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./

# Install production dependencies first
RUN npm install --production --no-cache

# Install additional development dependencies for babel presets
RUN npm install --save-dev @babel/preset-typescript @babel/preset-react

# Install vite globally
RUN npm install -g vite

# Check if vite is installed globally
RUN npm list -g vite

# Stage 2: Production stage
FROM node:18-slim

# Set working directory for the production image
WORKDIR /usr/src/app

# Copy only the production files from the build stage
COPY --from=build /usr/src/app /usr/src/app

# Make sure npm global packages are available in the PATH
ENV PATH /usr/local/share/.config/yarn/global/node_modules/.bin:$PATH

# Install production dependencies
RUN npm install --production --no-cache

# Expose port for the app
EXPOSE 5173

# Start the application
CMD ["npm", "run", "dev"]
