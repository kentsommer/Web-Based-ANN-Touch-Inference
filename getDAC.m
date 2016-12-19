function [ DAC ] = getDAC( DMX, DMY, DMZ )
% Euclidean distance between consecutive readings
DAC= [];

for i=1:length(DMX(1,:))
    if i > 1
        Ci = sqrt(DMX(1,i)^2 + DMY(1,i)^2 + DMZ(1,i)^2);
        DAC = [DAC, [Ci;DMY(2,i)]];
    end
end


end

