# EMA_PA_Data_Labelling
This code was developed to label physical activity (PA) accelerometer data collected as part of the WEALTH study (Wearable Sensors for the Assessment of Physical and Eating Behaviours).
The analysis integrates wearable sensor data with Ecological Momentary Assessment (EMA) prompts to generate sparsely labelled data for training machine learning algorithms for PA classification, as described in the manuscript "Data Labelling for Free-Living Physical Activity Recognition Using Thigh-Worn Wearables and Event-Based Ecological Momentary Assessment".
Label evaluation was carried out using MATLAB, and the machine learning experiments were conducted using Python.

## Label evaluation
This folder contains MATLAB scripts to compute accuracy (and other metrics) per activity using the sparsely labelled data according to different selection thresholds (e.g. 0%, 50%, 75%, and 90%).

## Machine learning experiments
This folder contains a Python script to train and evaluate machine learning algorithms using the data generated through different data selection thresholds.

## Citation
Please cite the following paper in your publications if this repository helps your research.

## Contact
For any questions or inquiries, feel free to contact:
- Luis Sigcha: [luis.sigcha@ul.ie](mailto:luis.sigcha@ul.ie)



