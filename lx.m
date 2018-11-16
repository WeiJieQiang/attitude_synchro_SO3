function L = lx(x)
    angle = norm(x);
    if angle == 0
        L = eye(3,3);
    else
        axis = x/angle;
        L = eye(3,3) + 0.5*hat(x) + ( 1 - mysinc(angle)/(mysinc(0.5*angle)*mysinc(0.5*angle)) )*hat(axis)*hat(axis);
    end
end