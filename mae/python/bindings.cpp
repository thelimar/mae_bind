#include "mae.hpp"

#include <pybind11/pybind11.h>
#include <pybind11/stl.h>

namespace py = pybind11;

PYBIND11_MODULE(mae, m) {
  m.doc() = R"doc(
    Python bindings for MAE calculation
  )doc";

  py::class_<MAE>(m, "MAE")
      .def_static("calc_mae", &MAE::calc_mae, R"doc(
          Calculate MAE between two vectors
      )doc");
}