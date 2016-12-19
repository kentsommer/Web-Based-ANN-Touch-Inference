clear all; close all; clc;
format long g;
load('savedNET.mat'); % Load Neural Network Weights and data

testInputs = inputs(:, tr.testInd);
testTargets = targets(:, tr.testInd);
testOutputs = net(testInputs, 'useGPU','yes');
[c,cm] = confusion(testTargets,testOutputs);
fprintf('Percentage Correct Classification   : %f%%\n', 100*(1-c));
fprintf('Percentage Incorrect Classification : %f%%\n', 100*c);
figure, plotconfusion(testTargets, testOutputs);