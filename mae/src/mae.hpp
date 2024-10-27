#pragma once
#include <vector>

class MAE {
public:
    static double calc_mae(const std::vector<double> &a, const std::vector<double> &b);
};