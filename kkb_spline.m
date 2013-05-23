function [ c ] = kkb_spline( t, x, f )
%KKB_SPLINE Bereken coefficienten voor een B-spline
%kleinstekwadratenbenadering van f.
%   t = knooppuntenrij voor de B-splines
%   x = abscissen waarin f geevalueerd is (x elem. van [t(1), t(end)])
%   f = matrix van functiewaarden in de abscissen van d functies

    function [ M ] = bsplines( t, x )
        orde = 4; % k+1 (k == 3)
        nplusk = length(t) - 3;
        
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
        
        M = zeros(length(x), nplusk);
        for i = 1:length(J)
            M(i,J(i)) = 1;
        end
       
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
    c = M\f;

end

