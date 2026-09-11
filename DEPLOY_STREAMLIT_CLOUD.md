# Deploy to Streamlit Cloud - Step by Step

## Prerequisites
1. GitHub account (https://github.com)
2. Streamlit Community Cloud account (https://share.streamlit.io)

## Steps

### 1. Create GitHub Repository

Go to https://github.com/new and create:
- **Repository name:** `plate-detection-streamlit`
- **Description:** YOLOv11-based license plate detector with Streamlit
- **Visibility:** Public
- **Initialize:** Skip initialization (we'll push existing repo)

### 2. Push Local Repository to GitHub

Run these commands:

```bash
cd E:\porto\plate-detection-streamlit

# Set remote to your new GitHub repo
git remote set-url origin https://github.com/YOUR_USERNAME/plate-detection-streamlit.git

# Push to GitHub
git push -u origin main
```

When prompted:
- **Username:** Your GitHub username
- **Password:** Your GitHub Personal Access Token (or password if enabled)

### 3. Get GitHub Personal Access Token

If needed:
1. Go to https://github.com/settings/tokens
2. Click "Generate new token" → "Generate new token (classic)"
3. Name: `streamlit-deploy`
4. Scopes: Check `repo` and `gist`
5. Click "Generate token"
6. Copy token (only shown once!)
7. Use as password when git prompts

### 4. Deploy to Streamlit Cloud

1. Go to https://share.streamlit.io
2. Click "New app"
3. Fill in:
   - **GitHub account:** midas79
   - **Repository:** plate-detection-streamlit
   - **Branch:** main
   - **Main file path:** app.py
4. Click "Deploy"

### 5. Wait for Deployment

- Streamlit will build and deploy automatically
- Takes 1-3 minutes
- You'll get a live URL like:
  ```
  https://plate-detection-streamlit-midas79.streamlit.app
  ```

### 6. Update Portfolio

Once deployed, update portfolio.ts:

```typescript
{
  id: "plate-detection",
  // ... other fields ...
  links: {
    live: "https://plate-detection-streamlit-midas79.streamlit.app",
    github: "https://github.com/midas79/plate-detection-streamlit"
  }
}
```

---

## Troubleshooting

### Push fails with authentication error
- Generate Personal Access Token (see step 3)
- Use token instead of password

### Deployment fails
- Check requirements.txt (all versions compatible)
- Check app.py file paths (they may not exist in cloud)
- View logs in Streamlit Cloud dashboard

### Model not found
- Streamlit Cloud doesn't have model files locally
- Need to download model or use default YOLOv11

---

## Next: Update App for Cloud

Since model files won't exist in Streamlit Cloud, update app.py:

Replace hardcoded paths with:

```python
# Use default model if trained model not available
try:
    if model_option == "Trained Model (Recommended)":
        model_path = "runs/detect/plate_detector_v23/weights/best.pt"
        if not os.path.exists(model_path):
            st.warning("Using default YOLOv11n - trained model not available")
            model_path = "yolov8n.pt"
    else:
        model_path = "yolov8n.pt"
except:
    model_path = "yolov8n.pt"
```

Or download model from cloud storage when deployed.

---

**You're ready to deploy!** Follow steps 1-6 above to get your app live.
