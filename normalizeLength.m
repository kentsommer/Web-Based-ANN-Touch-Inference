function [ cOX, cOY, cOZ, cMX, cMY, cMZ, crAlpha, crBeta, crGama, cMGX, cMGY, cMGZ ] = normalizeLength( OX, OY, OZ, MX, MY, MZ, rAlpha, rBeta, rGama, MGX, MGY, MGZ )
% Make inputs all the same length by trimming longer inputs
    OXsize = length(OX(1,:));
    OYsize = length(OY(1,:));
    OZsize = length(OZ(1,:));
    MXsize = length(MX(1,:));
    MYsize = length(MY(1,:));
    MZsize = length(MZ(1,:));
    rAlphasize = length(rAlpha(1,:));
    rBetasize = length(rBeta(1,:));
    rGamasize = length(rGama(1,:));
    MGXsize = length(MGX(1,:));
    MGYsize = length(MGY(1,:));
    MGZsize = length(MGZ(1,:));
    
    targetSize = min([OXsize, OYsize, OZsize, MXsize, MYsize, MZsize, rAlphasize, rBetasize, rGamasize, MGXsize, MGYsize, MGZsize]);

    cOX = OX;
    if OXsize > targetSize
        dif = OXsize - targetSize;
        cOX = OX(:,1:end-dif);
    end
    
    cOY = OY;
    if OYsize > targetSize
        dif = OYsize - targetSize;
        cOY = OY(:,1:end-dif);
    end
    
    cOZ = OZ;
    if OZsize > targetSize
        dif = OZsize - targetSize;
        cOZ = OZ(:,1:end-dif);
    end
    
    cMX = MX;
    if MXsize > targetSize
        dif = MXsize - targetSize;
        cMX = MX(:,1:end-dif);
    end
    
    cMY = MY;
    if MYsize > targetSize
        dif = MYsize - targetSize;
        cMY = MY(:,1:end-dif);
    end
    
    cMZ = MZ;
    if MZsize > targetSize
        dif = MZsize - targetSize;
        cMZ = MZ(:,1:end-dif);
    end
    
    crAlpha = rAlpha;
    if rAlphasize > targetSize
        dif = rAlphasize - targetSize;
        crAlpha = rAlpha(:,1:end-dif);
    end
    
    crBeta = rBeta;
    if rBetasize > targetSize
        dif = rBetasize - targetSize;
        crBeta = rBeta(:,1:end-dif);
    end
    
    crGama = rGama;
    if rGamasize > targetSize
        dif = rGamasize - targetSize;
        crGama = rGama(:,1:end-dif);
    end
    
    cMGX = MGX;
    if MGXsize > targetSize
        dif = MGXsize - targetSize;
        cMGX = MGX(:,1:end-dif);
    end
    
    cMGY = MGY;
    if MGYsize > targetSize
        dif = MGYsize - targetSize;
        cMGY = MGY(:,1:end-dif);
    end
    
    cMGZ = MGZ;
    if MGZsize > targetSize
        dif = MGZsize - targetSize;
        cMGZ = MGZ(:,1:end-dif);
    end
    
end
