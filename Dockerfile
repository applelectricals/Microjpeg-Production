# In Replit Shell
cd ~/workspace

# Create Dockerfile
cat > Dockerfile << 'EOF'
[paste the Dockerfile above]
EOF

# Commit and push
git add Dockerfile
git commit -m "Add Dockerfile for Coolify deployment"
git push origin main
```

---

### 2. Create New Coolify Project

**In Coolify Dashboard:**

1. **New Project** → Name: `microjpeg-hetzner`
2. **Add Resource** → **Application**
3. **Source**: GitHub → Select `Microjpeg-Production` repo
4. **Branch**: `main`
5. **Build Pack**: **Dockerfile**
6. **Port**: `10000`

---

### 3. Add Environment Variables

**Copy these EXACT values from your Render dashboard:**
```
NODE_ENV=production
PORT=10000
NPM_CONFIG_PRODUCTION=false
DATABASE_URL=your_neon_url
STRIPE_SECRET_KEY=your_key
VITE_STRIPE_PUBLIC_KEY=your_key
TESTING_STRIPE_SECRET_KEY=your_key
TESTING_VITE_STRIPE_PUBLIC_KEY=your_key
SENDGRID_API_KEY=your_key
PAYPAL_CLIENT_ID=your_id
PAYPAL_CLIENT_SECRET=your_secret
RAZORPAY_KEY_ID=your_key
RAZORPAY_KEY_SECRET=your_secret
VITE_TIDIO_PUBLIC_KEY=your_key
SESSION_SECRET=your_secret
REDIS_URL=your_redis_url (or leave empty)
R2_ENDPOINT=your_r2_endpoint
R2_ACCESS_KEY_ID=your_r2_key
R2_SECRET_ACCESS_KEY=your_r2_secret
R2_BUCKET_NAME=your_bucket