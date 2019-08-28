#!/usr/bin/env bats

. test_harness

@test "check_smt_enabled -- enabled -- dash delimiter" {
    export MOCK_CPU_DIRS_PATH=file_mocks/smt/smt_enabled_cpu_dash
    run check_smt_enabled
    [[ $output == "" ]]
    (( status == 1 ))
}


@test "check_smt_enabled -- enabled -- comma delimiter" {
    export MOCK_CPU_DIRS_PATH=file_mocks/smt/smt_enabled_cpu_comma
    run check_smt_enabled
    [[ $output == "" ]]
    (( status == 1 ))
}


@test "check_smt_enabled -- disabled" {
    export MOCK_CPU_DIRS_PATH=file_mocks/smt/smt_disabled_cpu
    run check_smt_enabled
    [[ $output == "" ]]
    (( status == 0 ))
}