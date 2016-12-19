function [ featureVecs ] = getFeatureVectors( OX, OY, OZ, MX, MY, MZ, rAlpha, rBeta, rGama, MGX, MGY, MGZ, KEYS )
% Returns an array of featureVectors (one for every press)

keysize = length(KEYS(1,:));
featureVecs = [];

for i=1:keysize
    disp(i)
    ctime = KEYS(2,i);
    [cOX, cOY, cOZ, cMX, cMY, cMZ, crAlpha, crBeta, crGama, cMGX, cMGY, cMGZ] = getKeySeq(OX, OY, OZ, MX, MY, MZ, rAlpha, rBeta, rGama, MGX, MGY, MGZ, ctime);
    
    [cOX, cOY, cOZ, cMX, cMY, cMZ, crAlpha, crBeta, crGama, cMGX, cMGY, cMGZ] = processData(cOX, cOY, cOZ, cMX, cMY, cMZ, crAlpha, crBeta, crGama, cMGX, cMGY, cMGZ);
    
    [ cfftOX, cfftOY, cfftOZ, cfftMX, cfftMY, cfftMZ, cfftrAlpha, cfftrBeta, cfftrGama, cfftMGX, cfftMGY, cfftMGZ ] = getFFT( cOX, cOY, cOZ, cMX, cMY, cMZ, crAlpha, crBeta, crGama, cMGX, cMGY, cMGZ );
    
    [ cDOX, cDOY, cDOZ, cDMX, cDMY, cDMZ, cDrAlpha, cDrBeta, cDrGama, cDMGX, cDMGY, cDMGZ] = getDerivative(cOX, cOY, cOZ, cMX, cMY, cMZ, crAlpha, crBeta, crGama, cMGX, cMGY, cMGZ);
    
    [cDAMX, cDAMY, cDAMZ] = normalizeLengthD(cDMX, cDMY, cDMZ);
    cDAC = getDAC(cDAMX, cDAMY, cDAMZ);
   
    
    
    [corOX, corOY, corOZ, corMX, corMY, corMZ, corrAlpha, corrBeta, corrGama, corMGX, corMGY, corMGZ] = normalizeLength(cOX, cOY, cOZ, cMX, cMY, cMZ, crAlpha, crBeta, crGama, cMGX, cMGY, cMGZ);
    
    if length(cDAC) == 0
       cDACStatFeatures = [0 ; 0 ; 0 ; 0 ; 0 ; 0];
       disp('issue with cDAC feature vector')
    else
       cDACStatFeatures = getStatFeatures({cDAC(1,:)});
    end
    cStatFeatures = getStatFeatures({cOX(1,:) ; cOY(1,:) ; cOZ(1,:) ; cMX(1,:) ; cMY(1,:) ; cMZ(1,:) ; crAlpha(1,:) ; crBeta(1,:) ; crGama(1,:) ; cMGX(1,:) ; cMGY(1,:) ; cMGZ(1,:)});
    cDStatFeatures = getStatFeatures({cDOX(1,:) ; cDOY(1,:) ; cDOZ(1,:) ; cDMX(1,:) ; cDMY(1,:) ; cDMZ(1,:) ; cDrAlpha(1,:) ; cDrBeta(1,:) ; cDrGama(1,:) ; cDMGX(1,:) ; cDMGY(1,:) ; cDMGZ(1,:)});
    cCorFeatures = getCorrelationFeatures({corOX(1,:) ; corOY(1,:) ; corOZ(1,:) ; corMX(1,:) ; corMY(1,:) ; corMZ(1,:) ; corrAlpha(1,:) ; corrBeta(1,:) ; corrGama(1,:) ; corMGX(1,:) ; corMGY(1,:) ; corMGZ(1,:)});
    
    cfftStatFeatures = getFFTStatFeatures({ cfftOX(1,:) ; cfftOY(1,:) ; cfftOZ(1,:) ; cfftMX(1,:) ; cfftMY(1,:) ; cfftMZ(1,:) ; cfftrAlpha(1,:) ; cfftrBeta(1,:) ; cfftrGama(1,:) ; cfftMGX(1,:) ; cfftMGY(1,:) ; cfftMGZ(1,:)});
    
    featureVecs = [featureVecs, [cStatFeatures ; cDStatFeatures ; cDACStatFeatures ; cfftStatFeatures ; cCorFeatures]];
end


end

