# what Docker image to build on top of?
FROM ubuntu:latest

# what to install
RUN apt-get update && apt-get -y update
RUN apt-get install -y build-essential python3.6 python3-pip python3-dev
RUN pip -q install pip --upgrade

# working directory, copy everything over
RUN mkdir src
WORKDIR src/
COPY . .

# load packages
RUN pip --no-cache-dir install numpy pandas seaborn sklearn jupyter

# get Juypter open
EXPOSE 8888
CMD ["jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]
