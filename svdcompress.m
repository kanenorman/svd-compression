function [Z,ratio]= svdcompress(X,b,p)
%KANE NORMAN (SMU)


%Inputs
    %X = image to be compressed
    %b = desired block size
    %p = constant between 0 and 1
 %Outputs
    %Z=new compressed image
    %ratio= compression ratio
    
    [m,n]=size(X);%m:#of rows, n:#of columns
    r1=mod(m,b);%residual on the bottom of the image
    r2=mod(n,b);%residual on the right of the image
    
Z=X; %Store X as Z. We will then return Z as a compressed image of A.

elements=(n*r1)+(m*r2)-(r1*r2);%this is a variable that will store the number of elements in z. 
%We go ahead an initalize it by giviing it the value of the residual area.

%Here we will use a nested for loop to loop to break X into bxb blocks
for i=1:b:m-b%We will start from row one and then skip to row b+1. We set the end parameter to be m-b to prevent overshooting the matirix dimensions
    for j=1:b:n-b
         A=X(i:i+(b-1),j:j+(b-1)); %We break a bxb block out of the matrix X
         
         
   
  
         [U,S,V]=svd(A);% Compute the SVD of that bxb block
            sigma=diag(S);%create the array sigma. This holds the values sigma1,sigma2,..sigmaN of the SVD
            k=cutoff(sigma,p);%Call our cutoff funtion to give us our minimum k
          
                %when k>=b/2 use A instead of Ak for efficency
                if k>=b/2
              
                  elements=elements+(b^2);%Here we are updating the number of elements in Z. Since A is a bxb matrix there are b^2 elements
                else
                A=U(:,1:k)*S(1:k,1:k)*V(:,1:k)';%If we opt to use Ak for efficency
                elements=elements+k*(2*b+1);%Here we are updating the number of elements in Z. The number of scalars needed to define Ak is k(2b+ 1).
                end    
             
                
   Z(i:i+(b-1),j:j+(b-1))=A;% assign that bxb block to the corresponding location of matrix Z.           
    end  
end




ratio=elements/(m*n); %return ratio i.e elements in Z/elements in X








