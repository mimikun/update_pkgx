function update_pkgx --description 'Update pkgx'
    echo "Update pkgx"
    if read_confirm
        set VERSION (pkgx --version | sed -e 's/pkgx //g')
        set NEW_VERSION (curl --silent https://api.github.com/repos/pkgxdev/pkgx/releases/latest | jq .name -r | sed -e 's/^v//g')
        if test $VERSION != $NEW_VERSION
            echo "Update found!"
            curl -Ssf https://pkgx.sh/$(uname)/$(uname -m).tgz | sudo tar xz -C /usr/local/bin
        else
            echo "No update required."
        end
    end
end
