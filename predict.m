function out = predict(KM,testMatrix,SV,alpha,kesi)
[Row Col] = size(alpha);
L = Col;

TM = [testMatrix' SV']';
TM = KernelMatrix(TM,kesi);

[tR tC] = size(testMatrix);
[sR sC] = size(SV);

% fprintf(1,'֧�������㹲�� %d ��\n',sR);

alph_i = zeros(1,sR);

sub1 = 0;
ii = 0;
for i=1:L
    if (alpha(i)>0)
        ii = ii+1;
        alph_i(ii) = alpha(i);
    end
    
    for j=1:L
        if ((alpha(i)>0)&&(alpha(j)>0))
            sub1 = sub1 + alpha(i) * alpha(j) * KM(i,j);
        end
    end
end

out = zeros(1,tR);
for i=1:tR
    sub2 = 0;
    for j=1:sR
        sub2 = sub2 + alph_i(j) * TM(i,tR+j);%tR+j��ʾ��j��֧��������i��ʾ��i�����������������ܹ���tR��
    end
    sub2 = sqrt(1 -2 * sub2 + sub1);
    out(i) = sub2;
end

end
        
