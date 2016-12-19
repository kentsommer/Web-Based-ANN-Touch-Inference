function [ cMX, cMY, cMZ ] = normalizeLengthD( MX, MY, MZ )
% Make inputs all the same length by trimming longer inputs
    MXsize = length(MX(1,:));
    MYsize = length(MY(1,:));
    MZsize = length(MZ(1,:));
    
    targetSize = min([MXsize, MYsize, MZsize]);
    
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
    
end

