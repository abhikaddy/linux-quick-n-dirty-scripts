#!/bin/bash
#######for macos use schebang /opt/homebrew/bin/bash for testing locally
#Author: Abhishek Kadam
##Logging-Framework
##Log the message at the appropriate level
##eg: log_info "${MESSAGE}"
# Set variables
LOG_LEVEL="${LOG_LEVEL:-info}"
 # Define logging functions
log_info() {
    local message="$1"
    log "info" "${message}"
}
log_warning() {
    local message="$1"
    log "warning" "${message}"
}
log_error() {
    local message="$1"
    log "error" "${message}"
}
log_debug() {
    local message="$1"
    log "debug" "${message}"
}
log() {
    local level="$1"
    local message="$2"
    if [[ "$level" == "debug" ]] && [[ "$LOG_LEVEL" != "debug" ]]; then
        return
    fi
    local log_msg="{\"level\":\"${level}\",\"message\":\"${message}\"}"
    case "$level" in
        info|debug)
            echo "${log_msg}" >&1
            ;;
        error|warning)
            echo "${log_msg}" >&2
            ;;
        *)
            echo "Unknown log level: ${level}" >&2
            ;;
    esac
}

## Your code here