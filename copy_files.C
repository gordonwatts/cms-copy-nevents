
void copy_files()
{
    TString source_file("root://eospublic.cern.ch//eos/opendata/cms/MonteCarlo2011/Summer11LegDR/SMHiggsToZZTo4L_M-125_7TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S13_START53_LV6-v1/20000/08CD3ECC-4C92-E411-B001-0025907B4F20.root");
    TString dest_file("/data/output.root");
    TString tree_name("Events");
    int entries_to_copy = 10;

    // Get the old tree going
    auto oldfile(TFile::Open(source_file, "READ"));
    TTree *oldtree;
    oldfile->GetObject(tree_name, oldtree);

    // Next, create the new tree in the new file.
 
    TFile newfile(dest_file, "RECREATE");
    auto newtree = oldtree->CloneTree(entries_to_copy);
 
    newtree->Print();
    newfile.Write();
}
