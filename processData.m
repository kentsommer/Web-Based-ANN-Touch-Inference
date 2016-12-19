function [ outOX, outOY, outOZ, outMX, outMY, outMZ, outrAlpha, outrBeta, outrGama, outMGX, outMGY, outMGZ ] = processData( OX, OY, OZ, MX, MY, MZ, rAlpha, rBeta, rGama, MGX, MGY, MGZ )
% Subtract first val from every value along 1st row

outOX = [bsxfun(@minus,OX(1,2:end),OX(1,1));OX(2,2:end)];
outOY = [bsxfun(@minus,OY(1,2:end),OY(1,1));OY(2,2:end)];
outOZ = [bsxfun(@minus,OZ(1,2:end),OZ(1,1));OZ(2,2:end)];

outMX = [bsxfun(@minus,MX(1,2:end),MX(1,1));MX(2,2:end)];
outMY = [bsxfun(@minus,MY(1,2:end),MY(1,1));MY(2,2:end)];
outMZ = [bsxfun(@minus,MZ(1,2:end),MZ(1,1));MZ(2,2:end)];

outrAlpha = [bsxfun(@minus,rAlpha(1,2:end),rAlpha(1,1));rAlpha(2,2:end)];
outrBeta = [bsxfun(@minus,rBeta(1,2:end),rBeta(1,1));rBeta(2,2:end)];
outrGama = [bsxfun(@minus,rGama(1,2:end),rGama(1,1));rGama(2,2:end)];

outMGX = [bsxfun(@minus,MGX(1,2:end),MGX(1,1));MGX(2,2:end)];
outMGY = [bsxfun(@minus,MGY(1,2:end),MGY(1,1));MGY(2,2:end)];
outMGZ = [bsxfun(@minus,MGZ(1,2:end),MGZ(1,1));MGZ(2,2:end)];

end

