FROM rootproject/root:latest
# FROM cmsopendata/cmssw_5_3_32

COPY copy_files.C .
COPY copy.sh .
# RUN chmod a+x ./copy.sh

# ENTRYPOINT [ "./copy.sh" ]
CMD ["./copy.sh"]