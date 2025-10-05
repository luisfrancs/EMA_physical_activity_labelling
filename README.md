# EMA_PA_Data_Labelling
This code was developed to label physical activity (PA) accelerometer data collected as part of the WEALTH study (Wearable Sensors for the Assessment of Physical and Eating Behaviours).
The analysis integrates wearable sensor data with Ecological Momentary Assessment (EMA) prompts to generate sparsely labelled data for training machine learning algorithms for PA classification, as described in the manuscript "Data Labelling for Free-Living Physical Activity Recognition Using Thigh-Worn Wearables and Event-Based Ecological Momentary Assessment".
Label evaluation was carried out using MATLAB, and the machine learning experiments were conducted using Python.

## Label evaluation
This folder contains MATLAB scripts to compute accuracy (and other metrics) per activity using the sparsely labelled data according to different selection thresholds (e.g. 0%, 50%, 75%, and 90%).

## Machine learning experiments
This folder contains a Python script to train and evaluate machine learning algorithms using the data generated through different data selection thresholds.

## Citation
Luis Sigcha, Annika Swenne, Jitka Kuhnova et al. Data Labelling for Free-Living Physical Activity Recognition using Thigh-Worn Wearables and Event-based Ecological Momentary Assessment, 05 August 2025, PREPRINT (Version 1) available at Research Square [https://doi.org/10.21203/rs.3.rs-6835979/v1]

## Contact
For any questions or inquiries, feel free to contact:
- Luis Sigcha: [luis.sigcha@ul.ie](mailto:luis.sigcha@ul.ie)



