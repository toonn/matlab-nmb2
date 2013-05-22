function [ y ] = periotrig( x, K, M )
%PERIOTRIG Evaluatie van periodieke interpolerende en benaderende veeltermen.
%   Deze functie evalueert benaderende veeltermen van de reeksen in de
%   kolommen van 'x' in 'M' punten... blabla aanvullen

N = size(x,1);
d = size(x,2);

X = fft(x);

Yhalf = zeros(M/2+1,d);
if K == N/2
    Yhalf(N/2 + 1, :) = M/(2*N) * X(N/2 + 1, :);
    K = K-1; % K==N/2 mag niet meer in de for lus voorkomen
end

for k = 0:K
    % (k+1) omdat matlab index vanaf 1 begint
    Yhalf(k+1,:) = M/N * X(k+1,:);
end


% Niet nodig omdat we beginnen van Y = zeros()
%for k = N/2 + 2:M
%    Yhalf(k,i) = 0;
%end

% Combine Yhalf and  the 'symmetric' part conj(Yhalf) into Y
Y = [Yhalf; conj(flipud(Yhalf(2:M/2,:)))];

y = ifft(Y);

end

