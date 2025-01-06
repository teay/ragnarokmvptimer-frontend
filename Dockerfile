# Stage 1: Build stage
FROM node:18-alpine AS build

# Set working directory
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./ 

# Remove existing node_modules and package-lock.json before reinstalling
RUN rm -rf node_modules package-lock.json

# Install all dependencies (including devDependencies) and vite globally in one step
RUN npm install --no-cache && \
    npm install -g vite && \
    npm install --save-dev rollup

# Stage 2: Production stage
FROM node:18-slim

# Set working directory for the production image
WORKDIR /usr/src/app

# Copy only the production files from the build stage
COPY --from=build /usr/src/app /usr/src/app

# Make sure npm global packages are available in the PATH
ENV PATH /usr/local/share/.config/yarn/global/node_modules/.bin:$PATH

# Expose port for the app
EXPOSE 5173

# Start the application in development mode with --host option
CMD ["npm", "run", "dev", "--", "--host"]
