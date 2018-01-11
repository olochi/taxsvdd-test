% 函数KernelMatrix
% 最后生成的核矩阵在KM里面保存

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [KM] = KernelMatrix(TrainMatrix,Sigma)

% 求解训练矩阵的大小
[Rows,Columns] = size(TrainMatrix); 
%fprintf(1,'Total %d points in %d dimensions\n',Rows,Columns);

% 生成一个大小为样本点个数相同的0方阵列
%KM = zeros(Rows,Rows)

% N为核矩阵上三角的个数，因为核矩阵是对称的，所以只要给上三角赋值就可了
%N = (Rows*Rows-Rows)/2+Rows;
for i=1:Rows
    for j=1:Rows
        s = TrainMatrix(i,:) - TrainMatrix(j,:);
        t = norm(s);
        KM(i,j) = exp(-(t^2)/(Sigma^2));
    end
end
    
    