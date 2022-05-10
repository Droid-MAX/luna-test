FROM python:3.8-slim

RUN apt-get update && apt-get install -y git python3 python3-dev python3-pip libusb-1.0-0-dev minicom tmux && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir poetry yowasp-yosys yowasp-nextpnr-ecp5
RUN find $(dirname $(which yowasp-yosys)) -type f -name "yowasp-*" -execdir bash -c 'x="{}";mv -v $x ${x##*yowasp-}' \;

RUN git clone --depth=1 https://github.com/greatscottgadgets/luna
WORKDIR /luna
RUN poetry install

ENTRYPOINT ["/bin/bash"]
