# Use an official Node.js runtime as a parent image
FROM node:16

# Set the working directory in the container
WORKDIR /myapp

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Run prisma generate to generate Prisma Client
RUN npx prisma generate

# Expose the port on which your Node.js application runs
EXPOSE 4000

# Start the Node.js application
CMD ["node", "src/index.js"]

