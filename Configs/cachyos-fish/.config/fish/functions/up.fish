function up
    if test (count $argv) -eq 0
        z ..
        return
    end

    if test (count $argv) -ne 1
        echo "Usage: up <n>"
        return 1
    end

    set -l n $argv[1]
    if not string match -qr '^[1-9]+$' -- $n
        echo "Error: Argument must be greater than 0."
        return 1
    end

    set -l path ""
    for i in (seq $n)
        set path "$path../"
    end

    z $path
end
