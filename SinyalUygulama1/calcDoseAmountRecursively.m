function recResult = calcDoseAmountRecursively(days, a, b)
    if days <=1
        recResult = a;
    else
        recResult = (a + calcDoseAmountRecursively(days-1, a, b) * (b/days)) * days;
    end
end