#include "MAE.hpp"

#include <vector>
#include <cmath>


double MAE::calc_mae(const std::vector<double>& a, const std::vector<double>& b) {
    double sum = 0.0;
    for (size_t i = 0; i < a.size(); ++i) {
        sum += std::abs(a[i] - b[i]);
    }

    return sum / a.size();
}