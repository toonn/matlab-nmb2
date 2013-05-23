function [ c ] = kkb_spline( t, x, f )
%KKB_SPLINE Bereken coefficienten voor een B-spline
%kleinstekwadratenbenadering van f.
%   t = knooppuntenrij voor de B-splines
%   x = abscissen waarin f geevalueerd is (x elem. van [t(1), t(end)])
%   f = matrix van functiewaarden in de abscissen van d functies

    function [ M ] = bsplines( t, x )
        % Stel de matrix M op met daarin n+k B-spline functies geevalueerd in de
        % abscissen  x.
        orde = 4; % k+1 (k == 3)
        nplusk = length(t) - 3;
        
        % Zoek in welk interval elke x zich bevindt.
        J = zeros(length(x), 1);
        for i = 1:length(x)
            for j = 4:length(t)-4
               if x(i) >= t(j)
                   J(i) = j;
               else
                   break;
               end
            end
        end
        
        % Initialiseer M op de juiste plaatsen met Nj,1(x) = 1
        M = zeros(length(x), nplusk);
        for i = 1:length(J)
            M(i,J(i)) = 1;
        end
       
        % Pas voor iedere x de 'efficiente evaluatie' van de B-splines toe.
        % Dit is gebaseerd op de recursie-betrekking voor B-splines,
        % het stelt ongeveer het omgekeerde op van de driehoekige tabel van de Boor.
        for i = 1:length(x)
            for k = 1:orde-1
                for l = 0:k
                    M(i,J(i)+l-k) = ...
                        (x(i) - t(J(i)+l-k)) / (t(J(i)+l) - t(J(i)+l-k))...
                            * M(i,J(i)+l-k) ...
                        + (t(J(i)+l+1) - x(i)) / (t(J(i)+l+1) - t(J(i)+l-k+1))...
                            * M(i,J(i)+l-k+1);
                end
            end
        end
    end

    M = bsplines(t, x);
    % Los c op uit: f = Mc
    c = M\f;

end

