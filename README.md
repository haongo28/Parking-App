Package for OCR:
$flutter pub add camera
$flutter pub add google_ml_kit

Add new class objects files in lib that is neccessary (coordinates_translator, text_detector_painter, camera_view)
In homepage, set onclick() for orange + button as TextDetectorV2View() to go to OCR scanner screen. (Example is shown in main.dart)

Decoded text from image is returned as recognisedText. 
