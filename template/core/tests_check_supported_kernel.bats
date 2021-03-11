#!/usr/bin/env bats

. test_harness


@test "check_supported_kernel -- RHEL5" {
    run check_supported_kernel "2.6.18-8.1.1.el5.x86_64"
    (( status == 1 ))
}


@test "check_supported_kernel -- RHEL6" {
    run check_supported_kernel "2.6.32-131.30.2.el6.x86_64"
    (( status == 0 ))
}


@test "check_supported_kernel -- RHEL7" {
    run check_supported_kernel "3.10.0-229.28.1.el7.x86_64"
    (( status == 0 ))
}


@test "check_supported_kernel -- RHEL8" {
    run check_supported_kernel "4.18.0-240.el8.x86_64"
    (( status == 0 ))
}


@test "check_supported_kernel -- Fedora 25" {
    run check_supported_kernel "4.9.12-200.fc25.x86_64"
    (( status == 1 ))
}

