# Use the official Node.js 20 image
FROM node:20-alpine

# Install git
RUN apk add --no-cache git

# Enable Corepack which includes Yarn
RUN corepack enable

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and yarn.lock if they exist
COPY package.json yarn.lock ./

# Install dependencies using yarn
RUN yarn install

# Copy the rest of the application
COPY . .

# Expose the port Scaffold-ETH-2 uses
EXPOSE 3000

# Command to run the development server
CMD ["yarn", "dev"]