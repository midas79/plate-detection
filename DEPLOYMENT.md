# Deployment Guide - Plate Detection Streamlit App

## Quick Deploy to Streamlit Cloud

### Prerequisites
- GitHub account
- Streamlit Community Cloud account (free at https://streamlit.io/cloud)

### Steps

1. Push to GitHub
   ```bash
   cd E:\porto\plate-detection-streamlit
   git init
   git add .
   git commit -m "Initial Streamlit app for plate detection"
   git remote add origin https://github.com/YOUR_USERNAME/plate-detection-streamlit.git
   git push -u origin main
   ```

2. Deploy to Streamlit Cloud
   - Go to https://share.streamlit.io
   - Click "New app"
   - Select your GitHub repo
   - Set:
     - Repository: `your-repo/plate-detection-streamlit`
     - Branch: `main`
     - Main file path: `app.py`
   - Click "Deploy"

3. Configure Secrets (if needed)
   - In Streamlit Cloud dashboard, click "Settings"
   - Add secrets for model paths if using cloud storage

### Access Live App
```
https://plate-detection-streamlit-YOUR_USERNAME.streamlit.app
```

---

## Local Development

### Run Locally
```bash
cd E:\porto\plate-detection-streamlit
pip install -r requirements.txt
streamlit run app.py
```

Access at: http://localhost:8501

---

## Environment Configuration

### Model Paths
Update paths in `app.py` if using different locations:

```python
# For trained model
model_path = "path/to/best.pt"

# For sample image
sample_path = "path/to/sample.jpg"

# For sample video
sample_video_path = "path/to/input.mp4"
```

### Streamlit Configuration
Edit `.streamlit/config.toml` to customize:
- Theme colors
- Page size
- Logging level
- Server settings

---

## Production Considerations

### Performance
- Model inference: 50-100ms per image
- Video processing: ~1-2 fps depending on resolution
- Memory: ~500MB for model + dependencies

### Scaling
For high traffic:
1. Use Streamlit Enterprise (contact sales)
2. Implement caching with `@st.cache_resource`
3. Optimize model size (use YOLOv11n nano variant)

### Security
- Model files stored locally or on secure servers
- No sensitive data in code or config files
- API keys in environment variables only

---

## Troubleshooting

### Model Loading Error
Error: "Model not found"
→ Verify model path matches actual file location

### Memory Issues
Error: "CUDA out of memory"
→ Reduce image resolution or use CPU inference
→ Set: model.to('cpu') in code

### File Upload Issues
Error: "File not supported"
→ Check file format (.jpg, .png, .mp4, .avi, .mov)
→ Check file size (max ~100MB)

---

## Monitoring

### Streamlit Cloud Dashboard
- View app activity and resource usage
- Monitor errors and logs
- Manage deployments

### Local Logging
Check console output for:
- Model loading time
- Detection performance
- Processing errors

---

## Updates & Maintenance

### Updating Dependencies
```bash
pip install --upgrade -r requirements.txt
```

### Model Updates
1. Replace `best.pt` file
2. Push to GitHub
3. Streamlit Cloud auto-redeploys

### Code Updates
1. Commit and push changes
2. Streamlit Cloud auto-redeploys on main branch
