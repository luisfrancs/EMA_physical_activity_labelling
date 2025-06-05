%% COMPUTES THE AVERAGE NUMBER OF SURVEYS PER ACTIVITY
% Script to compute Average number of surveys per activity as presented in the Paper " Data Labelling for Free-Living Physical Activity Recognition using Thigh-Worn Wearables and Event-based Ecological Momentary Assessment
%Author:  Luis Sigcha
clc;clear;
%% LOAD DATA
addpath 'functions\'
file_Results6Activities="Results_ALL6activities_0.75threshold_FULL_SURVEY2025-02-12 12-20-27_V3.csv";
df_Results=importfileALL6activities(file_Results6Activities, [2, Inf]);
%% ACTIVITY FILTER <<<<<<<<<<<<<< ------------------------------------UPDATE ACTIVIY HERE
groupSums = grpstats(df_Results, 'file_name', 'sum', 'DataVars', 'number_questionnaires');
mean_surveys = mean((groupSums.sum_number_questionnaires), 'omitnan');
std_surveys = std((groupSums.sum_number_questionnaires), 'omitnan');
fprintf('TOTAL Average number of surveys: %.1f%% (%.1f%%)\n', mean_surveys, std_surveys);
fprintf('\n');

activities = ["sitting", "standing", "walking", "running", "exercising", "cycling"];

for currentPA = activities
    average_number_surveys(df_Results, currentPA)
    fprintf('\n'); %
end

%% CALCULATES AVERAGE NUMBER OF SURVERYS BY THRESHOLD (0 means no filter)
%%Function within a script
function average_number_surveys(df_Results, activity)
% Local function that calculates filtered dataset metrics.
    df_Results=df_Results((df_Results.activity == activity),:); %FILTER usign activity OPTIONS: walking, sitting standing, exercising,...
    groupSums = grpstats(df_Results, 'file_name', 'sum', 'DataVars', 'number_questionnaires');
    mean_surveys = mean((groupSums.sum_number_questionnaires), 'omitnan');
    std_surveys = std((groupSums.sum_number_questionnaires), 'omitnan');
    fprintf(activity);
    fprintf('\n');
    fprintf('Average number of surveys: %.1f%% (%.1f%%)\n', mean_surveys, std_surveys);
end
