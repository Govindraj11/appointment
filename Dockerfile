# Use a specific Node.js version for reproducibility
FROM node:18

# Set the working directory inside the container
WORKDIR /home/app

# Copy package files first to leverage Docker layer caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the application port
EXPOSE 3001

# Run the application
CMD [ "node", "att.js" ]