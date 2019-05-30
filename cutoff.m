function k= cutoff(sigma,p)
%KANE NORMAN (SMU)


%Inputs
    %sigma: an array that contains the diagonal elements of matrix S (ie.sigma1,sigma2......sigmaN)
    %p:constant where 0<p<1
%Outputs
    %k: constant where 1=<k=<N. (locates sigma_k)  

    
    
%Sum up all the elements of the denominator i.e. (sigma1^2,sigma2^2,...sigmaN^2)
denominator=0;
for i=1:length(sigma)
    denominator=denominator+sigma(i)^2;
end
%deominator now equals (sigma1^2+sigma2^2+......sigmaN^2)

numerator=0;
k=1;%start at k=1 since we want to test all the value between 1 and N
   
while numerator<(p^2)*denominator %Use a while loop. Break loop once we find the minimum value of k
    numerator=numerator+sigma(k)^2;
   k=k+1;
end
    
    
  

