import cv2
import sys

cap = cv2.VideoCapture(0)
if not cap.isOpened():
    print("Error: Could not open the camera.")
    sys.exit(1)

while True:
    ret, frame = cap.read()
    if not ret:
        break

    # ✅ عرض نص على الكاميرا
    cv2.putText(frame, "Camera Opened", (50, 50), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)

    cv2.imshow('Camera', frame)

    if cv2.waitKey(1) & 0xFF == 27:  # اضغط ESC للإغلاق
        break

cap.release()
cv2.destroyAllWindows()
