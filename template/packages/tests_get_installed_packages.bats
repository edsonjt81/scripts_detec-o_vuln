#!/usr/bin/env bats

. test_harness

@test "get_installed_packages -- both installed" {
    rpm() {
        if [[ "$1" != "-qa" ]] ; then
            echo "bad argument 1"
            return 1
        fi
        if [[ "$2" != '--queryformat=%{NAME}-%{VERSION}-%{RELEASE}.%{ARCH}\n' ]] ; then
            echo "bad argument 2"
            return 1
        fi
        if [[ "$3" != "pkga" ]] ; then
            echo "bad argument 3"
            return 1
        fi
        if [[ "$4" != "pkgb" ]] ; then
            echo "bad argument 4"
            return 1
        fi
        echo "pkga-123-456"
        echo "pkgb-123-456"
        return 0
    }
    export -f rpm

    run get_installed_packages "pkga" "pkgb"
    (( status == 0 ))
    [[ "$output" == "pkga-123-456
pkgb-123-456" ]]
}

@test "get_installed_packages -- only one installed" {
    rpm() {
        if [[ "$1" != "-qa" ]] ; then
            echo "bad argument 1"
            return 1
        fi
        if [[ "$2" != '--queryformat=%{NAME}-%{VERSION}-%{RELEASE}.%{ARCH}\n' ]] ; then
            echo "bad argument 2"
            return 1
        fi
        if [[ "$3" != "pkga" ]] ; then
            echo "bad argument 3"
            return 1
        fi
        if [[ "$4" != "pkgb" ]] ; then
            echo "bad argument 4"
            return 1
        fi
        echo "pkgb-123-456"
        return 0
    }
    export -f rpm

    run get_installed_packages "pkga" "pkgb"
    (( status == 0 ))
    [[ "$output" == "pkgb-123-456" ]]
}

@test "get_installed_packages -- neither installed" {
    rpm() {
        if [[ "$1" != "-qa" ]] ; then
            echo "bad argument 1"
            return 1
        fi
        if [[ "$2" != '--queryformat=%{NAME}-%{VERSION}-%{RELEASE}.%{ARCH}\n' ]] ; then
            echo "bad argument 2"
            return 1
        fi
        if [[ "$3" != "pkga" ]] ; then
            echo "bad argument 3"
            return 1
        fi
        if [[ "$4" != "pkgb" ]] ; then
            echo "bad argument 4"
            return 1
        fi
        return 0
    }
    export -f rpm

    run get_installed_packages "pkga" "pkgb"
    (( status == 0 ))
    [[ "$output" == "" ]]
}

