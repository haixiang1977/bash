#define local variable and not conflict with global variable
function zipfile {
    local zipfile=$1
    local password=$2
    local srcfile=$3
    local rtn_code=0
    
    #check local source file is available or not
    if [ ! -f "$srcfile" ]; then
        echo "src file not available"
        rtn_code=1
        return $rtn_code
    fi
    
    #use zip command to do zip and check return code $?
    zip -g -P $password $zipfile $srcfile
    rtn_code=$?
    
    #check return code
    if [ $rtn_code -ne 0 ]; then
        echo "zip file failed"
        return $rtn_code
    fi
    
    #ls command to see result with `
    list=`ls`
    echo "list file: ======"
    echo "$list"
    echo "================="
    
    echo "zip file done"
    return $rtn_code
}
