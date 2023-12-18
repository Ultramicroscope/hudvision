#version 120

// there's probably a much smarter way to do this
#define SENS 0.01 //[0.000 0.005 0.010 0.015 0.020 0.025 0.030 0.035 0.040 0.045 0.050 0.055 0.060 0.065 0.070 0.075 0.080 0.085 0.090 0.095 0.100 0.105 0.110 0.115 0.120 0.125 0.130 0.135 0.140 0.145 0.150 0.155 0.160 0.165 0.170 0.175 0.180 0.185 0.190 0.195 0.200 0.205 0.210 0.215 0.220 0.225 0.230 0.235 0.240 0.245 0.250 0.255 0.260 0.265 0.270 0.275 0.280 0.285 0.290 0.295 0.300 0.305 0.310 0.315 0.320 0.325 0.330 0.335 0.340 0.345 0.350 0.355 0.360 0.365 0.370 0.375 0.380 0.385 0.390 0.395 0.400 0.405 0.410 0.415 0.420 0.425 0.430 0.435 0.440 0.445 0.450 0.455 0.460 0.465 0.470 0.475 0.480 0.485 0.490 0.495 0.500 0.505 0.510 0.515 0.520 0.525 0.530 0.535 0.540 0.545 0.550 0.555 0.560 0.565 0.570 0.575 0.580 0.585 0.590 0.595 0.600 0.605 0.610 0.615 0.620 0.625 0.630 0.635 0.640 0.645 0.650 0.655 0.660 0.665 0.670 0.675 0.680 0.685 0.690 0.695 0.700 0.705 0.710 0.715 0.720 0.725 0.730 0.735 0.740 0.745 0.750 0.755 0.760 0.765 0.770 0.775 0.780 0.785 0.790 0.795 0.800 0.805 0.810 0.815 0.820 0.825 0.830 0.835 0.840 0.845 0.850 0.855 0.860 0.865 0.870 0.875 0.880 0.885 0.890 0.895 0.900 0.905 0.910 0.915 0.920 0.925 0.930 0.935 0.940 0.945 0.950 0.955 0.960 0.965 0.970 0.975 0.980 0.985 0.990 0.995 1.000]
#define R 0.5 //[0.000 0.005 0.010 0.015 0.020 0.025 0.030 0.035 0.040 0.045 0.050 0.055 0.060 0.065 0.070 0.075 0.080 0.085 0.090 0.095 0.100 0.105 0.110 0.115 0.120 0.125 0.130 0.135 0.140 0.145 0.150 0.155 0.160 0.165 0.170 0.175 0.180 0.185 0.190 0.195 0.200 0.205 0.210 0.215 0.220 0.225 0.230 0.235 0.240 0.245 0.250 0.255 0.260 0.265 0.270 0.275 0.280 0.285 0.290 0.295 0.300 0.305 0.310 0.315 0.320 0.325 0.330 0.335 0.340 0.345 0.350 0.355 0.360 0.365 0.370 0.375 0.380 0.385 0.390 0.395 0.400 0.405 0.410 0.415 0.420 0.425 0.430 0.435 0.440 0.445 0.450 0.455 0.460 0.465 0.470 0.475 0.480 0.485 0.490 0.495 0.500 0.505 0.510 0.515 0.520 0.525 0.530 0.535 0.540 0.545 0.550 0.555 0.560 0.565 0.570 0.575 0.580 0.585 0.590 0.595 0.600 0.605 0.610 0.615 0.620 0.625 0.630 0.635 0.640 0.645 0.650 0.655 0.660 0.665 0.670 0.675 0.680 0.685 0.690 0.695 0.700 0.705 0.710 0.715 0.720 0.725 0.730 0.735 0.740 0.745 0.750 0.755 0.760 0.765 0.770 0.775 0.780 0.785 0.790 0.795 0.800 0.805 0.810 0.815 0.820 0.825 0.830 0.835 0.840 0.845 0.850 0.855 0.860 0.865 0.870 0.875 0.880 0.885 0.890 0.895 0.900 0.905 0.910 0.915 0.920 0.925 0.930 0.935 0.940 0.945 0.950 0.955 0.960 0.965 0.970 0.975 0.980 0.985 0.990 0.995 1.000]
#define G 0.5 //[0.000 0.005 0.010 0.015 0.020 0.025 0.030 0.035 0.040 0.045 0.050 0.055 0.060 0.065 0.070 0.075 0.080 0.085 0.090 0.095 0.100 0.105 0.110 0.115 0.120 0.125 0.130 0.135 0.140 0.145 0.150 0.155 0.160 0.165 0.170 0.175 0.180 0.185 0.190 0.195 0.200 0.205 0.210 0.215 0.220 0.225 0.230 0.235 0.240 0.245 0.250 0.255 0.260 0.265 0.270 0.275 0.280 0.285 0.290 0.295 0.300 0.305 0.310 0.315 0.320 0.325 0.330 0.335 0.340 0.345 0.350 0.355 0.360 0.365 0.370 0.375 0.380 0.385 0.390 0.395 0.400 0.405 0.410 0.415 0.420 0.425 0.430 0.435 0.440 0.445 0.450 0.455 0.460 0.465 0.470 0.475 0.480 0.485 0.490 0.495 0.500 0.505 0.510 0.515 0.520 0.525 0.530 0.535 0.540 0.545 0.550 0.555 0.560 0.565 0.570 0.575 0.580 0.585 0.590 0.595 0.600 0.605 0.610 0.615 0.620 0.625 0.630 0.635 0.640 0.645 0.650 0.655 0.660 0.665 0.670 0.675 0.680 0.685 0.690 0.695 0.700 0.705 0.710 0.715 0.720 0.725 0.730 0.735 0.740 0.745 0.750 0.755 0.760 0.765 0.770 0.775 0.780 0.785 0.790 0.795 0.800 0.805 0.810 0.815 0.820 0.825 0.830 0.835 0.840 0.845 0.850 0.855 0.860 0.865 0.870 0.875 0.880 0.885 0.890 0.895 0.900 0.905 0.910 0.915 0.920 0.925 0.930 0.935 0.940 0.945 0.950 0.955 0.960 0.965 0.970 0.975 0.980 0.985 0.990 0.995 1.000]
#define B 0.5 //[0.000 0.005 0.010 0.015 0.020 0.025 0.030 0.035 0.040 0.045 0.050 0.055 0.060 0.065 0.070 0.075 0.080 0.085 0.090 0.095 0.100 0.105 0.110 0.115 0.120 0.125 0.130 0.135 0.140 0.145 0.150 0.155 0.160 0.165 0.170 0.175 0.180 0.185 0.190 0.195 0.200 0.205 0.210 0.215 0.220 0.225 0.230 0.235 0.240 0.245 0.250 0.255 0.260 0.265 0.270 0.275 0.280 0.285 0.290 0.295 0.300 0.305 0.310 0.315 0.320 0.325 0.330 0.335 0.340 0.345 0.350 0.355 0.360 0.365 0.370 0.375 0.380 0.385 0.390 0.395 0.400 0.405 0.410 0.415 0.420 0.425 0.430 0.435 0.440 0.445 0.450 0.455 0.460 0.465 0.470 0.475 0.480 0.485 0.490 0.495 0.500 0.505 0.510 0.515 0.520 0.525 0.530 0.535 0.540 0.545 0.550 0.555 0.560 0.565 0.570 0.575 0.580 0.585 0.590 0.595 0.600 0.605 0.610 0.615 0.620 0.625 0.630 0.635 0.640 0.645 0.650 0.655 0.660 0.665 0.670 0.675 0.680 0.685 0.690 0.695 0.700 0.705 0.710 0.715 0.720 0.725 0.730 0.735 0.740 0.745 0.750 0.755 0.760 0.765 0.770 0.775 0.780 0.785 0.790 0.795 0.800 0.805 0.810 0.815 0.820 0.825 0.830 0.835 0.840 0.845 0.850 0.855 0.860 0.865 0.870 0.875 0.880 0.885 0.890 0.895 0.900 0.905 0.910 0.915 0.920 0.925 0.930 0.935 0.940 0.945 0.950 0.955 0.960 0.965 0.970 0.975 0.980 0.985 0.990 0.995 1.000]
#define INVERT

// there's probably a much smarter way to do this
#ifdef INVERT
#define C 1 - curr
#else
#define C curr
#endif

varying vec2 texCoord;

uniform sampler2D gcolor;
uniform sampler2D gaux4;

const vec4 still = vec4(R, G, B, 1.0);

void main() {
    vec4 curr = texture2D(gaux4, texCoord);
    vec4 prev = texture2D(gcolor, texCoord);
    vec3 d = abs(curr.rgb - prev.rgb);
    float avg = (d.r + d.g + d.b) / 3.0;
    gl_FragData[0] = avg > SENS ? C : still;
}