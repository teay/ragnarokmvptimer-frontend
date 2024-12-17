# Base image
FROM node:18

# Set working directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy source code to the container
COPY . .

# Expose the port that the app runs on
EXPOSE 5173

# Start the application
CMD ["npm", "run", "dev"]
