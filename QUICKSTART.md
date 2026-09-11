# Quick Start Guide - Plate Detection Streamlit App

## Run in 3 Steps

### Option 1: Windows (Recommended)
```bash
1. Double-click file: run.bat
2. Tunggu sampai browser terbuka otomatis
3. Aplikasi siap digunakan di http://localhost:8501
```

### Option 2: Manual (Windows/Linux/Mac)
```bash
# 1. Navigate ke directory
cd E:\porto\plate-detection-streamlit

# 2. Install dependencies
pip install -r requirements.txt

# 3. Run aplikasi
streamlit run app.py
```

---

## Available Features

### 1. Image Detection (Image Tab)
- Upload gambar (.jpg, .png, .jpeg)
- Atau gunakan sample image yang tersedia
- Lihat:
  - Deteksi plat nomor (dengan bounding box)
  - Cropped plates (hasil crop setiap plat)
  - Enhancement results (plat yang sudah di-enhance)
  - Confidence score untuk setiap deteksi

### 2. Video Detection (Video Tab)
- Upload video (.mp4, .avi, .mov)
- Atau gunakan sample video
- Processing progress bar (real-time)
- Download hasil video dengan annotasi

### 3. Settings (Sidebar)
- Model Selection
  - Trained Model (v23) - Recommended
  - Default YOLOv11n - Standard
- Enhancement Toggle — ON/OFF enhancement plat
- Confidence Threshold — Adjust detection sensitivity (0.1 - 1.0)

### 4. About (About Tab)
- Project information
- Technical details
- Model performance metrics
- Usage instructions

---

## Output Display

### For Images:
```
Original Image          →  Detection Result
     ↓                            ↓
  Input              Bounding boxes + Labels

Plus:
- Cropped Plates (individual detection results)
- Enhancement comparison
- Confidence scores
```

### For Videos:
```
Processing Progress    →  Output Video
    ↓                          ↓
Frame counting        Annotated with boxes
(progress bar)        + Labels + Timestamp
```

---

## Configuration (if needed)

### If Model Path Is Different:
Edit file `app.py`, find this section and update path:

```python
# Line ~120
model_path = "E:\\UB\\Semester 7\\PCD\\Deteksi plat nomor\\runs\\detect\\plate_detector_v23\\weights\\best.pt"
```

### If Sample Image/Video Path Is Different:
Edit in `app.py`, find:

```python
# Line ~180 (untuk image)
sample_path = "E:\\UB\\Semester 7\\PCD\\Deteksi plat nomor\\sample.jpg"

# Line ~320 (untuk video)
sample_video_path = "E:\\UB\\Semester 7\\PCD\\Deteksi plat nomor\\input.mp4"
```

---

## Usage Tips

### For Best Results:
1. Use high-quality images (HD preferred)
2. Plat nomor terlihat jelas di gambar
3. Pencahayaan yang cukup untuk deteksi akurat
4. Jika false positive, naikkan confidence threshold

### Performance:
- Image Processing: ~0.5-2 detik per gambar
- Video Processing: ~5-30 detik tergantung durasi
- Bisa menggunakan GPU jika tersedia (auto-detect)

### Troubleshooting:

| Problem | Solution |
|---------|----------|
| App tidak buka | Pastikan Python & dependencies installed |
| Model not found | Verifikasi path model di app.py |
| Slow processing | Reduce image resolution atau close other apps |
| Upload error | Check file format (.jpg, .png, .mp4, .avi, .mov) |

---

## Project Structure

```
E:\porto\plate-detection-streamlit\
├── app.py                  # Main Streamlit app
├── requirements.txt        # Python packages needed
├── run.bat                # Quick launcher (Windows)
├── README.md              # Full documentation
└── QUICKSTART.md          # This file

Data/Model Location:
E:\UB\Semester 7\PCD\Deteksi plat nomor\
├── runs/detect/plate_detector_v23/weights/best.pt  (Model)
├── sample.jpg              (Sample image)
├── input.mp4               (Sample video)
└── [other files]
```

---

## App Features

Aplikasi ini menampilkan:
- Real-time detection preview
- Interactive controls di sidebar
- Multiple tabs untuk berbagai use case
- Professional UI dengan Streamlit
- Download functionality

---

## FAQ

**Q: Apa beda "Trained Model" vs "Default YOLOv11n"?**
A: Trained Model adalah custom model yang sudah dilatih khusus untuk plat nomor Indonesia. Default adalah model standard YOLO. Gunakan Trained Model untuk hasil terbaik.

**Q: Bisa deteksi plat nomor lain (bukan Indonesia)?**
A: Model ini dilatih untuk plat nomor tertentu. Untuk plat format lain, perlu retrain model.

**Q: Berapa besar file model?**
A: ~13MB. Akan di-download otomatis pada pertama kali dijalankan.

**Q: Bisa di-deploy ke server/cloud?**
A: Ya, Streamlit bisa di-deploy ke Streamlit Cloud (gratis), Heroku, AWS, dll.

---

## Support

If error occurs:
1. Cek console output (ada error message detail)
2. Verifikasi semua paths sesuai
3. Pastikan semua dependencies installed
4. Coba re-run aplikasi

---

Ready to go? Run `run.bat` now!
