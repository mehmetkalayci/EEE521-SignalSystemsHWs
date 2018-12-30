function [result, dailyDoses] = calcDoseAmountIteratively(days, a, b)
    doseAmount(1) = a;
    for i=2:days
        doseAmount(i) = (a + (b * doseAmount(i-1)))
    end
    result = sum(doseAmount);
    dailyDoses = doseAmount;
end