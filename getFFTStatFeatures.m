function [ features ] = getFFTStatFeatures( inputs )
% Returns max, min, avg of input streams and cats together
    size = length(inputs(:,1));

    features = [];

    for i=1:size
        cInput = real(inputs{i});
        mmax = max(cInput);
        mmin = min(cInput);
        mmean = mean(cInput);
        msumsqr = sum(cInput.*conj(cInput));
        if isempty(cInput)
            mmax = 0;
            mmin = 0;
            mmean = 0;
            msumsqr = 0;
        end
        features = [features ; [mmax ; mmin ; mmean ; msumsqr]]; 
    end

end

