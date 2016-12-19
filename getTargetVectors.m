function [ targetVecs ] = getTargetVectors( KEYS )
% Returns training targets in form 9xSampleSize with 1 in place of correct
% digit
size = length(KEYS);
targetVecs = zeros(10,size);
keylist = KEYS(1,:);

for i=1:size
   targetVecs(keylist(i)+1, i) = 1;
end


end

