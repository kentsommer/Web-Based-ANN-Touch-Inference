function [ cOX, cOY, cOZ, cMX, cMY, cMZ, crAlpha, crBeta, crGama, cMGX, cMGY, cMGZ ] = getKeySeq( OX, OY, OZ, MX, MY, MZ, rAlpha, rBeta, rGama, MGX, MGY, MGZ, time )
% Returns sequence of values that are within 150ms of a given time
    windowSize = 600;

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
    
    cOX = [];
    cOY = [];
    cOZ = [];
    cMX = [];
    cMY = [];
    cMZ = [];
    crAlpha = [];
    crBeta = [];
    crGama = [];
    cMGX = [];
    cMGY = [];
    cMGZ = [];

    for OXi=1:OXsize
        ctime = OX(2,OXi);
        if abs(ctime - time) < windowSize/2
           cOX = [cOX, OX(:,OXi)]; 
        end
    end

    for OYi=1:OYsize
        ctime = OY(2,OYi);
        if abs(ctime - time) < windowSize/2
           cOY = [cOY, OY(:,OYi)]; 
        end
    end

    for OZi=1:OZsize
        ctime = OZ(2,OZi);
        if abs(ctime - time) < windowSize/2
           cOZ = [cOZ, OY(:,OZi)]; 
        end
    end

    for MXi=1:MXsize
        ctime = MX(2,MXi);
        if abs(ctime - time) < windowSize/2
           cMX = [cMX, MX(:,MXi)]; 
        end
    end

    for MYi=1:MYsize
        ctime = MY(2,MYi);
        if abs(ctime - time) < windowSize/2
           cMY = [cMY, MY(:,MYi)]; 
        end
    end

    for MZi=1:MZsize
        ctime = MZ(2,MZi);
        if abs(ctime - time) < windowSize/2
           cMZ = [cMZ, MZ(:,MZi)]; 
        end
    end

    for rAlphai=1:rAlphasize
        ctime = rAlpha(2,rAlphai);
        if abs(ctime - time) < windowSize/2
           crAlpha = [crAlpha, rAlpha(:,rAlphai)]; 
        end
    end

    for rBetai=1:rBetasize
        ctime = rBeta(2,rBetai);
        if abs(ctime - time) < windowSize/2
           crBeta = [crBeta, rBeta(:,rBetai)]; 
        end
    end

    for rGamai = 1:rGamasize
        ctime = rGama(2,rGamai);
        if abs(ctime - time) < windowSize/2
           crGama = [crGama, rGama(:,rGamai)]; 
        end
    end

    for MGXi=1:MGXsize
        ctime = MGX(2,MGXi);
        if abs(ctime - time) < windowSize/2
           cMGX = [cMGX, MGX(:,MGXi)]; 
        end
    end

    for MGYi=1:MGYsize
        ctime = MGY(2,MGYi);
        if abs(ctime - time) < windowSize/2
           cMGY = [cMGY, MGY(:,MGYi)]; 
        end
    end

    for MGZi=1:MGZsize
        ctime = MGZ(2,MGZi);
        if abs(ctime - time) < windowSize/2
           cMGZ = [cMGZ, MGZ(:,MGZi)]; 
        end
    end

end

