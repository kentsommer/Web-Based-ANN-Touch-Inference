clear all; close all; clc;
format long g;

% Setup and get data
[ OX, OY, OZ, MX, MY, MZ, rAlpha, rBeta, rGama, MGX, MGY, MGZ, KEYS ] = getData();
inputs = getFeatureVectors( OX, OY, OZ, MX, MY, MZ, rAlpha, rBeta, rGama, MGX, MGY, MGZ, KEYS);
targets = getTargetVectors(KEYS);

%TRAIN
net = patternnet([1000], 'traingd');
net.trainParam.max_fail = 10;
net.performFcn = 'crossentropy';
net.trainParam.epochs = 30000;
% Setup Division of Data for Training, Validation, Testing % For a list of all data division functions type: help nndivide 
net.divideFcn = 'dividerand'; % Divide data randomly 
net.divideMode = 'sample'; % Divide up every sample 
net.divideParam.trainRatio = 75/100; 
net.divideParam.valRatio = 15/100; 
net.divideParam.testRatio = 15/100;
[net, tr] = train(net, inputs, targets, 'useGPU','yes');

disp('after training')

% Show Results
outputs = net(inputs, 'useGPU','yes');
errors = gsubtract(targets,outputs); 
performance = perform(net,targets,outputs);

trainTargets = targets .* tr.trainMask{1};      
valTargets = targets  .* tr.valMask{1};      
testTargets = targets  .* tr.testMask{1};     
trainPerformance = perform(net,trainTargets,outputs);
valPerformance = perform(net,valTargets,outputs);
testPerformance = perform(net,testTargets,outputs);

trOut = outputs(tr.trainInd);
vOut = outputs(tr.valInd);
tsOut = outputs(tr.testInd);
trTarg = outputs(tr.trainInd);
vTarg = outputs(tr.valInd);
tsTarg = outputs(tr.testInd);
plotregression(trTarg,trOut,'Train',vTarg,vOut,'Validation',...
tsTarg,tsOut,'Testing')

testInputs = inputs(:, tr.testInd);
testTargets = targets(:, tr.testInd);
testOutputs = net(testInputs, 'useGPU','yes');
figure, plotconfusion(testTargets, testOutputs);
[c,cm] = confusion(testTargets,testOutputs);
fprintf('Percentage Correct Classification   : %f%%\n', 100*(1-c));
fprintf('Percentage Incorrect Classification : %f%%\n', 100*c);

