#!/usr/bin/env bats

. test_harness


@test "get_virtualization -- not available" {
    command() {
        return 1
    }

    run get_virtualization
    (( status == 0 ))
    [[ "$output" == "virt-what not available" ]]
}


@test "get_virtualization -- nothing" {
    command() {
        return 0
    }
    virt-what() {
        return 0
    }

    run get_virtualization
    (( status == 0 ))
    [[ "$output" == "None" ]]
}


@test "get_virtualization -- oneline" {
    command() {
        return 0
    }

    virt-what() {
        echo "oneline"
    }


    run get_virtualization
    (( status == 0 ))
    [[ "$output" == "oneline" ]]
}


@test "get_virtualization -- one line" {
    command() {
        return 0
    }

    virt-what() {
        echo "one line"
    }


    run get_virtualization
    (( status == 0 ))
    [[ "$output" == "one line" ]]
}


@test "get_virtualization -- two lines" {
    command() {
        return 0
    }

    virt-what() {
        echo "one line"
        echo "line two"
    }


    run get_virtualization
    (( status == 0 ))
    [[ "$output" == "one line line two" ]]
}


@test "get_virtualization -- IBM" {
    command() {
        return 0
    }

    virt-what() {
        cat file_mocks/virt-what-ibm
    }


    run get_virtualization
    (( status == 0 ))
    [[ "$output" == "ibm_power-lpar_shared" ]]
}


@test "get_virtualization -- KVM" {
    command() {
        return 0
    }

    virt-what() {
        cat file_mocks/virt-what-kvm
    }


    run get_virtualization
    (( status == 0 ))
    [[ "$output" == "kvm" ]]
}


@test "get_virtualization -- VMWare" {
    command() {
        return 0
    }

    virt-what() {
        cat file_mocks/virt-what-vmware
    }


    run get_virtualization
    (( status == 0 ))
    [[ "$output" == "vmware" ]]
}


@test "get_virtualization -- Hyper-V" {
    command() {
        return 0
    }

    virt-what() {
        cat file_mocks/virt-what-hyperv
    }


    run get_virtualization
    (( status == 0 ))
    [[ "$output" == "hyperv qemu" ]]
}