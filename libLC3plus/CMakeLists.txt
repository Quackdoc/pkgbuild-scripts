cmake_minimum_required(VERSION 3.9)

project(lc3plus_floatpoint
	    VERSION 1.3.6
	    DESCRIPTION "LC3plus floatpoint library"
	    HOMEPAGE_URL "https://www.iis.fraunhofer.de/en/ff/amm/communication/lc3.html"
	    LANGUAGES C)

add_definitions(-DWMOPS=0 -DDONT_COUNT_MEM)

add_library(LC3plus SHARED
    adjust_global_gain.c
    al_fec_fl.c
    apply_global_gain.c
    ari_codec.c
    attack_detector.c
    CMakeLists.txt
    codec_exe.c
    constants.c
    cutoff_bandwidth.c
    dct4.c
    dec_entropy.c
    dec_lc3_fl.c
    detect_cutoff_warped.c
    enc_entropy.c
    enc_lc3_fl.c
    estimate_global_gain.c
    fft.c
    imdct.c
    lc3.c
    LC3plus.pc.in
    ltpf_coder.c
    ltpf_decoder.c
    makefile
    mdct.c
    mdct_shaping.c
    near_nyquist_detector.c
    noise_factor.c
    noise_filling.c
    olpa.c
    pc_apply.c
    pc_classify.c
    pc_main.c
    pc_update.c
    per_band_energy.c
    plc_classify.c
    plc_compute_stab_fac.c
    plc_damping_scrambling.c
    plc_main.c
    plc_noise_substitution0.c
    plc_noise_substitution.c
    plc_phecu_f0_refine_first.c
    plc_phecu_fec_hq.c
    plc_phecu_hq_ecu.c
    plc_phecu_lf_peak_analysis.c
    plc_phecu_rec_frame.c
    plc_phecu_setf0hz.c
    plc_phecu_spec_ana.c
    plc_phecu_subst_spec.c
    plc_phecu_tba_per_band_gain.c
    plc_phecu_tba_spect_Xavg.c
    plc_phecu_tba_trans_dect_gains.c
    plc_phecu_trans_burst_ana_sub.c
    plc_tdc.c
    plc_tdc_tdac.c
    plc_update.c
    quantize_spec.c
    reorder_bitstream.c
    resamp12k8.c
    residual_coding.c
    residual_decoding.c
    setup_com_lc3.c
    setup_dec_lc3.c
    setup_enc_lc3.c
    sns_compute_scf.c
    sns_interpolate_scf.c
    sns_quantize_scf.c
    tns_coder.c
    tns_decoder.c

)

include_directories(fft)

SET(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -pedantic -Wcast-qual -Wall -W -Wextra -Wno-long-long")
SET(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes")
SET(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -Werror-implicit-function-declaration")

set_target_properties(LC3plus PROPERTIES VERSION ${PROJECT_VERSION})

set_target_properties(LC3plus PROPERTIES PUBLIC_HEADER lc3.h)

target_link_libraries(LC3plus m)

include(GNUInstallDirs)

install(TARGETS LC3plus
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

configure_file(LC3plus.pc.in lc3plus.pc @ONLY)

install(FILES ${CMAKE_BINARY_DIR}/lc3plus.pc DESTINATION ${CMAKE_INSTALL_DATAROOTDIR}/pkgconfig)
