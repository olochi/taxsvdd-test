% ����KernelMatrix
% ������ɵĺ˾�����KM���汣��

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [KM] = KernelMatrix(TrainMatrix,Sigma)

% ���ѵ������Ĵ�С
[Rows,Columns] = size(TrainMatrix); 
%fprintf(1,'Total %d points in %d dimensions\n',Rows,Columns);

% ����һ����СΪ�����������ͬ��0������
%KM = zeros(Rows,Rows)

% NΪ�˾��������ǵĸ�������Ϊ�˾����ǶԳƵģ�����ֻҪ�������Ǹ�ֵ�Ϳ���
%N = (Rows*Rows-Rows)/2+Rows;
for i=1:Rows
    for j=1:Rows
        s = TrainMatrix(i,:) - TrainMatrix(j,:);
        t = norm(s);
        KM(i,j) = exp(-(t^2)/(Sigma^2));
    end
end
    
    