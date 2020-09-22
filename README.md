# RStudio Server Docker for use in a Carpentries Workshop

* Contains tidyverse


## Instructions for running the container on Linux
The easiest way to run this container is to use pull the image from docker hub with the following command:

```docker pull jannetta/rstudioserver```

The GitHub repository contains a "Makefile" which contains the commands for easily running and stopping the container. For this to work you need **make** installed and you need the Makefile which can be downloaded from https://github.com/jsteyn/rstudioserver/blob/master/Makefile. The following commands are available:

```make run```: this will create an ephemeral container from the image and run it with the name **rstudioserver***. It will expose rstudioserver on **localhost:3838**. The password is **mypassword**. 
