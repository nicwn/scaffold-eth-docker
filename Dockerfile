# Use the official Node.js 20 image
FROM node:20-alpine

# Install git and bash
RUN apk add --no-cache git bash

# Enable Corepack which includes Yarn
RUN corepack enable

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and yarn.lock if they exist
COPY scaffold-eth-2/package.json scaffold-eth-2/yarn.lock ./

# Install dependencies using yarn
RUN yarn install

# Copy the rest of the application
COPY scaffold-eth-2/ .

# Expose the ports used by Scaffold-ETH-2
EXPOSE 3000
EXPOSE 8545

# Default command
CMD ["yarn", "chain"]