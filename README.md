vim-pivotal-tracker
===================

A vim plugin for interacting with pivotal tracker.

Fair warning: right now, it depends on Java and it's *slow*. It gets the job
done however. I'm fully aware that this is an abomination, but wanted to
write this using Clojure.

## Currently Supported

* Search, show results in buffer
* Update modified story description

## Dependencies

A JVM is required. "java" binary must be on the $PATH. Tested w/ Java 6.

## Installation

Using Pathogen, simply copy the vim-pivotal-tracker directory into ~/.vim/bundle.

Also, add the following to your .vimrc (or somewhere)

    " Replace with your own values
    let g:token = "ec88145a606f95ed411cf"
    let g:project_id = "966911"

## Usage

    <leader>pte - load stories into current buffer
    <leader>ptw - save the current story, who's id is under the cursor

## TODO

* Update story name
* Add/remove comments

## Building

The jar file is included prebuilt, for convenience. However, if you'd like
to build the source, it's at https://github.com/jebberjeb/pivotal-tracker-clj.

* clone the repo
* follow instructions to build the jar
* copy the STANDALONE jar in target into your plugin directory
* rename it to pt.jar

Copyright © 2014 Jeb Beich
