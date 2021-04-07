# FROM rootproject/root:latest
FROM cmsopendata/cmssw_5_3_32

COPY copy.sh .


ENTRYPOINT [ "/opt/cms/entrypoint.sh", "/home/cmsusr/copy.sh" ]
