
import cv2
from ultralytics import YOLO
from .models import Pollution

import datetime

# Load the YOLOv8 model
model = YOLO('backend/pollution_detection.pt')


def detect_pollutions(video_path):

    # Open the video file
    cap = cv2.VideoCapture(video_path)

    # Loop through the video frames
    while cap.isOpened():
        # Read a frame from the video
        success, frame = cap.read()

        if success:
            # Run YOLOv8 inference on the frame
            results = model(frame)

            # Visualize the results on the frame
            annotated_frame = results[0].plot()

            # Display the annotated frame
            # cv2.imshow("YOLOv8 Inference", annotated_frame)

            # class_type = results[0].cls

            # save image
            cv2.imwrite(f'/media/images/{class_type}_{datetime.date.today}', annotated_frame)

            # detect class
            # save_pollutions("image", "class_type")

        # Break the loop if 'q' is pressed
        if cv2.waitKey(1) & 0xFF == ord("q"):
            break
        # else:
        #     # Break the loop if the end of the video is reached
        #     break

    # Release the video capture object and close the display window
    cap.release()
    cv2.destroyAllWindows()



# get current location using Google API
def getLocation():
    print('the current location')
    pass



def save_pollutions(image, class_type):

    getLocation()    
    new = Pollution(
        date = datetime.now().strftime('%m-%d-%Y'),
        street = '', 
        location = '', 
        location_url = '',
        type = class_type,
        image = "", #Image(),
        approved = False,
        rejected = False,
    )
    # new.save()
    print('object save successfully')


 
# detect_pollutions(0)
 


