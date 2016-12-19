function [ OX, OY, OZ, MX, MY, MZ, rAlpha, rBeta, rGama, MGX, MGY, MGZ ] = getDerivative( OX, OY, OZ, MX, MY, MZ, rAlpha, rBeta, rGama, MGX, MGY, MGZ )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


for i= length(OX(1,:)):-1:1
    if i > 1
        OX(1,i) = OX(1,i) - OX(1,i-1);
    end
end

for i= length(OY(1,:)):-1:1
    if i > 1
        OY(1,i) = OY(1,i) - OY(1,i-1);
    end
end

for i= length(OZ(1,:)):-1:1
    if i > 1
        OZ(1,i) = OZ(1,i) - OZ(1,i-1);
    end
end

for i= length(MX(1,:)):-1:1
    if i > 1
        MX(1,i) = MX(1,i) - MX(1,i-1);
    end
end

for i= length(MY(1,:)):-1:1
    if i > 1
        MY(1,i) = MY(1,i) - MY(1,i-1);
    end
end

for i= length(MZ(1,:)):-1:1
    if i > 1
        MZ(1,i) = MZ(1,i) - MZ(1,i-1);
    end
end

for i= length(rAlpha(1,:)):-1:1
    if i > 1
        rAlpha(1,i) = rAlpha(1,i) - rAlpha(1,i-1);
    end
end

for i= length(rBeta(1,:)):-1:1
    if i > 1
        rBeta(1,i) = rBeta(1,i) - rBeta(1,i-1);
    end
end

for i= length(rGama(1,:)):-1:1
    if i > 1
        rGama(1,i) = rGama(1,i) - rGama(1,i-1);
    end
end

for i= length(MGX(1,:)):-1:1
    if i > 1
        MGX(1,i) = MGX(1,i) - MGX(1,i-1);
    end
end

for i= length(MGY(1,:)):-1:1
    if i > 1
        MGY(1,i) = MGY(1,i) - MGY(1,i-1);
    end
end

for i= length(MGZ(1,:)):-1:1
    if i > 1
        MGZ(1,i) = MGZ(1,i) - MGZ(1,i-1);
    end
end

OX = OX(:,2:end);
OY = OY(:,2:end);
OZ = OZ(:,2:end);

MX = MX(:,2:end);
MY = MY(:,2:end);
MZ = MZ(:,2:end);

rAlpha = rAlpha(:,2:end);
rBeta = rBeta(:,2:end);
rGama = rGama(:,2:end);

MGX = MGX(:,2:end);
MGY = MGY(:,2:end);
MGZ = MGZ(:,2:end);

end

