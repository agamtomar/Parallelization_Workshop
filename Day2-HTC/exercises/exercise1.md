In a terminal, background two `matrix-multiply.py` processes. Use the
`wait` command to wait for all background commands to finish, and use
the `time` command to time the total execution.

## Serial example

    $ time (
    > python matrix-multiply.py data/input_0.csv
    > python matrix-multiply.py data/input_1.csv
    > )

## Login node access

    $ ssh username@rc.colorado.edu

Alternatively

    $ ssh user00xx@tutorial-login.rc.colorado.edu

## Tips

* The `&` suffix "backgrounds" a process when used at the end of a
  command.
* The `time` command can be used as a prefix to time the execution of
  another command.
* The `wait` command waits until a background job has completed.
