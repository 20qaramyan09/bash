#!/bin/bash

# Լոգ ֆայլի անուն
LOGFILE="/var/log/myscript.log"

# Ստուգում, թե արդյոք օգտատերը root-ն է
if [[ $EUID -ne 0 ]]; then
   echo "Այս սքրիպտը պետք է աշխատացնել root-ի կարգավիճակում" 
   exit 1
fi

# Լոգ ֆայլի ստեղծում կամ ավելացում
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOGFILE
}

log "Սքրիպտը սկսվել է"

# Ստուգել մնացորդային հիշողությունը
MEMORY=$(free -m | awk 'NR==2{printf "Հիշողություն: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')
log "$MEMORY"

# Ստուգել ցանցային կապը
ping -c 1 google.com > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
    log "Ցանցային կապը ակտիվ է"
else
    log "Ցանցային կապը բացակայում է"
fi

# Ջնջել 7 օրից ավելի հին ֆայլերը
DIR="/path/to/cleanup"
if [[ -d "$DIR" ]]; then
    find "$DIR" -type f -mtime +7 -exec rm -f {} \;
    log "$DIR-ում 7 օրից ավելի հին ֆայլերը ջնջված են"
else
    log "$DIR գոյություն չունի"
fi

log "Սքրիպտը ավարտված է"
