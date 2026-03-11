function brightness
    set -l val $argv[1]
    if test -z $val
        echo Please enter an integer
        return 1
    end
    test $val -eq $val > /dev/null 2>&1
    if test $status -ne 0
        echo Only integers between 0 and 100
        return 1
    end
    if test $val -le 100
        and test $val -ge 0
        ddcutil setvcp 10 $val
    else
        echo Has to be an integer between 0 and 100
    end

end
