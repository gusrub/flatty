#!/bin/bash

GEM_CHECK_CMD="$(command -v gem)"
GEM_INS_COUNT="$(gem list --local | grep "minitest\|awesome_print" | wc -l)"
GEM_INS_CMD="gem install --no-ri --no-doc awesome_print minitest"
RUBY_CHECK_CMD="$(command -v ruby)"

if ! [[ -x $GEM_CHECK_CMD ]]; then
    echo "You need to have gem installed!... exiting."
    exit 1
elif ! [[ -x $RUBY_CHECK_CMD ]]; then
    echo "You need to have ruby installed!... exiting."
    exit 1
fi

if [[ $GEM_INS_COUNT != "2" ]]; then
    echo "Installing required deps..."
    eval $GEM_INS_CMD
fi

echo "Running tests..."
ruby -v test.rb

