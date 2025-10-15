FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install system dependencies (ImageMagick for image processing)
RUN apk add --no-cache \
    imagemagick \
    libraw \
    dcraw \
    python3 \
    make \
    g++

# Copy package files
COPY package*.json ./

# Install dependencies (including devDependencies for build)
# NPM_CONFIG_PRODUCTION=false ensures devDependencies are installed
ENV NPM_CONFIG_PRODUCTION=false
RUN npm ci

# Copy all application code
COPY . .

# Build the application
# This runs: vite build && esbuild server/index.ts
RUN npm run build

# Set environment to production
ENV NODE_ENV=production
ENV PORT=10000

# Expose port
EXPOSE 10000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
  CMD node -e "require('http').get('http://localhost:10000/api/health', (r) => {process.exit(r.statusCode === 200 ? 0 : 1)})"

# Start the application
CMD ["npm", "start"]
