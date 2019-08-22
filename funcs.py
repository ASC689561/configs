def ssh_():
    import os
    import sys
    print(sys.argv)
    import shlex
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("-s","--server")
    # args = parser.parse_args(shlex.split(os.environ['PYTHON_ARG']))
    # print(args.server)
    # print(f'ssh administrator@117.6.16.176 -p 93')
