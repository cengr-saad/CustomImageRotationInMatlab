function [new] = rotate(mat, angle)
w = size(mat,2);
h = size(mat,1);
if angle<90
    nw = abs(round((w * cosd(angle))+(h * sind(angle))));
    nh = abs(round((h * cosd(angle))+(w * sind(angle))));
end
if angle==90
    nh = size(mat,2);
    nw = size(mat,1);
end
if angle>90
    nw = abs(round((w * cosd(angle-90))+(h * sind(angle-90))));
    nh = abs(round((h * cosd(angle-90))+(w * sind(angle-90))));
end

X = [cosd(angle) -sind(angle); sind(angle) cosd(angle)];
new = nan(nh, nw);
size(mat);
new_center = round(((size(new)))/2)';
mat_center = round(((size(mat)))/2)';
for i=1 : size(new,1)
    for j=1 : size(new,2)
        coord = [i;j];
        r_coord = round((inv(X))*(coord-new_center)+mat_center);
        if (((r_coord(1))<1) && ((r_coord(2))<1))
            new(coord(1), coord(2)) = nan;
        elseif r_coord(1)<1
            r_coord(1)=1;
        elseif r_coord(2)<1
            r_coord(2)=1;
        elseif r_coord(1)>size(mat,1)
            new(coord(1), coord(2)) = nan;
        elseif r_coord(2)>size(mat,2)
            new(coord(1), coord(2)) = nan;
        else
            new(coord(1), coord(2)) = uint8(mat(r_coord(1), r_coord(2)));
        end
    end
end
% size_mat = size(mat);
% center = round(size_mat/2);
% for i=1 : size(mat,1)
%     for j=1 : size(mat,2)
%         coord = [i;j];
%         r_coord = round(X*coord);
%         if r_coord(1)<1
%             r_coord(1)=1;
%         end
%         if r_coord(2)<1
%             r_coord(2)=1;
%         end
%         if r_coord(1)>size(mat,1)
%             r_coord(1)=size(mat,1);
%         end
%         if r_coord(2)>size(mat,2)
%             r_coord(2)=size(mat,2);
%         end
%         new(r_coord(1), r_coord(2)) = uint8(mat(coord(1), coord(2)));
%     end
% end
