%% CALCULATES ACCURACY RESULS PER DATA SEGMENT
% Script to calculate accuracy results per data segment as presented in the Paper " Data Labelling for Free-Living Physical Activity Recognition using Thigh-Worn Wearables and Event-based Ecological Momentary Assessment
%Author:  Luis Sigcha
clc;clear;
%% LOAD DATA
addpath functions\
file_Results6Activities="Results_ALL6activities_0.75threshold_FULL_SURVEY2025-02-12 12-20-27_V3.csv";
df_Results=importfileALL6activities(file_Results6Activities, [2, Inf]);
activities = ["sitting", "standing", "walking", "running", "exercising", "cycling"];

for currentPA = activities
    fprintf('=========================\n'); % No curly braces needed here
    fprintf('Current activity: %s\n', currentPA); % No curly braces needed here
    df_Results=importfileALL6activities(file_Results6Activities, [2, Inf]);
    %% ACTIVITY FILTER
    df_Results=df_Results((df_Results.activity == currentPA),:); 
    %% CALCULATE METRIC BY THRSHOLD (0 means no filter)
    filtered_Data_Set_Metrics(df_Results,0.0)
    filtered_Data_Set_Metrics(df_Results,0.50)
    filtered_Data_Set_Metrics(df_Results,0.75)
    filtered_Data_Set_Metrics(df_Results,0.90)
    fprintf('\n'); %
end

%%Function within a script
function filtered_Data_Set_Metrics(df_Results,threshold)
% Local function that calculates filtered dataset metrics.
    original_count=sum(df_Results.number_questionnaires);
    fprintf('RESULTS FILTERED BY THRESHOLD (TH=%.0f%%):\n', 100*threshold);
    df_Results = df_Results((df_Results.Accuracy >= threshold),:); %FILTER usign threshold
    % Calculate mean and standard deviation of Accuracy
    mean_acc = mean((df_Results.Accuracy), 'omitnan');
    std_acc = std((df_Results.Accuracy), 'omitnan');
    fprintf('Mean accuracy: %.1f%% (%.1f%%)\n', 100 * mean_acc, 100 * std_acc);
    % Calculate total data length
    length_mean = mean((df_Results.data_length), 'omitnan');
    length_std = std((df_Results.data_length), 'omitnan');
    fprintf('Mean segment lengt: %.1f%% (%.1f%%)\n', (length_mean / (20 * 60)), (length_std / (20 * 60)));
    full_data_length = sum((df_Results.data_length), 'omitnan');
    fprintf('Data in samples: %d\n', full_data_length);
    fprintf('Data in minutes: %.0f\n', round(full_data_length / (20 * 60)));
    fprintf('Data in hours: %.1f\n', (full_data_length / (20 * 60 * 60)));
    fprintf('Number of data segments: %.f\n', sum(df_Results.number_questionnaires));
    fprintf('\n');
    filter_count=sum(df_Results.number_questionnaires);
    percent_redux=100*(filter_count/original_count);
    fprintf('Reduction of: %.f%%\n', 100-percent_redux);
    fprintf('\n');
end
