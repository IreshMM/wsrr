# Base image contains the installation files
# Base image of the base image is openebs/rhel7:latest
FROM ireshmm/wsrr-package:8.5
RUN mkdir /install
RUN tar -xvf /WSRR_V8.5_LINUX_X86_Part1.tar.gz -C /install
RUN tar -xvf /WSRR_V8.5_LINUX_X86_Part2.tar.gz -C /install
RUN rm /WSRR_V8.5_LINUX_X86_Part{1,2}.tar.gz
RUN sed -i '34s/IM/IM64/' /install/responsefiles/template_response.xml
RUN /install/IM64/installc -input /install/responsefiles/template_response.xml -log /tmp/install_log.var -acceptLicense
