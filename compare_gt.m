function compare_gt(P3,T,J,Zcoords_gt,Zdist)
% Compares it with ground truth. 
% Note that there are still 2 unresolvable ambiguities:
% 1. depth direction (i.e. the shape could be "flipped" along the Z axis) -> we test both possibilities
% 2. Z translation                                                        -> we subtract the mean of the Z coords to evaluate reconstruction results
Zcoords_em = P3(2*T+1:3*T,:) - mean(P3(2*T+1:3*T,:),2)*ones(1,J);

Zerror1 = mean( mean(abs(Zcoords_em - Zcoords_gt), 2)./Zdist );
Zerror2 = mean( mean(abs(-Zcoords_em - Zcoords_gt), 2)./Zdist );

if Zerror2 < Zerror1,
   avg_zerror = 100*Zerror2;
   P3(2*T+1:3*T,:) = -(P3(2*T+1:3*T,:) - mean(P3(2*T+1:3*T,:),2)*ones(1,J));
else
   avg_zerror = 100*Zerror1;
   P3(2*T+1:3*T,:) = P3(2*T+1:3*T,:) - mean(P3(2*T+1:3*T,:),2)*ones(1,J);
end
fprintf('Average reconstruction error in Z: %f%%\n', avg_zerror);