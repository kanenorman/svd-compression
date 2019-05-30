function img_compress
%KANE NORMAN
%SOUTHERN METHODIST UNIVERSITY



A=imread('image.jpg'); % modify accordingly 
X = double(rgb2gray(A));
X0=X; % save the original image

[Z,ratio]=svdcompress(X0,8,.9);
figure
colormap('gray');
   label=sprintf('SVD compression: ratio=%8.4f,error=%8.4f',ratio,norm(Z-X0,'fro')/norm(X0,'fro'));
   imagesc(Z); title(label);