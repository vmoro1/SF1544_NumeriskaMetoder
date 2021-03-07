function value = funktion(x)
    v_max = 25;
    distance = 75;
    k = v_max/distance;
    if x <= distance && x > 0
        value = k*x;
    elseif x <= 0
        value = 0;
    else
        value = v_max;
    end
end