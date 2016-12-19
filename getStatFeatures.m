function [ features ] = getStatFeatures( inputs )
% Returns max, min, avg of input streams and cats together
size = length(inputs(:,1));

features = [];

for i=1:size
    cInput = inputs{i};
    skw = skewness(cInput);
    krt = kurtosis(cInput);
    mmax = max(cInput);
    mmin = min(cInput);
    mmean = mean(cInput);
    msumsqr = sumsqr(cInput);
    if isnan(skw)
       skw = 0; 
    end
    if isnan(krt)
       krt = 0; 
    end
    if isempty(cInput)
       mmax = 0;
       mmin = 0;
       mmean = 0;
       msumsqr = 0;
    end
    features = [features ; [mmax ; mmin ; mmean ; msumsqr ; skw ; krt]]; 
end

end