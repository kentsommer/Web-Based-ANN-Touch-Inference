function [ features ] = getCorrelationFeatures( inputs )
% Returns correlation features
    
    ori = [inputs{1} ; inputs{2} ; inputs{3}];
    acc = [inputs{4} ; inputs{5} ; inputs{6}];
    rotR = [inputs{7} ; inputs{8} ; inputs{9}];
    accG = [inputs{10} ; inputs{11} ; inputs{12}];
    
    size = 3;
    
    features = [];

    for i=1:size
        cori = ori(i,:);
        cacc = acc(i,:);
        crotR = rotR(i,:);
        caccG = accG(i,:);
        
        cov1 = cov(cori, cacc);
        cov2 = cov(cori, crotR);
        cov3 = cov(cori, caccG);
        cov4 = cov(cacc, caccG);
        cov5 = cov(cacc, crotR);
        cov6 = cov(caccG, crotR);
        
        R1 = cov1(1,2) / sqrt(cov1(1,1) * cov1(2,2));
        R2 = cov2(1,2) / sqrt(cov2(1,1) * cov2(2,2));
        R3 = cov3(1,2) / sqrt(cov3(1,1) * cov3(2,2));
        R4 = cov4(1,2) / sqrt(cov4(1,1) * cov4(2,2));
        R5 = cov5(1,2) / sqrt(cov5(1,1) * cov5(2,2));
        R6 = cov6(1,2) / sqrt(cov6(1,1) * cov6(2,2));
        
        if isnan(R1)
           R1 = 0; 
        end
        if isnan(R2)
           R2 = 0; 
        end
        if isnan(R3)
           R3 = 0; 
        end
        if isnan(R4)
           R4 = 0; 
        end
        if isnan(R5)
           R5 = 0; 
        end
        if isnan(R6)
           R6 = 0; 
        end
        
        features = [features ; [R1 ; R2 ; R3 ; R4 ; R5 ; R6]]; 
    end

end

