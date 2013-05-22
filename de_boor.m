function [ z ] = de_boor( t, c, y )
%DE_BOOR Summary of this function goes here
%   Detailed explanation goes here

    function [ zed ] = db( t, d, x, j, k)
        for r = 1:k
            for l = k+1:-1:r+1
                i = j-4+l;
                alpha = (x - t(i)) / (t(i+k+1-r) - t(i));
                d(l) = alpha * d(l) + (1-alpha) * d(l-1);
            end
        end
        
        zed = d(4);
    end

    z = zeros(size(y,1), size(c,2));
    for w = 1:size(c,2)
        for n = 1:size(y,1)
            for j = 4:length(t)-4
                if y(n) < t(j+1) || (y(n) == t(j+1) && j+1 == length(t)-3)
                    z(n,w) = db(t, c(j-3:j,w), y(n), j, 3);
                    break; 
                end
            end
        end
    end
end

