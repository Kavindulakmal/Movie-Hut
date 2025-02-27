# Use an official Node.js runtime as the base image
FROM node:20.10-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Vite app for production
RUN npm run build

# Expose port 5173
EXPOSE 5173

# Serve the app using Vite's preview server
CMD ["npm", "run", "dev", "--", "--host"]
