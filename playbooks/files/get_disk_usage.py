#!/usr/bin/env python3
import json
import socket
import subprocess


def get_disk_usage():
    # Run 'df -lhP' and capture output directly inside Python
    output = subprocess.check_output(["df", "-lhP"], text=True)

    lines = output.strip().splitlines()
    disks = []

    for line in lines[1:]:
        parts = line.split(maxsplit=5)
        if len(parts) == 6:
            disks.append(
                {
                    "filesystem": parts[0],
                    "size": parts[1],
                    "used": parts[2],
                    "avail": parts[3],
                    "use_percent": parts[4],
                    "mounted_on": parts[5],
                }
            )

    payload = {"hostname": socket.getfqdn(), "disks": disks}

    print(json.dumps(payload, indent=2))


if __name__ == "__main__":
    get_disk_usage()
