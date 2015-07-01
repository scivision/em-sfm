function input_handler(fn,writeimg,use_lds,max_em_iter)
load(fn,'P3_gt')
[T, J] = size(P3_gt); T = T/3; %#ok<NODEF>

% 2D motion resulting from orthographic projection (Eq (1))
p2_obs = P3_gt(1:2*T, :);

% runs the non-rigid structure from motion algorithm
tol = 0.0001;
K = 2; % number of deformation shapes
Zcoords_gt = P3_gt(2*T+1:3*T,:) - mean(P3_gt(2*T+1:3*T,:),2)*ones(1,J);
Zdist = max(Zcoords_gt,[],2) - min(Zcoords_gt,[],2); % size of the 3D shape along the Z axis for each time frame
MD = zeros(T,J);

tic
[P3, S_hat, V, RO, Tr, Z] = em_sfm(p2_obs, MD, K, use_lds, tol, max_em_iter);
disp([num2str(toc,'%.1f'), ' sec to run SfM'])

compare_gt(P3,T,J,Zcoords_gt,Zdist)

vis_reconstruction(P3_gt, P3, writeimg);

end %function